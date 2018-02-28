package com.hzmux.hzcms.modules.sys.entity;

import com.hzmux.hzcms.common.persistence.IdEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yanxu on 2017/6/26.
 */
@Entity
@Table(name = "biz_over_fee")
@DynamicInsert
@DynamicUpdate
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class OverFeeEntity extends IdEntity<OverFeeEntity> {

    private static final long serialVersionUID = 1L;

    private Double peekOverFee;  	//高峰溢价费
    private Double weatherOverFee; 	//天气溢价费
    private boolean peekIsOpen;		//高峰溢价开关状态
    private boolean weatherIsOpen;	//天气溢价开关状态

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


    @Override
    public String toString() {
        return "OverFeeEntity{" +
                "peekOverFee=" + peekOverFee +
                ", weatherOverFee=" + weatherOverFee +
                ", peekIsOpen=" + peekIsOpen +
                ", weatherIsOpen=" + weatherIsOpen +
                ", peekIsOpenBack=" + peekIsOpenBack +
                '}';
    }
}
