package com.xinguang.tubobo.admin.web.restful.request;

import org.hibernate.validator.constraints.NotBlank;

public class ReqRefreshToken {

	@NotBlank(message = "不能为空")
	private String refreshToken;

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }
}
