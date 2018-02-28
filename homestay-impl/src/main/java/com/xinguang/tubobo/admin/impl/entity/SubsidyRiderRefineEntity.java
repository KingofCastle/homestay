package com.xinguang.tubobo.admin.impl.entity;

import java.io.Serializable;

/**
 * Created by lvhantai on 2017/7/11.
 */
public class SubsidyRiderRefineEntity implements Serializable{
    private String id;
    private Integer subsidyWeekStart;       //补贴星期开始
    private Integer subsidyWeekEnd;         //补贴星期结束
    private Double subsidyAmount;           //补贴金额
    private String subsidyHourStart;        //开始时间 时
    private String subsidyHourEnd;          //结束时间 时
    private String subsidyMinuteStart;      //开始时间 分
    private String subsidyMinuteEnd;        //开始时间 分
    private String provinceName;            //省代号
    private String cityName;                //市代号
    private String areaName;               //区代号
    private String provinceCode;            //省代号
    private String cityCode;                //市代号
    private String areaCode;               //区代号
    private String orderType;

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }



    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getSubsidyWeekStart() {
        return subsidyWeekStart;
    }

    public void setSubsidyWeekStart(Integer subsidyWeekStart) {
        this.subsidyWeekStart = subsidyWeekStart;
    }

    public Integer getSubsidyWeekEnd() {
        return subsidyWeekEnd;
    }

    public void setSubsidyWeekEnd(Integer subsidyWeekEnd) {
        this.subsidyWeekEnd = subsidyWeekEnd;
    }

    public Double getSubsidyAmount() {
        return subsidyAmount;
    }

    public void setSubsidyAmount(Double subsidyAmount) {
        this.subsidyAmount = subsidyAmount;
    }

    public String getSubsidyHourStart() {
        return subsidyHourStart;
    }

    public void setSubsidyHourStart(String subsidyHourStart) {
        this.subsidyHourStart = subsidyHourStart;
    }

    public String getSubsidyHourEnd() {
        return subsidyHourEnd;
    }

    public void setSubsidyHourEnd(String subsidyHourEnd) {
        this.subsidyHourEnd = subsidyHourEnd;
    }

    public String getSubsidyMinuteStart() {
        return subsidyMinuteStart;
    }

    public void setSubsidyMinuteStart(String subsidyMinuteStart) {
        this.subsidyMinuteStart = subsidyMinuteStart;
    }

    public String getSubsidyMinuteEnd() {
        return subsidyMinuteEnd;
    }

    public void setSubsidyMinuteEnd(String subsidyMinuteEnd) {
        this.subsidyMinuteEnd = subsidyMinuteEnd;
    }

    public static final String PARAMETER_NORMAL = "1";
    public static final String PARAMETER_WEEK_ERROR = "2";
    public static final String PARAMETER_HOUR_ERROR = "3";
    public static final String PARAMETER_AMOUNT_RANGE_ERROR = "4";
    public static final String PARAMETER_AMOUNT_ACCURACY_ERROR = "5";
    public static final String PARAMETER_EXIST = "6";
    public static final String PARAMETER_MINUTE_ERROR = "7";
    public static final String SWITCH_STATUS_CPEN = "0";//开
    public static final String SWITCH_STATUS_CLOSE = "1";//关
    public static final String AREACODE_EMPTY = "0";//区域码为空
    public static final String AREACODE_EXIST = "1";//
}
