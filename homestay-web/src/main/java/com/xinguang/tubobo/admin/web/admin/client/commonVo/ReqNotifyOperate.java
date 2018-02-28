package com.xinguang.tubobo.admin.web.admin.client.commonVo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.List;

/**
 * Created by lvhantai on 2017/7/19.
 */
public class ReqNotifyOperate {
    @NotNull(message = "id列表不能为空")
    private List<String> ids;
    @Pattern(regexp = "^DEL|PROCESS" ,message = "operate 值为：DEL|PROCESS")
    private String operate;

    public List<String> getIds() {
        return ids;
    }

    public void setIds(List<String> ids) {
        this.ids = ids;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }
}
