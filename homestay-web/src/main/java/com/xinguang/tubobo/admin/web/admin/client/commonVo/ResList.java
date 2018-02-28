package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import java.io.Serializable;
import java.util.List;

public class ResList implements Serializable{

	private List<Object> list;

    public ResList(List<Object> list) {
        this.list = list;
    }

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

}
