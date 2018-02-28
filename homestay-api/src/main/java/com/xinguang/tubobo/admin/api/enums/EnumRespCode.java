package com.xinguang.tubobo.admin.api.enums;

public enum EnumRespCode {

	SUCCESS("0", "操作成功"),
	FAIL("1", "操作失败"),
	PARAMS_ERROR("2", "参数错误"),
	INFO_ERROR("3", "信息错误"),
	BUSY("4", "系统繁忙"),

	NO_USER_INFO("5", "用户不存在"),
	NO_BIND_PHONE("6", "未绑定手机"),
	LOGIN_EXPIRED("7", "登录过期"),
	TOKEN_VERIFY_ERROR("8", "token验证错误"),

	PHONE_OR_PWD_ERROR("10", "用户名或密码错误"),
	PHONE_NOT_EXIST("11", "手机号未绑定"),
	PHONE_EXIST("12", "手机号已被绑定"),
	PHONE_EXIST_NO_PWD("13", "手机号已被绑定,但无密码"),
	PHONE_FORMAT_ERROR("14", "手机号格式错误"),
	ORIGIN_PWD_ERROR("15", "原密码错误"),

	VALIDATE_CODE_NOT_FOUND("20", "请先发送验证码"),
	VALIDATE_CODE_EXPIRED("21", "验证码过期"),
	VALIDATE_CODE_ERROR("22", "验证码错误"),
	VALIDATE_CODE_DISABLED("23", "验证码失效，请重发"),

	NOT_RIDER("30", "未认证骑士"),
	WAYBILL_NOT_FOUND("31", "运单不存在"),
	STORE_INFO_ERROR("32", "门店信息错误"),
	ADDRESS_INFO_ERROR("33", "地址信息错误"),
	APPLY_ACCEPTED_CAN_NOT_DELETE("34", "寄件请求只有在未受理前可以删除"),
	APPLY_ACCEPTED_CAN_NOT_CHANGE("35", "预约收件方式不能改变"),
	SIGN_ERROR("36", "签收失败"),
	DELAY_NOT_ALLOW("37", "滞留件不允许此操作"),
	SMS_MODEL_ERROR("38", "短信模版错误"),
	WAYBILL_UPLOADTYPE_ERROR("39", "运单上传类型错误"),
	UPLOAD_WAYBILL_IS_NULL("40", "上传运单为空"),
	WAYBILLNO_IS_BLANK("41", "运单号为空"),
	WAYBILLNO_EXIST("42", "运单号已存在"),
	WAYBILLNO_DISABLED("43", "运单号不可用"),
	UPLOAD_SIGNINFO_IS_NULL("44", "上传的有效签收信息为空"),
	WAYBILL_IS_EVALUATED("45", "运单已评价"),
	TASK_NOT_EXIST("46", "预约任务不存在"),
	TASK_IS_EVALUATED("47", "任务已评价"),

	ALISMS_TEMPLATE_TYPE_ERROR("50", "短信模版类型错误"),

	BIND_TUBOBOUSERINFO_ERROR("100", "绑定用户信息到兔波波帐号失败"),
	TUBOBOUSER_SMS_LIMIT("101", "今天已发送5次短信，请明天再试"),


	UPLOAD_PHOTO_FAIL("110", "上传图片失败"),
	APPVERSION_NOT_FOUND("120", "根据appName查询不到版本信息"),

	USERID_BY_PHONE_NOT_FOUND("130", "根据通行证账号查询到的userId为空"),
	USERID_PHONE_NOT_MATCH("131", "根据通行证账号与userId不匹配"),

	SMS_TYPE_ERROR("140", "验证码类型错误"),

	CAR_TYPE_LIST_NOT_FOUND("150", "车辆类型列表不存在"),

	SYS_NOTIFY_EMPTY("160","系统公告为空"),
	SYS_NOTIFY_OPERATE_ERROR("161","系统公告操作失败"),
	SYS_NOTIFY_OPERATE_SUCCESS("162","系统公告操作成功"),

	JWT_CREATE_ERROR("200", "token加密失败"),
	JWT_VERIFY_ERROR("201", "token解密失败"),



	/*后端功能 前后端分离 返回码*/

	TOKEN_EXPIRED("10001", "token expired"),
	TOKEN_MISS("10002", "token miss"),
	TOKEN_VALID_FAIL("10003", "token valid fail"),
	TOKEN_VALID_ERROR("10004", "token valid error"),

	USER_NO_PERMISSON("10005", "permission denied"),
	CHECK_PERMISSON_ERROR("10006", "check permisson error"),

	USERNAME_PWD_ERROR("10010", "用户名密码错误"),
	LOGIN_FAIL("10011", "登录失败"),
	PASSWORD_OLD_ERROR("10012", "原密码错误"),
	PASSWORD_UPDATE_FAIL("10013", "密码更新失败"),
	PASSWORD_DECRYPT_FAIL("10014", "密码解析失败"),
	CHECK_PASSWORD_PATTEN_FAIL("10015", "密码格式错误,长度为8~20位"),


	;






    private String value;
    private String desc;

    private EnumRespCode(String value, String desc){
        this.value = value;
        this.desc = desc;
    }

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
