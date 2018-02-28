<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>微信用户</title>
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
        <li><a href="${ctx}/wenwen/userInfo/riderUserList">骑手用户</a></li>
        <li><a href="${ctx}/wenwen/userInfo/merchantUserList">商家用户</a></li>
        <li><a href="${ctx}/wenwen/userInfo/driverUserList">司机用户</a></li>
        <li class="active"><a href="${ctx}/wenwen/userInfo/wxUserList">微信用户</a></li>
    </ul>
    <form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/userInfo/wxUserList" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        
        <div class="row">
	        <label>手机：</label><form:input path="phone" htmlEscape="false" maxlength="11" class="input-small"/>
	        <label>openId：</label><form:input path="openId" htmlEscape="false" maxlength="40" />
            <label>授权时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
	                
	        &nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
        </div>

    </form:form>
    
    <tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th class="span2">openId</th>
        <th class="span1">userId</th>
        <th class="span1"  style="width: 90px">account</th>
        <th class="span1"  style="width: 80px">手机</th>
        <th class="span2"  style="width: 130px">token</th>
        <th class="span1">昵称</th>
        <th class="span1">头像</th>
        <th class="span1">性别</th>
        <th class="span1">位置</th>
<!--         <th class="span1">unionid</th> -->
        <th class="span2">注册时间</th>
        <th class="span2">更新时间</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <td>${entity.openId}</td>
                <td>${entity.userId}</td>
                <td>${entity.account}</td>
                <td>${entity.phone}</td>
                <td>${entity.token}</td>
                <td>${entity.nickName}</td>
                <td><a target="_blank" href="${entity.headImgUrl}">查看</a></td>
                <td>${entity.sex}</td>
                <td>${entity.country} ${entity.province} ${entity.city}</td>
<%--                 <td>${entity.unionid}</td> --%>
                <td><fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <td><fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <div class="pagination">${page}</div>
</body>
</html>
