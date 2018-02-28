<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>用户信息</title>
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
        <li class="active"><a href="${ctx}/wenwen/customerInfo/list">所有记录</a></li>
        <shiro:hasPermission name="ww:customerInfo:edit">
			<li><a href="${ctx}/wenwen/customerInfo/form">新增</a></li>
		</shiro:hasPermission>
    </ul>
    <form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/customerInfo/list" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        
        <div class="row">
       		<label>门店 ：</label>
            <form:select path="store.storeId" class="select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            
	        <label>联系电话：</label><form:input path="phone" htmlEscape="false" maxlength="11" class="input-small"/>
	        <label>姓名：</label><form:input path="name" htmlEscape="false" maxlength="20" class="input-small"/>
        </div>

        <div class="row" style="margin-top:8px;">
       		<label>录入人 ：</label>
            <form:select path="operatorId" class="input-small select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options  itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            
            <label>录入时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
	                
	        &nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
        </div>

    </form:form>
    
    <tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th class="span1">门店</th>
        <th class="span1">姓名</th>
        <th class="span1">联系电话</th>
        <th class="span1">省</th>
        <th class="span1">市</th>
        <th class="span1">区</th>
        <th class="span3">详细地址</th>
        <th class="span1">录入人</th>
        <th class="span2">录入时间</th>
<!--         <th class="span1">更新时间</th> -->
        <th class="span1">操作</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="info">
            <tr>
                <td>${info.store.storeName}</td>
                <td>${info.name}</td>
                <td><a href="${ctx}/wenwen/customerInfo/form?id=${info.id}">${info.phone}</a></td>
                <td>${info.provinceName}</td>
                <td>${info.cityName}</td>
                <td>${info.areaName}</td>
                <td>${info.detailAddress}</td>
                <td>${info.operatorName}</td>
                <td><fmt:formatDate value="${info.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
<%--                 <td><fmt:formatDate value="${info.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td> --%>
                <td>
					<shiro:hasPermission name="ww:customerInfo:delete">
						<a href="${ctx}/wenwen/customerInfo/delete?id=${info.id}" onclick="if(confirm('确定删除?')==false)return false;">删除</a>
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
