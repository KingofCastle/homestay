package com.xinguang.tubobo.admin.api;

import com.xinguang.tubobo.admin.api.dto.RefreshTokenDTO;
import com.xinguang.tubobo.admin.api.dto.TokenDTO;
import com.xinguang.tubobo.admin.api.exception.TuboboAdminServerException;
import com.xinguang.tubobo.admin.api.exception.UserOrPasswordInvalidException;

/**
 * 账号验证接口.
 */
public interface AdminAuthService {
    /**
     * 登陆返回token
     * @param userName
     * @param password
     * @return
     * @throws UserOrPasswordInvalidException
     */
    String login(String userName,String password) throws UserOrPasswordInvalidException;
    boolean verify(String jwt);

    /**
     * 校验用户名密码是否正确
     * @param userName
     * @param password
     * @return
     */
    boolean checkPwd(String userName,String password);

    /**
     * 后台用户登录
     * @param phone
     * @param password
     * @return
     * @throws TuboboAdminServerException
     * since 2017/12/07
     */
    TokenDTO userLogin(String phone,String password) throws TuboboAdminServerException;

    /**
     * 后台用户校验token
     * @param token
     * @return
     * @throws TuboboAdminServerException
     * since 2017/12/07
     */
    boolean userCheckToken(String token) throws TuboboAdminServerException;

    /**
     * 后台用户刷新token
     * @param refreshToken
     * @return
     * @throws TuboboAdminServerException
     * since 2017/12/07
     */
    RefreshTokenDTO userRefreshToken(String refreshToken) throws TuboboAdminServerException;

    /**
     * 后台用户校验permission
     * @param token
     * @param permission
     * @return
     * @throws TuboboAdminServerException
     * since 2017/12/07
     */
    boolean userCheckPermission(String token, String permission) throws TuboboAdminServerException;
}
