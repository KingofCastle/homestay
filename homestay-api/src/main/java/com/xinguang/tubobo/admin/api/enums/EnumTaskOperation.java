package com.xinguang.tubobo.admin.api.enums;

/**
 * Created by YUGE on 2017/5/26.
 */
public enum EnumTaskOperation {

    ASSIGN("指派", "ASSIGN"),
    CLOSE("关闭", "CLOSE"),
    ALLOTE("分配", "ALLOTE"),
    REALLOT("退回", "REALLOT");

    private String name;
    private String value;

    private EnumTaskOperation(String name, String value) {
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
