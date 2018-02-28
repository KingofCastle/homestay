package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import com.xinguang.tubobo.admin.api.enums.EnumRespCode;

public class WxClientResp<T> {

    private String code;
    private String errorMsg;
    private T data;

    public WxClientResp(String code, String errorMsg) {
    	this.code = code;
    	this.errorMsg = errorMsg;
    }

	public WxClientResp(EnumRespCode enumRespCode) {
		this.code = enumRespCode.getValue();
		this.errorMsg = enumRespCode.getDesc();
		this.data = null;
	}

    public WxClientResp(T data) {
		this.code = EnumRespCode.SUCCESS.getValue();
        this.errorMsg = EnumRespCode.SUCCESS.getDesc();
        this.data = data;
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

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
