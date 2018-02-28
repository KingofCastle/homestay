package com.xinguang.tubobo.admin.api;


import com.xinguang.tubobo.admin.api.dto.OverFeeDTO;

/**
 * 兔波波后台提供给商家的查询溢价 接口
 */
public interface OverFeeService {

    /**
     * 兔波波后台提供给商家的查询溢价记录数据
     * areaCode 传入趋于码
     */
    OverFeeDTO findOverFee(String areaCode);
    /**
     * 兔波波后台提供给商家端该查询天气溢价是否
     */

}
