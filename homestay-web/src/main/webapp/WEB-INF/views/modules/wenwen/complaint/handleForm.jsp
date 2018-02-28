<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>处理投诉</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#inputForm").validate({
                rules:{
                    forfeit: {
                        required: true,
                        range: [1,9998]
                      }
                },
                submitHandler: function(form){
                    form.submit();
                    // parent.$.fancybox.close();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element.parent());
                    }
                }
            });
        });
    </script>
</head>
<body>
<tags:message content="${message}"/>
<form:form id="inputForm" modelAttribute="hadleDto" action="${ctx}/wenwen/task/complaint/handle" method="post" class="form-horizontal" >
    <form:hidden path="complaintId"/>
    <form:hidden path="merchantId"/>
    <form:hidden path="riderId"/>
    <form:hidden path="orderNo"/>
    <div class="control-group">
        <label class="control-label">处理方案:</label>
        <div class="controls">
            <textarea name="handleMsg" rows="4" maxlength="200" class="txt required" style="width:400px;" placeholder="请填写500字符以内的处理方案" value="${hadleDto.handleMsg}">${hadleDto.handleMsg}</textarea>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">处罚对象:</label>
        <div class="controls">
            <form:radiobuttons path="handleObject" items="${fns:getDictList('complaint_handle_object')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
            <span class="help-inline"></span>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">罚款金额:</label>
        <div class="controls">
            <input name="forfeit" htmlEscape="false" maxlength="30" class="required" value="${hadleDto.forfeit/100.0 == 0?'':(hadleDto.forfeit/100.0)}" /> 元
        </div>
    </div>
    <div class="form-actions">
        <input name="Submit" value="提交" class="btn btn-primary" type="submit" />
    </div>
</form:form>
</body>
</html>
