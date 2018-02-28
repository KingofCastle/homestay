<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>雇员信息</title>
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
		<li><a href="${ctx}/wenwen/employee/list">所有员工</a></li>
		<shiro:hasPermission name="ww:employee:edit">
			<li class="active"><a href="#">员工信息</a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="ww:employee:statistics">
			<li class=""><a href="${ctx}/wenwen/employee/statistics">员工统计</a></li>
		</shiro:hasPermission>
	</ul><br/>

	<form:form id="inputForm" modelAttribute="employee" action="${ctx}/wenwen/employee/save" method="post" class="form-horizontal">
	    <form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="row">
            <div class="span20">
            	<div class="control-group">
                    <label class="control-label">所属门店:</label>
                    <div class="controls">
                        <form:select path="belongStore.storeId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}"/>
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
		<div class="row">
            <div class="span20">
            	<div class="control-group">
                    <label class="control-label">类型:</label>
                    <div class="controls">
	                    <form:select path="employeeType" class="required">
	                        <form:options items="${fns:getDictList('employee_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
	                    </form:select>
                    </div>
                </div>
            </div>
        </div>
		<div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">手机:</label>
                    <div class="controls">
                    	<form:input path="phone" htmlEscape="false" maxlength="11" class="required phone"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">姓名:</label>
                    <div class="controls">
                    	<form:input path="name" htmlEscape="false" maxlength="10" class="required realName"/>
                    </div>
                </div>
            </div>
        </div>
		<div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">密码:</label>
                    <div class="controls">
	                	<input id="password" name="password" type="password" value="" maxlength="15" minlength="8" class="${empty employee.id?'required':''}"/>
	                	<c:if test="${not empty employee.id}"><span class="help-inline">若不修改密码，请留空。</span></c:if>
                    </div>
                </div>
            </div>
        </div>
        
		<div class="form-actions">
			<input id="btnAppoint" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
