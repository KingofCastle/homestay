package com.xinguang.tubobo.admin.impl.entity;

import java.util.Date;
import java.util.List;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Reference;

@Entity(noClassnameStored=true)
public class StoreEntity {
	
    @Id
    private String storeId;
    
	private String parentId;//父级id
	private String parentIds;//所有父级id
	private String areaId;//归属区域id
	
    private String storeCode;
    private String storeName;
    private String storePhone;
    private String storeType;
    private String storeAddressStandard;//区域码对应的规范地址
    private String storeAddressDetail;//具体详细地址

	private String storeSource; // 门店来源 自营、加盟

    private String areaCode; // 标准的行政区域code
    private String riderAble; // 0:对骑士不开放；1：对骑士开放

    private String youzanShopAble;//有赞店铺是否开放 0:不开放；1：开放

    @Reference(ignoreMissing=true,lazy=true)
    private List<ExpressCompanyEntity> expressCompanyList;
//    private String expressCompanyIds;//门店与快递公司业务关系 split by ","

    private Date createDate;
    private String createBy;
    private Date updateDate;
    private String updateBy;

    private Double longitude;//门店经度
    private Double latitude;//门店纬度

	//对应乐收门店信息
	private Boolean lsFlag;//是否开通同步签收

	private String lsLoginName;
	private String lsLoginPwd;

    private String lsBoxId;//货架号
    private String lsNodeId;//站点
    private String lsNodeName;
    private String lsLockerId;//柜口 园区
    private String lsLockerAddress;
    private String lsUserId;
    private String lsUserName;
    private String lsPhone;
    private String lsType;

    public StoreEntity() {
    }
	public StoreEntity(String storeId) {
	    this.storeId = storeId;
    }

	public Boolean getLsFlag() {
		return lsFlag;
	}

	public void setLsFlag(Boolean lsFlag) {
		this.lsFlag = lsFlag;
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

	public String getLsLoginName() {
		return lsLoginName;
	}

	public void setLsLoginName(String lsLoginName) {
		this.lsLoginName = lsLoginName;
	}

	public String getLsLoginPwd() {
		return lsLoginPwd;
	}

	public void setLsLoginPwd(String lsLoginPwd) {
		this.lsLoginPwd = lsLoginPwd;
	}

	public String getLsBoxId() {
		return lsBoxId;
	}

	public void setLsBoxId(String lsBoxId) {
		this.lsBoxId = lsBoxId;
	}

	public String getLsLockerId() {
		return lsLockerId;
	}

	public void setLsLockerId(String lsLockerId) {
		this.lsLockerId = lsLockerId;
	}

	public String getLsLockerAddress() {
		return lsLockerAddress;
	}

	public void setLsLockerAddress(String lsLockerAddress) {
		this.lsLockerAddress = lsLockerAddress;
	}

	public String getLsNodeId() {
		return lsNodeId;
	}

	public void setLsNodeId(String lsNodeId) {
		this.lsNodeId = lsNodeId;
	}

	public String getLsNodeName() {
		return lsNodeName;
	}

	public void setLsNodeName(String lsNodeName) {
		this.lsNodeName = lsNodeName;
	}

	public String getLsUserId() {
		return lsUserId;
	}

	public void setLsUserId(String lsUserId) {
		this.lsUserId = lsUserId;
	}

	public String getLsUserName() {
		return lsUserName;
	}

	public void setLsUserName(String lsUserName) {
		this.lsUserName = lsUserName;
	}

	public String getLsPhone() {
		return lsPhone;
	}

	public void setLsPhone(String lsPhone) {
		this.lsPhone = lsPhone;
	}

	public String getLsType() {
		return lsType;
	}

	public void setLsType(String lsType) {
		this.lsType = lsType;
	}

	public String getStoreId() {
		return storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public String getStoreType() {
		return storeType;
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
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
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

    public String getStoreCode() {
        return storeCode;
    }
    public void setStoreCode(String storeCode) {
        this.storeCode = storeCode;
    }
    public List<ExpressCompanyEntity> getExpressCompanyList() {
        return expressCompanyList;
    }
    public void setExpressCompanyList(List<ExpressCompanyEntity> expressCompanyList) {
        this.expressCompanyList = expressCompanyList;
    }
    public String getAreaCode() {
        return areaCode;
    }
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }
    public String getRiderAble() {
        return riderAble;
    }
    public void setRiderAble(String riderAble) {
        this.riderAble = riderAble;
    }
	public String getStoreAddressStandard() {
		return storeAddressStandard;
	}
	public String getStoreAddressDetail() {
		return storeAddressDetail;
	}
	public void setStoreAddressStandard(String storeAddressStandard) {
		this.storeAddressStandard = storeAddressStandard;
	}
	public void setStoreAddressDetail(String storeAddressDetail) {
		this.storeAddressDetail = storeAddressDetail;
	}
	public String getYouzanShopAble() {
		return youzanShopAble;
	}
	public void setYouzanShopAble(String youzanShopAble) {
		this.youzanShopAble = youzanShopAble;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getParentIds() {
		return parentIds;
	}
	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getStoreSource() {
		return storeSource;
	}

	public void setStoreSource(String storeSource) {
		this.storeSource = storeSource;
	}

	@Override
	public String toString() {
		return "{" +
				"storeName='" + storeName + '\'' +
				", lsBoxId='" + lsBoxId + '\'' +
				", lsNodeId='" + lsNodeId + '\'' +
				", lsLockerId='" + lsLockerId + '\'' +
				", lsUserId='" + lsUserId + '\'' +
				'}';
	}
}
