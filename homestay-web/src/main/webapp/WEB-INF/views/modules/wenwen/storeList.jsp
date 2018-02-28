<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>门店信息</title>
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
		<li class="active"><a href="${ctx}/wenwen/store/">所有记录</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="store" action="${ctx}/wenwen/store/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>门店：</label><form:input path="storeName" htmlEscape="false" maxlength="10" class="input-small"/>
		<label>电话 ：</label><form:input path="storePhone" htmlEscape="false" maxlength="12" class="input-small"/>
		<label>门店类型 ：</label>
		<form:select path="storeType" class="select_changeAndSubmit">
			<form:option value="" label="-全部-"/>
			<form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('sys_office_type')}" htmlEscape="false"/>
		</form:select>
		<label>门店来源 ：</label>
		<form:select path="storeSource" class="input-small select_changeAndSubmit">
			<form:option value="" label="-全部-"/>
			<form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('sys_office_source')}" htmlEscape="false"/>
		</form:select>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span2" >门店编号</th>
		<th  class="span2" >门店名称</th>
		<th  class="span2" >门店电话</th>
		<th  class="span2" >门店类型</th>
		<th  class="span2" >门店来源</th>
		<th  class="span2" >区域代码</th>
		<th  class="span2" >标准地址</th>
		<th  class="span5" >详细地址</th>
		<th  class="span3" >快递公司</th>
		<th  class="span2" >同步签收</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="store">
			<tr>
				<td>${store.storeCode}</td>
				<td><a href="${ctx}/wenwen/store/form?id=${store.storeId}">${store.storeName}</a></td>
				<td>${store.storePhone}</td>
				<td>${fns:getDictLabel(store.storeType, 'sys_office_type', '')}</td>
				<td>${fns:getDictLabel(store.storeSource, 'sys_office_source', '')}</td>
				<td>${store.areaCode}</td>
				<td>${store.storeAddressStandard}</td>
				<td>${store.storeAddressDetail}</td>
				<td>
                    <c:forEach items="${store.expressCompanyList}" var="company">
                        ${company.companyName} 
                    </c:forEach>
                </td>
				<td><c:if test="${store.lsFlag}">开启</c:if></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
