<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>所有员工</title>
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
		<li class="active"><a href="${ctx}/wenwen/employee/list">所有员工</a></li>
		<shiro:hasPermission name="ww:employee:edit">
			<li class=""><a href="${ctx}/wenwen/employee/form">新增员工</a></li>
		</shiro:hasPermission>
		<shiro:hasPermission name="ww:employee:statistics">
			<li class=""><a href="${ctx}/wenwen/employee/statistics">员工统计</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="employeeEntity" action="${ctx}/wenwen/employee/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>所属门店：</label>
		<form:select path="belongStore.storeId" class="select_changeAndSubmit">
        	<form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
        </form:select>
		<label>手机：</label><form:input path="phone" htmlEscape="false" maxlength="11" class="input-small"/>
		<label>姓名 ：</label><form:input path="name" htmlEscape="false" maxlength="10" class="input-small"/>
		<label>类型 ：</label>
	    <form:select path="employeeType" class="select_changeAndSubmit">
	        <form:option value="" label="-全部-"/>
	        <form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('employee_type')}" htmlEscape="false"/>
	    </form:select>
		<label>状态 ：</label>
	    <form:select path="delFlag" class="select_changeAndSubmit input-small">
	        <form:option value="" label="-全部-"/>
	        <form:option value="0" label="在职"/>
	        <form:option value="1" label="离职"/>
	    </form:select>		
		
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		<shiro:hasPermission name="ww:employee:export">
		<tags:exportfieldsselect  id="exportData" name="fields" submitFormId="searchForm" exportClass="EmployeeEntity" submitUrl="${ctx}/wenwen/employee/export"></tags:exportfieldsselect>
		</shiro:hasPermission>
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span2" >手机</th>
		<th  class="span2" >姓名</th>
		<th  class="span2" >类型</th>
		<th  class="span2" >所属门店</th>
		<th  class="span2" >签到门店</th>
		<th  class="span2" >签到有效期至</th>
		<th  class="span2" >注册时间</th>
		<th  class="span2" >更新时间</th>
		<th  class="span2" >状态</th>
		<th  class="span2" >操作</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="employee">
			<tr>
				<td><a href="${ctx}/wenwen/employee/form?employeeId=${employee.id}">${employee.phone}</a></td>
				<td>${employee.name}</td>
				<td>${fns:getDictLabel(employee.employeeType, 'employee_type', '')}</td>
				<td>${employee.belongStore.storeName}</td>
				<td>${employee.signStore.storeName}</td>
				<td><fmt:formatDate value="${employee.tokenIdExpiredTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${employee.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${employee.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:if test="${'0' eq employee.delFlag }">在职</c:if><c:if test="${'1' eq employee.delFlag }">离职</c:if></td>
				<td>	
					<shiro:hasPermission name="ww:employee:delete">
						<c:if test="${'0' eq employee.delFlag }">
							<a href="${ctx}/wenwen/employee/delete?id=${employee.id}" onclick="return confirm('确认离职吗？')">离职注销</a>
						</c:if>
					</shiro:hasPermission>			    
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
