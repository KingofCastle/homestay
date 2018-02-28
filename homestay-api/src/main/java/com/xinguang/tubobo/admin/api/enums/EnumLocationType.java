package com.xinguang.tubobo.admin.api.enums;

/**
 * Created by YUGE on 2017/6/14.
 */
public enum EnumLocationType {

    GPS("gps坐标", "gps");

    private String name;
    private String value;

    private EnumLocationType(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
