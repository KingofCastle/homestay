<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户详情</title>

    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            var userId = $("#userId").val();

            var flag = $("#flag").val();
            //骑手信息审核通过
            $("#verifySuccess").click(function () {
                if (confirm("确认认证通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/riderStatusVerify?id=" + userId + "&riderStatus=SUCCESS";
                }
            });

            //骑手信息审核不通过
            $("#verifyFailSub").click(function () {
                if (confirm("确认认证不通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/riderStatusVerify?id=" + userId + "&riderStatus=FAIL";
                }
            });
            //骑手冻结
            $("#frozen").click(function () {
                if (confirm("确认冻结吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/riderStatusVerify?id=" + userId + "&riderStatus=FROZEN";
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/userInfo/riderUserList">骑手用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/merchantUserList">商家用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/driverUserList">司机用户</a></li>
    <li class="active"><a href="#">骑手详情</a></li>
    <c:if test="${not empty entity.accountId}">
        <li><a href="${ctx}/wenwen/userInfo/userAccountForm?id=${entity.accountId}&from=rider">账户明细</a></li>
    </c:if>

</ul>
<br/>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/userInfo/riderStatusVerify" method="post" class="form-horizontal">
    <form:hidden path="userId"/>
    <input id="userId" name ="id" type="hidden" value="${entity.userId}"/>
    <input id="riderStatus" name="riderStatus" type="hidden" value="FAIL"/>
    <tags:message content="${message}"/>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">用户编号:</label>

                <div class="controls">
                    <label class="lbl">${entity.userId}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">注册时间:</label>

                <div class="controls">
                    <label class="lbl"><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"
                                                       type="date"/></label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">bd:</label>

                <div class="controls">
                    <label class="lbl">${entity.bd}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bd邀请码绑定时间:</label>
                <label >
                    <fmt:formatDate value="${entity.bdUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/>
                </label>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">资金账户:</label>

                <div class="controls">
                    <label class="lbl">${entity.accountId}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">银行:</label>

                <div class="controls">
                    <label class="lbl">${accountInfo.bankName}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">卡号:</label>

                <div class="controls">
                    <label class="lbl">${accountInfo.bankCard}</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">姓名:</label>

                <div class="controls">
                    <label class="lbl">${entity.realName}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">联系方式:</label>

                <div class="controls">
                    <label class="lbl">${entity.phone}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">身份证号:</label>

                <div class="controls">
                    <label class="lbl">${entity.idCardNo}</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">骑手认证状态:</label>

                <div class="controls">
                    <label class="lbl">${fns:getDictLabel(entity.riderStatus, 'tubobo_user_authentication', '')}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">申请时间:</label>

                <div class="controls">
                    <label class="lbl"><fmt:formatDate value="${entity.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"
                                                       type="date"/></label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">通过时间:</label>

                <div class="controls">
                    <label class="lbl"><fmt:formatDate value="${entity.verifyDate}" pattern="yyyy-MM-dd HH:mm:ss"
                                                       type="date"/></label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">所属城市:</label>

                <div class="controls">
                    <label class="lbl">${entity.pcdName}</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">身份证正面照:</label>

                <div class="controls">
                    <img src="${entity.idCardImageFront}" height="300" width="300"/>
                </div>
            </div>
        </div>
        <div class="span20">
            <div class="control-group">
                <label class="control-label">身份证反面照:</label>

                <div class="controls">
                    <img src="${entity.idCardImageBack}" height="300" width="300"/>
                </div>
            </div>
        </div>
        <div class="span20">
            <div class="control-group">
                <label class="control-label">健康证:</label>

                <div class="controls">
                    <img src="${entity.healthyCertificateImage}" height="300" width="300"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">所属服务商ID:</label>
                <div class="controls">
                    <label class="lbl">${entity.providerId}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">所属服务商名称:</label>
                <div class="controls">
                    <label class="lbl">${entity.providerName}</label>
                </div>
            </div>
        </div>
    </div>
    <div class="form-actions" align="center">
        <shiro:hasPermission name="ww:rider:verify">
            <div id="textRider">
                骑手审核：
            </div>

            <input class="btn btn-primary" type="button" id="verifySuccess" value="通过"/>&nbsp;
            <input class="btn btn-primary" type="button" id="verifyFail" value="不通过"/>&nbsp;
            <div id="reason"  hidden style="display: none">
                <h3>请选择审核失败原因</h3>
                <br/>
                <select id="failReason" name="failReason">
                    <option value="请选择">请选择</option>
                    <option value="身份证照片不合格">身份证照片不合格</option>
                    <option value="本人与身份证不符">本人与身份证不符</option>
                    <option value="身份证已过期">身份证已过期</option>
                    <option value="其他" >其他(请在下方填写原因)</option>
                </select>
                <br/>
                <div id="reasonDetailh3" style="display: none">
                    请填写原因:
                    <br/>
                    <textarea  id="reasonDetail" type="text" name="reasonDetail" maxlength="30" ></textarea>
                </div>

                <input class="btn btn-primary" type="submit" id="verifyFailSub11" value="确认提交(审核失败)"/>&nbsp;
                <br/>
                <br/>
            </div>

            <input class="btn btn-primary" type="button" id="frozen" value="冻结"/>&nbsp;
        </shiro:hasPermission>

        <br><br>
       <%-- <c:if test="${entity.driverStatus ne 'INIT'}">
            <shiro:hasPermission name="ww:driver:verify">
                <div id="textDriver">
                    司机审核：
                </div>
                <input class="btn btn-primary" type="button" id="driverVerifySuccess" value="通过"/>&nbsp;
                <input class="btn btn-primary" type="button" id="driverVerifyFail" value="不通过"/>&nbsp;
                <input class="btn btn-primary" type="button" id="driverFrozen" value="冻结"/>&nbsp;
            </shiro:hasPermission>
        </c:if>--%>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
    <%--<div class="form-actions">--%>
    <%--&lt;%&ndash;<c:if test="${task.taskStatus eq 'INIT' || task.taskStatus eq 'REALLOT' || task.taskStatus eq 'ALLOTED' || task.taskStatus eq 'ASSIGNED'}">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<shiro:hasPermission name="ww:merchant:task:view">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<input class="btn btn-primary" type="button" id="cancelButton" value="取消订单"/> &nbsp;&nbsp;&ndash;%&gt;--%>
    <%--&lt;%&ndash;</shiro:hasPermission>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
    <%--<input class="btn btn-primary" type="button" value="返 回" onclick="window.location.href='${ctx}/wenwen/userInfo/list'"/>--%>
    <%--</div>--%>
</form:form>
<script>
    $("#verifyFail").click(function () {
        document.getElementById("reason").style.display="block";
        document.getElementById("frozen").style.display="none";
        document.getElementById("verifySuccess").style.display="none";
        document.getElementById("verifyFail").style.display="none";
        document.getElementById("textDriver").style.display="none";
        document.getElementById("driverVerifySuccess").style.display="none";
        document.getElementById("driverVerifyFail").style.display="none";
        document.getElementById("driverFrozen").style.display="none";
    });
    $(document).on("change",'select#failReason',function(){
        var reason=this.value
        if (reason=="其他"){
            document.getElementById("reasonDetailh3").style.display="block";

        }else{
            document.getElementById("reasonDetailh3").style.display="none";

        }

    });
</script>


</body>
</html>
