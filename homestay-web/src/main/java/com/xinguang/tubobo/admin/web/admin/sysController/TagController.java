/**
 * Copyright &copy; 2012-2013 <a href="http://www.hzmux.com">hzmux</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.xinguang.tubobo.admin.web.admin.sysController;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hzmux.hzcms.common.web.BaseController;

/**
 * 标签Controller
 * @author Song
 * @version 2014-10-01
 */
@Controller
@RequestMapping(value = "${adminPath}/tag")
public class TagController extends BaseController {
	
	/**
	 * 树结构选择标签（treeselect.tag）
	 */
	@RequiresUser
	@RequestMapping(value = "treeselect")
	public String treeselect(HttpServletRequest request, Model model) {
		model.addAttribute("url", request.getParameter("url")); 	// 树结构数据URL
		model.addAttribute("extId", request.getParameter("extId")); // 排除的编号ID
		model.addAttribute("checked", request.getParameter("checked")); // 是否可复选
		model.addAttribute("selectIds", request.getParameter("selectIds")); // 指定默认选中的ID
		model.addAttribute("module", request.getParameter("module"));	// 过滤栏目模型（仅针对CMS的Category树）
		return "modules/sys/tagTreeselect";
	}
	@RequiresUser
	@RequestMapping(value = "linkselect")
	public String linkselect(HttpServletRequest request, Model model) {
	    model.addAttribute("url", request.getParameter("url")); 	// 树结构数据URL
	    model.addAttribute("extId", request.getParameter("extId")); // 排除的编号ID
	    model.addAttribute("checked", request.getParameter("checked")); // 是否可复选
	    model.addAttribute("selectIds", request.getParameter("selectIds")); // 指定默认选中的ID
	    model.addAttribute("module", request.getParameter("module"));	// 过滤栏目模型（仅针对CMS的Category树）
	    return "modules/sys/linkselect";
	}

	@RequiresUser
	@RequestMapping(value = "tagTreeselectForFenpei")
	public String tagTreeselectForFenpei(HttpServletRequest request, Model model) {
	    model.addAttribute("url", request.getParameter("url")); 	// 树结构数据URL
	    model.addAttribute("extId", request.getParameter("extId")); // 排除的编号ID
	    model.addAttribute("checked", request.getParameter("checked")); // 是否可复选
	    model.addAttribute("selectIds", request.getParameter("selectIds")); // 指定默认选中的ID
	    model.addAttribute("module", request.getParameter("module"));	// 过滤栏目模型（仅针对CMS的Category树）
	    return "modules/sys/tagTreeselectForFenpei";
	}
	
	/**
	 * 图标选择标签（iconselect.tag）
	 */
	@RequiresUser
	@RequestMapping(value = "iconselect")
	public String iconselect(HttpServletRequest request, Model model) {
		model.addAttribute("value", request.getParameter("value"));
		return "modules/sys/tagIconselect";
	}
	
}
