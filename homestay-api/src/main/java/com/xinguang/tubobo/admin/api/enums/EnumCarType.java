package com.xinguang.tubobo.admin.api.enums;

/**
 * 车配车辆类型枚举.
 */
public enum EnumCarType {
    SMALL_MINIBUS("小型面包", "small-minibus"),
    SMALL_VAN("小型厢货", "small-van"),
    MEDIUM_VAN("中型厢货", "medium-van"),
    MEDIUM_MINIBUS("中型面包", "medium-minibus");

    EnumCarType(String name, String value){
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

    public static String getNameByType(String type){
        String name = "";
        for (EnumCarType enumCarType:EnumCarType.values()){
            if (enumCarType.getValue().equals(type)){
                name = enumCarType.getName();
                break;
            }
        }
        return name;
    }
}
