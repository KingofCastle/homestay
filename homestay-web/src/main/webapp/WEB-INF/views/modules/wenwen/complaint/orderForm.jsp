<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>填写投诉原因</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#inputForm").validate({
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
<form id="inputForm" action="${ctx}/wenwen/task/complaint/order" method="post" class="form-horizontal" >
    <input type="hidden" name="taskNo" value="${taskNo}" />
    <div class="control-group">
        <label class="control-label">填写投诉原因:</label>
        <div class="controls">
            <textarea name="reason" rows="4" maxlength="200" class="txt required" style="width:400px;" placeholder="请填写100字符内的投诉原因"></textarea>
        </div>
    </div>
    <div class="form-actions">
        <input type="submit" name="Submit" value="提交" class="btn" />
    </div>
</form>
</body>
</html>
