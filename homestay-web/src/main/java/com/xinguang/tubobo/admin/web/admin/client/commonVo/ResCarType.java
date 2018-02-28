package com.xinguang.tubobo.admin.web.admin.client.commonVo;

/**
 * Created by YUGE on 2017/6/12.
 */
public class ResCarType {

    private String name;//类型名称

    private String carType;//车辆类型

    public ResCarType(String name, String carType) {
        this.name = name;
        this.carType = carType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }
}
