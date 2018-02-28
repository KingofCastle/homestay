<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>商家任务信息详情</title>
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
                        window.location.href = "${ctx}/wenwen/merchant/task/cancel?taskId=" + taskId;
                    }
                }

            });
            // 投诉订单
            // $("#complaintButton").click(function () {
            //     $.fancybox.open({
            //         href: '${ctx}/wenwen/task/complaint/orderForm?taskNo=${task.orderNo}',
            //         type: 'iframe'
            //     });

            // });

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/merchant/task/list">所有记录</a></li>
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
            <td>实付金额</td>
            <td><label class="lbl"><c:if test="${not empty task.payAmount}">${task.payAmount/100} 元</c:if></label></td>
        </tr>
        <tr>
            <td>配送费</td>
            <td><label class="lbl"><c:if test="${not empty task.deliveryFee}">${task.deliveryFee/100} 元</c:if></label></td>
        </tr>
        <tr>
            <td>骑手小费</td>
            <td><label class="lbl"><c:if test="${not empty task.tipFee}">${task.tipFee/100} 元</c:if></label></td>
        </tr>
        <tr>
            <td>天气溢价</td>
            <td><label class="lbl"><c:if test="${not empty task.weatherOverFee}">${task.weatherOverFee/100} 元</c:if></label></td>
        </tr>
        <tr>
            <td>高峰溢价</td>
            <td><label class="lbl"><c:if test="${not empty task.peekOverFee}">${task.peekOverFee/100} 元</c:if></label></td>
        </tr>
        <tr>
            <td>配送距离</td>
            <td><label class="lbl">${task.deliveryDistance} 米</label></td>
        </tr>

        <tr>
            <td>商家id</td>
            <td><label class="lbl">${task.userId}</label></td>
        </tr>
        <tr>
            <td>商家名称</td>
            <td><label class="lbl">${task.senderName}</label></td>
        </tr>
        <tr>
            <td>商家手机</td>
            <td><label class="lbl">${task.senderPhone}</label></td>
        </tr>
        <tr>
            <td>商家地址</td>
            <td><label class="lbl">${task.senderAddressProvince} ${task.senderAddressCity} ${task.senderAddressDistrict} ${task.senderAddressStreet} ${task.senderAddressDetail} ${task.senderAddressRoomNo}</label>
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
            <td><label class="lbl">${task.receiverAddressProvince} ${task.receiverAddressCity} ${task.receiverAddressDistrict} ${task.receiverAddressStreet} ${task.receiverAddressDetail} ${task.receiverAddressRoomNo}</label>
            </td>
        </tr>


        <tr>
            <td>下单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label></td>
        </tr>
        <tr>
            <td>接单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.grabOrderTime}" pattern="yyyy-MM-dd HH:mm:ss"  type="date"/></label></td>
        </tr>
        <tr>
            <td>取货时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.grabItemTime}" pattern="yyyy-MM-dd HH:mm:ss"  type="date"/></label></td>
        </tr>
        <tr>
            <td>送达时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.finishOrderTime}" pattern="yyyy-MM-dd HH:mm:ss"  type="date"/></label></td>
        </tr>

        <tr>
            <td>取消时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.cancelTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label></td>
        </tr>
        <tr>
            <td>所属城市</td>
            <td><label class="lbl">${task.senderAddressCity}</label></td>
        </tr>

        <tr>
            <td>备注</td>
            <td><label class="lbl">${task.orderRemark}</label></td>
        </tr>

        <tr>
            <td>取消原因</td>
            <td><label class="lbl">${task.cancelReason}</label></td>
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
            <td>骑手id</td>
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
    <div class="form-actions">
        <a href="${ctx}/wenwen/task/complaint/orderForm?taskNo=${task.orderNo}" class="fancybox btn" data-fancybox-type="iframe">转为投诉单</a>
        <input id="cancelButton" type="button" name="Submit" value="取消订单" class="btn" />
        <input style="display:none" id="inputOrderStatus" value="${task.orderStatus}">    
    </div>
    
</form:form>

</body>
</html>
