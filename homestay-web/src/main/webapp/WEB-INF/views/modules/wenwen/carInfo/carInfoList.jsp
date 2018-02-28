<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>车辆信息管理</title>
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
        <shiro:hasPermission name="ww:carInfo:edit">
	        <li><a href="${ctx}/wenwen/carInfo/form">新增</a></li>
        </shiro:hasPermission>
    </ul>
    <form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/carInfo/list" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <label>类型 ：</label>
        <form:select path="carType" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('car_type')}" htmlEscape="false"/>
        </form:select>
       &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </form:form>
    <tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th  class="span1" >名字</th>
        <th  class="span1" >类型</th>
        <th  class="span1" >起步价(元)</th>
        <th  class="span1" >起步公里(km)</th>
        <th  class="span1" >超出价格(元/km)</th>
        <th  class="span1" >最大载重(t)</th>
        <th  class="span1" >长(m)</th>
        <th  class="span1" >宽(m)</th>
        <th  class="span1" >高(m)</th>
        <th  class="span1" >车辆描述</th>
        <th  class="span1" >排序</th>
        <th  class="span1" >图片地址</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <td><a href="${ctx}/wenwen/carInfo/form?id=${entity.id}">${entity.name}</a></td>
                <td>${fns:getDictLabel(entity.carType, 'car_type', entity.carType)}</td>
                <td>${entity.startPrice}</td>
                <td>${entity.startDistance}</td>
                <td>${entity.beyondPrice}</td>
                <td>${entity.maxLoad}</td>
                <td>${entity.volumeLong}</td>
                <td>${entity.volumeWidth}</td>
                <td>${entity.volumeHeight}</td>
                <td>${entity.description}</td>
                <td>${entity.order}</td>
                <td><c:if test="${ not empty entity.iconUrl}"><a href="${entity.iconUrl}" target="_blank">下载</a></c:if></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <div class="pagination">${page}</div>
</body>
</html>
