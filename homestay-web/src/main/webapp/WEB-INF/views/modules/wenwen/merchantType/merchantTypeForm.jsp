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
    </script>
</head>

<body>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/merchant/type/execute" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="row">
    <div class="span6">
        <div class="control-group">
            商家类型名称:
         <%--   <form:input path="name" htmlEscape="false" maxlength="5" class="required"/>--%>
                  <input id="name" name="name" value="${entity.name}" required="required" type="text" maxlength="10"/>
        </div>
    </div>
</div>
<div class="row">
    <div class="span6">
        <div class="control-group">
            类型说明:
        <input id="describtion" name="describtion"  value="${entity.describtion}" maxlength="100" required="required" type="text"/>
        </div>
    </div>
</div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                关联定价模板:
                <select id="merchantTypeList" name="temId">
                    <c:choose>
                        <c:when test="${entity.name != null}">
                            <c:forEach var="value" items="${merchantDeliverFeeTem}">
                                <c:choose>
                                    <c:when test="${entity.temId == value.id}">
                                        <option value="${value.id}"  selected id="temId" name="temId"><c:out value="${value.name}"/></option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${value.id}"id="temId" name="temId"><c:out value="${value.name}"/></option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="value" items="${merchantDeliverFeeTem}">
                                <option value="${value.id}" id="temId" name="temId"><c:out value="${value.name}"/></option>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span6">
            <div class="control-group">
                佣金比例:
                <input id="commissionRate" name="commissionRate"  value="${entity.commissionRate}"  max="100" min="0" type="number" step="1" required="required" />
            </div>
        </div>
    </div>

<div class="form-actions">
    <input type="submit" name="Submit" value="提交" class="btn"  />
</div>
</form:form>

</body>
</html>