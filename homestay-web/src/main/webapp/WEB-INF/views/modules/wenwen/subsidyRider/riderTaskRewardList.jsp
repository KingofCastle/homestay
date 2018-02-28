<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>骑手任务奖励设置</title>
    <meta name="decorator" content="default"/>

</head>
<body>

<ul class="nav nav-tabs">
    <shiro:hasPermission name="ww:weatherFeeOver:view">
        <li class="active"><a >骑手任务奖励设置</a></li>
    </shiro:hasPermission>
</ul>


<a href="${ctx}/wenwen/riderTaskReward/view?id=">新增骑手任务奖励设置</a>

<table>
    <tbody id="files" name="filess">
    <tags:message content="${message}"/>

    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr style="width: 100%">
            <th class="span1" style="width: 5%">奖励类型</th>
            <th class="span1" style="width: 12%">区域</th>
            <th class="span1" style="width: 38%">时间限制</th>
            <th class="span1" style="width: 20%" >完成梯度</th>
            <th class="span1" style="width: 20%">奖励梯度</th>
            <th class="span1" style="width: 5%">查看</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${list}" var="item" varStatus="status">
            <tr style="width: 100%">
                <td style="width: 5%">
                    <c:if test="${item.ruleType=='0'}">
                        日奖励
                    </c:if>
                    <c:if test="${item.ruleType=='1'}">
                        周奖励
                    </c:if>
                </td>
                <td style="width: 12%">${item.provinceName} ${item.cityName}</td>
                <td style="width: 38%">${item.timeLimitStrShow}</td>
                <td style="width: 20%">${item.satisfyNumStr}</td>
                <td style="width: 20%">${item.rewardStr}</td>
                <td style="width: 5%"><a href="${ctx}/wenwen/riderTaskReward/view?id=${item.id}">查看</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    </tbody>
</table>
</body>
</html>
