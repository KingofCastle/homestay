<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>跑腿任务信息详情</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            //取消商家任务
            $("#cancelButton").click(function () {
                var orderStatus = $("#inputOrderStatus").val();
                if ("CANCEL"==orderStatus || "FINISH"== orderStatus){
                    alert("已取消或已完成的不允许取消");
                }else {
                    if (confirm("取消订单后无法恢复，确定要取消该单吗？")) {
                        var taskId = $("#taskId").text();
                        window.location.href = "${ctx}/wenwen/legwork/task/cancel?taskId=" + taskId;
                    }
                }

            });

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/legwork/task/list">所有记录</a></li>
    <li class="active"><a href="#">商家任务详情</a></li>
</ul>
<br/>

<form:form id="inputForm" modelAttribute="task" action="" method="post"
           class="form-horizontal">

    <tags:message content="${message}"/>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>订单信息</th>
            <th></th>
        </tr>
        </thead>
        <tr>
            <td>订单编号</td>
            <td><label class="lbl" id="taskId">${task.orderNo}</label></td>
        </tr>
        <tr>
            <td>订单状态</td>
            <td><label class="lbl">${fns:getDictLabel(task.orderStatus, 'merchant_order_status', '')}</label></td>
        </tr>
        <tr>
            <td>发货人</td>
            <td><label class="lbl">${task.senderName}</label></td>
        </tr>
        <tr>
            <td>发货人电话</td>
            <td><label class="lbl">${task.senderPhone}</label></td>
        </tr>
        <tr>
            <td>发货地址</td>
            <td><label class="lbl">${task.senderDetailAddr}</label>
            </td>
        </tr>
        <tr>
            <td>收货人</td>
            <td><label class="lbl">${task.receiverName}</label></td>
        </tr>
        <tr>
            <td>收货人电话</td>
            <td><label class="lbl">${task.receiverPhone}</label></td>
        </tr>
        <tr>
            <td>收货地址</td>
            <td><label class="lbl">${task.receiverDetailAddr}</label>
            </td>
        </tr>
        <tr>
            <td>重量</td>
            <td><label class="lbl">${task.weight}</label></td>
        </tr>
        <tr>
            <td>备注</td>
            <td><label class="lbl">${task.remark}</label></td>
        </tr>
    </table>

    <table class="table table-bordered">
        <tr>
            <td>配送费</td>
            <td><label class="lbl"><c:if test="${not empty task.deliveryFee}">${task.deliveryFee} 元</c:if></label></td>
        </tr>
        <tr>
            <td>骑手小费</td>
            <td><label class="lbl"><c:if test="${not empty task.tip}">${task.tip} 元</c:if></label></td>
        </tr>
        <tr>
            <td>应付金额</td>
            <td><label class="lbl"><c:if test="${not empty task.deliveryFee or not empty task.tip}">${task.deliveryFee+task.tip} 元</c:if></label></td>
        </tr>
        <tr>
            <td>支付状态</td>
            <td><label class="lbl">${task.payStatus}</label></td>
        </tr>
    </table>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>骑手信息</th>
            <th></th>
        </tr>
        </thead>

        <tr>
            <td>骑手编号</td>
            <td><label class="lbl">${task.riderId}</label></td>
        </tr>
        <tr>
            <td>骑手名称</td>
            <td><label class="lbl">${task.riderName}</label></td>
        </tr>
        <tr>
            <td>骑手电话</td>
            <td><label class="lbl">${task.riderPhone}</label></td>
        </tr>
    </table>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>状态信息</th>
            <th></th>
        </tr>
        </thead>
        <tr>
            <td>创建订单时间</td>
            <td><label class="lbl">${task.createDate}</label></td>
        </tr>
        <tr>
            <td>接单时间</td>
            <td><label class="lbl">${task.getTime}</label></td>
        </tr>
        <tr>
            <td>取货时间</td>
            <td><label class="lbl">${task.pickTime}</label></td>
        </tr>
        <tr>
            <td>送达时间</td>
            <td><label class="lbl">${task.finishTime}</label></td>
        </tr>
    </table>
</form:form>
<td><input id="cancelButton" type="submit" name="Submit" value="取消订单" class="btn" /></td>
<input style="display:none" id="inputOrderStatus" value="${task.orderStatus}">
</body>
</html>
