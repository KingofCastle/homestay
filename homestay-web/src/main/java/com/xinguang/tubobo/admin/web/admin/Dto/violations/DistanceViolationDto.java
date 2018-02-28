package com.xinguang.tubobo.admin.web.admin.Dto.violations;

import java.io.Serializable;

/**
 * Created by yangxb on 2017/8/31.
 */
public class DistanceViolationDto implements Serializable{
    private Integer pickupDistance;
    private Integer arriveDistance;

    public Integer getPickupDistance() {
        return pickupDistance;
    }

    public void setPickupDistance(Integer pickupDistance) {
        this.pickupDistance = pickupDistance;
    }

    public Integer getArriveDistance() {
        return arriveDistance;
    }

    public void setArriveDistance(Integer arriveDistance) {
        this.arriveDistance = arriveDistance;
    }
}
