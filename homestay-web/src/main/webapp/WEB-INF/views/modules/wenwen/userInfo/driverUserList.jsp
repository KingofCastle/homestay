<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户列表</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".select_changeAndSubmit").change(function () {
                $("#searchForm").submit();
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
    <li><a href="${ctx}/wenwen/userInfo/riderUserList">骑手用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/merchantUserList">商家用户</a></li>
    <li class="active"><a href="${ctx}/wenwen/userInfo/driverUserList">司机用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/wxUserList">微信用户</a></li>
</ul>
<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/userInfo/driverUserList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <div class="row">
        <label>司机姓名：</label><form:input path="realName" htmlEscape="false" maxlength="10" class="input-small"/>
        <label>联系方式：</label><form:input path="phone" htmlEscape="false" maxlength="11" class="input-small"/>
        <label>bd邀请码：</label><form:input path="bd" htmlEscape="false" maxlength="50" class="input-small"/>
        <label>司机状态 ：</label>
        <form:select path="driverStatus" class="input-small select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('tubobo_user_authentication')}" htmlEscape="false"/>
        </form:select>
        <label>注册时间：</label><input name="createTime" id="beginTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                                   value='<fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
        - <input name="updateTime" id="endTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                 value='<fmt:formatDate value="${entity.updateTime}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
        &nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>

    </div>

</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <%--<th class="span1"><input id="button_checkAll" type="checkbox"/></th>--%>
            <th class="span1">用户编号</th>
            <th class="span1">资金账户</th>
            <th class="span1">司机姓名</th>
            <th class="span1"  style="width: 80px">身份证号</th>
            <th class="span1">联系方式</th>
            <th class="span1">bd邀请码</th>
            <th class="span1">注册时间</th>
            <th class="span1">司机状态</th>
            <th class="span1">申请时间</th>
            <th class="span1">审核时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <%--<td><input class="checkbox_taskId" taskId="${task.userId}" type="checkbox"/></td>--%>
                <td><a href="${ctx}/wenwen/userInfo/driverUserForm?id=${entity.userId}">${entity.userId}</a></td>
                <td>${entity.accountId}</td>
                <td>${entity.realName}</td>
                <td>${entity.idCardNo}</td>
                <td>${entity.phone}</td>
                <td>${entity.bd}</td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td>${fns:getDictLabel(entity.driverStatus, 'tubobo_user_authentication', '')}</td>
                <td><fmt:formatDate value="${entity.driverApplyDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td><fmt:formatDate value="${entity.driverVerifyDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination">${page}</div>
</body>
</html>
