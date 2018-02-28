/**
 * Copyright &copy; 2012-2013 <a href="http://www.hzmux.com">hzmux</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.xinguang.tubobo.admin.web.admin.sysController;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hzmux.hzcms.common.persistence.Page;
import com.hzmux.hzcms.common.web.BaseController;
import com.hzmux.hzcms.modules.sys.entity.Log;
import com.hzmux.hzcms.modules.sys.service.LogService;

/**
 * 日志Controller
 * @author Song
 * @version 2014-10-01
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/log")
public class LogController extends BaseController {

	@Autowired
	private LogService logService;
	
	@RequiresPermissions("sys:log:view")
	@RequestMapping(value = {"list", ""})
	public String list(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Log> page = logService.find(new Page<Log>(request, response), paramMap); 
        model.addAttribute("page", page);
        model.addAllAttributes(paramMap);
		return "modules/sys/logList";
	}

}
