<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>商家类型</title>
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

        $(document).ready(function () {
            $(".select_changeAndSubmit").change(function () {
                $("#searchForm").submit();
            });
        });
    </script>
</head>

<body>
<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/merchant/type/list" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

<%--    <div class="row">
        <label>商家类型名称 ：</label>
        <form:select path="merchanTypeList" class="input-small select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${entity}" htmlEscape="false"/>
        </form:select>
    </div>--%>
    <tags:message content="${message}"/>
    <div style="width:100%; overflow: auto">
        <table id="contentTable" style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
            <thead>
            <tr>
                <th class="span1">商家类型编号</th>
                <th class="span1">商家类型名称</th>
                <th class="span1">说明</th>
                <th class="span1">关联定价模板</th>
                <th class="span1">佣金比例</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${entity}" var="entity">
                <tr>
                    <td><a href="${ctx}/wenwen/merchant/type/view/?id=${entity.id}">${entity.id}</a></td>
                    <td>${entity.name}</td>
                    <td>${entity.describtion}</td>
                    <td><a href="${ctx}/wenwen/merchant/deliverFee/tem/form/?id=${entity.temId}">${entity.temName}</a></td>
                    <td>${entity.commissionRate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="form-actions" align="center" id="div1">
        <a href="${ctx}/wenwen/merchant/type/view">新增商家类型</a>
    </div>
</form:form>


</body>
</html>