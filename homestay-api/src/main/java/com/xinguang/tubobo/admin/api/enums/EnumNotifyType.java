package com.xinguang.tubobo.admin.api.enums;

/**
 * 车配车辆类型枚举.
 */
public enum EnumNotifyType {
    NOTIFY_MERCHANT("商家", "MERCHANT"),
    NOTIFY_RIDER("骑手", "RIDER"),
    NOTIFY_DRIVER("司机", "DRIVER");

    EnumNotifyType(String name, String value){
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
