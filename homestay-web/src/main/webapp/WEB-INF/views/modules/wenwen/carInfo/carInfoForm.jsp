<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/5/31
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>车辆信息管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#name").focus();
            $("#inputForm").validate({
                rules:{
                    sort: { number:true, maxlength:10 }
                },
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
    <ul class="nav nav-tabs">
        <li><a href="${ctx}/wenwen/carInfo/list">所有记录</a></li>
        <li class="active"><a href="#">模版详情</a></li>
    </ul><br/>

    <form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/carInfo/save" method="post" enctype="multipart/form-data" class="form-horizontal">
        <form:hidden path="id"/>
        <tags:message content="${message}"/>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">名称:</label>
                    <div class="controls">
                        <form:input path="name" htmlEscape="false" maxlength="10" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">类型:</label>
                    <div class="controls">
                        <form:select path="carType" class="required">
                            <form:options items="${fns:getDictList('car_type')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                        </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">起步价:</label>
                    <div class="controls">
                        <form:input path="startPrice" htmlEscape="false" maxlength="20" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">起步公里:</label>
                    <div class="controls">
                        <form:input path="startDistance" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">超出范围每公里价格:</label>
                    <div class="controls">
                        <form:input path="beyondPrice" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">最大载重:</label>
                    <div class="controls">
                        <form:input path="maxLoad" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">长:</label>
                    <div class="controls">
                        <form:input path="volumeLong" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">宽:</label>
                    <div class="controls">
                        <form:input path="volumeWidth" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">高:</label>
                    <div class="controls">
                        <form:input path="volumeHeight" htmlEscape="false" maxlength="5" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">车辆描述:</label>
                    <div class="controls">
                        <form:input path="description" htmlEscape="false" maxlength="50" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">排序:</label>
                    <div class="controls">
                        <form:input path="order" htmlEscape="false" maxlength="5" class="required" />
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="row">
            <div class="span6">--%>
                <div class="control-group">
                    <label class="control-label">图片:</label>
                    <div class="controls">
                        <form:hidden path="iconUrl" htmlEscape="false" maxlength="255" class="input-xlarge"/>
                        <%--<input type="hidden" id="iconUrl" limit="10" name="iconUrl" value="${entity.iconUrl}" />--%>
                        <tags:uploadpicture input="iconUrl" type="images"/>
                        <%--------------------------------------------------------------%>
                        <%--<input type="file" name="iconFile"/>--%>
                    </div>
                </div>
          <%--  </div>
        </div>--%>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
            <input class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
    </form:form>
</body>
</html>
