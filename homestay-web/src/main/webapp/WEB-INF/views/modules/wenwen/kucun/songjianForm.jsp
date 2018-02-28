<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>派件明细</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
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
		<li><a href="${ctx}/wenwen/kucun/songjian/list">所有记录</a></li>
		<li class="active"><a href="#">运单详情</a></li>
	</ul><br/>


	<form:form id="inputForm" modelAttribute="waybill" action="${ctx}/wenwen/kucun/songjian/save" method="post" class="form-horizontal">
		<tags:message content="${message}"/>
		<div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">门店</label>
                    <div class="controls">
                    <input type="text" htmlEscape="false" maxlength="10" class="required" value="${waybill.belongStore.storeName}" readonly="true"/>
<%--                     <tags:treeselect id="belongStore" name="belongStore.storeId" value="${wayBillSEntity.belongStore.storeId}" labelName="belongStore.storeName" labelValue="${wayBillSEntity.belongStore.storeName}"  --%>
<%--                          title="门店" url="/wenwen/store/treeData" cssClass="input-small required" allowClear="true"/> --%>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">快递公司:</label>
                    <div class="controls">
                    <input type="text" htmlEscape="false" maxlength="10" class="required" value="${waybill.expressCompany.companyName}" readonly="true"/>
<%--                     <tags:treeselect id="expressCompany" name="expressCompany.companyId" value="${wayBillSEntity.expressCompany.companyId}" labelName="expressCompany.companyName" labelValue="${wayBillSEntity.expressCompany.companyId}"  --%>
<%--                            title="快递公司" url="/wenwen/expressCompany/treeData" cssClass="input-small required" allowClear="true"/> --%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">运单号:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.waybillNo}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">运单状态:</label>
                    <div class="controls">
                    <input type="text" value="${fns:getDictLabel(waybill.waybillStatus, 'waybillS_status', '')}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">收件人电话:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.receiverPhone}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">取件码/集包号:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.areaNum}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">快件类型:</label>
                    <div class="controls">
                    <input type="text" value="${fns:getDictLabel(waybill.pickupType,'pickup_type','')}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">配送方式:</label>
                    <div class="controls">
                    <input type="text" value="${fns:getDictLabel(waybill.dispatchingWay,'dispatching_way','')}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">代收运费:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.payFreight}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">代收货款:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.payment}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">入库人:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.inOperator.name}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">入库时间:</label>
                    <div class="controls">
                    <input type="text" value="<fmt:formatDate value="${waybill.inTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">出库人:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.outOperator.name}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">出库时间:</label>
                    <div class="controls">
                    <input type="text" value="<fmt:formatDate value="${waybill.outTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">签收人:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.signOperator.name}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">签收时间:</label>
                    <div class="controls">
                    <input type="text" value="<fmt:formatDate value="${waybill.signTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">更新人:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.updateBy}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">更新时间:</label>
                    <div class="controls">
                    <input type="text" value="<fmt:formatDate value="${waybill.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">滞留天数:</label>
                    <div class="controls">
                    <input type="text" value="${waybill.remainStatus}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">退回原因:</label>
                    <div class="controls">
                    <input type="text" value="${fns:getDictLabel(waybill.returnBackReason,'returnBack_reason','')}" htmlEscape="false" maxlength="50" class="required" readonly="true"/>
                    </div>
                </div>
            </div>
        </div>
		<div class="form-actions">
<!-- 			<input id="btnAppoint" class="btn btn-primary" type="submit" value="保存"/>&nbsp; -->
			<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
