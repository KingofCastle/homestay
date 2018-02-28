<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/7/12
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>公告</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#inputForm").validate({
                rules:{
                    sort: { number:true, maxlength:10 }
                },
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
    <li class="active"><a href="#">新增公告</a></li>
</ul><br/>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/notify/save" method="post" enctype="multipart/form-data" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">发送对象:</label>
                <form:radiobuttons path="clientType" items="${fns:getDictList('notify')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">公告标题:</label>
                <form:input path="title" htmlEscape="false" maxlength="15" class="required"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">摘要:</label>
                <form:input path="summary" htmlEscape="false" maxlength="25" class="required"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">公告内容:</label>
                <form:textarea path="content" rows="5" cols="30" class="required" onchange="this.value=this.value.substring(0, 500)"
                               onkeydown="this.value=this.value.substring(0, 500)"
                               onkeyup="this.value=this.value.substring(0, 500)"/>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="提 交"/>&nbsp;
    </div>
</form:form>
</body>
</html>
