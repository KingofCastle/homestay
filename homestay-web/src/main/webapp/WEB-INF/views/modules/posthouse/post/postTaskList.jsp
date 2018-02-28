<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
	<title>驿站任务</title>
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
	<li class="active"><a href="${ctx}/posthouse/merchant/task/list">所有记录</a></li>
</ul>

<form:form id="searchForm" modelAttribute="entity" action="${ctx}/posthouse/post/task/list" method="post"
		   class="breadcrumb form-search">

	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

	<label>服务商ID ：</label><form:input path="providerId" htmlEscape="false" maxlength="12" class="input-small"/>
<%--	<label>服务商名称：</label><form:input path="providerName" htmlEscape="false" maxlength="12" class="input-small"/>--%>
	<label>订单编号：</label><form:input path="orderNo" htmlEscape="false" maxlength="20" class="input-small"/>
	<label>骑手电话：</label><form:input path="riderPhone" htmlEscape="false" maxlength="11" class="input-small"/>
	<label>状态 ：</label>
	<form:select path="orderStatus" class="input-small select_changeAndSubmit">
		<form:options itemValue="value" itemLabel="label" items="${fns:getDictList('merchant_order_status')}"
					  htmlEscape="false"/>
				<form:option value="" label="-全部-"/>
	</form:select>

	<label>下单时间(只能查询所选日期当天的订单)：</label>
	<input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
		   value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>'
		   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>

<%--	<label>下单时间：</label>
	<input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
		   value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>'
		   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	- <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
			 value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>'
			 onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>--%>
	&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>
</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th class="span2">订单编号</th>
			<th class="span1">服务商ID</th>
			<th class="span1">服务商名称</th>
			<th class="span1">配送费</th>
			<th class="span1">状态</th>
			<th class="span1">骑手姓名</th>
			<th class="span1" style="width: 90px" >骑手电话</th>
			<th class="span1" >收货人电话</th>
			<th class="span1">收货地址</th>
			<th class="span1">操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="task">
			<tr>
				<td>${task.orderNo}</td>
				<td>${task.providerId}</td>
				<td>${task.providerName}</td>
				<td><c:if test="${not empty task.payAmount}">${task.payAmount/100} 元</c:if></td>
				<td>${fns:getDictLabel(task.orderStatus, 'merchant_order_status', '')}</td>
				<td>${task.riderName}</td>
				<td>${task.riderPhone}</td>
				<td>${task.receiverPhone}</td>
				<td>${task.receiverAddressDistrict} ${task.receiverAddressStreet} ${task.receiverAddressDetail} ${task.receiverAddressRoomNo}</td>
				<td><a href="${ctx}/posthouse/post/task/view?orderNo=${task.orderNo}">查看明细</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="pagination">${page}</div>
</body>
</html>
