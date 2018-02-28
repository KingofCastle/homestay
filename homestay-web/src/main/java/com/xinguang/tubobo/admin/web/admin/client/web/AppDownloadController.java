package com.xinguang.tubobo.admin.web.admin.client.web;

import com.hzmux.hzcms.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppDownloadController extends BaseController {

	@RequestMapping(value = "/tuboboUser/downloadApp")
	public String downloadApp1(){
		return "modules/AppDownload";
	}

    @RequestMapping(value = "/downloadApp")
    public String downloadApp2(){
        return "modules/AppDownload";
    }

	@RequestMapping(value = "/download/toobob-assistant")
	public String downloadPDA(){
		return "modules/PDADownload";
	}
}