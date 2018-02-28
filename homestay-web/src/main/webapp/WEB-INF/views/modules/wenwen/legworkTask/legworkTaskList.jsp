<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>跑腿任务</title>
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
    <li class="active"><a href="${ctx}/wenwen/legwork/task/list">所有记录</a></li>
</ul>

<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/legwork/task/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <label>用户电话：</label><form:input path="senderPhone" htmlEscape="false" maxlength="11" class="input-small"/>
    <label>骑手电话：</label><form:input path="riderPhone" htmlEscape="false" maxlength="11" class="input-small"/>
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
    <%--<label>所属城市：</label>--%>
    <%--<form:select path="senderAddressCity" class="input-small select_changeAndSubmit">--%>
        <%--<form:option value="" label="-请选择-"/>--%>
        <%--<form:options itemValue="value" itemLabel="label" items="${fns:getDictList('city_name')}" htmlEscape="false"/>--%>
    <%--</form:select>--%>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>


</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="span2">订单编号</th>
            <th class="span1">用户电话</th>
            <th class="span1">配送费</th>
            <th class="span1">骑手小费</th>
            <th class="span1">订单状态</th>
            <th class="span1" style="width: 90px">收货人电话</th>
            <th class="span3">收货人地址</th>
            <th class="span1">骑手姓名</th>
            <th class="span1" style="width: 90px" >骑手电话</th>
            <th class="span1">下单时间</th>
            <th class="span1">接单时间</th>
            <th class="span1">取货时间</th>
            <th class="span1">送达时间</th>
            <%--<th class="span1">所属城市</th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="task">
            <tr>
                <td><a href="${ctx}/wenwen/legwork/task/form?id=${task.orderNo}">${task.orderNo}</a></td>
                <td>${task.senderPhone}</td>
                <td><c:if test="${not empty task.deliveryFee}">${task.deliveryFee} 元</c:if></td>
                <td><c:if test="${not empty task.tip}">${task.tip} 元</c:if></td>
                <td>${fns:getDictLabel(task.orderStatus, 'merchant_order_status', '')}</td>
                <td>${task.receiverPhone}</td>
                <td>${task.receiverDetailAddr}</td>
                    <%--<td>${task.deliveryDistance}</td>--%>
                <td>${task.riderName}</td>
                <td>${task.riderPhone}</td>
                <td><fmt:formatDate value="${task.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td><fmt:formatDate value="${task.getTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td><fmt:formatDate value="${task.pickTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td><fmt:formatDate value="${task.finishTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
              <%--  <td>${task.senderAddressCity}</td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination">${page}</div>
</body>
</html>
