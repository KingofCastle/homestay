<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>车配任务</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $(".select_changeAndSubmit").change(function () {
                $("#searchForm").submit();
            });

        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/wenwen/car/task/list">所有记录</a></li>
</ul>

<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/car/task/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>


    <label>订单编号：</label><form:input path="orderNo" htmlEscape="false" maxlength="20" class="input-small"/>
    <label>收货人电话：</label><form:input path="receiverPhone" htmlEscape="false" maxlength="11" class="input-small"/>

    <%--<label>收货人电话：</label><form:input path="receiverPhone" htmlEscape="false" maxlength="12" class="input-small"/>--%>

    <label>状态 ：</label>
    <form:select path="orderStatus" class="input-small select_changeAndSubmit">
        <form:option value="" label="-全部-"/>
        <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('merchant_order_status')}"
                      htmlEscape="false"/>
    </form:select>

    <label>下单时间：</label>
    <input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
           value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>'
           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
    - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
             value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>'
             onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>

    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>


</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="span2">订单编号</th>
            <th class="span1">发货地址</th>
            <th class="span1">配送费</th>
            <th class="span1">小费</th>
            <th class="span1">订单状态</th>
            <th class="span1">司机姓名</th>
            <th class="span1">司机电话</th>
            <th class="span1">收货人电话</th>
            <th class="span1">收货地址</th>


            <%--<th class="span1">配送距离</th>--%>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="task">
            <tr>
                <td><a href="${ctx}/wenwen/car/task/form?id=${task.orderNo}">${task.orderNo}</a></td>
                <td>${task.senderAddressDistrict} ${task.senderAddressStreet} ${task.senderAddressDetail} ${task.senderAddressRoomNo}</td>
                <td><c:if test="${not empty task.deliveryFee}">${task.deliveryFee/100}元</c:if></td>
                <td><c:if test="${not empty task.tipFee}">${task.tipFee/100}元</c:if></td>
                <td>${fns:getDictLabel(task.orderStatus, 'merchant_order_status', '')}</td>
                <td>${task.riderName}</td>
                <td>${task.riderPhone}</td>
                <td>${task.receiverPhone}</td>
                <td>${task.receiverAddressCity}${task.receiverAddressDistrict}${task.receiverAddressStreet}${task.receiverAddressDetail}${task.receiverAddressRoomNo}</td>

                    <%--<td>${task.deliveryDistance}</td>--%>


            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination">${page}</div>
</body>
</html>
