/*!
 * Copyright &copy; 2012-2013 <a href="https://github.com/Hzmux/hzcms">hzcms</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// 引入js和css文件
function include(id, path, file){
	if (document.getElementById(id)==null){
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++){
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
            document.write("<" + tag + (i==0?" id="+id:"") + attr + link + "></" + tag + ">");
        }
	}
}

// 打开一个窗体
function windowOpen(url, name, width, height){
	var top=parseInt((window.screen.height-height)/2,10),left=parseInt((window.screen.width-width)/2,10),
		options="location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,"+
		"resizable=yes,scrollbars=yes,"+"width="+width+",height="+height+",top="+top+",left="+left;
	window.open(url ,name , options);
}

// 显示加载框
function loading(mess){
	top.$.jBox.tip.mess = null;
	top.$.jBox.tip(mess,'loading',{opacity:0});
}

// 确认对话框- 确认后跳转到href
function confirmx(mess, href){
	top.$.jBox.confirm(mess,'系统提示',function(v,h,f){
		if(v=='ok'){
			loading('正在提交，请稍等...');
			location = href;
		}
	},{buttonsFocus:1});
	top.$('.jbox-body .jbox-icon').css('top','55px');
	return false;
}
// 确认对话框- 确认后执行func函数（无参）
function confirmSubmit(mess, func){
    top.$.jBox.confirm(mess,'系统提示',function(v,h,f){
        if(v=='ok'){
            func();
        }
    },{buttonsFocus:1});
    top.$('.jbox-body .jbox-icon').css('top','55px');
    return false;
}
// 显示一个提示 success， error
function showTip(content, ctype) {
	top.$.jBox.tip(content,ctype);
}
$(document).ready(function() {
	//所有下拉框使用select2
	$("select").select2();
	$('.fancybox').fancybox();
});


/**
 * 初始化省市区下拉选
 * @param pcdJsonList -- json对象  省市区（code,parent,child）
 * @param _province -- select的ID省
 * @param _city -- select的ID 地级市
 * @param _area -- select的ID 区县
 * @param defaultProvince -- 默认值 省
 * @param defaultCity -- 默认值 地级市
 * @param defaultArea -- 默认值 区县
 */
function addressInit(pcdJsonList, _province, _city, _area, defaultProvince, defaultCity, defaultArea)
{
    var domProvince = document.getElementById(_province);
    var domCity = document.getElementById(_city);
    var domArea = document.getElementById(_area);
    
    var emptyOption = new Object();
    emptyOption.parent="-请选择-";
    emptyOption.code="";
    emptyOption.child=[];

    //添加下拉选项
    function addOption(dom, data)
    {
    	var option = document.createElement("OPTION");
    	dom.options.add(option);
    	option.innerHTML = data.parent;
    	option.value = data.code;
    	option.obj = data;
    }
    
    //默认值选择
    function defaultSelect(dom, code)
    {
    	if(code != ""){
	        for(var i=0; i<dom.options.length; i++)
	        {
	            if(dom.options[i].value == code || dom.options[i].innerHTML == code ) 
	            {
	            	dom.innerHTML == code;
	            	dom.selectedIndex = i;
	                return;
	            }
	        }
    	}
    	dom.selectedIndex = 0;
    }
    
    function changeProvince()
    {
    	if(domProvince.selectedIndex == -1)return;
    	if(!domCity){return;}
        domCity.options.length = 0;
//        domCity.onchange = null;
        addOption(domCity,emptyOption);
        var item = domProvince.options[domProvince.selectedIndex].obj;
        for(var i=0; i<item.child.length; i++)
        {
            addOption(domCity, item.child[i]);
        }
        defaultSelect(domCity, defaultCity);
    	changeCity();
    	domCity.onchange = changeCity;
    }
    
    function changeCity()
    {
    	if(domCity.selectedIndex == -1)return;
    	if(!domArea){return;}
        domArea.options.length = 0;
        addOption(domArea,emptyOption);
        var item = domCity.options[domCity.selectedIndex].obj;
        for(var i=0; i<item.child.length; i++)
        {
            addOption(domArea, item.child[i]);
        }
        defaultSelect(domArea, defaultArea);
    }
     
    addOption(domProvince,emptyOption);
    for(var i=0; i<pcdJsonList.length; i++)
    {
        addOption(domProvince, pcdJsonList[i]);
    }
    defaultSelect(domProvince, defaultProvince);
    changeProvince();
    domProvince.onchange = changeProvince;
}
