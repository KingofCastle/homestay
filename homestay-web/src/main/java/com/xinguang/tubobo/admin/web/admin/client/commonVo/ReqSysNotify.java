package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

/**
 * Created by lvhantai on 2017/7/19.
 */
public class ReqSysNotify {

    @Pattern(regexp = "^MERCHANT|RIDER|DRIVER" ,message = "type 值为：MERCHANT|RIDER|DRIVER")
    private String clientType;

    @Min(value = 1 ,message = "取值为1-10")
    @Max(value = 20 ,message = "取值为1-20")
    private int pageSize;

    private int pageNo;

    private long timeStamp;

    public String getClientType() {
        return clientType;
    }

    public void setClientType(String clientType) {
        this.clientType = clientType;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public long getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(long timeStamp) {
        this.timeStamp = timeStamp;
    }
}
