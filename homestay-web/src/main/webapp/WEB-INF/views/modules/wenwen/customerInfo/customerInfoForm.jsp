<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户明细</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			// 初始化省市下拉选
			var pcdJsonList = eval('${fns:queryPcdJson()}');
            addressInit(pcdJsonList, "provinceCode", "cityCode", "areaCode", $("#provinceName").val(), $("#cityName").val(), $("#areaName").val());
			
			$("#provinceCode").change(function(){
				$("#provinceName").val($(this).find("option:selected").text());
			});
			$("#cityCode").change(function(){
				$("#cityName").val($(this).find("option:selected").text());
			});
			$("#areaCode").change(function(){
				$("#areaName").val($(this).find("option:selected").text());
			});
			
			$("#waybillNo").focus();
			
			$("#waybillNo").blur(function(){
				var waybillNo = $(this).val();
				if(waybillNo){
					$.ajax({
					    url:'${ctx}/wenwen/customerInfo/queryPhoneByWaybillNo',
					    type:'POST', //GET
					    async:false,    //或false,是否异步
					    data:{
					    	waybillNo:waybillNo
					    },
					    dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/
					    success:function(data){
					    	if(data == "customerInfo_exist"){
					    		alert("门店已录入该手机的用户信息，如需修改请从列表页进入");
					    		$("#waybillNo").val('');
					    		$("#waybillNo").focus();
					    	}else if(data == "no_waybillInfo"){
					    		alert("运单号不存在");
					    		$("#waybillNo").val('');
					    		$("#waybillNo").focus();
					    	}else{
					    		$("#phone").val(data);
					    		$("#name").focus();
					    	}
					    }
					});
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
		<li><a href="${ctx}/wenwen/customerInfo/list">所有记录</a></li>
		<li class="active"><a href="#">用户详情</a></li>
	</ul><br/>

	<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/customerInfo/save" method="post" class="form-horizontal">
		<form:hidden id="id" path="id"/>
		
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
                    <label class="control-label">录入人:</label>
                    <div class="controls">
                        <form:select path="operatorId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" />
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">运单号:</label>
                    <div class="controls">
                        <input type="text" id="waybillNo" maxlength="20"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">联系电话:</label>
                    <div class="controls">
                        <form:input path="phone" htmlEscape="false" maxlength="12" class="form_input required phone"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">姓名:</label>
                    <div class="controls">
                        <form:input path="name" htmlEscape="false" maxlength="20" class="form_input required"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">省:</label>
                    <div class="controls">
                        <form:select path="provinceCode" class="required"></form:select>
				        <form:hidden path="provinceName"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">市:</label>
                    <div class="controls">
                        <form:select path="cityCode" class="required"></form:select>
                        <form:hidden path="cityName"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">区:</label>
                    <div class="controls">
                        <form:select path="areaCode" class="required"></form:select>
                        <form:hidden path="areaName"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span20">
                <div class="control-group">
                    <label class="control-label">详细地址:</label>
                    <div class="controls">
                        <form:textarea row="3" path="detailAddress" htmlEscape="false" maxlength="50" class="required"/>
                    </div>
                </div>
            </div>
        </div>

		<div class="form-actions">
			<shiro:hasPermission name="ww:customerInfo:edit">
		      	<input class="btn btn-primary" type="submit" value="保存"/> &nbsp;&nbsp;
			</shiro:hasPermission>
			<input class="btn btn-primary" type="button" value="返 回" onclick="window.location.href='${ctx}/wenwen/customerInfo/list'"/>
		</div>
	</form:form>
</body>
</html>
