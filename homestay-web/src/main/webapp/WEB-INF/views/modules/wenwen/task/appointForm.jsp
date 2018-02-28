<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>预约任务详情</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {


            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/task/appoint/list">所有记录</a></li>
    <li class="active"><a href="#">预约任务详情</a></li>
</ul>
<br/>


<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/task/appoint/save" method="post"
           class="form-horizontal">
    <tags:message content="${message}"/>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">寄件人:</label>

                <div class="controls">
                        ${entity.senderName}
                        <%--                     <tags:treeselect id="belongStore" name="belongStore.storeId" value="${wayBillSEntity.belongStore.storeId}" labelName="belongStore.storeName" labelValue="${wayBillSEntity.belongStore.storeName}"  --%>
                        <%--                          title="门店" url="/wenwen/store/treeData" cssClass="input-small required" allowClear="true"/> --%>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">寄件人手机:</label>

                <div class="controls">
                        ${entity.senderPhone}
                        <%--                     <tags:treeselect id="expressCompany" name="expressCompany.companyId" value="${wayBillSEntity.expressCompany.companyId}" labelName="expressCompany.companyName" labelValue="${wayBillSEntity.expressCompany.companyId}"  --%>
                        <%--                            title="快递公司" url="/wenwen/expressCompany/treeData" cssClass="input-small required" allowClear="true"/> --%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">寄件人地址:</label>

                <div class="controls">
                        ${entity.senderPcdName} ${entity.senderAddress}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">收件人:</label>

                <div class="controls">
                        ${entity.receiverName}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">收件人手机:</label>

                <div class="controls">
                        ${entity.receiverPhone}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">收件人地址:</label>

                <div class="controls">
                        ${entity.receiverPcdName} ${entity.receiverAddress}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">寄件类型:</label>

                <div class="controls">
                        ${entity.shipment}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">备注:</label>

                <div class="controls">
                        ${entity.remark}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">运费:</label>

                <div class="controls">
                        ${entity.payFreight}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">保费:</label>

                <div class="controls">
                    <c:if test="${entity.insureFlag eq true}">${entity.insurePrice}</c:if>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">重量（kg）:</label>

                <div class="controls">
                        ${entity.weight}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">物品大小:</label>

                <div class="controls">
                        ${entity.size}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">申请时间:</label>

                <div class="controls">
                    <fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">任务状态:</label>

                <div class="controls">
                        ${fns:getDictLabel(entity.taskStatus, 'task_status', '')}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">任务类型:</label>

                <div class="controls">
                        ${fns:getDictLabel(entity.taskType, 'task_type', '')}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">所属门店:</label>

                <div class="controls">
                        ${store.storeName}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">快递员:</label>

                <div class="controls">
                        ${operator.name}
                </div>
            </div>
        </div>
        <%--<div class="span6">--%>
            <%--<div class="control-group">--%>
                <%--<label class="control-label">配送方式:</label>--%>

                <%--<div class="controls">--%>
                        <%--${fns:getDictLabel(entity.wayBillS.pickupType, 'pickup_type', '')}--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">配送时间:</label>

                <div class="controls">
                        ${entity.appointTime}
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">运单号:</label>

                <div class="controls">
                        ${wayBillS.waybillNo}
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span6">
            <div class="control-group">
                <label class="control-label">任务完成时间:</label>

                <div class="controls">
                    <fmt:formatDate value="${entity.finishTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/>
                </div>
            </div>
        </div>
        <div class="span6">
            <div class="control-group">
                <label class="control-label">是否评价:</label>

                <div class="controls">
                        ${fns:getDictLabel(entity.evaluationFlag, 'true_false', '')}
                </div>
            </div>
        </div>
    </div>

</form:form>
<table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="span1">操作人</th>
        <th class="span1">操作</th>
        <th class="span1">目标</th>
        <th class="span1">时间</th>
        <%--<th class="span1">操作</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${entity.operations}" var="operation">
        <tr>
            <td>${operation.operator}</td>
            <td>${operation.operation}</td>
            <td>${operation.target}</td>
            <td><fmt:formatDate value="${operation.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <%--<td>--%>
                <%--<shiro:hasPermission name="ww:equipment:view">--%>
                <%--<a href="">查看</a>--%>
                <%--</shiro:hasPermission>--%>
                <%--</td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="form-actions">
    <!-- 			<input id="btnAppoint" class="btn btn-primary" type="submit" value="保存"/>&nbsp; -->
    <input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>
