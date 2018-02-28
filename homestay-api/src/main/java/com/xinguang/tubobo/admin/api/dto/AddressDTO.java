package com.xinguang.tubobo.admin.api.dto;

import java.io.Serializable;

/**
 * 地址实体
 */
public class AddressDTO implements Serializable {

	private String merchantId;//商家id

    private String name;
    private String phone;
    private String province;//省
    private String city;//市
    private String district;//区
    private String street;//街道
	private String detailAddress;//详细地址
    private String roomNo;//门牌号
	private Double longitude;
	private Double latitude;

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

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
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

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	@Override
	public String toString() {
		return "AddressDTO{" +
				"merchantId='" + merchantId + '\'' +
				", name='" + name + '\'' +
				", phone='" + phone + '\'' +
				", province='" + province + '\'' +
				", city='" + city + '\'' +
				", district='" + district + '\'' +
				", street='" + street + '\'' +
				", detailAddress='" + detailAddress + '\'' +
				", roomNo='" + roomNo + '\'' +
				", longitude=" + longitude +
				", latitude=" + latitude +
				'}';
	}
}
