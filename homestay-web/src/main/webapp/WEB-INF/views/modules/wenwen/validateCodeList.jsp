<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>验证码列表</title>
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
		<li class="active"><a>所有记录</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="validateCode" action="${ctx}/wenwen/validateCode/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>手机号 ：</label><form:input path="phone" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>类型 ：</label>
		<form:select path="type" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('validateCode_type')}" htmlEscape="false"/>
        </form:select>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span2" >手机号</th>
		<th  class="span2" >类型</th>
		<th  class="span2" >验证码</th>
		<th  class="span2" >验证结果</th>
		<th  class="span2" >发送时间</th>
		<th  class="span2" >过期时间</th>
<!-- 		<th  class="span2" >是否有效</th> -->
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="code">
			<tr>
				<td>${code.phone}</td>
				<td>${fns:getDictLabel(code.type, 'validateCode_type', '')}</td>
				<td>${code.code}</td>
				<td>${fns:getDictLabel(code.result, 'validateCode_status', '')}</td>
				<td><fmt:formatDate value="${code.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
				<td><fmt:formatDate value="${code.expireTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
<%-- 				<c:if test="${code.delFlag == '0'}"><td>有效</td></c:if> --%>
<%--                 <c:if test="${code.delFlag == '1'}"><td>--</td></c:if> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
