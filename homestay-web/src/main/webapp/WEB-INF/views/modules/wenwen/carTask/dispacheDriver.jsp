<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>分配司机</title>
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
    <li class="active"><a href="${ctx}/wenwen/car/task/list">所有记录</a></li>
</ul>
<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/car/task/dispacheDriver?orderNo=${orderNo}" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="pageSize" name="senderLongitude" type="hidden" value="${senderLongitude}"/>
    <input id="pageSize" name="senderLatitude" type="hidden" value="${senderLatitude}"/>


    <label>司机名称：</label><form:input path="realName" htmlEscape="false" maxlength="20" class="input-small"/>
    <label>车牌：</label><form:input path="carNumber" htmlEscape="false" maxlength="11" class="input-small"/>
    <%--<label>车辆类型：</label>
    <form:select path="carType" class="input-small select_changeAndSubmit">
        <form:option value="" label="-全部-"/>

        <form:options itemValue="value" itemLabel="label" items="${types}"
                      htmlEscape="false" />


    </form:select>--%>

<%--    <label>司机状态 ：</label>
    <form:select path="driverStatus" class="input-small select_changeAndSubmit">
        <form:option value="" label="-全部-"/>
        <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('driver_is_free')}"
                      htmlEscape="false"/>
    </form:select>--%>



    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>


</form:form>

<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="span2">司机名称</th>
            <th class="span1">车牌</th>
            <th class="span1">车辆类型</th>
            <th class="span1">司机状态</th>
            <th class="span1">司机距离取货地</th>
            <th class="span1">操作</th>



            <%--<th class="span1">配送距离</th>--%>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.list}" var="task">
            <form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/car/task/sendOrder?orderNo=${orderNo}" method="post"
                       class="breadcrumb form-search">
            <tr>

                <input id="riderId" name="riderId" type="hidden" value="${task.userId}"/>
                <input id="riderPhone" name="riderPhone" type="hidden" value="${task.phone}"/>
                <input id="riderName" name="riderName" type="hidden" value="${task.realName}"/>
                <input id="riderCarNo" name="riderCarNo" type="hidden" value="${task.carNumber}"/>
                <input id="riderCarType" name="riderCarType" type="hidden" value="${task.carType}"/>
                <input id="puckupDistance" name="puckupDistance" type="hidden" value="${task.pickupDistance}"/>
                <td>${task.realName}</td>
                <td>${task.carNumber}</td>
                <td>${fns:getDictLabel(task.carType, 'car_type', '')}</td>
<%--
                <td>${task.tipFee}</td>
--%>

                <td>${fns:getDictLabel(task.free, 'driver_is_free', '')}</td>

                <td>${task.pickupDistance}米 </td>
                <%-- <td><input type="button" name="Submit" value="选择" class="btn" onclick="location.href='${ctx}/wenwen/car/task/sendOrder?realName=${task.realName}&idCardNo=${task.idCardNo}&carType=${task.carType}&orderNo=${orderNo}&userId=${task.userId}&phone=${task.phone}'" />
                 </td>--%>
                 <td><input type="submit" name="Submit" value="选择" class="btn"  />
                 </td>

             </tr>

             </form:form>
         </c:forEach>
         </tbody>
     </table>
 </div>

 <%--<div class="pagination">${page}</div>--%>
</body>
</html>
