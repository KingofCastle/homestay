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
            //司机信息审核通过
            $("#driverVerifySuccess").click(function () {
                if (confirm("确认认证通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/driverStatusVerify?id=" + userId + "&driverStatus=SUCCESS";
                }
            });

            //司机信息审核不通过
            $("#driverVerifyFail").click(function () {
                if (confirm("确认认证不通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/driverStatusVerify?id=" + userId + "&driverStatus=FAIL";
                }
            });
            //司机冻结
            $("#driverFrozen").click(function () {
                if (confirm("确认冻结吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/driverStatusVerify?id=" + userId + "&driverStatus=FROZEN";
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
    <li class="active"><a href="#">司机详情</a></li>
    <li><a href="${ctx}/wenwen/userInfo/userAccountForm?id=${entity.accountId}&from=rider">账户明细</a></li>

</ul>
<br/>

<form:form id="inputForm" modelAttribute="entity" action=" " method="post" class="form-horizontal">
    <form:hidden path="userId"/>
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
                    <label class="lbl"><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"
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
    </div>

    <c:if test="${entity.driverStatus ne 'INIT'}">
        <HR>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">司机认证状态:</label>

                    <div class="controls">
                        <label class="lbl">${fns:getDictLabel(entity.driverStatus, 'tubobo_user_authentication', '')}</label>
                    </div>
                </div>
            </div>
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">车牌号:</label>

                    <div class="controls">
                        <label class="lbl">${entity.carNumber}</label>
                    </div>
                </div>
            </div>
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">车辆类型:</label>

                    <div class="controls">
                        <label class="lbl">${fns:getDictLabel(entity.carType, 'car_type_new', '')}</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">司机申请时间:</label>

                    <div class="controls">
                        <label class="lbl"><fmt:formatDate value="${entity.driverApplyDate}"
                                                           pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label>
                    </div>
                </div>
            </div>
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">司机审核时间:</label>

                    <div class="controls">
                        <label class="lbl"><fmt:formatDate value="${entity.driverVerifyDate}"
                                                           pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">司机驾驶证照片:</label>

                    <div class="controls">
                        <img src="${entity.driverLicenceImage}" height="250" width="200"/>
                    </div>
                </div>
            </div>
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">车辆行驶证照片:</label>

                    <div class="controls">
                        <img src="${entity.carLicenceImage}" height="250" width="200"/>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <div class="form-actions" align="center">
        <shiro:hasPermission name="ww:driver:verify">
            司机审核：
            <input class="btn btn-primary" type="button" id="driverVerifySuccess" value="通过"/>&nbsp;
            <input class="btn btn-primary" type="button" id="driverVerifyFail" value="不通过"/>&nbsp;
            <input class="btn btn-primary" type="button" id="driverFrozen" value="冻结"/>&nbsp;
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
