package com.xinguang.tubobo.admin.api.enums;

public enum EnumExpressTrack{

	IN("入库"),
	OUT("出库"),
	DELAY("滞留"),
	SIGN("签收"),
	CHANGE_TO_DELIVERY("预约配送"),
	PUT_INTO_FRIDGE("放入冰箱"),
	RETURNBACK("退回")
	;
	
    private String value;
     
    private EnumExpressTrack(String value){
        this.value = value;
    }

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
     
}
