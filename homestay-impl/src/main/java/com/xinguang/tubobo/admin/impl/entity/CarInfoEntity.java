package com.xinguang.tubobo.admin.impl.entity;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by lvhantai on 2017/5/26.
 * 车辆信息管理entity
 */
@Entity(noClassnameStored = true)
public class CarInfoEntity implements Serializable{
    @Id
    private String id;

    private String iconUrl;         //图片
    private String name;
    private String carType;         //小型面包：small-minibus;
                                    //中型面包: medium-minibus;
                                    //小型厢货：small-van;
                                    //中型厢货：medium-van
    private Double startPrice;      //起步价
    private Double startDistance;   //起步公里
    private Double beyondPrice;     //超出范围每公里价格
    private Double maxLoad;         //最大载重
    private Double volumeLong;      //长
    private Double volumeWidth;     //宽
    private Double volumeHeight;    //高
    private Integer order;          //排序
    private String description;     //车辆描述

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public Double getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Double startPrice) {
        this.startPrice = startPrice;
    }

    public Double getStartDistance() {
        return startDistance;
    }

    public void setStartDistance(Double startDistance) {
        this.startDistance = startDistance;
    }

    public Double getBeyondPrice() {
        return beyondPrice;
    }

    public void setBeyondPrice(Double beyondPrice) {
        this.beyondPrice = beyondPrice;
    }

    public Double getMaxLoad() {
        return maxLoad;
    }

    public void setMaxLoad(Double maxLoad) {
        this.maxLoad = maxLoad;
    }

    public Double getVolumeLong() {
        return volumeLong;
    }

    public void setVolumeLong(Double volumeLong) {
        this.volumeLong = volumeLong;
    }

    public Double getVolumeWidth() {
        return volumeWidth;
    }

    public void setVolumeWidth(Double volumeWidth) {
        this.volumeWidth = volumeWidth;
    }

    public Double getVolumeHeight() {
        return volumeHeight;
    }

    public void setVolumeHeight(Double volumeHeight) {
        this.volumeHeight = volumeHeight;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
