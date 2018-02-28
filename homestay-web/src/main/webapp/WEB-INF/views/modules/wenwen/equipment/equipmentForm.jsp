<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>设备明细</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/equipment/list">所有记录</a></li>
    <li class="active"><a href="#">门店详情</a></li>
</ul>
<br/>


<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/store/save" method="post"
           class="form-horizontal">
    <tags:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">传感器ID:</label>

        <div class="controls">
            <label class="lbl">${entity.id}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">智能硬件名称:</label>

        <div class="controls">
            <label class="lbl">${entity.name}</label>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">所属门店:</label>

        <div class="controls">
            <label class="lbl">${entity.store.storeName}</label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">温度:</label>

        <div class="controls">
            <label class="lbl">${entity.temperature}</label>
        </div>
    </div>

</form:form>
<table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th class="span1">快递单号</th>
        <th class="span1">录入时间</th>
        <th class="span1">操作员</th>
        <%--<th class="span1">操作</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${entity.items}" var="wayBill">
        <tr>
            <td>${wayBill.waybillNo}</td>
            <td><fmt:formatDate value="${wayBill.inTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
            <td>${wayBill.inOperator.name}</td>
            <%--<td>--%>
                <%--<shiro:hasPermission name="ww:equipment:view">--%>
                    <%--<a href="">查看</a>--%>
                <%--</shiro:hasPermission>--%>
            <%--</td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="form-actions">
    <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
</div>
</body>
</html>
