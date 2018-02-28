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
    <li><a href="${ctx}/posthouse/provider/edit">新增</a></li>
</ul>
<form:form id="searchForm" modelAttribute="queryCondition" action="${ctx}/posthouse/provider/list" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <div>
        <label>用户：</label>
        <label>服务商ID：</label><form:input path="providerId" htmlEscape="false" maxlength="11" class="input-small"/>
        <label>服务商名称：</label><form:input path="providerName" htmlEscape="false" maxlength="100" class="input-small"/>
        <label>联系电话：</label><form:input path="operatorPhone" htmlEscape="false" maxlength="11" class="input-small"/>

        &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>

    </div>
</form:form>
<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
            <th  class="span1" >服务商ID</th>
            <th  class="span1" >服务商名称</th>
            <th  class="span1" >联系人</th>
            <th  class="span1" >联系电话</th>
            <th  class="span1" >添加时间</th>
            <%--<th  class="span1" >操作</th>--%>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <td><a href="${ctx}/posthouse/provider/form?id=${entity.id}">${entity.id}</a></td>
                <td>${entity.name}</td>
                <td>${entity.operatorName}</td>
                <td>${entity.operatorPhone}</td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <%--<td>--%>
                    <%--<shiro:hasPermission name="posthouse:provider:edit">--%>
                        <%--<a href="${ctx}/posthouse/provider/edit?id=${entity.id}">编辑</a>--%>
                    <%--</shiro:hasPermission>--%>
                <%--</td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination">${page}</div>
</body>
</html>
