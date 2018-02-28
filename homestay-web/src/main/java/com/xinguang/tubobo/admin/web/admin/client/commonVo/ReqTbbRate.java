package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by YUGE on 2017/5/27.
 */
public class ReqTbbRate {

    @Size(min = 1, max = 64)
    private String orderId;
    @Size(min = 1, max = 64)
    private String targetId;
    @Size(min = 1, max = 64)
    private String targetCategory;

    private Date createDateBegin;
    private Date createDateEnd;

    private String platformId;


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTargetId() {
        return targetId;
    }

    public void setTargetId(String targetId) {
        this.targetId = targetId;
    }

    public String getTargetCategory() {
        return targetCategory;
    }

    public void setTargetCategory(String targetCategory) {
        this.targetCategory = targetCategory;
    }

    public Date getCreateDateBegin() {
        return createDateBegin;
    }

    public void setCreateDateBegin(Date createDateBegin) {
        this.createDateBegin = createDateBegin;
    }

    public Date getCreateDateEnd() {
        return createDateEnd;
    }

    public void setCreateDateEnd(Date createDateEnd) {
        this.createDateEnd = createDateEnd;
    }

    public String getPlatformId() {
        return platformId;
    }

    public void setPlatformId(String platformId) {
        this.platformId = platformId;
    }
}
