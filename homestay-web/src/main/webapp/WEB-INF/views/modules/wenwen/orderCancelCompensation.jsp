<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>商家取消订单设置</title>
    <meta name="decorator" content="default"/>

    <ul class="nav nav-tabs">
        <li ><a href="${ctx}/wenwen/orderCancel/compensation/view">商家取消订单设置</a></li>
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

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/orderCancel/compensation/execute" method="post" class="form-horizontal">
    <tags:message content="${message}"/>
    <h3>商家可取消订单，每单扣除 <input id="merDeductionFee" name="merDeductionFee" min="0" max="999" type="number" step="0.1"  value="${entity.merDeductionFee}"/>元 补偿给骑手     <input id="merCompensationDriverFee" name="merCompensationDriverFee"  min="0" max="999" type="number" step="0.1"  value="${entity.merCompensationDriverFee}"/>
    </h3>
    <h3>订单待取货状态，骑手可取消订单，每单扣除 <input id="driverDeductionFee" name="driverDeductionFee"  min="0" max="999" type="number" step="0.1"  value="${entity.driverDeductionFee}"/>元 补偿给商家     <input id="driverCompensationMerFee" name="driverCompensationMerFee" min="0" max="999" type="number" step="0.1"   value="${entity.driverCompensationMerFee}"/>
    </h3>
    <input type="submit" name="Submit" value="提交" class="btn"  />
</form:form>
</body>

</html>