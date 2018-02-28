<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收件列表</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/dialog.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".select_changeAndSubmit").change(function(){
                $("#searchForm").submit();
            });

            $("#btnImport").click(function(){
                $.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true},
                    bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
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

<div id="importBox" class="hide">
	<form id="importForm" action="${ctx}/wenwen/kucun/lanjian/import" method="post" enctype="multipart/form-data"
		  style="padding-left:20px;text-align:center;" class="form-search" onsubmit="loading('正在导入，请稍等...');"><br/>
		<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
		<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
		<a href="${ctx}/wenwen/kucun/lanjian/importTemplate">下载模板</a>
	</form>
</div>

	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wenwen/kucun/lanjian/list">所有记录</a></li>
		<shiro:hasPermission name="ww:kucun:lanjian:edit">
			<li><a href="${ctx}/wenwen/kucun/lanjian/form">新增</a></li>
		</shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="waybill" action="${ctx}/wenwen/kucun/lanjian/list" method="post" class="breadcrumb form-search">
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
<!-- 	        <label>状态 ：</label> -->
<%-- 	        <form:select path="waybillStatus" class="input-small select_changeAndSubmit"> --%>
<%-- 	            <form:option value="" label="-全部-"/> --%>
<%-- 	            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('waybillR_status')}" htmlEscape="false"/> --%>
<%-- 	        </form:select> --%>
        </div>
        <div class="row" style="margin-top:8px;">
        	<label>手机：</label><form:input path="senderPhone" htmlEscape="false" maxlength="12" class="input-small"/>
			<label>运单号：</label><form:input path="waybillNo" htmlEscape="false" maxlength="20" class="input-small"/>
			
			<label>录入时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${waybill.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${waybill.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
	                
	        &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>

			<shiro:hasPermission name="ww:kucun:lanjian:import">
				<input id="btnImport" class="btn btn-primary" type="button" value="导入"/>
			</shiro:hasPermission>

			<shiro:hasPermission name="ww:kucun:lanjian:export">
				<tags:exportfieldsselect  id="exportData" name="fields" submitFormId="searchForm" exportClass="WayBillREntity" submitUrl="${ctx}/wenwen/kucun/lanjian/export"></tags:exportfieldsselect>
			</shiro:hasPermission>

        </div>
	</form:form>



<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span1" >门店</th>
		<th  class="span1" >快递公司</th>
		<th  class="span1" >运单状态</th>
		<th  class="span1" >运单号</th>
		<th  class="span1" >寄件人</th>
		<th  class="span1" >寄件手机</th>
        <th  class="span2" >寄件地址</th>
        <th  class="span1" >收件人</th>
        <th  class="span1" >收件手机</th>
        <th  class="span2" >收件地址</th>
		<th  class="span1" >运费</th>
		<th  class="span1" >保价</th>
<!-- 		<th  class="span1" >物品</th> -->
<!-- 		<th  class="span1" >大小</th> -->
<!-- 		<th  class="span1" >重量</th> -->
<!-- 		<th  class="span1" >货款</th> -->
<!-- 		<th  class="span1" >保价金额</th> -->
<!-- 		<th  class="span1" >付款方式</th> -->
<!-- 		<th  class="span2" >备注</th> -->
        <th  class="span1" >录入时间</th>
        <th  class="span1" >入库时间</th>
        <th  class="span1" >出库时间</th>
<!--         <th  class="span1" >操作</th> -->
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="waybill">
			<tr>
<%-- 			    <td><c:if test="${waybill.waybillStatus eq 1}"><input type="checkbox" name="checkedWayBillId" value="${waybill.id}"></c:if></td> --%>
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
				<td>${fns:getDictLabel(waybill.waybillStatus, 'waybillR_status', '')}</td>
				<td>${waybill.waybillNo}</td>
<%-- 				<td><a href="${ctx}/wenwen/kucun/lanjian/form?id=${waybill.id}">${waybill.waybillNo}</a></td> --%>
				<td>${waybill.senderName}</td>
				<td>${waybill.senderPhone}</td>
				<td>${waybill.senderPcdName} ${waybill.senderAddress}</td>
				<td>${waybill.receiverName}</td>
				<td>${waybill.receiverPhone}</td>
				<td>${waybill.receiverPcdName} ${waybill.receiverAddress}</td>
				<td>${waybill.payFreight}（${waybill.weight}kg）</td>
				<td><c:if test="${waybill.insureFlag eq true}">是</c:if></td>
<%-- 				<td>${waybill.shipment}</td> --%>
<%-- 				<td>${fns:getDictLabel(waybill.size, 'shipment_size', '')}</td> --%>
<%-- 				<td>${waybill.weight}</td> --%>
<%-- 				<td>${waybill.payFreight}</td> --%>
<%-- 				<td>${waybill.insurePrice}</td> --%>
<%--                 <td>${fns:getDictLabel(waybill.paymentMethod, 'payment_method', '')}</td> --%>
<%-- 				<td>${waybill.remark}</td> --%>
				<td><fmt:formatDate value="${waybill.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
				<td><fmt:formatDate value="${waybill.inTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
				<td><fmt:formatDate value="${waybill.outTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
<!-- 				<td> -->
<%-- 					<shiro:hasPermission name="ww:kucun:lanjian:delete"> --%>
<%-- 						<a href="${ctx}/wenwen/kucun/lanjian/delete?id=${waybill.id}" onclick="if(confirm('确定删除?')==false)return false;">删除</a> --%>
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
