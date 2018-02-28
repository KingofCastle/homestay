<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>定价模板</title>
    <meta name="decorator" content="default"/>

    <script type="text/javascript">
        $("#Submit").click(function () {
            $("#inputForm").submit();
        });
        $("#inputForm").validate({
            submitHandler: function (form) {
                loading('正在提交，请稍等...');
                form.submit();
            },
            errorContainer: "#messageBox",
            errorPlacement: function (error, element) {
                $("#messageBox").text("输入有误，请先更正。");
                if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                    error.appendTo(element.parent().parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });
    </script>
</head>

<body>
<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/merchant/deliverFee/tem/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <tags:message content="${message}"/>
    <div style="width:100%; overflow: auto">
        <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>
                <th class="span1">模板编号</th>
                <th class="span1">模板名称</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${entity}" var="entity">
                <tr>
                    <td><a href="${ctx}/wenwen/merchant/deliverFee/tem/form?id=${entity.id}">${entity.id}</a></td>
                    <td>${entity.name}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="form-actions" align="center" id="div1">
        <a href="${ctx}/wenwen/merchant/deliverFee/tem/form">新增定价模板</a>
    </div>

</form:form>
</body>

</html>