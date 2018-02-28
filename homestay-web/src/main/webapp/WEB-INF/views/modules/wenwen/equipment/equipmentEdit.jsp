<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>设备信息编辑</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/equipment/list">所有记录</a></li>
    <li class="active"><a href="">编辑设备信息</a></li>
</ul>
<br/>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/equipment/save" method="post"
           class="form-horizontal">
    <input id="flag" name="flag" type="hidden" value="${flag}"/>

    <tags:message content="${message}"/>
    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">智能硬件名称:</label>

                <div class="controls">
                    <form:input path="name" htmlEscape="false" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">所属门店:</label>

                <div class="controls">
                    <form:select path="store.storeId" htmlEscape="false" class="required">
                        <form:options itemValue="value" itemLabel="label"
                                      items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}"/>
                    </form:select>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">传感器ID:</label>

                <div class="controls">
                    <c:if test="${flag eq 'edit' }">
                        ${entity.id}
                        <input id="id" name="id" type="hidden" value="${entity.id}"/>
                    </c:if>
                    <c:if test="${'add' eq flag }">
                        <form:input path="id" htmlEscape="false"/>
                    </c:if>
                </div>
            </div>
        </div>
    </div>


    <div class="form-actions">
        <input id="btnAppoint" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
