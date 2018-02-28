<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>距离违规设置</title>
    <meta name="decorator" content="default"/>
    <ul class="nav nav-tabs">
        <li ><a href="${ctx}/wenwen/violations/distance/view?orderType=postOrder">距离违规设置</a></li>
        <shiro:hasPermission name="ww:merchantTaskDeliverFee:view">
            <li ><a href="${ctx}/wenwen/overTimeRule/view?orderType=postOrder">超时送达违规设置</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="ww:timeout:view">
            <li ><a href="${ctx}/wenwen/violations/timeoutPickup/view?orderType=postOrder">超时到店违规设置</a></li>
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

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/violations/distance/execute" method="post" class="form-horizontal">
    <tags:message content="${message}"/>
    <input id="orderType" name="orderType" value="${orderType}" type="hidden">

    <div class="row">
    <div class="span6">
        <div class="control-group">
            取货违规距离：
        <input id="pickupViolation" name="pickupViolation" min="0" max="2000" type="number" value="${entity.pickupViolation}" step="0.1"/>
        米
        </div>
    </div>
</div>
<div class="row">
    <div class="span6">
        <div class="control-group">
    送达违规距离：
        <input id="arriveViolation" name="arriveViolation"  min="0"  type="number" max="2000" value="${entity.arriveViolation}" step="0.1" />米
        </div>
    </div>
</div>
    注：违规距离为骑手实际确认取货\确认送达的地理位置信息与商家店铺地址\收货地址 之间的最大偏差距离，超过该违规距离，将该单视为有违规风险，放至违规任务列表中

<div class="form-actions">
    <input type="submit" name="Submit" value="提交" class="btn"  />
</div>
</form:form>

</body>
</html>