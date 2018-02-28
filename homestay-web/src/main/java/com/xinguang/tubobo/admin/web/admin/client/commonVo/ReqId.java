package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by lvhantai on 2017/7/19.
 */
public class ReqId {
    @NotBlank(message = "id 不能为空")
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
