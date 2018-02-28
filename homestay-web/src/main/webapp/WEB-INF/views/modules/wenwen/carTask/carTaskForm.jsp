<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>商家任务信息详情</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            //取消商家任务
            <%--$("#cancelButton").click(function () {--%>
                <%--if (confirm("确认取消该任务吗？")) {--%>
                    <%--var taskId = $("#taskId").text();--%>
                    <%--window.location.href = "${ctx}/wenwen/merchant/task/cancel?taskIds=" + taskId;--%>
                <%--}--%>
            <%--});--%>

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/car/task/list">所有记录</a></li>
    <li class="active"><a href="#">车配任务详情</a></li>
</ul>
<br/>

<form:form id="inputForm" modelAttribute="task" action=" " method="post"
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
            <td><label class="lbl">${task.orderNo}</label></td>
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
            <td>选择车型</td>
            <td><label class="lbl">${task.carTypeName}</label>
            </td>
        </tr>
        <tr>
            <td>配送费</td>
            <td><label class="lbl"><c:if test="${not empty task.deliveryFee}">${task.deliveryFee/100}元</c:if></label></td>
        </tr>
        <tr>
            <td>骑手小费</td>
            <td><label class="lbl"><c:if test="${not empty task.tipFee}">${task.tipFee/100}元</c:if></label></td>
        </tr>


        <tr>
            <td>应付金额</td>
            <td><label class="lbl"><c:if test="${not empty task.payAmount}">${task.payAmount/100}元</c:if></label></td>
        </tr>

        <tr>
            <td>订单状态</td>
            <td><label class="lbl">${fns:getDictLabel(task.orderStatus, 'merchant_order_status', '')}</label></td>
        </tr>


        <tr>
            <td>备注</td>
            <td><label class="lbl">${task.orderRemark}</label></td>
        </tr>
        <%--<tr>
            <td>配送距离</td>
            <td><label class="lbl">${task.deliveryDistance}</label></td>
        </tr>
--%>
        <tr>
            <td>货主编号</td>
            <td><label class="lbl">${task.userId}</label></td>
        </tr>
        <tr>
            <td>货主姓名</td>
            <td><label class="lbl">${task.senderName}</label></td>
        </tr>

        <tr>
            <td>发货地址</td>
            <td><label class="lbl">${task.senderAddressProvince} ${task.senderAddressCity} ${task.senderAddressDistrict} ${task.senderAddressStreet} ${task.senderAddressDetail} ${task.senderAddressRoomNo}</label>
            </td>
        </tr>
        <tr>
            <td>货主电话</td>
            <td><label class="lbl">${task.senderPhone}</label></td>
        </tr>



        <tr>
            <td>创建订单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label></td>
        </tr>
        <tr>
            <td>预约类型</td>
            <td><label class="lbl">
                <c:if test="${task.appointType eq 'appoint'}" >
                    预约用车
                </c:if>
                <c:if test="${task.appointType eq 'immediate'}" >
                    立即用车
                </c:if>
            </label></td>
        </tr>
        <tr>
            <td>预约时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.appointTime}" pattern="yyyy-MM-dd HH:mm:ss"  type="date"/></label></td>
        </tr>
        <tr>
            <td>派单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"  type="date"/></label></td>
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


     <%--   <tr>
            <td>取消原因</td>
            <td><label class="lbl">${task.cancelReason}</label></td>
        </tr>--%>

    </table>


    <table class="table table-bordered">
        <thead>
        <tr>
            <th>司机信息</th>
            <th></th>
        </tr>
        </thead>

        <tr>
            <td>司机编号</td>
            <td><label class="lbl">${task.riderId}</label></td>
        </tr>
        <tr>
            <td>司机姓名</td>
            <td><label class="lbl">${task.riderName}</label></td>
        </tr>
        <tr>
            <td>司机电话</td>
            <td><label class="lbl">${task.riderPhone}</label></td>
        </tr>
        <tr>
            <td>车牌</td>
            <td><label class="lbl">${task.riderCarNo}</label></td>
        </tr>
    </table>


</form:form>


<td >
    <input type="button" align="center" style="width: 200px;height: 40px;"  name="Submit" value="分配司机" class="btn" onclick="location.href='${ctx}/wenwen/car/task/dispacheDriver?senderLongitude=${task.senderLongitude}&senderLatitude=${task.senderLatitude}&orderNo=${orderNo}'" />
</td>





</body>
</html>
