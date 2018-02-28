package com.xinguang.tubobo.admin.impl.entity;

import java.util.Date;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Indexed;

/**
 * 地址管理实体
 */
@Entity(noClassnameStored=true)
public class AddressInfoEntity {
	
    @Id
    private String id;

	@Indexed
    private String normalUserId;//用户ID

    private String type;//寄件地址 收件地址
    private String name;
	@Indexed
    private String phone;
    private String pcdCode;//省市区代码
    private String pcdName;//省市区中文

	private String province;//省
	private String city;//市
	private String district;//区

    private String street;//街道
    private String detailAddress;//详细地址
    private String roomNo;//门牌号
	private Double longitude;
	private Double latitude;
	@Indexed
    private String merchantId;//商家id

    private Boolean isDefault;//是否默认地址

    private String delFlag;
    private Date createDate;
    private String createBy;
    private Date updateDate;
    private String updateBy;
    
	public String getType() {
		return type;
	}
	public String getName() {
		return name;
	}
	public String getPhone() {
		return phone;
	}
	public String getPcdCode() {
		return pcdCode;
	}
	public String getPcdName() {
		return pcdName;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setPcdCode(String pcdCode) {
		this.pcdCode = pcdCode;
	}
	public void setPcdName(String pcdName) {
		this.pcdName = pcdName;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getNormalUserId() {
		return normalUserId;
	}
	public void setNormalUserId(String normalUserId) {
		this.normalUserId = normalUserId;
	}
	public Boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
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
}
