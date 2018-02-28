package com.xinguang.tubobo.admin.web.restful.request;

import org.hibernate.validator.constraints.NotBlank;

public class ReqCheckToken {

    @NotBlank(message = "不能为空")
    private String token;

//	@NotBlank(message = "不能为空")
	private String permission;

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
