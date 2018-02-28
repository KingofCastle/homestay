package com.xinguang.tubobo.admin.web.admin.sysController;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.hzmux.hzcms.common.utils.excel.ExportExcel;
import com.hzmux.hzcms.common.web.BaseController;
import com.xinguang.tubobo.admin.impl.entity.EmployeeEntity;
import com.xinguang.tubobo.admin.impl.entity.FeedBackEntity;
import com.xinguang.tubobo.admin.impl.entity.WayBillREntity;
import com.xinguang.tubobo.admin.impl.entity.WayBillSEntity;

@Controller
@RequestMapping("${adminPath}/export")
public class ExportFieldsController extends BaseController {
    
    private static Map<String, Class<?>> supportClass = new HashMap<String, Class<?>>();
    static {
        Class<?>[] clses = {WayBillSEntity.class, WayBillREntity.class, EmployeeEntity.class, FeedBackEntity.class};
        for (Class<?> cls : clses) {
            supportClass.put(cls.getSimpleName(), cls);
        }
    }

    @RequiresUser
    @ResponseBody
    @RequestMapping(value = "fields")
    public List<Map<String, Object>> getFields(@RequestParam String exportClass, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        
        List<String[]> exportFields = getexportFields(exportClass);
        
        response.setContentType("application/json; charset=UTF-8");
        for (String[] field : exportFields) {
            Map<String, Object> map = Maps.newHashMap();

            map.put("id", field[0]);
            map.put("name", field[1]);
            mapList.add(map);
        }
        
        return mapList;
    }

    private List<String[]> getexportFields(String exportClass) {
        Class<?> cls = supportClass.get(exportClass);

        if(null != cls) {
            List<String[]> exportFields = ExportExcel.getExcelField(cls);
            return exportFields;
        } else {
            return Collections.emptyList();
        }
    }
}
