package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by Administrator on 2017/5/18.
 */
public class ReqSmsSend {
    @NotBlank(message = "手机号 不能为空")
    private String phone;
    @NotBlank(message = "短信类型 不能为空")
    private String type;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ReqSmsSend{" +
                "phone='" + phone + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
