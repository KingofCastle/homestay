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
    <script type="text/javascript">
        $(document).ready(function () {
            $("#switchClose").click(function() {
                $("#content").hide();
                window.location.href = "${ctx}/wenwen/subsidyRider/view?flag=close&orderType=crowdOrder";
            });
            $("#switchOpen").click(function() {
                $("#content").show();
                window.location.href = "${ctx}/wenwen/subsidyRider/view?flag=open&orderType=crowdOrder";
            });
        });
    </script>
</head>
<body>
<input id="orderType" name="orderType" type="hidden" value="${orderType}"/>
<h4>
    骑手补贴开关:
    <input id="switchClose" class="btn btn-primary" type="button" disabled value="关闭"/>
    <input id="switchOpen" class="btn btn-primary" type="button" value="开启"/>
</h4>
<br/>
</body>
</html>
