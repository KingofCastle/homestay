<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>阿里短信模版</title>
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
        <li class="active"><a>所有记录</a></li>
        <shiro:hasPermission name="ww:aliSmsTemplate:edit">
	        <li><a href="${ctx}/wenwen/aliSmsTemplate/form">新增</a></li>
        </shiro:hasPermission>
    </ul>
    <form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/aliSmsTemplate/list" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <label>类型 ：</label>
        <form:select path="smsType" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('sms_type')}" htmlEscape="false"/>
        </form:select>
       &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
    </form:form>
    <tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th  class="span1" >名称</th>
        <th  class="span1" >类型</th>
        <th  class="span1" >阿里模版id</th>
        <th  class="span1" >阿里模版签名</th>
        <th  class="span3" >内容</th>
        <th  class="span1" >生成时间</th>
        <th  class="span1" >更新时间</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <td>${entity.name}</td>
                <td>${fns:getDictLabel(entity.smsType, 'sms_type', entity.smsType)}</td>
                <td><a href="${ctx}/wenwen/aliSmsTemplate/form?id=${entity.id}">${entity.aliSmsId}</a></td>
                <td>${entity.aliSignName}</td>
                <td>${entity.content}</td>
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
