package com.xinguang.tubobo.admin.api;

/**
 * Created by xuqinghua on 2017/8/30.
 */
public interface AdminAliSmsService {

    boolean sendSms(String type,String phone);
    boolean checkSmsCode(String type,String phone,String code);
}
