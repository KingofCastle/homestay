package com.xinguang.tubobo.admin.impl.entity;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Reference;

import java.util.Date;

/**
 * 上传签收
 */
@Entity(noClassnameStored=true)
public class UploadSignInfoEntity {

	@Id
    private String id;
	
	private Date createDate;

	@Reference(ignoreMissing=true,lazy=true)
	private StoreEntity store; //门店

	@Reference(ignoreMissing=true,lazy=true)
	private EmployeeEntity employee;//入库人员

	private String userTags;
	private String comment;
	private String waybillNo;
	private String receiverPhone;
	private boolean lsSignFlag;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public StoreEntity getStore() {
		return store;
	}

	public void setStore(StoreEntity store) {
		this.store = store;
	}

	public EmployeeEntity getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeEntity employee) {
		this.employee = employee;
	}

	public String getUserTags() {
		return userTags;
	}

	public void setUserTags(String userTags) {
		this.userTags = userTags;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getWaybillNo() {
		return waybillNo;
	}

	public void setWaybillNo(String waybillNo) {
		this.waybillNo = waybillNo;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public boolean isLsSignFlag() {
		return lsSignFlag;
	}

	public void setLsSignFlag(boolean lsSignFlag) {
		this.lsSignFlag = lsSignFlag;
	}

}
