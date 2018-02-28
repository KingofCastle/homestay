package com.xinguang.tubobo.admin.web.admin.Dto.violations;

import java.io.Serializable;

/**
 * Created by yangxb on 2017/8/30.
 */
public class TimeoutPickupDto implements Serializable{

    private Double initDistance; //初始公里数
    private Double initMinute; // 取货时间
    private Double raiseMinute; //据店铺距离每增加1公里，取货时间增加取货时间
    private String orderType;

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public Double getInitMinute() {
        return initMinute;
    }

    public void setInitMinute(Double initMinute) {
        this.initMinute = initMinute;
    }

    public Double getRaiseMinute() {
        return raiseMinute;
    }

    public void setRaiseMinute(Double raiseMinute) {
        this.raiseMinute = raiseMinute;
    }

    public Double getInitDistance() {
        return initDistance;
    }

    public void setInitDistance(Double initDistance) {
        this.initDistance = initDistance;
    }


}
