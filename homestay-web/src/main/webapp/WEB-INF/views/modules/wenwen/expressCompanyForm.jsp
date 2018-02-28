<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>录入运单</title>
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
        <li><a href="${ctx}/wenwen/expressCompany/list">所有记录</a></li>
        <li class="active"><a href="#">添加</a></li>
    </ul><br/>


    <form:form id="inputForm" modelAttribute="expressCompanyEntity" action="${ctx}/wenwen/expressCompany/save" method="post" class="form-horizontal">
        <form:hidden path="companyId"/>
        <tags:message content="${message}"/>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">名称:</label>
                    <div class="controls">
                    <form:input path="companyName" htmlEscape="false" maxlength="10" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">正则:</label>
                    <div class="controls">
                    <form:input path="regularExpression" htmlEscape="false" maxlength="200" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">联系电话:</label>
                    <div class="controls">
                    <form:input path="contractPhone" htmlEscape="false" maxlength="11" class="required"/>
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
