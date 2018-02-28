<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>揽件任务</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$(".select_changeAndSubmit").change(function(){
                $("#searchForm").submit();
            });
			
			$("#button_checkAll").change(function(){
				if($(this).attr("checked")){ 
					$('input[class="checkbox_taskId"]').attr("checked","true"); 
				} else { 
					$('input[class="checkbox_taskId"]').removeAttr("checked"); 
				} 

            });

			//任务中心分配任务到门店
			$(".allotButton").click(function(){
				var taskIds = $(this).attr("taskId");
				allot(taskIds);
            });

			//任务中心批量分配任务到门店
			$("#batchAllotButton").click(function(){
				var taskIds = "";
				$('input[class="checkbox_taskId"]:checked').each(function(){
					taskIds = taskIds + $(this).attr("taskId") + ",";
				});
				if(taskIds){
					allot(taskIds);
				}else{
					top.$.jBox.tip("请选择需要操作的 记录", 'info');
					
				}
            });

			//门店指派任务到快递员
			$(".assignButton").click(function(){
				var taskIds = $(this).attr("taskId");
				assign(taskIds);
            });
			
			//门店批量指派任务到快递员
			$("#batchAssignButton").click(function(){
				var taskIds = "";
				$('input[class="checkbox_taskId"]:checked').each(function(){
					taskIds = taskIds + $(this).attr("taskId") + ",";
				});
				if(taskIds){
					assign(taskIds);
				}else{
					top.$.jBox.tip("请选择需要操作的 记录", 'info');
					
				}
            });
			
			//任务中心取消任务
			$(".cancelButton").click(function(){
				if(confirm("确认取消该任务吗？")){
					var taskId = $(this).attr("taskId");
	                window.location.href="${ctx}/wenwen/task/lanjian/cancel?taskIds="+taskId;
				}
            });
			
			//门店退回任务 需任务中心重新分配
			$(".reallotButton").click(function(){
				if(confirm("确认退回该任务吗？")){
					var taskId = $(this).attr("taskId");
	                window.location.href="${ctx}/wenwen/task/lanjian/reallot?taskIds="+taskId;
				}
            });

		});
		
		function allot(taskIds){
			top.$.jBox.open("iframe:${ctx}/wenwen/tag/storeList?", "选择分配门店",250,300,{
                buttons:{"确定":"ok", "关闭":true}, bottomText:"",submit:function(v, h, f){
                    var storeId = h.find("iframe")[0].contentWindow.dataId;
                    if (v=="ok"){
                        if(!storeId){
                            top.$.jBox.tip("未选择门店", 'info');
                            return false;
                        };
                        window.location.href="${ctx}/wenwen/task/lanjian/allot?taskIds="+taskIds+"&storeId="+storeId;
                    }
                }, loaded:function(h){
                    $(".jbox-content", top.document).css("overflow-y","hidden");
                }
            });
        }

		function assign(taskIds){
			top.$.jBox.open("iframe:${ctx}/wenwen/tag/employeeList?", "选择快递员",250,300,{
                buttons:{"确定":"ok", "关闭":true}, bottomText:"",submit:function(v, h, f){
                    var employeeId = h.find("iframe")[0].contentWindow.dataId;
                    if (v=="ok"){
                        if(!employeeId){
                            top.$.jBox.tip("未选择快递员", 'info');
                            return false;
                        };
                        window.location.href="${ctx}/wenwen/task/lanjian/assign?taskIds="+taskIds+"&employeeId="+employeeId;
                    }
                }, loaded:function(h){
                    $(".jbox-content", top.document).css("overflow-y","hidden");
                }
            });
        }
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/wenwen/task/lanjian/list">所有记录</a></li>
	</ul>

	<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/task/lanjian/list" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<label>门店 ：</label>
        <form:select path="belongStore.storeId" class="select_changeAndSubmit">
        	<form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
        </form:select>
	        
		<label>手机号：</label><form:input path="senderPhone" htmlEscape="false" maxlength="12" class="input-small"/>
		
		<label>状态 ：</label>
        <form:select path="taskStatus" class="input-small select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('task_status')}" htmlEscape="false"/>
        </form:select>
        
        <label>申请时间：</label><input name="createDate" id="beginDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}'});"/>
	        - <input name="updateDate" id="endDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}'});"/>
        
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>
		
		<shiro:hasPermission name="ww:task:lanjian:allot">
			<c:if test="${entity.taskStatus eq 'INIT' || entity.taskStatus eq 'REALLOT'}">
				<input id="batchAllotButton" class="btn btn-primary" type="button" value="批量分配"/>
			</c:if>
		</shiro:hasPermission>
		
		<shiro:hasPermission name="ww:task:lanjian:assign">
			<c:if test="${entity.taskStatus eq 'ALLOTED' || entity.taskStatus eq 'ASSIGNED'}">
				<input id="batchAssignButton" class="btn btn-primary" type="button" value="批量指派"/>
			</c:if>
		</shiro:hasPermission>
		
	</form:form>
	
	<tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th  class="span1" ><input id="button_checkAll" type="checkbox"/></th>
		<th  class="span1" >寄件人</th>
		<th  class="span1" >寄件人手机</th>
		<th  class="span2" >寄件人地址</th>
 		<th  class="span1" >收件人</th>
		<th  class="span1" >收件人手机</th>
		<th  class="span2" >收件人地址</th>
		<th  class="span1" >寄件类型</th>
<!-- 		<th  class="span1" >重量</th> -->
		<th  class="span1" >备注</th>
		<th  class="span1" >运费</th>
		<th  class="span1" >保价</th>
        <th  class="span1" >申请时间</th>
		<th  class="span1" >任务状态</th>
<!-- 		<th  class="span1" >快递公司</th> -->
<!-- 		<th  class="span2" >运单号</th> -->
<!-- 		<th  class="span1" >运单状态</th> -->
<!-- 		<th  class="span2" >入库时间</th> -->
<!-- 		<th  class="span1" >付款方式</th> -->
<!--         <th  class="span2" >付款信息</th> -->
		<th  class="span1" >所属门店</th>
		<th  class="span1" >取件员</th>
		<th  class="span1" >操作</th>
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="task">
			<tr>
				<td><input class="checkbox_taskId" taskId="${task.id}" type="checkbox"/></td>
				<td>${task.senderName}</td>
				<td>${task.senderPhone}</td>
				<td>${task.senderPcdName} ${task.senderAddress}</td>
 				<td>${task.receiverName}</td>
				<td>${task.receiverPhone}</td>
 				<td>${task.receiverPcdName} ${task.receiverAddress}</td>
				<%--<td>${task.receiverPcdName}</td>--%>
				<td>${task.shipment}</td>
<%-- 				<td>${task.weight}</td> --%>
				<td>${task.remark}</td>
				<td>${task.payFreight}</td>
				<td><c:if test="${task.insureFlag eq true}">是</c:if></td>
				<td><fmt:formatDate value="${task.createDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
				<td>${fns:getDictLabel(task.taskStatus, 'task_status', '')}</td>
<%-- 				<td>${task.expressCompany.companyName}</td> --%>
<%-- 				<td>${task.waybillNo}</td> --%>
<%-- 				<td>${fns:getDictLabel(task.waybillStatus, 'waybill_status', '')}</td> --%>
<%-- 				<td><fmt:formatDate value="${task.inTime}" pattern="yyyy-MM-dd HH:mm" type="date"/></td> --%>
<%-- 				<td>${task.payMethod}</td> --%>
<%-- 				<td>${task.payStatus} ${task.payType} ${task.payTime}</td> --%>
				<td>${task.belongStore.storeName}</td>
				<td>${task.inOperator.name}</td>
				<td>
					<shiro:hasPermission name="ww:task:lanjian:allot">
						<c:if test="${task.taskStatus eq 'INIT' || task.taskStatus eq 'REALLOT'}">
							<a href="#" class="allotButton" taskId="${task.id}">分配</a>
						</c:if>
						<c:if test="${task.taskStatus eq 'INIT' || task.taskStatus eq 'REALLOT' || task.taskStatus eq 'ALLOTED' || task.taskStatus eq 'ASSIGNED'}">
							<a href="#" class="cancelButton" taskId="${task.id}">关闭</a>
						</c:if>
					</shiro:hasPermission>
					<shiro:hasPermission name="ww:task:lanjian:assign">
						<c:if test="${task.taskStatus eq 'ALLOTED' || task.taskStatus eq 'ASSIGNED'}">
							<a href="#" class="assignButton" taskId="${task.id}">指派</a>
							<a href="#" class="reallotButton" taskId="${task.id}">退回</a>
						</c:if>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
	<div class="pagination">${page}</div>
</body>
</html>
