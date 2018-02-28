<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>投诉详情</title>
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
		<li><a href="${ctx}/wenwen/feedback/list">所有记录</a></li>
		<li class="active"><a href="#">投诉详情</a></li>
	</ul><br/>


	<form:form id="inputForm" modelAttribute="feedback" action="${ctx}/wenwen/feedback/save" method="post" class="form-horizontal">
	    <form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">门店:</label>
                    <div class="controls">
                        <input type="text" value="${feedback.waybill.belongStore.storeName}" readonly="readonly">
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">快递公司:</label>
                    <div class="controls">
                        <input type="text" value="${feedback.waybill.expressCompany.companyName}" readonly="readonly">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">运单号:</label>
                    <div class="controls">
<%--                     <form:input path="waybillNo" htmlEscape="false" maxlength="50" readonly="readonly"/> --%>
                        <input type="text" name="waybillNo" value="${feedback.waybillNo}" readonly="readonly">
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">联系电话:</label>
                    <div class="controls">
                        <input type="text" value="${feedback.waybill.receiverPhone}" readonly="readonly">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">快件状态:</label>
                    <div class="controls">
                        <input type="text" value="${fns:getDictLabel(feedback.waybill.waybillStatus, 'waybillS_status', '')}" readonly="readonly">
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">取件码/集包号:</label>
                    <div class="controls">
                        <input type="text" value="${feedback.waybill.areaNum}" readonly="readonly">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">入库时间:</label>
                    <div class="controls">
                        <input type="text" value="<fmt:formatDate value="${feedback.waybill.inTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
                    </div>
                </div>
            </div>
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">出库时间:</label>
                    <div class="controls">
                        <input type="text" value="<fmt:formatDate value="${feedback.waybill.outTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">投诉内容:</label>
                    <div class="controls">
	                    <form:textarea path="content" rows="5"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">处理结果:</label>
                    <div class="controls">
                        <c:if test="${feedback.result eq '0'}"><input type="text" value="未处理" readonly="readonly"></c:if>
                        <c:if test="${feedback.result eq '1'}"><input type="text" value="已处理" readonly="readonly"></c:if>
                    </div>
                </div>
            </div>
        </div>
		<div class="form-actions">
		    <c:if test="${feedback.result eq '0'}">
    			<input id="btnAppoint" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
		    </c:if>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
