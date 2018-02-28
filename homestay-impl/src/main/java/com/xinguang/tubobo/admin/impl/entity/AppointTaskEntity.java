package com.xinguang.tubobo.admin.impl.entity;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Indexed;
import org.mongodb.morphia.annotations.Reference;

import java.util.Date;
import java.util.List;

/**
 * 预约任务 取件任务/配送任务
 */
@Entity(noClassnameStored=true)
public class AppointTaskEntity {

	@Id
    private String id;
    
	//任务状态
    private String taskStatus;
    
    @Indexed
    private String normalUserId;//用户ID
    private String normalUserPhone;//用户手机

	//任务类型
	private String taskType;

    @Reference(ignoreMissing=true,lazy=true)
    private StoreEntity store; // 门店
    
    @Reference(ignoreMissing=true,lazy=true)
    private EmployeeEntity operator;//任务归属人
    private Date finishTime;//任务完成时间

	@Reference(ignoreMissing = true, lazy = true)
	private WayBillSEntity wayBillS;

	@Reference(ignoreMissing = true, lazy = true)
	private WayBillREntity wayBillR;

	@Reference(ignoreMissing = true, lazy = true)
	private List<TaskOperationEntity> operations;

	private Boolean evaluationFlag;//是否评价

 	private String senderName; // 寄件人姓名
	private String senderPhone; // 寄件人手机号
	private String senderPcdCode;//省市区代码
	private String senderPcdName;//省市区中文
	private String senderAddress; // 寄件人详细地址
	private String receiverName; // 收件人姓名
	private String receiverPhone; // 收件人手机号
	private String receiverPcdCode;//省市区代码
	private String receiverPcdName;//省市区中文
	private String receiverAddress; // 收件人详细地址

	private String shipment;//寄件物
	private Boolean insureFlag;//是否保价
	private Double insurePrice;//保价金额 单位：元；数字
	private Double weight;//单位：KG；数字
	private String size;//物品大小
	private String source;//来源
    
    private Double payment;//代收货款
    private Double payFreight;//代收运费
    private String remark;
    
    private String delFlag;
    private Date createDate; // 录入时间
    private String createBy; // 录入人
    private Date updateDate; // 更新时间
    private String updateBy; // 更新人

	private String appointTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}

	public String getNormalUserId() {
		return normalUserId;
	}

	public void setNormalUserId(String normalUserId) {
		this.normalUserId = normalUserId;
	}

	public String getNormalUserPhone() {
		return normalUserPhone;
	}

	public void setNormalUserPhone(String normalUserPhone) {
		this.normalUserPhone = normalUserPhone;
	}

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public StoreEntity getStore() {
		return store;
	}

	public void setStore(StoreEntity store) {
		this.store = store;
	}

	public EmployeeEntity getOperator() {
		return operator;
	}

	public void setOperator(EmployeeEntity operator) {
		this.operator = operator;
	}

	public Date getFinishTime() {
		return finishTime;
	}

	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}

	public WayBillSEntity getWayBillS() {
		return wayBillS;
	}

	public void setWayBillS(WayBillSEntity wayBillS) {
		this.wayBillS = wayBillS;
	}

	public List<TaskOperationEntity> getOperations() {
		return operations;
	}

	public void setOperations(List<TaskOperationEntity> operations) {
		this.operations = operations;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderPhone() {
		return senderPhone;
	}

	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}

	public String getSenderPcdCode() {
		return senderPcdCode;
	}

	public void setSenderPcdCode(String senderPcdCode) {
		this.senderPcdCode = senderPcdCode;
	}

	public String getSenderPcdName() {
		return senderPcdName;
	}

	public void setSenderPcdName(String senderPcdName) {
		this.senderPcdName = senderPcdName;
	}

	public String getSenderAddress() {
		return senderAddress;
	}

	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getReceiverPcdCode() {
		return receiverPcdCode;
	}

	public void setReceiverPcdCode(String receiverPcdCode) {
		this.receiverPcdCode = receiverPcdCode;
	}

	public String getReceiverPcdName() {
		return receiverPcdName;
	}

	public void setReceiverPcdName(String receiverPcdName) {
		this.receiverPcdName = receiverPcdName;
	}

	public String getReceiverAddress() {
		return receiverAddress;
	}

	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	public String getShipment() {
		return shipment;
	}

	public void setShipment(String shipment) {
		this.shipment = shipment;
	}

	public Boolean getInsureFlag() {
		return insureFlag;
	}

	public void setInsureFlag(Boolean insureFlag) {
		this.insureFlag = insureFlag;
	}

	public Double getInsurePrice() {
		return insurePrice;
	}

	public void setInsurePrice(Double insurePrice) {
		this.insurePrice = insurePrice;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Double getPayment() {
		return payment;
	}

	public void setPayment(Double payment) {
		this.payment = payment;
	}

	public Double getPayFreight() {
		return payFreight;
	}

	public void setPayFreight(Double payFreight) {
		this.payFreight = payFreight;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getAppointTime() {
		return appointTime;
	}

	public void setAppointTime(String appointTime) {
		this.appointTime = appointTime;
	}

	public Boolean getEvaluationFlag() {
		return evaluationFlag;
	}

	public void setEvaluationFlag(Boolean evaluationFlag) {
		this.evaluationFlag = evaluationFlag;
	}

	public WayBillREntity getWayBillR() {
		return wayBillR;
	}

	public void setWayBillR(WayBillREntity wayBillR) {
		this.wayBillR = wayBillR;
	}
}
