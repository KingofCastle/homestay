package com.hzmux.hzcms.modules.sys.entity;

import com.hzmux.hzcms.common.persistence.IdEntity;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yanxu on 2017/7/13.
 */
@Entity
@Table(name = "biz_peek_fee")
@DynamicInsert
@DynamicUpdate
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class PeekOverFeeEntity extends IdEntity<PeekOverFeeEntity> {

    private static final long serialVersionUID = 1L;
    private Double peekOverFee;
    private boolean peekIsOpenBack;
    private Integer weekStart;
    private Integer weekEnd;
    private Integer hourStart;
    private Integer minuteStart;
    private Integer hourEnd;
    private Integer minuteEnd;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Double getPeekOverFee() {
        return peekOverFee;
    }

    public void setPeekOverFee(Double peekOverFee) {
        this.peekOverFee = peekOverFee;
    }

    public boolean isPeekIsOpenBack() {
        return peekIsOpenBack;
    }

    public void setPeekIsOpenBack(boolean peekIsOpenBack) {
        this.peekIsOpenBack = peekIsOpenBack;
    }

    public Integer getWeekStart() {
        return weekStart;
    }

    public void setWeekStart(Integer weekStart) {
        this.weekStart = weekStart;
    }

    public Integer getWeekEnd() {
        return weekEnd;
    }

    public void setWeekEnd(Integer weekEnd) {
        this.weekEnd = weekEnd;
    }

    public Integer getHourStart() {
        return hourStart;
    }

    public void setHourStart(Integer hourStart) {
        this.hourStart = hourStart;
    }

    public Integer getMinuteStart() {
        return minuteStart;
    }

    public void setMinuteStart(Integer minuteStart) {
        this.minuteStart = minuteStart;
    }

    public Integer getHourEnd() {
        return hourEnd;
    }

    public void setHourEnd(Integer hourEnd) {
        this.hourEnd = hourEnd;
    }

    public Integer getMinuteEnd() {
        return minuteEnd;
    }

    public void setMinuteEnd(Integer minuteEnd) {
        this.minuteEnd = minuteEnd;
    }

    @Override
    public String toString() {
        return "PeekOverFeeEntity{" +
                "peekOverFee=" + peekOverFee +
                ", peekIsOpenBack=" + peekIsOpenBack +
                ", weekStart=" + weekStart +
                ", weekEnd=" + weekEnd +
                ", hourStart=" + hourStart +
                ", minuteStart=" + minuteStart +
                ", hourEnd=" + hourEnd +
                ", minuteEnd=" + minuteEnd +
                '}';
    }
}
