<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html style="overflow-x:hidden;overflow-y:auto;">
<head>
    <title>图标选择</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
    <style type="text/css">
		.the-icons {padding:25px 10px 15px;list-style:none;}
		.the-icons li {float:left;width:22%;line-height:25px;margin:2px 5px;cursor:pointer;}
		.the-icons i {margin:1px 5px;} .the-icons li:hover {background-color:#efefef;}
        .the-icons li.active {background-color:#0088CC;color:#ffffff;}
    </style>
    <script type="text/javascript">
        var selectedAccount = {};
        $(document).ready(function(){

            $("input:radio").change(function(){

                var checked = $("input:radio:checked");

                selectedAccount.accountId = checked.val();
                selectedAccount.accountName = checked.attr("accountName");
                selectedAccount.accountPhone = checked.attr("accountPhone");

	    	});
	    });

        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").attr("action","${ctx}/tbbaccount/withdraw/accountinfo/list");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="form" action="${ctx}/tbbaccount/withdraw/accountinfo/list" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
    <div>
        <label>姓名： </label>
        <form:input path="name" type="text" maxlength="50" class="input-small"  />
        <label>手机： </label>
        <form:input path="phone" type="text" maxlength="11" class="input-small"  />

        &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="搜索" onclick="return page();"/>
    </div>
</form:form>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead><tr><th align="center">选择</th><th>姓名</th><th>手机号</th></tr></thead>
    <tbody>
    <c:forEach items="${page.list}" var="info">
        <tr>
            <td><div align="center"><input type="radio" name="accountId" value="${info.id}" accountName="${info.name}" accountPhone="${info.phone}"></div></td>
            <td>${info.name}</td>
            <td>${info.phone}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</body>
</html>