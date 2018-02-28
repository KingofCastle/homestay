package com.xinguang.tubobo.admin.web.admin.Dto;

import java.io.Serializable;

/**
 * Created by yangxb on 2017/8/30.
 */
public class OrderCancelCompensationDto implements Serializable {

    private Double merDeductionFee;  	//商家扣款费用
    private Double merCompensationDriverFee; 	//商家赔偿骑手费用
    private Double driverDeductionFee;  	//骑手扣款费用
    private Double driverCompensationMerFee; 	//骑手赔偿商家费用

    public Double getMerDeductionFee() {
        return merDeductionFee;
    }

    public void setMerDeductionFee(Double merDeductionFee) {
        this.merDeductionFee = merDeductionFee;
    }

    public Double getMerCompensationDriverFee() {
        return merCompensationDriverFee;
    }

    public void setMerCompensationDriverFee(Double merCompensationDriverFee) {
        this.merCompensationDriverFee = merCompensationDriverFee;
    }

    public Double getDriverDeductionFee() {
        return driverDeductionFee;
    }

    public void setDriverDeductionFee(Double driverDeductionFee) {
        this.driverDeductionFee = driverDeductionFee;
    }

    public Double getDriverCompensationMerFee() {
        return driverCompensationMerFee;
    }

    public void setDriverCompensationMerFee(Double driverCompensationMerFee) {
        this.driverCompensationMerFee = driverCompensationMerFee;
    }
}
