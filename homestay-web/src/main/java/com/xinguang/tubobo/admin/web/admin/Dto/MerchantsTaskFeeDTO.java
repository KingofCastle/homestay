package com.xinguang.tubobo.admin.web.admin.Dto;

import java.io.Serializable;

/**
 * Created by xuqinghua on 2017/6/28.
 */
public class MerchantsTaskFeeDTO implements Serializable {
    private String code;
    private String name;
    private boolean opened;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isOpened() {
        return opened;
    }

    public void setOpened(boolean opened) {
        this.opened = opened;
    }
}
