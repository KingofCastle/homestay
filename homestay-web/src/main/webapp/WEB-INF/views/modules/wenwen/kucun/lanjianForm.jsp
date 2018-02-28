<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收件明细</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {

            document.getElementById("waybillNo").focus();

            // 初始化省市下拉选
			var pcdJsonList = eval('${fns:queryPcdJson()}');
            addressInit(pcdJsonList, "receiverProvinceCode", "receiverCityCode", "", "", "", "");
			
			$("#receiverProvinceCode").change(function(){
				$("#receiverProvinceName").val($(this).find("option:selected").text());
			});
			$("#receiverCityCode").change(function(){
				$("#receiverCityName").val($(this).find("option:selected").text());
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
		<li><a href="${ctx}/wenwen/kucun/lanjian/list">所有记录</a></li>
		<li class="active"><a href="#">新增</a></li>
	</ul><br/>

	<form:form id="inputForm" modelAttribute="waybill" action="${ctx}/wenwen/kucun/lanjian/save" method="post" class="form-horizontal">
		<form:hidden id="waybillId" path="id"/>
		<form:hidden id="waybillStatus" path="waybillStatus"/>
		
		<tags:message content="${message}"/>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">门店:</label>
                    <div class="controls">
                        <form:select path="belongStore.storeId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}"/>
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">录入人:</label>
                    <div class="controls">
                        <form:select path="inOperator.id" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" />
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">快递公司:</label>
                    <div class="controls">
                        <form:select path="expressCompany.companyId" htmlEscape="false" class="required">
			                <form:options itemValue="value" itemLabel="label" items="${fns:queryExpressCompanyListByStoreId(fns:getUser().office.id)}" />
			            </form:select>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">运单号:</label>
                    <div class="controls">
                        <form:input path="waybillNo" id="waybillNo" htmlEscape="false" maxlength="20" class="required waybillNo"/>（必填）
<%--                         <c:choose> --%>
<%--                             <c:when test="${empty waybill.waybillNo}"><form:input path="waybillNo" htmlEscape="false" maxlength="20" class="required"/></c:when> --%>
<%--                             <c:otherwise><form:input path="waybillNo" htmlEscape="false" maxlength="20" class="required" readonly="true"/></c:otherwise> --%>
<%--                         </c:choose> --%>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                 <div class="control-group">
                     <label class="control-label">寄件人:</label>
                     <div class="controls">
                        <form:input path="senderName" htmlEscape="false" maxlength="10" class=""/>
                     </div>
                 </div>
             </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">寄件人电话:</label>
                    <div class="controls">
                        <form:input path="senderPhone" htmlEscape="false" maxlength="15" class="form_input phoneOrTel"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
             <div class="span10">
                 <div class="control-group">
                     <label class="control-label">寄件人地址:</label>
                     <div class="controls">
                         <form:input path="senderAddress"  htmlEscape="false" maxlength="50" class=""/>
                     </div>
                 </div>
             </div>
        </div>
        <div class="row">
         <div class="span10">
             <div class="control-group">
                 <label class="control-label">收件人:</label>
                 <div class="controls">
                     <form:input path="receiverName" htmlEscape="false" maxlength="10" class=""/>
                 </div>
             </div>
         </div>
        </div>
        <div class="row">
         <div class="span10">
             <div class="control-group">
                 <label class="control-label">收件人电话:</label>
                 <div class="controls">
                     <form:input path="receiverPhone" htmlEscape="false" maxlength="15" class=""/>
                 </div>
             </div>
         </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">目的省 :</label>
                    <div class="controls">
                        <form:select id="receiverProvinceCode" path="receiverPcdCode" class="required">
<%--                             <form:options itemValue="value" itemLabel="label" items="${fns:queryAreaList('1')}"/> --%>
                        </form:select>（必填）
                        <form:hidden id="receiverProvinceName" path="receiverPcdName"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">目的市 :</label>
                    <div class="controls">
                        <form:select id="receiverCityCode" path="receiverPcdCode">
                        </form:select>
                        <form:hidden id="receiverCityName" path="receiverPcdName"/>
                    </div>
                </div>
            </div>
        </div>
<!--         <div class="row"> -->
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">目的区 :</label> -->
<!--                     <div class="controls"> -->
<%--                         <form:select id="receiverDistrictCode" path="receiverPcdCode"> --%>
<%--                         </form:select> --%>
<%--                         <form:hidden id="receiverDistrictName" path="receiverPcdName"/> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">收件地址:</label>
                    <div class="controls">
                        <form:input path="receiverAddress" htmlEscape="false" maxlength="50" class=""/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">价格:</label>
                    <div class="controls">
                        <form:input path="payFreight" htmlEscape="false" maxlength="5" class="required number"/>（必填）
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span10">
                <div class="control-group">
                    <label class="control-label">重量:</label>
                    <div class="controls">
                        <form:input path="weight" htmlEscape="false" maxlength="5" class="required number"/>（必填）
                    </div>
                </div>
            </div>
        </div>
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">货款:</label> -->
<!--                     <div class="controls"> -->
<%--                         <form:input path="payment" htmlEscape="false" maxlength="50" class="number" /> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">保价金额:</label> -->
<!--                     <div class="controls"> -->
<%--                         <form:input path="insurePrice" htmlEscape="false" maxlength="50" class="number"/> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

<!--         <div class="row"> -->
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">物品:</label> -->
<!--                     <div class="controls"> -->
<%--                         <form:input path="shipment" htmlEscape="false" maxlength="50" /> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">大小:</label> -->
<!--                     <div class="controls"> -->
<%--                         <form:select path="size"> --%>
<%--                             <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('shipment_size')}" htmlEscape="false"/> --%>
<%--                         </form:select> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">付款方式:</label> -->
<!--                     <div class="controls"> -->
<%--                         <form:select path="paymentMethod"> --%>
<%--                             <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('payment_method')}" htmlEscape="false"/> --%>
<%--                         </form:select> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--             <div class="span10"> -->
<!--                 <div class="control-group"> -->
<!--                     <label class="control-label">备注:</label> -->
<!--                     <div class="controls"> -->
<%--                         <textarea name="remark" rows="3" >${waybill.remark}</textarea> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <%--<div class="row">--%>
        	<%--<div style="padding-left:80px;color:red;" class="control-group">（相关数据会发送短信通知用户，请仔细录入）</div>--%>
        <%--</div>--%>


		<div class="form-actions">
<%-- 		      <c:when test="${waybill.waybillStatus == 0}"> --%>
<!-- 		          <input id="ruku" class="btn btn-primary" type="button" value="入库"/> -->
<%-- 		      </c:when> --%>
<%-- 		      <c:when test="${waybill.waybillStatus == 1}"> --%>
<!-- 		          <input id="chuku" class="btn btn-primary" type="button" value="出库"/> -->
<%-- 		      </c:when> --%>
		      <c:if test="${empty waybill.id}">
			      <input class="btn btn-primary" type="submit" value="入库"/>
		      </c:if>
<%-- 		      <c:if test="${waybill.waybillStatus eq 1}"> --%>
<!--                   <input class="btn btn-primary" type="submit" value="保存"/> -->
<%--               </c:if> --%>
		    &nbsp;&nbsp;
			<input class="btn btn-primary" type="button" value="返 回" onclick="window.location.href='${ctx}/wenwen/kucun/lanjian/list'"/>
		</div>
	</form:form>
</body>
</html>
