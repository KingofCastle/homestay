<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>评价列表</title>
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
    <li class="active"><a href="${ctx}/wenwen/tbbRate/list">所有记录</a></li>
</ul>

<form:form id="searchForm" modelAttribute="condition" action="${ctx}/wenwen/tbbRate/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <%--<input id="platformId" name="platformId" type="hidden" value="MERCHANT"/>--%>

    <label>评价人 ：</label>
    <form:select id="platformId" path="platformId" class="input-small select_changeAndSubmit">
        <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('tbb_rate_platform')}"
                      htmlEscape="false"/>
    </form:select>

    <label>评价分类 ：</label>
    <form:select path="targetCategory" class="input-small  select_changeAndSubmit">
        <form:option value="" label="-全部-"/>
        <form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('tbb_rate_category')}" htmlEscape="false"/>
    </form:select>

    <label>订单编号 ：</label><form:input path="orderId" htmlEscape="false" maxlength="20" class="input-small"/>

    <label>目标编号：</label><form:input path="targetId" htmlEscape="false" maxlength="20" class="input-small"/>
    <%--<label>目标分类：</label><form:input path="targetCategory" htmlEscape="false" maxlength="11" class="input-small"/>--%>


    <label>评价时间：</label>
    <input name="createDateBegin" id="beginDate" type="text" readonly="readonly" maxlength="20"
           class="input-small Wdate"
           value='<fmt:formatDate value="${condition.createDateBegin}" pattern="yyyy-MM-dd"/>'
           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
    - <input name="createDateEnd" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
             value='<fmt:formatDate value="${condition.createDateEnd}" pattern="yyyy-MM-dd"/>'
             onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>

    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>


</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="span1">评价人</th>
            <th class="span1">评价分类</th>
            <th class="span2">订单编号</th>
            <th class="span2">目标编号</th>
            <%--<th class="span1">评价用户ID</th>--%>
            <th class="span1">是否匿名</th>
            <th class="span2">评价</th>
            <th class="span2">评价标签</th>
            <th class="span2">评分</th>
            <th class="span2">评价时间</th>
            <th class="span1">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="rate">
            <tr>
                <td>${fns:getDictLabel(rate.platformId, 'tbb_rate_platform', '')}</td>
                <td>${fns:getDictLabel(rate.targetCategory, 'tbb_rate_category', '')}</td>
                <td>${rate.orderId}</td>
                <td>${rate.targetId}</td>
                <%--<td>${rate.customerId}</td>--%>
                <td>${fns:getDictLabel(rate.anony, 'true_false', '')}</td>
                <td>${rate.fullTxt}</td>
                <td>
                    <c:forEach items="${rate.tags}" var="tags">
                        ${tags}&nbsp;
                    </c:forEach>
                </td>
                <td>
                    <c:forEach items="${rate.scores}" var="mymap">
                        <c:if test="${'RATE_SERVICE_SCORE' eq mymap.key}">服务评价:${mymap.value}</c:if>
                        <c:if test="${'RATE_DELIVERY_SCORE' eq mymap.key}">配送时效:${mymap.value}</c:if>
                        <c:if test="${'DELIVERY_SERVICE' eq mymap.key}">配送评价:${mymap.value}</c:if>
                    </c:forEach>
                </td>
                <td><fmt:formatDate value="${rate.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td>
                    <shiro:hasPermission name="ww:tbbRate:delete">
                        <a href="${ctx}/wenwen/tbbRate/delete?platformId=${rate.platformId}&orderId=${rate.orderId}&targetId=${rate.targetId}"
                           onclick="return confirm('确定删除该条评价?')">删除</a>
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
