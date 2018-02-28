<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新增客户端版本</title>
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
		<li><a href="${ctx}/wenwen/appVersion/list">所有记录</a></li>
		<li class="active"><a href="#">新增</a></li>
	</ul><br/>


	<form:form id="inputForm" modelAttribute="version" action="${ctx}/wenwen/appVersion/save" method="post" class="form-horizontal">
        <form:hidden path="id"/>
        <tags:message content="${message}"/>
        <div class="row">
            <div class="span4">
                <div class="control-group">
                    <label class="control-label">app名称:</label>
                    <div class="controls">
                        <form:select path="appName" class="required">
                            <form:options items="${fns:getDictList('app_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                        </form:select>
<%--                         <form:input path="name" readonly="${empty smsModel.id?false:true}" htmlEscape="false" maxlength="50" class="required" value=""/> --%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span4">
                <div class="control-group">
                    <label class="control-label">app类型:</label>
                    <div class="controls">
	                    <form:select path="appType" class="required">
	                        <form:options items="${fns:getDictList('app_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
	                    </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span4">
                <div class="control-group">
                    <label class="control-label">version:</label>
                    <div class="controls">
                        <form:input path="version" class="required" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span4">
                <div class="control-group">
                    <label class="control-label">minVersion:</label>
                    <div class="controls">
                        <form:input path="minVersion" class="required" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span4">
                <div class="control-group">
                    <label class="control-label">下载url:</label>
                    <div class="controls">
                        <form:input path="url" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span4">
                <div class="control-group">
                    <label class="control-label">版本描述:</label>
                    <div class="controls">
                        <form:textarea path="description" rows="5" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
            <input class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
    </form:form>
</body>
</html>
