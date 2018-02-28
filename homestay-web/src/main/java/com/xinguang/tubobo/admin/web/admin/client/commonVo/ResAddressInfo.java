package com.xinguang.tubobo.admin.web.admin.client.commonVo;


/**
 * 地址管理实体
 */
public class ResAddressInfo {

	private String id;
    
    private String name;
    private String phone;
    private String pcdCode;//省市区代码
    private String pcdName;//省市区中文
    private String detailAddress;
    private Boolean isDefault;//是否默认地址
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPcdCode() {
		return pcdCode;
	}
	public void setPcdCode(String pcdCode) {
		this.pcdCode = pcdCode;
	}
	public String getPcdName() {
		return pcdName;
	}
	public void setPcdName(String pcdName) {
		this.pcdName = pcdName;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}

}
