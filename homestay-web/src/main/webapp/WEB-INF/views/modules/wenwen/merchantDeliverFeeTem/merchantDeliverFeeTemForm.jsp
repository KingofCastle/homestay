<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>定价模板</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">
        $("#Submit").click(function () {
            $("#inputForm").submit();
        });
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

        $(document).ready(function () {
            $(".select_changeAndSubmit").change(function () {
                $("#searchForm").submit();
            });
        });
    </script>
</head>

<body>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/merchant/deliverFee/tem/execute" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
<div class="row">
    <div class="span6">
        <div class="control-group">
            模板名称:
            <input id="name" name="name" value="${entity.name}" required="required" type="text" maxlength="10"/>
        </div>
    </div>
</div>
<div class="form-actions">
    <input type="submit" name="Submit" value="提交" class="btn"  />
</div>
</form:form>
</body>

</html>