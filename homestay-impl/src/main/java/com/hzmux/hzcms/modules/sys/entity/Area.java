/**
 * Copyright &copy; 2012-2013 <a href="http://www.hzmux.com">hzmux</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.hzmux.hzcms.modules.sys.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hzmux.hzcms.modules.sys.utils.DictUtils;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.Length;

import com.google.common.collect.Lists;
import com.hzmux.hzcms.common.persistence.IdEntity;

/**
 * 区域Entity
 * @author Song
 * @version 2014-10-01
 */
@Entity
@Table(name = "sys_area")
@DynamicInsert @DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Area extends IdEntity<Area> {

	private static final long serialVersionUID = 1L;
	private Area parent;	// 父级编号
	private String parentIds; // 所有父级编号
	private String code; 	// 区域编码
	private String name; 	// 区域名称
	private String type; 	// 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）
	private String cheOpen;//车配网开通状态
	@JSONField(serialize = false)
	private List<Office> officeList = Lists.newArrayList(); // 部门列表
	private List<Area> childList = Lists.newArrayList();	// 拥有子区域列表

	public Area(){
		super();
	}
	
	public Area(String id){
		this();
		this.id = id;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="parent_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull
	public Area getParent() {
		return parent;
	}

	public void setParent(Area parent) {
		this.parent = parent;
	}

	@Length(min=1, max=255)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Length(min=1, max=1)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Length(min=0, max=100)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Length(min=1, max=1)
	public String getCheOpen() {
		return cheOpen;
	}

	public void setCheOpen(String cheOpen) {
		this.cheOpen = cheOpen;
	}

	@OneToMany(mappedBy = "area", fetch=FetchType.LAZY)
	@Where(clause="del_flag='"+DEL_FLAG_NORMAL+"'")
	@OrderBy(value="code") @Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	@JsonIgnore
	public List<Office> getOfficeList() {
		return officeList;
	}

	public void setOfficeList(List<Office> officeList) {
		this.officeList = officeList;
	}

	@OneToMany(mappedBy = "parent", fetch=FetchType.LAZY)
	@Where(clause="del_flag='"+DEL_FLAG_NORMAL+"'")
	@OrderBy(value="code") @Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Area> getChildList() {
		return childList;
	}

	@JsonBackReference
	public void setChildList(List<Area> childList) {
		this.childList = childList;
	}

	@Transient
	public static void sortList(List<Area> list, List<Area> sourcelist, String parentId){
		for (int i=0; i<sourcelist.size(); i++){
			Area e = sourcelist.get(i);
			if (e.getParent()!=null && e.getParent().getId()!=null
					&& e.getParent().getId().equals(parentId)){
				list.add(e);
				// 判断是否还有子节点, 有则继续获取子节点
				for (int j=0; j<sourcelist.size(); j++){
					Area childe = sourcelist.get(j);
					if (childe.getParent()!=null && childe.getParent().getId()!=null
							&& childe.getParent().getId().equals(e.getId())){
						sortList(list, sourcelist, e.getId());
						break;
					}
				}
			}
		}
	}

	@Transient
	public boolean isAdmin(){
		return isAdmin(this.id);
	}
	
	@Transient
	public static boolean isAdmin(String id){
		return id != null && id.equals("1");
	}

	@Transient
	public String getTypeName(){
		return DictUtils.getDictLabel(this.getType(), "sys_area_type","无");
	}

	@Transient
	public String getOpen(){
		if (this.getCode().endsWith("0000")){
			return "";
		}
		return DictUtils.getDictLabel(this.getCheOpen(), "open_status","");
	}

	@Transient
	public static String getFullName(Area area){
	    if(null == area || isAdmin(area.getId())) {
	        return "";
	    }
	    return getFullName(area.getParent()) + area.getName();
	}

	public enum OpenStatus {
		NOKAI("0", "未开通")
		,KAI("1", "开通")
		;

		public static OpenStatus valueOfCode(String code) {
			if (null == code || code.length() < 1) {
				return null;
			}
			for (OpenStatus openStatus : OpenStatus.values()) {
				if (openStatus.getCode().equals(code)) {
					return openStatus;
				}
			}
			return null;
		}
		OpenStatus(String code, String lable) {
			this.code = code;
			this.lable = lable;
		}

		private String code;
		private String lable;

		public String getCode() {
			return code;
		}
		public String getLable() {
			return lable;
		}
	}
	
}