<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>员工统计</title>
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
		<li><a href="${ctx}/wenwen/employee/list">所有员工</a></li>
		<shiro:hasPermission name="ww:employee:edit">
			<li><a href="${ctx}/wenwen/employee/form">员工信息</a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="ww:employee:statistics">
			<li class="active"><a href="#">员工统计</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/employee/statistics" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

        <label>所属门店 ：</label>
        <form:select path="storeId" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
        </form:select>
		
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		<shiro:hasPermission name="ww:employee:correctstatistics">
			&nbsp;<a href="${ctx}/wenwen/employee/statistics/correct" class="btn">校正最新数据</a>
		</shiro:hasPermission>
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span2" >门店</th>
		<th  class="span2" >店长</th>
		<th  class="span2" >直营快递员</th>
		<th  class="span2" >兼职快递员</th>
		<th  class="span2" >在职员工总数</th>
		<th  class="span2" >离职注销</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
				<td>${entity.storeName}</td>
				<td>${entity.storeKeeperNum}</td>
				<td>${entity.storeEmployeeNum}</td>
				<td>${entity.storePartTimeJobNum}</td>
				<td>${entity.totalNum}</td>
				<td>${entity.deleteNum}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
