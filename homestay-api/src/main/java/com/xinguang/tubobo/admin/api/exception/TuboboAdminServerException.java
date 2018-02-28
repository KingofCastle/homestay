package com.xinguang.tubobo.admin.api.exception;

import com.xinguang.tubobo.admin.api.enums.EnumRespCode;

public class TuboboAdminServerException extends Exception {

    private String code;
    private String errorMsg;

    public TuboboAdminServerException(EnumRespCode resp) {
        this.code = resp.getValue();
        this.errorMsg = resp.getDesc();
    }

    public TuboboAdminServerException(String code, String errorMsg) {
        this.code = code;
        this.errorMsg = errorMsg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
