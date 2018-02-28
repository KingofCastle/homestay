<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>阿里短信记录</title>
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
	<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/aliSmsRecord/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>手机号 ：</label><form:input path="phone" htmlEscape="false" maxlength="12" class="input-small"/>
		
		<label>门店 ：</label>
        <form:select path="storeId" class="select_changeAndSubmit">
        	<form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
        </form:select>
        
        <label>短信类型 ：</label>
        <form:select path="smsType" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('sms_type')}" htmlEscape="false"/>
        </form:select>
        
        <label>发送结果 ：</label>
        <form:select path="smsStatus" class="input-small select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('sms_status')}" htmlEscape="false"/>
        </form:select>
        
        <label>录入时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
	                
		&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		
	</form:form>
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
<!-- 		<th  class="span1" >应用</th> -->
		<th  class="span2" >类型</th>
		<th  class="span2" >模版ID</th>
<!-- 		<th  class="span2" >短信签名</th> -->
		<th  class="span1" >立即发送</th>
<!-- 		<th  class="span1" >门店</th> -->
<!--         <th  class="span1" >快递公司</th> -->
		<th  class="span2" >手机号</th>
		<th  class="span5" >参数内容</th>
		<th  class="span2" >录入时间</th>
		<th  class="span2" >发送时间</th>
		<th  class="span2" >接收时间</th>
		<th  class="span2" >发送结果</th>
		<th  class="span2" >返回码</th>
<!-- 		<th  class="span3" >流水号</th> -->
		<th  class="span2" >异常</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="record">
			<tr>
<%-- 				<td>${fns:getDictLabel(record.appId, 'messageCenter_app', '')}</td> --%>
				<td>${fns:getDictLabel(record.smsType, 'sms_type', '')}</td>
<%-- 				<td>${record.store.storeName}</td> --%>
<%-- 				<td>${record.expressCompany.companyName}</td> --%>
				<td>${record.aliSmsId}</td>
<%-- 				<td>${record.aliSignName}</td> --%>
				<td>${record.immediate}</td>
				<td>${record.phone}</td>
				<td>${record.jsonParams}</td>
				<td><fmt:formatDate value="${record.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
				<td>${record.sendTime}</td>
				<td>${record.receiverTime}</td>
<%-- 				<td><fmt:formatDate value="${record.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td> --%>
				<td>${fns:getDictLabel(record.smsStatus, 'sms_status', record.smsStatus)}</td>
				<td>${record.bizResultCode}</td>
<%-- 				<td>${record.bizId}</td> --%>
				<td>
					${record.taobaoResponseSubMsg} 
				    <c:if test="${record.smsStatus eq '2' || record.smsStatus eq '10'}">
				        <a href="#" onclick="alert('${record.taobaoResponseErrorCode} ${record.taobaoResponseMsg} ${record.taobaoResponseSubCode} ${record.taobaoResponseSubMsg}');">详情</a>
				    </c:if>
				    <input type="hidden" value="${record.bizId}">
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
