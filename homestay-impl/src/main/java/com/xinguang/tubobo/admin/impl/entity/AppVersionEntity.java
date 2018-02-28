package com.xinguang.tubobo.admin.impl.entity;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;

import java.util.Date;

@Entity(noClassnameStored=true)
public class AppVersionEntity {
	
	@Id
	private String id;
	
	private String appName;
	
	private String appType;//ios;android
    private String version;
    private String minVersion;
    private String jsVersion;
    private String url;
    private String bundleUrl;
    private String md5;
    private String supportMinVersion;

    private String description;
    
    private String delFlag;
    private Date createDate;
    
	public String getId() {
		return id;
	}
	public String getAppName() {
		return appName;
	}
	public String getAppType() {
		return appType;
	}
	public String getVersion() {
		return version;
	}
	public String getMinVersion() {
		return minVersion;
	}
	public String getUrl() {
		return url;
	}
	public String getDescription() {
		return description;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public void setAppType(String appType) {
		this.appType = appType;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public void setMinVersion(String minVersion) {
		this.minVersion = minVersion;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getJsVersion() {
		return jsVersion;
	}
	public void setJsVersion(String jsVersion) {
		this.jsVersion = jsVersion;
	}
	public String getBundleUrl() {
		return bundleUrl;
	}
	public void setBundleUrl(String bundleUrl) {
		this.bundleUrl = bundleUrl;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}

	public String getSupportMinVersion() {
		return supportMinVersion;
	}

	public void setSupportMinVersion(String supportMinVersion) {
		this.supportMinVersion = supportMinVersion;
	}
}
