package com.xinguang.tubobo.admin.api;


import com.xinguang.tubobo.admin.api.dto.AddressDTO;
import com.xinguang.tubobo.admin.api.dto.CarTypeDTO;
import com.xinguang.tubobo.admin.api.dto.CityOpenDTO;
import com.xinguang.tubobo.admin.api.enums.EnumCarType;
import com.xinguang.tubobo.admin.api.enums.EnumOrderType;

import java.util.List;

/**
 * 兔波波后台提供给商家的服务接口.
 */
public interface AdminToMerchantService {
    /**
     * 查询开通的城市列表
     *
     * @param orderType 区分货主大件或者商家小件。
     * @return
     * @see EnumOrderType
     */
    List<CityOpenDTO> queryOpenedCityList(String orderType);

    /**
     * 获取车辆类型列表
     *
     * @return
     */
    List<CarTypeDTO> queryCarTypeList();

    /**
     * 根据车辆类型，获取车辆信息
     *
     * @param
     * @return
     * @see EnumCarType
     */
    CarTypeDTO queryCarTypeInfo(String carType);

    boolean sendDistributeTaskSmsAlert();

    /**
     * 查询商家地址库
     *
     * @param merchantId
     * @param phone      从头开始 模糊匹配
     * @param limit      查询条数 查询条数 min=1,max=50
     * @return
     */
    List<AddressDTO> queryAddressRecords(String merchantId, String phone, int limit);
    /**
     * 发送短信给收件人
     *
     * @param riderName
     * @param riderPhone
     * @param receiverPhone      收信人
     * @return
     */
    boolean sendRiderMessageToReceiver(String riderName, String riderPhone, String receiverPhone);
}


