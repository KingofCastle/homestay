package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ReqAddressInfo {

	@NotBlank(message = "token 不能为空")
	private String token;
	private String id;

    @NotBlank(message = "name 不能为空")
	@Size(min = 1, max = 10,message = "name 长度为1-10")
    private String name;

    @NotBlank(message = "phone 不能为空")
	@Pattern(regexp = "^1\\d{10}|((0\\d{2,3})(-)?)(\\d{7,8})((-)?(\\d{3,}))?$" ,message = "phone 格式错误")
    private String phone;

	@NotBlank(message = "pcdCode 不能为空")
	@Pattern(regexp = "^\\d{6,8}((\\s\\d{6,8})?)((\\s\\d{6,8})?)$" ,message = "pcdCode 格式错误")
    private String pcdCode;//省市区代码

	@NotBlank(message = "pcdName 不能为空")
	@Pattern(regexp = "^[\\u4E00-\\u9FA5]{1,10}((\\s[\\u4E00-\\u9FA5]{1,10})?)((\\s[\\u4E00-\\u9FA5]{1,10})?)$" ,message = "pcdName 格式错误")
    private String pcdName;//省市区中文

    @NotBlank(message = "detailAddress 不能为空")
	@Size(min = 1, max = 30,message = "detailAddress 长度为1-30")
    private String detailAddress;

	private Double longitude;
	private Double latitude;

    private boolean isDefault;//是否默认地址

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
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
}
