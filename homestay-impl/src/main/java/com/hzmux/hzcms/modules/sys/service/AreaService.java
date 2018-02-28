/**
 * Copyright &copy; 2012-2013 <a href="http://www.hzmux.com">hzmux</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.hzmux.hzcms.modules.sys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hzmux.hzcms.common.persistence.Parameter;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hzmux.hzcms.common.service.BaseService;
import com.hzmux.hzcms.modules.sys.dao.AreaDao;
import com.hzmux.hzcms.modules.sys.dao.OfficeDao;
import com.hzmux.hzcms.modules.sys.entity.Area;
import com.hzmux.hzcms.modules.sys.entity.Office;
import com.hzmux.hzcms.modules.sys.utils.UserUtils;

/**
 * 区域Service
 * @author Song
 * @version 2014-10-01
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends BaseService {

	@Autowired
	private AreaDao areaDao;
	@Autowired
    OfficeDao officeDao;
	
	public Area get(String id) {
		return areaDao.get(id);
	}
	
	public List<Area> findAll(){
		return UserUtils.getAreaList();
	}
	
	public List<Area> findByParentId(String parentId){
		return areaDao.findByParentId(parentId);
	}

	public Area findByCode(String code){
		return areaDao.findByCode(code);
	}
	public Area findByLikelyName(String name){
		return areaDao.findByLikelyName(name);
	}

	@Transactional(readOnly = false)
	public void save(Area area) {
		area.setParent(this.get(area.getParent().getId()));
		String oldParentIds = area.getParentIds(); // 获取修改前的parentIds，用于更新子节点的parentIds
		area.setParentIds(area.getParent().getParentIds()+area.getParent().getId()+",");

		//检查同一等级节点是否已全部开通
		List<Area> areaList = areaDao.findByParentId(area.getParent().getId());
		Area areaPare = areaDao.get(area.getParent().getId());
		boolean isCheAllOpen = isCheAllOpen(areaList);
		if (isCheAllOpen){
			areaPare.setCheOpen(Area.OpenStatus.KAI.getCode());
		}else {
			areaPare.setCheOpen(Area.OpenStatus.NOKAI.getCode());
		}
		areaDao.clear();
		areaDao.save(area);
		areaDao.save(areaPare);
		// 更新子节点 parentIds
		List<Area> list = areaDao.findByParentIdsLike("%,"+area.getId()+",%");
		for (Area e : list){
			e.setParentIds(e.getParentIds().replace(oldParentIds, area.getParentIds()));
			e.setCheOpen(area.getCheOpen());
		}
		areaDao.save(list);
		UserUtils.removeCache(UserUtils.CACHE_AREA_LIST);
	}

	private boolean isCheAllOpen(List<Area> areaList) {
		for (int i=0;i<areaList.size();i++) {
			if (Area.OpenStatus.NOKAI.getCode().equals(areaList.get(i).getCheOpen()))
				return false;
		}
		return true;
	}

	@Transactional(readOnly = false)
	public void delete(String id) {
		areaDao.deleteById(id, "%,"+id+",%");
		UserUtils.removeCache(UserUtils.CACHE_AREA_LIST);
	}
	
	public Map<String, String> findProvinceCityByOfficeId(String officeId){
		if(StringUtils.isBlank(officeId)){
			return null;
		}
		Office office = officeDao.get(officeId);
		if (null == office) {
			return null;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		Area area = get(office.getArea().getId());
		String pIds = area.getParentIds();
		String[] pIdsArr = pIds.split(",");
		for (String id : pIdsArr) {
			if (!"0".equals(id)&& !"1".equals(id)) {
				Area parent = get(id);
				if (null != parent && parent.getType().equals("2")) {
					map.put("province", parent.getName());
				}
				if (null != parent && parent.getType().equals("3")) {
					map.put("city", parent.getName());
				}
			}
		}
		return map;
	}

	@Transactional(readOnly = false)
	public List<Area> findByCheOpenState(String state){
		return areaDao.find("from Area where cheOpen=:p1", new Parameter(state));
	}
}
