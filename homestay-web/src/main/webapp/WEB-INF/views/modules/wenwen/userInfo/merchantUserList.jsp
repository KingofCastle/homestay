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
    <li class="active"><a href="${ctx}/wenwen/userInfo/merchantUserList">商家用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/driverUserList">司机用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/wxUserList">微信用户</a></li>
</ul>
<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/userInfo/merchantUserList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <div class="row">
        <label>店铺名称：</label><form:input path="merchantName" htmlEscape="false" maxlength="10" class="input-small"/>
        <label>联系方式：</label><form:input path="phone" htmlEscape="false" maxlength="11" class="input-small"/>
        <label>bd邀请码：</label><form:input path="bdCode" htmlEscape="false" maxlength="50" class="input-small"/>
        <label>用户编号：</label><form:input path="userId" htmlEscape="false" maxlength="50" class="input-small"/>
        <label>状态 ：</label>
        <form:select path="merchantStatus" class="input-small select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('tubobo_user_authentication')}" htmlEscape="false"/>
        </form:select>
        <label>所属城市：</label>
        <form:select path="cityCode" class="input-small select_changeAndSubmit">
            <form:option value="" label="-请选择-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('city_name')}" htmlEscape="false"/>
        </form:select>
        <label>注册时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                                   value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                 value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
        <label>商家类型 ：</label>
        <select id="merchantTypeList" name="merTypeId" path="merchantTypeList" class="input-small">
            <option value="${value.id}">
                -请选择-
            </option>
            <c:forEach var="value" items="${merchantTypeList}">
                <option value="${value.id}">
                        ${value.name}
                </option>
            </c:forEach>
        </select>
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
            <th class="span1">店铺名称</th>
            <th class="span1"  style="width: 90px">身份证号</th>
            <th class="span1" style="width: 90px">联系方式</th>
            <th class="span2">店铺地址</th>
            <%--<th class="span1">用户类型</th>--%>
            <th class="span1">bd邀请码</th>
            <th class="span1">认证类型</th>
            <th class="span1">注册时间</th>
            <th class="span1">货主状态</th>
            <th class="span1">商家状态</th>
            <th class="span1">申请时间</th>
            <th class="span1">通过时间</th>
            <th class="span1">所属城市</th>
                <th class="span1">商家类型</th>
            <%--<th class="span1">操作</th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <%--<td><input class="checkbox_taskId" taskId="${task.userId}" type="checkbox"/></td>--%>
                <td><a href="${ctx}/wenwen/userInfo/merchantUserForm?id=${entity.userId}">${entity.userId}</a></td>
                <td>${entity.accountId}</td>
                <td>${entity.merchantName}</td>
                <td>${entity.idCardNo}</td>
                <td>${entity.phone}</td>
                <td>${entity.addressProvince} ${entity.addressCity} ${entity.addressDistrict} ${entity.addressStreet} ${entity.addressDetail}</td>
                <%--<td>商家用户</td>--%>
                <td>${entity.bdCode}</td>
                <td>${fns:getDictLabel(entity.identifyType, 'tubobo_user_identify_type', '')}</td>
                    <td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td>${fns:getDictLabel(entity.consignorStatus, 'tubobo_user_authentication', '')}</td>
                <td>${fns:getDictLabel(entity.merchantStatus, 'tubobo_user_authentication', '')}</td>
                <td><fmt:formatDate value="${entity.applyDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td><fmt:formatDate value="${entity.verifyDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td>${entity.addressCity}</td>
                   <td>
                       <c:forEach var="value" items="${merchantTypeList}">
                           <c:if test="${entity.merTypeId == value.id}">
                               <c:out value="${value.name}"/>
                           </c:if>
                       </c:forEach>
                   </td>
                <%--<td>--%>
                    <%--<shiro:hasPermission name="ww:userInfo:view">--%>
                        <%--<a href="${ctx}/wenwen/userInfo/merchantUserForm?id=${entity.userId}">查看详情</a>--%>
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
