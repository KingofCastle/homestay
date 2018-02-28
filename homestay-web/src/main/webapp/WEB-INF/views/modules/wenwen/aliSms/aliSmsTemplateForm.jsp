<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>阿里短信模版</title>
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
		<li><a href="${ctx}/wenwen/aliSmsTemplate/list">所有记录</a></li>
		<li class="active"><a href="#">模版详情</a></li>
	</ul><br/>


	<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/aliSmsTemplate/save" method="post" class="form-horizontal">
        <form:hidden path="id"/>
        <tags:message content="${message}"/>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">名称:</label>
                    <div class="controls">
                        <form:input path="name" htmlEscape="false" maxlength="10" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">类型:</label>
                    <div class="controls">
	                    <form:select path="smsType" class="required">
	                        <form:options items="${fns:getDictList('sms_type')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
	                    </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">阿里模版id:</label>
                    <div class="controls">
                        <form:input path="aliSmsId" htmlEscape="false" maxlength="20" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">阿里模版签名:</label>
                    <div class="controls">
                        <form:input path="aliSignName" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">内容:</label>
                    <div class="controls">
                        <form:textarea path="content" class="required" rows="5" />
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
