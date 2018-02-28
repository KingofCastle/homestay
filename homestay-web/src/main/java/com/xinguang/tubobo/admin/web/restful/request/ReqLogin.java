package com.xinguang.tubobo.admin.web.restful.request;

import org.hibernate.validator.constraints.NotBlank;

public class ReqLogin {

	@NotBlank(message = "不能为空")
	private String phone;

    @NotBlank(message = "不能为空")
	private String password;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
