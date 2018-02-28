<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户端版本编辑</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
            $("#android_apk").hide();
            $("#ios_url").hide();
            $("#bundle_file").hide();
            
            $("#appType").change(function(){
                if($(this).val() == "ios"){
                	$("#android_apk").hide();
                    $("#ios_url").show();
                    $("#bundle_file").show();
                }else if($(this).val() == "android"){
                	$("#android_apk").show();
                    $("#ios_url").hide();
                    $("#bundle_file").show();
                }else{
                	$("#android_apk").hide();
                    $("#ios_url").hide();
                    $("#bundle_file").hide();
                }
            });
			
            $("#inputForm").validate({
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
		<li><a href="${ctx}/wenwen/appVersion/list">所有记录</a></li>
		<li class="active"><a href="#">新增</a></li>
	</ul><br/>


	<form:form id="inputForm" modelAttribute="version" action="${ctx}/wenwen/appVersion/save" method="post" enctype="multipart/form-data" class="form-horizontal">
        <form:hidden path="id"/>
        <tags:message content="${message}"/>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">app名称:</label>
                    <div class="controls">
                        <form:select path="appName" class="required">
                            <form:options items="${fns:getDictList('app_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                        </form:select>
<%--                         <form:input path="name" readonly="${empty smsModel.id?false:true}" htmlEscape="false" maxlength="50" class="required" value=""/> --%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">app类型:</label>
                    <div class="controls">
	                    <form:select path="appType" class="required">
	                        <form:option value="">-请选择-</form:option>
	                        <form:options items="${fns:getDictList('app_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
	                    </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">version:</label>
                    <div class="controls">
                        <form:input path="version" class="required" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">minVersion:</label>
                    <div class="controls">
                        <form:input path="minVersion" class="required" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">jsVersion:</label>
                    <div class="controls">
                        <form:input path="jsVersion" class="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">supportMinVersion:</label>
                    <div class="controls">
                        <form:input path="supportMinVersion" class="" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="ios_url">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">ios_url:</label>
                    <div class="controls">
                        <form:input path="url" class="required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="android_apk">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">android_apk:</label>
                    <div class="controls">
                        <input type="file" name="androidApk" />
                        <%--<input type="file" name="androidApk" class="required"/>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="bundle_file">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">bundle_file:</label>
                    <div class="controls">
                        <input type="file" name="bundleFile"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">md5:</label>
                    <div class="controls">
                        <form:input path="md5" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span6">
                <div class="control-group">
                    <label class="control-label">版本描述:</label>
                    <div class="controls">
                        <form:textarea path="description" rows="5" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
            <input class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>
    </form:form>
</body>
</html>
