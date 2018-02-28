<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投诉处理</title>
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
    <li class="active"><a href="${ctx}/wenwen/task/complaint/list">所有记录</a></li>
</ul>

<form:form id="searchForm" modelAttribute="complaintOrderQueryCondition" action="${ctx}/wenwen/task/complaint/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>商家电话：</label><form:input path="merchantPhone" htmlEscape="false" maxlength="11" class="input-small"/>
    <label>骑手电话：</label><form:input path="riderPhone" htmlEscape="false" maxlength="11" class="input-small"/>
    <label>订单编号：</label><form:input path="orderNo" htmlEscape="false" maxlength="32" class="input-small"/>

    <label>状态 ：</label>
    <form:select path="status" class="input-small select_changeAndSubmit">
        <form:option value="" label="-请选择-"/>
        <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('complaint_order_status')}"
                      htmlEscape="false"/>
    </form:select>

    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="搜索"/><br><br>
</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="span1">订单编号</th>
            <th class="span1">商家名称</th>
            <th class="span1">商家手机号</th>
            <th class="span1">配送费</th>
            <th class="span1">状态</th>
            <th class="span1">骑手姓名</th>
            <th class="span1">骑手电话</th>
            <th class="span1">收货人电话</th>
            <th class="span1">收货地址</th>
            <th class="span1">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="task">
            <tr>
                <td>${task.orderNo}</td>
                <td>${task.merchantName}</td>
                <td>${task.merchantPhone}</td>
                <td>${task.deliveryFee}</td>
                <td>${task.complaintStatusName}</td>
                <td>${task.riderName}</td>
                <td>${task.riderPhone}</td>
                <td>${task.recivePhone}</td>
                <td>${task.reciveAddress}</td>
                <td>
                    <a href="${ctx}/wenwen/task/complaint/detail?id=${task.complaintId}">查看明细</a>
                    <c:if test="${task.complaintStatus eq '0'}">
                        <a href="${ctx}/wenwen/task/complaint/form?id=${task.complaintId}&merchantId=${task.merchantId}&riderId=${task.riderId}&orderNo=${task.orderNo}" class="fancybox" data-fancybox-type="iframe" >处理</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination">${page}</div>
</body>
</html>
