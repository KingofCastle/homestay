package com.xinguang.tubobo.admin.web.admin.Dto;

import java.io.Serializable;

/**
 * Created by yanxu on 2017/7/11.
 */
public class OverTimeAdminDTO implements Serializable {
    private Double initDistance;    //起始距离
    private Double initMinute;       //起始送达时间
    private Double raiseMinute;     //配送距离每增加1公里，配送时间增加分数
    private String beginMinute;     //每段超出时间开始点    ,分割
    private String endMinute;          //每段超出时间结束点    ,分割
    private String punishFee;          //骑手惩罚费用    ,分割
    private String paidFee;          //赔偿给商家费用    ,分割
    private String orderType;

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public Double getInitDistance() {
        return initDistance;
    }

    public void setInitDistance(Double initDistance) {
        this.initDistance = initDistance;
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

    public String getBeginMinute() {
        return beginMinute;
    }

    public void setBeginMinute(String beginMinute) {
        this.beginMinute = beginMinute;
    }

    public String getEndMinute() {
        return endMinute;
    }

    public void setEndMinute(String endMinute) {
        this.endMinute = endMinute;
    }

    public String getPunishFee() {
        return punishFee;
    }

    public void setPunishFee(String punishFee) {
        this.punishFee = punishFee;
    }

    public String getPaidFee() {
        return paidFee;
    }

    public void setPaidFee(String paidFee) {
        this.paidFee = paidFee;
    }
}
