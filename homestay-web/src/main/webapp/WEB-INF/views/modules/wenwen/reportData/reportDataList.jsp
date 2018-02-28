<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>每日报表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$(".select_changeAndSubmit").change(function(){
                $("#searchForm").submit();
            });
			
		});

		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a>日报</a></li>
		<shiro:hasPermission name="ww:reportData:betweenTwoDay">
			<li><a href="${ctx}/wenwen/reportData/betweenTwoDay">周报</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="reportData" action="${ctx}/wenwen/reportData/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
        <label>门店 ：</label>
        <form:select path="storeId" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
        </form:select>

        <label>报表日期：</label><input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                value='<fmt:formatDate value="${reportData.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
        
		&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
        
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>

		<th  class="span2" >门店</th>
		<th  class="span1" >派件人数</th>
		
		<th  class="span1" >前一天<br>派件数</th>
		<th  class="span1" >前一天<br>收件数</th>
		<th  class="span1" >前一天<br>收派比</th>
		<th  class="span1" >前一天<br>签收率</th>
		
		<th  class="span1" >派件数</th>
		<th  class="span1" >收件数</th>
		<th  class="span1" >收派比</th>
		<th  class="span1" >签收率</th>
		
		<th  class="span1" >派件<br>升降比</th>
		<th  class="span1" >收件<br>升降比</th>
		<th  class="span1" >签收<br>升降比</th>
		
		<th  class="span1" >自提件</th>
		<th  class="span1" >自提占比</th>
		<th  class="span1" >配送件</th>
		<th  class="span1" >配送占比</th>
		<th  class="span1" >滞留件</th>
		<th  class="span1" >滞留占比</th>
		<th  class="span1" >退回件</th>
		<th  class="span1" >退回占比</th>
		
<!-- 		<th  class="span1" >投诉</th> -->
<!-- 		<th  class="span1" >投诉占比</th> -->
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="reportData">
			<tr>
<%-- 				<td>${reportData.date}</td> --%>
				<td>${reportData.storeName}</td>
				<td>${reportData.employeeNum}</td>
				
				<td>${reportData.yesterdayPaijianNum}</td>
				<td>${reportData.yesterdayShoujianNum}</td>
				<td><c:if test="${reportData.yesterdayPaijianNum gt 0}"><fmt:formatNumber value="${reportData.yesterdayShoujianNum/reportData.yesterdayPaijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td><c:if test="${reportData.yesterdayPaijianNum gt 0}"><fmt:formatNumber value="${reportData.yesterdaySignNum/reportData.yesterdayPaijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				
				<td>${reportData.paijianNum}</td>
				<td>${reportData.shoujianNum}</td>
				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.shoujianNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.signNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				
				<td><c:if test="${reportData.yesterdayPaijianNum gt 0}"><fmt:formatNumber value="${(reportData.paijianNum-reportData.yesterdayPaijianNum)/reportData.yesterdayPaijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td><c:if test="${reportData.yesterdayShoujianNum gt 0}"><fmt:formatNumber value="${(reportData.shoujianNum-reportData.yesterdayShoujianNum)/reportData.yesterdayShoujianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td><c:if test="${reportData.yesterdaySignNum gt 0}"><fmt:formatNumber value="${(reportData.signNum-reportData.yesterdaySignNum)/reportData.yesterdaySignNum*100}" maxFractionDigits="2"/>%</c:if></td>
				
				
				<td>${reportData.zitiNum}</td>
				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.zitiNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td>${reportData.peisongNum}</td>
				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.peisongNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td>${reportData.delayNum}</td>
				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.delayNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
				<td>${reportData.returnBackNum}</td>
				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.returnBackNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>

<%-- 				<td>${reportData.feedBackNum}</td> --%>
<%-- 				<td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.feedBackNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
