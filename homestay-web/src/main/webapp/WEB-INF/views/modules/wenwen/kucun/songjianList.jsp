<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>派件列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$(".select_changeAndSubmit").change(function(){
				$("#searchForm").attr("action","${ctx}/wenwen/kucun/songjian/list");
                $("#searchForm").submit();
            });
			
            $("#updateAssociateMobileNumDatabase").click(function() {
            	top.$.jBox.confirm("确认以当前条件筛选的手机号更新手机号码联想库？","系统提示",function(v,h,f){
                    if(v=="ok"){
                        $("#searchForm").attr("action","${ctx}/wenwen/kucun/songjian/updateAssociateMobileNumDatabase");
                        $("#searchForm").submit();
                    }
                },{buttonsFocus:1});
                top.$('.jbox-body .jbox-icon').css('top','55px');
            });
               
		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
            $("#searchForm").attr("action","${ctx}/wenwen/kucun/songjian/list");
			$("#searchForm").submit();
        	return false;
        }

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wenwen/kucun/songjian/list">所有记录</a></li>
<%-- 		<li ><a href="${ctx}/wenwen/kucun/songjian/form">添加记录</a></li> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="waybill" action="${ctx}/wenwen/kucun/songjian/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<div class="row">
            <label>门店 ：</label>
            <form:select path="belongStore.storeId" class="select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            <label>快递公司 ：</label>
            <form:select path="expressCompany.companyId" class="input-small select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options itemValue="value" itemLabel="label" items="${fns:queryExpressCompanyListByStoreId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            <label>状态 ：</label>
            <form:select path="waybillStatus" class="input-small select_changeAndSubmit">
                <form:option value="" label="-全部-"/>
                <form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('waybillS_status')}" htmlEscape="false"/>
            </form:select>
            <label>配送方式 ：</label>
            <form:select path="pickupType" class="input-small select_changeAndSubmit">
                <form:option value="" label="-全部-"/>
                <form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('pickup_type')}" htmlEscape="false"/>
            </form:select>
		</div>
		<div class="row" style="margin-top:8px;">
			<label>手机 ：</label><form:input path="receiverPhone" htmlEscape="false" maxlength="12" class="input-small"/>
			<label>运单号 ：</label><form:input path="waybillNo" htmlEscape="false" maxlength="20" class="input-small"/>
			<label>取件码/集包号 ：</label><form:input path="areaNum" htmlEscape="false" maxlength="5" class="input-small"/>
		</div>
		<div class="row" style="margin-top:8px;">
		    <label>入库人 ：</label>
            <form:select path="inOperator.id" class="input-small select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options  itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
		    <label>出库人 ：</label>
            <form:select path="outOperator.id" class="input-small select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options  itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            
            <label>录入时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${waybill.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${waybill.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
            
	        &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;
	            
            <shiro:hasPermission name="updateAssociateMobileNumDatabase">
            	<input id="updateAssociateMobileNumDatabase" class="btn btn-primary" type="button" value="更新号码库"/>&nbsp;
            </shiro:hasPermission>
	            
            <shiro:hasPermission name="ww:kucun:songjian:export">
            	<tags:exportfieldsselect  id="exportData" name="fields" submitFormId="searchForm" exportClass="WayBillSEntity" submitUrl="${ctx}/wenwen/kucun/songjian/export"></tags:exportfieldsselect>
            </shiro:hasPermission>
		</div>
		
	</form:form>
	<tags:message content="${message}"/>

<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
<!-- 		<th  class="span1" ><input type="checkbox" id="checkall" /></th> -->
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
		<th  class="span1" >签收人</th>
		<th  class="span2" >签收时间</th>
		<th  class="span2" >更新时间</th>
<!-- 		<th  class="span1" >操作</th> -->
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="waybill">
			<tr>
<%-- 				<td><input type="checkbox" name="checkedWayBillId" value="${waybill.id}"></td> --%>
	<td>
		<c:catch var ="storeException">
			${waybill.belongStore.storeName}
		</c:catch>
		<c:if test = "${catchException != null}"></c:if>
	</td>
	<td>
		<c:catch var ="companyException">
			${waybill.expressCompany.companyName}
		</c:catch>
		<c:if test = "${companyException != null}"></c:if>
	</td>
				<td>${fns:getDictLabel(waybill.waybillStatus, 'waybillS_status', '')}</td>
				<td><a href="${ctx}/wenwen/kucun/songjian/form?id=${waybill.id}">${waybill.waybillNo}</a></td>
				<td>${waybill.receiverPhone}</td>
				<td>${waybill.areaNum}</td>
				<td>${fns:getDictLabel(waybill.pickupType,'pickup_type','')}</td>
				<td>${waybill.payment}</td>
				<td>${waybill.payFreight}</td>
				<td>${waybill.inOperator.name}</td>
				<td><fmt:formatDate value="${waybill.inTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${waybill.outOperator.name}</td>
				<td><fmt:formatDate value="${waybill.outTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${waybill.signOperator.name}</td>
				<td><fmt:formatDate value="${waybill.signTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${waybill.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<!-- 				<td> -->
<%-- 					<shiro:hasPermission name="ww:kucun:songjian:delete"> --%>
<%-- 						<a href="${ctx}/wenwen/kucun/songjian/delete?id=${waybill.id}" onclick="if(confirm('确定删除?')==false)return false;">删除</a> --%>
<%-- 					</shiro:hasPermission> --%>
<!-- 				</td> -->
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
