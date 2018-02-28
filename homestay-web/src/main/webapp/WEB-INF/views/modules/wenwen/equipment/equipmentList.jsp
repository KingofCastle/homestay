<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>设备列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

            $(".select_changeAndSubmit").change(function () {
                $("#searchForm").submit();
            });

            $("#addEquip").click(function () {
                window.location.href = "${ctx}/wenwen/equipment/edit?flag=add";
            });
        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/wenwen/equipment/list">所有记录</a></li>
</ul>

<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/equipment/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <label>智能硬件编号 ：</label><form:input path="id" htmlEscape="false" maxlength="12" class="input-small"/>

    <label>智能硬件名称：</label><form:input path="name" htmlEscape="false" maxlength="20" class="input-small"/>

    <label>门店 ：</label>
    <form:select path="store.storeId" class="select_changeAndSubmit">
        <form:option value="" label="-全部-"/>
        <form:options itemValue="value" itemLabel="label"
                      items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
    </form:select>


    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>


</form:form>

<input id="addEquip" class="btn btn-primary" type="button" value="新增智能硬件"/><br><br>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="span1">传感器ID</th>
            <th class="span1">智能硬件名称</th>
            <th class="span1">所属门店</th>
            <th class="span1">存放快递数</th>
            <th class="span1">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="equipment">
            <tr>
                <td>${equipment.id}</td>
                <td>${equipment.name}</td>
                <td>${equipment.store.storeName}</td>
                <td>${fn:length(equipment.items)}</td>
                <td>
                    <shiro:hasPermission name="ww:equipment:view">
                        <a href="${ctx}/wenwen/equipment/edit?id=${equipment.id}&flag=edit">编辑</a>
                        <a href="${ctx}/wenwen/equipment/form?id=${equipment.id}">查看详情</a>
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
