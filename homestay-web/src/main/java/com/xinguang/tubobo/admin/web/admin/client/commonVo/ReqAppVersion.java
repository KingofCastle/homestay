package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;

public class ReqAppVersion {

    @NotBlank(message = "appName 不能为空")
	private String appName;

    @Pattern(regexp = "^android|ios" ,message = "type 值为：android|ios")
	private String type;

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
