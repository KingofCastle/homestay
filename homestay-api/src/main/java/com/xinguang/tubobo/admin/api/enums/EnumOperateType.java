package com.xinguang.tubobo.admin.api.enums;

/**
 * 车配车辆类型枚举.
 */
public enum EnumOperateType {
    CLIENT_DELETE("删除", "DEL"),
    CLIENT_READE("已读", "PROCESS");

    EnumOperateType(String name, String value){
        this.name = name;
        this.value = value;
    }
    private String name;
    private String value;

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
