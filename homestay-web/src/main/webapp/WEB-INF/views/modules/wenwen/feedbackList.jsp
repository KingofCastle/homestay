<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>投诉列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$(".select_changeAndSubmit").change(function(){
                $("#searchForm").submit();
            });

			$("#addFeedBack_a").click(function(){
                var waybillNo = $("#waybillNo").val();
                if(waybillNo == ""){
                	showTip("请先输入运单号！", "error");
                	return;
                }
                window.location.href="${ctx}/wenwen/feedback/form?waybillNo="+waybillNo;
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
		<li class="active"><a href="${ctx}/wenwen/feedback/list">所有记录</a></li>
		<shiro:hasPermission name="ww:feedback:save">
			<li ><a id="addFeedBack_a" href="#">新增</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="feedback" action="${ctx}/wenwen/feedback/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div class="row">
			<label>运单号 ：</label><form:input id="waybillNo" path="waybillNo" htmlEscape="false" maxlength="20" class="input-small"/>
            
            <label>门店 ：</label>
            <form:select path="storeId" class="select_changeAndSubmit">
                <form:option value="" label="-全部-"/>
                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            
            <label>状态 ：</label>
            <form:select path="result" class="input-small select_changeAndSubmit">
                <form:option value="" label="-全部-"/>
                <form:option value="0" label="未处理"/>
                <form:option value="1" label="已处理"/>
            </form:select>
            
            <label>投诉时间：</label><input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                    value='<fmt:formatDate value="${feedback.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
            - <input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                    value='<fmt:formatDate value="${feedback.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
                    
                &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
                <shiro:hasPermission name="ww:feedback:export">
                <tags:exportfieldsselect  id="exportData" name="fields" submitFormId="searchForm" exportClass="FeedBackEntity" submitUrl="${ctx}/wenwen/feedback/export"></tags:exportfieldsselect>
                </shiro:hasPermission>
		</div>
	</form:form>
	<tags:message content="${message}"/>

<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span2" >门店</th>
        <th  class="span1" >快递公司</th>
        <th  class="span1" >运单状态</th>
        <th  class="span2" >运单号</th>
        <th  class="span2" >收件人手机</th>
        <th  class="span1" >取件码/<br>集包号</th>
        <th  class="span1" >配送方式</th>
        <th  class="span1" >代收货款</th>
        <th  class="span1" >代收运费</th>
        <th  class="span1" >入库人</th>
        <th  class="span2" >入库时间</th>
        <th  class="span1" >出库人</th>
        <th  class="span2" >出库时间</th>
		<th  class="span2" >投诉时间</th>
		<th  class="span5" >投诉内容</th>
<!-- 		<th  class="span2" >处理时间</th> -->
		<th  class="span1" >操作</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="feedback">
			<tr>
			    <td>${feedback.waybill.belongStore.storeName}</td>
                <td>${feedback.waybill.expressCompany.companyName}</td>
                <td>${fns:getDictLabel(feedback.waybill.waybillStatus, 'waybillS_status', '')}</td>
                <td><a href="${ctx}/wenwen/feedback/form?id=${feedback.id}">${feedback.waybillNo}</a></td>
                <td>${feedback.waybill.receiverPhone}</td>
                <td>${feedback.waybill.areaNum}</td>
                <td>${fns:getDictLabel(feedback.waybill.dispatchingWay,'dispatching_way','')}</td>
                <td>${feedback.waybill.payment}</td>
                <td>${feedback.waybill.payFreight}</td>
                <td>${feedback.waybill.inOperator.name}</td>
                <td><fmt:formatDate value="${feedback.waybill.inTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${feedback.waybill.outOperator.name}</td>
                <td><fmt:formatDate value="${feedback.waybill.outTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><fmt:formatDate value="${feedback.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${feedback.content}</td>
				<td>
					<shiro:hasPermission name="ww:feedback:deal">
					    <c:if test="${feedback.result eq '0'}">
					        <a href="${ctx}/wenwen/feedback/deal?id=${feedback.id}">处理</a>
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
