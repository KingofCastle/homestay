package com.xinguang.tubobo.admin.web.restful.controller;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.hzmux.hzcms.common.beanvalidator.BeanValidators;
import com.hzmux.hzcms.common.utils.StringUtils;
import com.hzmux.hzcms.modules.sys.service.SystemService;
import com.xinguang.tubobo.admin.api.enums.EnumRespCode;
import com.xinguang.tubobo.admin.api.exception.TuboboAdminServerException;
import com.xinguang.tubobo.admin.impl.utils.SecretUtils;
import com.xinguang.tubobo.admin.web.restful.ClientResp;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Validator;
import java.util.List;

/**
 * 2017-08-01
 * ouyoung
 */
public abstract class BaseRestfulController<P> {

    protected Logger logger = LoggerFactory.getLogger(BaseRestfulController.class);

    @Autowired
    protected Validator validator;
    @Autowired
    protected SystemService systemService;

//    @RequestMapping
//    @ResponseBody
//    protected Object request(@RequestBody(required = false) P req, HttpServletRequest request, HttpServletResponse response) {
//
//        try {
//            // 验证请求参数
//            valid(req);
//
//            String userId = "";
//            // 验证token
//            if (needLogin()) {
//                userId = checkToken(request.getHeader("Authorization"));
//            }
//
//            if (StringUtils.isBlank(userId)) {
//                return new ClientResp(EnumRespCode.INFO_ERROR.getValue(), EnumRespCode.INFO_ERROR.getDesc());
//            }
//
//            // 验证permission
//            checkPermission(userId,returnPermission());
//
//            // 处理业务
//            Object res = doService(userId,req);
//            return new ClientResp(res);
//
//        }catch (TuboboAdminServerException e){
//            return new ClientResp(e.getCode() , e.getErrorMsg());
//        }catch (Exception e){
//            logger.error("{}",e);
//            return new ClientResp(EnumRespCode.BUSY.getValue() , EnumRespCode.BUSY.getDesc());
//        }
//
//    }

    /**
     * 业务处理
     *
     * @param req
     * @return 正常处理完成之后正常返回
     */
    protected Object doService(String userId, P req) throws TuboboAdminServerException {
        return null;
    }

    /**
     * 是否需要验证token
     *
     * @return
     */
    protected boolean needLogin() {
        return true;
    }

    /**
     * 获取权限
     * @return
     */
    protected String returnPermission(){
        return null;
    }

    /**
     * 验证token
     * @param token
     * @return
     * @throws TuboboAdminServerException
     */
    protected String checkToken(String token) throws TuboboAdminServerException {
        if(StringUtils.isBlank(token)){
            throw new TuboboAdminServerException(EnumRespCode.TOKEN_MISS);
        }
        try {
            return SecretUtils.jwtVerify(token);
        }catch (TokenExpiredException e){
            throw new TuboboAdminServerException(EnumRespCode.TOKEN_EXPIRED);
        }catch (JWTVerificationException e){
            throw new TuboboAdminServerException(EnumRespCode.TOKEN_VALID_FAIL);
        }catch (Exception e){
            logger.error("checkToken ERROR. {}",e);
            throw new TuboboAdminServerException(EnumRespCode.TOKEN_VALID_ERROR);
        }
    }

    /**
     * 验证permission
     * @param userId
     * @return
     * @throws TuboboAdminServerException
     */
    protected void checkPermission(String userId,String permission) throws TuboboAdminServerException {
        try {
            if (StringUtils.isBlank(permission)) {
                return;
            }
            List<String> permissonList = systemService.queryPermisson(userId);
            if (null != permissonList && permissonList.contains(permission)){
                return;
            }else {
                throw new TuboboAdminServerException(EnumRespCode.USER_NO_PERMISSON);
            }
        }catch (TuboboAdminServerException e){
            throw new TuboboAdminServerException(EnumRespCode.USER_NO_PERMISSON);
        }catch (Exception e){
            logger.error("checkPermission ERROR. {}",e);
            throw new TuboboAdminServerException(EnumRespCode.CHECK_PERMISSON_ERROR);
        }
    }

    /**
     * 验证请求参数
     * @param req
     * @throws TuboboAdminServerException
     */
    protected void valid(Object req) throws TuboboAdminServerException {
        try {
            BeanValidators.valid(validator,req);
        }catch (Exception e){
            throw new TuboboAdminServerException(EnumRespCode.PARAMS_ERROR.getValue(), e.getMessage());
        }
    }

}
