package com.xinguang.tubobo.admin.web.restful.controller;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.hzmux.hzcms.common.utils.StringUtils;
import com.hzmux.hzcms.modules.sys.entity.User;
import com.xinguang.tubobo.admin.api.enums.EnumRespCode;
import com.xinguang.tubobo.admin.api.exception.TuboboAdminServerException;
import com.xinguang.tubobo.admin.impl.config.Constants;
import com.xinguang.tubobo.admin.impl.utils.SecretUtils;
import com.xinguang.tubobo.admin.web.restful.ClientResp;
import com.xinguang.tubobo.admin.web.restful.request.ReqCheckToken;
import com.xinguang.tubobo.admin.web.restful.request.ReqLogin;
import com.xinguang.tubobo.admin.web.restful.request.ReqRefreshToken;
import com.xinguang.tubobo.admin.api.dto.RefreshTokenDTO;
import com.xinguang.tubobo.admin.api.dto.TokenDTO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 不需要登录验证的接口
 */
@Controller
public class NoLoginController extends BaseRestfulController<Object>{



    /**
     * 登录
     */
    @ResponseBody
    @RequestMapping(value = "/user/login", method = {RequestMethod.POST,RequestMethod.OPTIONS})
    public ClientResp<Object> login(@RequestBody ReqLogin req, HttpServletRequest request, HttpServletResponse response) {

        // 验证请求参数
        try {
            valid(req);
        }catch (TuboboAdminServerException e){
            return new ClientResp(EnumRespCode.PARAMS_ERROR.getValue(), e.getMessage());
        }

        String pwd;
        try {
            pwd = SecretUtils.aesDecrypt(req.getPassword());
        } catch (Exception e) {
            return new ClientResp(EnumRespCode.PASSWORD_DECRYPT_FAIL.getValue(),EnumRespCode.PASSWORD_DECRYPT_FAIL.getDesc());
        }

        try {
            User user = systemService.getUserByLoginName(req.getPhone());
            if (user != null && SecretUtils.passwordValidate(pwd,user.getPassword())){
                String token = SecretUtils.jwtCreate(user.getId(), Constants.TOKEN_EXPIRED_SECONDS);
                String refreshToken = SecretUtils.jwtCreate(user.getId(),Constants.REFRESH_TOKEN_EXPIRED_SECONDS);
                TokenDTO res = new TokenDTO(token,refreshToken, user.getName(), user.getLoginName());
                return new ClientResp(res);
            } else {
                return new ClientResp(EnumRespCode.USERNAME_PWD_ERROR.getValue(),EnumRespCode.USERNAME_PWD_ERROR.getDesc());
            }
        } catch (Exception e) {
            logger.error("login ERROR. {}",e);
            return new ClientResp(EnumRespCode.LOGIN_FAIL.getValue(),EnumRespCode.LOGIN_FAIL.getDesc());
        }
    }

    /**
     * 校验token
     */
    @ResponseBody
    @RequestMapping(value = "/user/checkToken", method = {RequestMethod.POST,RequestMethod.OPTIONS})
    public ClientResp<Object> checkToken(@RequestBody ReqCheckToken req, HttpServletRequest request, HttpServletResponse response) {
        try {
            valid(req);
            SecretUtils.jwtVerify(req.getToken());
            return new ClientResp();
        }catch (TuboboAdminServerException e){
            return new ClientResp(e.getCode(), e.getErrorMsg());
        }catch (TokenExpiredException e){
            return new ClientResp(EnumRespCode.TOKEN_EXPIRED.getValue(),EnumRespCode.TOKEN_EXPIRED.getDesc());
        }catch (JWTVerificationException e){
            return new ClientResp(EnumRespCode.TOKEN_VALID_FAIL.getValue(),EnumRespCode.TOKEN_VALID_FAIL.getDesc());
        }catch (Exception e){
            logger.error("refreshToken ERROR. {}",e);
            return new ClientResp(EnumRespCode.TOKEN_VALID_ERROR.getValue(),EnumRespCode.TOKEN_VALID_ERROR.getDesc());
        }
    }

    /**
     * 刷新token
     */
    @ResponseBody
    @RequestMapping(value = "/user/refreshToken", method = {RequestMethod.POST,RequestMethod.OPTIONS})
    public ClientResp<Object> refreshToken(@RequestBody ReqRefreshToken req, HttpServletRequest request, HttpServletResponse response) {
        try {
            valid(req);
            String userId = SecretUtils.jwtVerify(req.getRefreshToken());
            String token = SecretUtils.jwtCreate(userId,Constants.TOKEN_EXPIRED_SECONDS);
            String refreshToken = SecretUtils.jwtCreate(userId,Constants.REFRESH_TOKEN_EXPIRED_SECONDS);
            RefreshTokenDTO res = new RefreshTokenDTO(token,refreshToken);
            return new ClientResp(res);
        }catch (TuboboAdminServerException e){
            return new ClientResp(e.getCode(), e.getErrorMsg());
        }catch (TokenExpiredException e){
            return new ClientResp(EnumRespCode.TOKEN_EXPIRED.getValue(),EnumRespCode.TOKEN_EXPIRED.getDesc());
        }catch (JWTVerificationException e){
            return new ClientResp(EnumRespCode.TOKEN_VALID_FAIL.getValue(),EnumRespCode.TOKEN_VALID_FAIL.getDesc());
        }catch (Exception e){
            logger.error("refreshToken ERROR. {}",e);
            return new ClientResp(EnumRespCode.TOKEN_VALID_ERROR.getValue(),EnumRespCode.TOKEN_VALID_ERROR.getDesc());
        }
    }

    /**
     * 校验用户权限
     */
    @ResponseBody
    @RequestMapping(value = "/user/checkPermission", method = {RequestMethod.POST,RequestMethod.OPTIONS})
    public ClientResp<Object> checkPermission(@RequestBody ReqCheckToken req, HttpServletRequest request, HttpServletResponse response) {
        try {
            // 验证参数
            valid(req);
            // 验证token
            String userId = checkToken(req.getToken());
            //如果权限字段为空 默认通过权限校验
            if (StringUtils.isBlank(req.getPermission())){
                return new ClientResp();
            }
            // 验证permisson
            List<String> permissonList = systemService.queryPermisson(userId);
            if (null != permissonList && permissonList.contains(req.getPermission())){
                return new ClientResp();
            }else {
                return new ClientResp(EnumRespCode.USER_NO_PERMISSON.getValue(),EnumRespCode.USER_NO_PERMISSON.getDesc());
            }
        }catch (TuboboAdminServerException e){
            return new ClientResp(e.getCode(), e.getErrorMsg());
        }catch (Exception e){
            logger.error("checkPermission ERROR. {}",e);
            return new ClientResp(EnumRespCode.CHECK_PERMISSON_ERROR.getValue(),EnumRespCode.CHECK_PERMISSON_ERROR.getDesc());
        }
    }

}
