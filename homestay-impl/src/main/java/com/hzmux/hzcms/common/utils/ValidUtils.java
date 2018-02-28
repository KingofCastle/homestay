package com.hzmux.hzcms.common.utils;

import org.apache.commons.lang.StringUtils;

public class ValidUtils {

	public static final String contractPhonePattern = "(1\\d{10})|(((0\\d{2,3})(-)?)(\\d{7,8})((-)?(\\d{3,}))?)$";
	public static final String str = "0123456789abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	/**
	 * 验证手机格式
	 */
    public static boolean isPhone(String phone){
    	if (StringUtils.isBlank(phone)) {
			return false;
		}
    	return phone.matches("1\\d{10}");
    }

    public static boolean isPhoneOrTel(String phone){
    	if (StringUtils.isBlank(phone)) {
			return false;
		}
    	return phone.matches("1\\d{10}") || phone.matches("^((0\\d{2,3})(-)?)(\\d{7,8})((-)?(\\d{3,}))?$");
    }
    
    /**
     * 获取验证码
     */
    public static String getValidateCode(int length){
		String code = "";
        while (code.length() < length) {
        	code += (int) (Math.random() * 10);
        }
    	return code;
    }


	/**
	 * 随机生成新光通行证密码
	 */
	public static String genXgPwd(int length){
		StringBuffer pwd = new StringBuffer();
		pwd.append("0a");
		while (pwd.length() < length) {
			pwd.append(str.charAt((int)(Math.random() * (str.length() - 1))));
		}
		return pwd.toString();
	}

}
