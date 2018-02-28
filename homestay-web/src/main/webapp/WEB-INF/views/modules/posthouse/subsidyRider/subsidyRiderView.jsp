<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/7/10
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>骑手补贴</title>
    <meta name="decorator" content="default"/>
    <%--<script type="text/javascript">
        var blockNum = 10;
        $(document).ready(function(){
            var parentDom = $('#father');
            var oriDom = parentDom.children(":first");
            $('.btnAdd').click(function(){
                var clLength = parentDom.children().length;
                if(blockNum>clLength){
                    var nowDom = oriDom.clone();

                    parentDom.append(nowDom);
                }else{
                    return false;
                }
            });
        });
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#switchClose").click(function() {
                $("#content").hide();
                window.location.href = "${ctx}/wenwen/subsidyRider/view?flag=close&orderType=postOrder";
            });
            $("#switchOpen").click(function() {
                $("#content").show();
                window.location.href = "${ctx}/wenwen/subsidyRider/view?flag=open&orderType=postOrder";
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
<h4>
    骑手补贴开关:
    <input id="switchClose" class="btn btn-primary" type="button" value="关闭"/>
    <input id="switchOpen" class="btn btn-primary" type="button" disabled value="开启"/>
</h4>
<br/>
<div id="content">
<ul class="nav nav-tabs">
    <li class="active"><a >骑手补贴设置记录</a></li>
    <shiro:hasPermission name="ww:subsidyRider:view">
        <li><a href="${ctx}/wenwen/subsidyRider/form?orderType=postOrder">添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/subsidyRider/view" method="post" class="breadcrumb form-search">
    <input id="orderType" name="orderType" type="hidden" value="${orderType}"/>
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <div class="row">
        <label>所属城市：</label>
        <form:select path="cityCode" class="input-small select_changeAndSubmit">
            <form:option value="" label="-请选择-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('city_name')}" htmlEscape="false"/>
        </form:select>
        &nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </div>
</form:form>
<tags:message content="${message}"/>
<div style="width: 100%;overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
            <th  class="span1" >补贴开始星期</th>
            <th  class="span1" >补贴结束星期</th>
            <th  class="span1" >开始时间(时/分)</th>
            <th  class="span1" >结束时间(时/分)</th>
            <th  class="span1" >补贴城市</th>
            <th  class="span1" >补贴区域</th>
            <th  class="span1" >补贴金额(元)</th>
            <th  class="span1" >操作</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <%--<td><a href="${ctx}/wenwen/carInfo/form?id=${entity.id}">${entity.name}</a></td>--%>
                <td>${fns:getDictLabel(entity.subsidyWeekStart, 'week', entity.subsidyWeekStart)}</td>
                <td>${fns:getDictLabel(entity.subsidyWeekEnd, 'week', entity.subsidyWeekEnd)}</td>
                <td>${entity.subsidyTimeStart}</td>
                <td>${entity.subsidyTimeEnd}</td>
                <td>${entity.cityCode}</td>
                <td>${entity.areaCode}</td>
                <td>${entity.subsidyAmount}</td>
                <td>
                    <shiro:hasPermission name="ww:subsidyRider:view">
                        <a href="${ctx}/wenwen/subsidyRider/form?id=${entity.id}&orderType=${entity.orderType}">编辑</a>
                    </shiro:hasPermission>
                    <shiro:hasPermission name="ww:subsidyRider:delete">
                        <a href="${ctx}/wenwen/subsidyRider/delete?id=${entity.id}&orderType=${entity.orderType}">删除</a>
                    </shiro:hasPermission>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="pagination">${page}</div>
</div>
</body>
</html>
