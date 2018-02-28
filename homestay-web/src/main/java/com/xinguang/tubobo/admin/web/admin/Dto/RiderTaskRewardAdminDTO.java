package com.xinguang.tubobo.admin.web.admin.Dto;

import com.xinguang.tubobo.rider.api.RiderToAdminServiceInterface;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;

/**
 * Created by yanxu on 2017/7/11.
 */
public class RiderTaskRewardAdminDTO implements Serializable {

    private boolean rewardIsOpen; //开关是否开启
    private String beginNum;   //每段附加费开始任务数  ,分割
    private String endNum;     //每段附加费开始任务数    ,分割
    private String perFee;          //每段附加费    ,分割
    private String choice;

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public boolean isRewardIsOpen() {
        return rewardIsOpen;
    }

    public void setRewardIsOpen(boolean rewardIsOpen) {
        this.rewardIsOpen = rewardIsOpen;
    }

    public String getBeginNum() {
        return beginNum;
    }

    public void setBeginNum(String beginNum) {
        this.beginNum = beginNum;
    }

    public String getEndNum() {
        return endNum;
    }

    public void setEndNum(String endNum) {
        this.endNum = endNum;
    }

    public String getPerFee() {
        return perFee;
    }

    public void setPerFee(String perFee) {
        this.perFee = perFee;
    }
}
