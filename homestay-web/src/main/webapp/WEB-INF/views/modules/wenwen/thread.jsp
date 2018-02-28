<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>线程管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
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
	</ul>
<tags:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th  class="span1" >后台守护线程</th>
        <th  class="span1" >状态</th>
        <th  class="span1" >操作</th>
        </tr></thead>
        <tbody>
            <tr>
                <td>保存运单</td>
                <td>${waybill}</td>
                <td>
	                <c:choose>
	                    <c:when test="${waybill}">
	                       <a href="${ctx}/wenwen/thread/update?thread=waybill&action=stop" onclick="return confirmx('确认要关闭吗？', this.href)">关闭</a>
	                    </c:when>
	                    <c:otherwise>
	                       <a href="${ctx}/wenwen/thread/update?thread=waybill&action=start" onclick="return confirmx('确认要开启吗？', this.href)">开启</a>
	                    </c:otherwise>
	                </c:choose>
                </td>
            </tr>
<!--             <tr> -->
<!--                 <td>发送短信</td> -->
<%--                 <td>${sms}</td> --%>
<!--                 <td> -->
<%--                     <c:choose> --%>
<%--                         <c:when test="${sms}"> --%>
<%--                            <a href="${ctx}/wenwen/thread/update?thread=sms&action=stop" onclick="return confirmx('确认要关闭吗？', this.href)">关闭</a> --%>
<%--                         </c:when> --%>
<%--                         <c:otherwise> --%>
<%--                            <a href="${ctx}/wenwen/thread/update?thread=sms&action=start" onclick="return confirmx('确认要开启吗？', this.href)">开启</a> --%>
<%--                         </c:otherwise> --%>
<%--                     </c:choose> --%>
<!--                 </td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                 <td>微信推送</td> -->
<%--                 <td>${wechat}</td> --%>
<!--                 <td> -->
<%--                     <c:choose> --%>
<%--                         <c:when test="${wechat}"> --%>
<%--                            <a href="${ctx}/wenwen/thread/update?thread=wechat&action=stop" onclick="return confirmx('确认要关闭吗？', this.href)">关闭</a> --%>
<%--                         </c:when> --%>
<%--                         <c:otherwise> --%>
<%--                            <a href="${ctx}/wenwen/thread/update?thread=wechat&action=start" onclick="return confirmx('确认要开启吗？', this.href)">开启</a> --%>
<%--                         </c:otherwise> --%>
<%--                     </c:choose> --%>
<!--                 </td> -->
<!--             </tr> -->
        </tbody>
    </table>
    <br>

    待处理运单数：${uploadWayBill} <a href="${ctx}/wenwen/thread/rePush">推送</a>
</body>
</html>
