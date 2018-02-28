<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户标签</title>
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
		<li class="active"><a href="${ctx}/wenwen/customerTag/list">所有记录</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/customerTag/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div class="row">
            <label>门店：</label>
			<form:select path="store.storeId" class="select_changeAndSubmit">
	        	<form:option value="" label="-全部-"/>
	            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
	        </form:select>
            
            <label>手机：</label><form:input path="phone" htmlEscape="false" maxlength="12" class="input-small"/>
            
            <label>录入时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
                    
                &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		</div>
	</form:form>
	<tags:message content="${message}"/>

<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th class="span1" >门店</th>
        <th class="span1" >运单号</th>
        <th class="span1" >电话</th>
        <th class="span2" >标签</th>
        <th class="span2" >内容</th>
        <th class="span2" >录入时间</th>
        <th class="span2" >录入人</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
			    <td>${entity.store.storeName}</td>
			    <td>${entity.waybillNo}</td>
			    <td>${entity.phone}</td>
			    <td>${entity.tags}</td>
                <td>${entity.comment}</td>
                <td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${entity.operator.name}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
