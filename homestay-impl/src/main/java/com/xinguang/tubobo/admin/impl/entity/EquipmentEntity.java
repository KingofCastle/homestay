package com.xinguang.tubobo.admin.impl.entity;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Reference;
import org.mongodb.morphia.annotations.Transient;

import java.util.Date;
import java.util.List;

/**
 * 智能硬件设备
 */
@Entity(noClassnameStored=true)
public class EquipmentEntity {

	@Id
    private String id;//设备id

	private String name;//设备名称

	@Reference(ignoreMissing=true,lazy=true)
	private StoreEntity store; //门店

	@Reference(ignoreMissing=true,lazy=true)
	private List<WayBillSEntity> items;

	@Transient
    private String temperature;

    private Date createDate;
    private String createBy;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public StoreEntity getStore() {
		return store;
	}

	public void setStore(StoreEntity store) {
		this.store = store;
	}

	public List<WayBillSEntity> getItems() {
		return items;
	}

	public void setItems(List<WayBillSEntity> items) {
		this.items = items;
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

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
}
