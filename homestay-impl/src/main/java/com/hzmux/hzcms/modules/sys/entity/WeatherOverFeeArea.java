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
@Table(name = "biz_weather_area")
@DynamicInsert
@DynamicUpdate
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class WeatherOverFeeArea extends IdEntity<WeatherOverFeeArea> {

    private static final long serialVersionUID = 1L;
    private boolean weatherIsOpen;
    private String  districtCode;
    private String  cityCode;
    private Double  weatherOverFee;
    public boolean getWeatherIsOpen() {
        return weatherIsOpen;
    }

    public void setWeatherIsOpen(boolean weatherIsOpen) {
        this.weatherIsOpen = weatherIsOpen;
    }


    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public Double getWeatherOverFee() {
        return weatherOverFee;
    }

    public void setWeatherOverFee(Double weatherOverFee) {
        this.weatherOverFee = weatherOverFee;
    }

    @Override
    public String toString() {
        return "WeatherOverFeeArea{" +
                "districtCode='" + districtCode + '\'' +
                ", cityCode='" + cityCode + '\'' +
                ", weatherOverFee=" + weatherOverFee +
                '}';
    }
}
