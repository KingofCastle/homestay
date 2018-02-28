<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>超时到店违规设置</title>
    <meta name="decorator" content="default"/>
    <ul class="nav nav-tabs">
        <li ><a href="${ctx}/wenwen/violations/timeoutPickup/view?orderType=crowdOrder">超时到店违规设置</a></li>
        <shiro:hasPermission name="ww:merchantTaskDeliverFee:view">
            <li ><a href="${ctx}/wenwen/overTimeRule/view?orderType=crowdOrder">超时送达违规设置</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="ww:distance:view">
            <li ><a href="${ctx}/wenwen/violations/distance/view?orderType=crowdOrder">距离违规设置</a></li>
        </shiro:hasPermission>
    </ul>

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
    </script>
</head>

<body>
<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/violations/timeoutPickup/execute" method="post" class="form-horizontal">
    <tags:message content="${message}"/>
    <input id="orderType" name="orderType" value="${orderType}" type="hidden">
    <h3>预计取货时间规则：
        <input id="initDistance" name="initDistance"  min="0" max="9999"  step="0.1" type="number" value="${entity.initDistance}"/>
        公里内，取货时间
        <input id="initMinute" name="initMinute" min="0" max="999" type="number" step="1" value="${entity.initMinute}"/>
        分钟，据店铺距离每增加1公里，取货时间增加
        <input id="raiseMinute" name="raiseMinute" min="0" max="999" type="number" step="1" value="${entity.raiseMinute}"/>
        分钟</h3>
    <input type="submit" name="Submit" value="提交" class="btn"  />
</form:form>

</body>
</html>