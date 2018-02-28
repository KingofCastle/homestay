<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>新增面单</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#div_waybillNoQujian").show();
			$("#div_waybillNoList").hide();
			
			$("#addWay").change(function(){
				if($(this).val() == "qujianAdd"){
					$("#div_waybillNoQujian").show();
					$("#div_waybillNoList").hide();
				}else if($(this).val() == "piliangAdd"){
					$("#div_waybillNoQujian").hide();
					$("#div_waybillNoList").show();
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
		<li><a href="${ctx}/wenwen/waybillInfo/list">所有记录</a></li>
		<li class="active"><a href="#">新增面单</a></li>
	</ul><br/>

	<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/waybillInfo/save" method="post" class="form-horizontal">
		
		<tags:message content="${message}"/>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">门店:</label>
                    <div class="controls">
                        <form:select path="store.storeId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}"/>
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">快递公司:</label>
                    <div class="controls">
                        <form:select path="expressCompany.companyId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryExpressCompanyListByStoreId(fns:getUser().office.id)}"/>
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">添加人:</label>
                    <div class="controls">
                        <form:select path="addManId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" />
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">面单来源:</label>
                    <div class="controls">
                        <form:select path="source" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('waybillInfo_source')}" />
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">面单单价:</label>
                    <div class="controls">
                    	<form:input path="price" htmlEscape="false" maxlength="5" class="required number"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">添加方式:</label>
                    <div class="controls">
                        <select id="addWay">
                        	<option value="qujianAdd">区间添加</option>
                        	<option value="piliangAdd">批量添加</option>
			            </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="div_waybillNoQujian">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">面单区间:</label>
                    <div class="controls">
                    	<form:input path="waybillNoRangeBegin" htmlEscape="false" maxlength="21" class="required waybillNo"/> - 
                    	<form:input path="waybillNoRangeEnd" htmlEscape="false" maxlength="21" class="required waybillNo"/>（一次最多添加500条数据）
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="div_waybillNoList">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">面单单号:</label>
                    <div class="controls">
                    	<textarea id="waybillNoList" name="waybillNoList" rows="10" cols="2" class="required"></textarea>
                    </div>
                </div>
            </div>
        </div>

		<div class="form-actions">
			<shiro:hasPermission name="ww:waybillInfo:edit">
		      	<input class="btn btn-primary" type="submit" value="保存"/> &nbsp;&nbsp;
			</shiro:hasPermission>
			<input class="btn btn-primary" type="button" value="返 回" onclick="window.location.href='${ctx}/wenwen/waybillInfo/list'"/>
		</div>
	</form:form>
</body>
</html>
