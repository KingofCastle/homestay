package com.xinguang.tubobo.admin.api.dto;

import java.io.Serializable;

/**
 * Created by yanxu on 2017/6/27.
 */
public class OverFeeDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Double peekOverFee;  	//高峰溢价费
    private Double weatherOverFee; 	//天气溢价费
    private boolean peekIsOpen;		//高峰溢价开关状态
    private boolean weatherIsOpen;	//天气溢价开关状态
    private String weatherArea;		//天气溢价覆盖区域编码
    private boolean peekIsOpenBack;  //高峰溢价后台开关状态


    public boolean getPeekIsOpenBack() {
        return peekIsOpenBack;
    }

    public void setPeekIsOpenBack(boolean peekIsOpenBack) {
        this.peekIsOpenBack = peekIsOpenBack;
    }

    public Double getPeekOverFee() {
        return peekOverFee;
    }

    public void setPeekOverFee(Double peekOverFee) {
        this.peekOverFee = peekOverFee;
    }

    public Double getWeatherOverFee() {
        return weatherOverFee;
    }

    public void setWeatherOverFee(Double weatherOverFee) {
        this.weatherOverFee = weatherOverFee;
    }

    public boolean getPeekIsOpen() {
        return peekIsOpen;
    }

    public void setPeekIsOpen(boolean peekIsOpen) {
        this.peekIsOpen = peekIsOpen;
    }

    public boolean getWeatherIsOpen() {
        return weatherIsOpen;
    }

    public void setWeatherIsOpen(boolean weatherIsOpen) {
        this.weatherIsOpen = weatherIsOpen;
    }

    public String getWeatherArea() {
        return weatherArea;
    }

    public void setWeatherArea(String weatherArea) {
        this.weatherArea = weatherArea;
    }

    @Override
    public String toString() {
        return "OverFeeEntity{" +
                "peekOverFee=" + peekOverFee +
                ", weatherOverFee=" + weatherOverFee +
                ", peekIsOpen=" + peekIsOpen +
                ", weatherIsOpen=" + weatherIsOpen +
                ", weatherArea='" + weatherArea + '\'' +
                ", peekIsOpenBack=" + peekIsOpenBack +
                '}';
    }

}
