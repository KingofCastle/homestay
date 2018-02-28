<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>快递公司列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
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
		<li class="active"><a href="${ctx}/wenwen/expressCompany/list">所有记录</a></li>
		<shiro:hasPermission name="ww:expressCompany:edit">
			<li ><a href="${ctx}/wenwen/expressCompany/form">新增</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="expressCompanyEntity" action="${ctx}/wenwen/expressCompany/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>名称 ：</label><form:input path="companyName" htmlEscape="false" maxlength="10" class="input-small"/>
		<label>联系电话 ：</label><form:input path="contractPhone" htmlEscape="false" maxlength="12" class="input-small"/>

		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span1" >操作</th>
		<th  class="span1" >状态</th>
		<th  class="span2" >名称</th>
		<th  class="span2" >正则验证</th>
		<th  class="span2" >联系电话</th>
		<th  class="span2" >更新时间</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="expressCompany">
			<tr>
				<td>
				    <shiro:hasPermission name="ww:expressCompany:edit">
				    	<a href="${ctx}/wenwen/expressCompany/form?companyId=${expressCompany.companyId}">修改</a>
				    </shiro:hasPermission>
				    <shiro:hasPermission name="ww:expressCompany:open">
				       <c:if test="${expressCompany.opened eq 0}">
				            <a href="${ctx}/wenwen/expressCompany/open?companyId=${expressCompany.companyId}&opened=1" onclick="return confirmx('确认要开启吗？', this.href)">开启</a>
				       </c:if>
                       <c:if test="${ expressCompany.opened eq 1}">
                            <a href="${ctx}/wenwen/expressCompany/open?companyId=${expressCompany.companyId}&opened=0" onclick="return confirmx('确认要禁用吗？', this.href)">禁用</a>
                       </c:if>
				    </shiro:hasPermission>
				</td>
				<td>
				       <c:if test="${expressCompany.opened eq 0}">未开启</c:if>
                       <c:if test="${expressCompany.opened eq 1}">已开启</c:if>
                </td>
				<td>${expressCompany.companyName}</td>
				<td>${expressCompany.regularExpression}</td>
				<td>${expressCompany.contractPhone}</td>
				<td><fmt:formatDate value="${expressCompany.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
