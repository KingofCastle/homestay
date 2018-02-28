<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户评价</title>
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
		<li class="active"><a href="${ctx}/wenwen/evaluation/list">所有记录</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/evaluation/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div class="row">
            <label>类型：</label>
            <form:select path="type" class="input-small select_changeAndSubmit">
		        <form:option value="" label="-全部-"/>
		        <form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('evaluation_type')}" htmlEscape="false"/>
		    </form:select>
            
            <label>手机：</label><form:input path="phone" htmlEscape="false" maxlength="12" class="input-small"/>
            
            <label>评价时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
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
		<th class="span1" >类型</th>
        <th class="span1" >运单号</th>
        <th class="span1" >姓名</th>
        <th class="span1" >电话</th>
        <th class="span1" >评分</th>
        <th class="span2" >标签</th>
        <th class="span2" >评价内容</th>
        <th class="span2" >评价时间</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="entity">
			<tr>
                <td>${fns:getDictLabel(entity.type, 'evaluation_type', '')}</td>
			    <td>${entity.waybillNo}</td>
			    <td>${entity.name}</td>
			    <td>${entity.phone}</td>
                <td>${entity.evaluationStar}</td>
                <td>${entity.evaluationTag}</td>
                <td>${entity.evaluationComment}</td>
                <td><fmt:formatDate value="${entity.evaluationTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
