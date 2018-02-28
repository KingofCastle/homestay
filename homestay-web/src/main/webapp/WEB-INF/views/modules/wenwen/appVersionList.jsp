<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>客户端版本列表</title>
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
        <li><a href="${ctx}/wenwen/appVersion/form">新增</a></li>
    </ul>
    <form:form id="searchForm" modelAttribute="version" action="${ctx}/wenwen/appVersion/list" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <label>app名称：</label>
        <form:select path="appName" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('app_name')}" htmlEscape="false"/>
        </form:select>
        <label>app类型：</label>
        <form:select path="appType" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('app_type')}" htmlEscape="false"/>
        </form:select>
       &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </form:form>
    <tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th class="span1" >app名称</th>
        <th class="span1" >app类型</th>
        <th class="span1" >version</th>
        <th class="span1" >minVersion</th>
        <th class="span2" >下载url</th>
        <th class="span2" >版本描述</th>
        <th class="span1" >更新时间</th>
        <%--<th class="span1" >操作</th>--%>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="version">
            <tr>
                <td>${fns:getDictLabel(version.appName, 'app_name', '')}</td>
                <td>${fns:getDictLabel(version.appType, 'app_type', '')}</td>
                <td>${version.version}</td>
                <td>${version.minVersion}</td>
                <td>${version.url}</td>
                <td>${version.description}</td>
                <td><fmt:formatDate value="${version.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <%--<td>--%>
                    <%--<c:if test="${version.delFlag eq '0'}">--%>
                        <%--<a href="${ctx}/wenwen/appVersion/form?id=${version.id}">更新</a>--%>
                    <%--</c:if>--%>
                <%--</td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <div class="pagination">${page}</div>
</body>
</html>
