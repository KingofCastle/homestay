<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>面单管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
        	$(".select_changeAndSubmit").change(function(){
        		$("#searchForm").attr("action","${ctx}/wenwen/waybillInfo/list");
                $("#searchForm").submit();
            });
        	
        	$("#allot").click(function(){
        		allot();
            });
        	$("#usable").click(function(){
        		usable();
            });
        	$("#sold").click(function(){
				if(confirm("确定销售所有满足筛选条件的面单？")){
	        		$("#searchForm").attr("action","${ctx}/wenwen/waybillInfo/sold");
                	$("#searchForm").submit();
        		}
            });
        	$("#abandon").click(function(){
        		if(confirm("确定报废所有满足筛选条件的面单？")){
	        		$("#searchForm").attr("action","${ctx}/wenwen/waybillInfo/abandon");
	                $("#searchForm").submit();
        		}
            });
        });
        
        function allot(){
            top.$.jBox.open("iframe:${ctx}/wenwen/tag/storeList", "请选择门店",250,300,{
                buttons:{"确定":"ok", "关闭":true}, bottomText:"",submit:function(v, h, f){
                    var dataId = h.find("iframe")[0].contentWindow.dataId;
                    if (v=="ok"){
                        if(!dataId){
                            top.$.jBox.tip("未选择门店", 'info');
                            return false;
                        };
                        // 执行保存
                        loading('正在提交，请稍等...');
                        
                        $("#storeId").val(dataId);
						$("#searchForm").attr("action","${ctx}/wenwen/waybillInfo/allot");
                        $('#searchForm').submit();
                        return true;
                    }
                }, loaded:function(h){
                    $(".jbox-content", top.document).css("overflow-y","hidden");
                }
            });
        }

        function usable(){
            top.$.jBox.open("iframe:${ctx}/wenwen/tag/employeeList", "请选择员工",250,300,{
                buttons:{"确定":"ok", "关闭":true}, bottomText:"",submit:function(v, h, f){
                    var dataId = h.find("iframe")[0].contentWindow.dataId;
                    if (v=="ok"){
                        if(!dataId){
                            top.$.jBox.tip("未选择员工", 'info');
                            return false;
                        };
                        // 执行保存
                        loading('正在提交，请稍等...');
                        
                        $("#employeeId").val(dataId);
						$("#searchForm").attr("action","${ctx}/wenwen/waybillInfo/usable");
                        $('#searchForm').submit();
                        return true;
                    }
                }, loaded:function(h){
                    $(".jbox-content", top.document).css("overflow-y","hidden");
                }
            });
        }
        
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/wenwen/waybillInfo/list");
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
    <ul class="nav nav-tabs">
        <li class="active"><a href="${ctx}/wenwen/waybillInfo/list">所有记录</a></li>
        <shiro:hasPermission name="ww:waybillInfo:edit">
			<li><a href="${ctx}/wenwen/waybillInfo/form">新增</a></li>
		</shiro:hasPermission>
    </ul>
    <form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/waybillInfo/list" method="post" class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

        <input id="storeId" name="storeId" type="hidden"/>
        <input id="employeeId" name="employeeId" type="hidden"/>
        
        <div class="row">
            <label>门店 ：</label>
            <form:select path="store.storeId" class="select_changeAndSubmit">
                <form:option value="" label="-全部-"/>
                <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            <label>快递公司 ：</label>
            <form:select path="expressCompany.companyId" class="input-small select_changeAndSubmit">
                <form:option value="" label="-全部-"/>
                <form:options itemValue="value" itemLabel="label" items="${fns:queryExpressCompanyListByStoreId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
            <%--<label>面单来源 ：</label>--%>
            <%--<form:select path="source" class="input-small select_changeAndSubmit">--%>
                <%--<form:option value="" label="-全部-"/>--%>
                <%--<form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('waybillInfo_source')}" htmlEscape="false"/>--%>
            <%--</form:select>--%>
            <%--<label>面单状态：</label>--%>
            <%--<form:select path="status" class="input-small select_changeAndSubmit">--%>
                <%--<form:option value="" label="-全部-"/>--%>
                <%--<form:options  itemValue="value" itemLabel="label" items="${fns:getDictList('waybillInfo_status')}" htmlEscape="false"/>--%>
            <%--</form:select>--%>
        </div>
        <div class="row" style="margin-top:8px;">
        	<label>面单号 ：</label><form:input path="waybillNoRangeBegin" htmlEscape="false" maxlength="20" class=""/>
			- <form:input path="waybillNoRangeEnd" htmlEscape="false" maxlength="20" class=""/>
       		<%--<label>领用人 ：</label>--%>
            <%--<form:select path="receiveManId" class="input-small select_changeAndSubmit">--%>
            	<%--<form:option value="" label="-全部-"/>--%>
                <%--<form:options  itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>--%>
            <%--</form:select>--%>
        </div>
        <div class="row" style="margin-top:8px;">
       		<label>添加人 ：</label>
            <form:select path="addManId" class="input-small select_changeAndSubmit">
            	<form:option value="" label="-全部-"/>
                <form:options  itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
            </form:select>
	        <label>添加时间：</label><input name="addDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.addDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
	        - <input name="addEndDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
	                value='<fmt:formatDate value="${entity.addEndDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
        </div>
        <div class="row" style="margin-top:8px;">
       		<%--<label>变更人 ：</label>--%>
            <%--<form:select path="updateManId" class="input-small select_changeAndSubmit">--%>
            	<%--<form:option value="" label="-全部-"/>--%>
                <%--<form:options  itemValue="value" itemLabel="label" items="${fns:queryEmployeeListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>--%>
            <%--</form:select>--%>
	        <%--<label>变更时间：</label><input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"--%>
	                <%--value='<fmt:formatDate value="${entity.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>--%>
	        <%--- <input name=updateEndDate type="text" readonly="readonly" maxlength="20" class="input-small Wdate"--%>
	                <%--value='<fmt:formatDate value="${entity.updateEndDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>--%>

	        &nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>

			<%--<shiro:hasPermission name="ww:waybillInfo:allot">--%>
		        <%--&nbsp;&nbsp;<input id="allot" class="btn btn-primary" type="button" value="调拨"/>--%>
			<%--</shiro:hasPermission>--%>

			<%--<shiro:hasPermission name="ww:waybillInfo:usable">--%>
		        <%--&nbsp;&nbsp;<input id="usable" class="btn btn-primary" type="button" value="领用"/>--%>
			<%--</shiro:hasPermission>--%>

			<%--<shiro:hasPermission name="ww:waybillInfo:sold">--%>
		        <%--&nbsp;&nbsp;<input id="sold" class="btn btn-primary" type="button" value="销售"/>--%>
			<%--</shiro:hasPermission>--%>

			<%--<shiro:hasPermission name="ww:waybillInfo:abandon">--%>
		        <%--&nbsp;&nbsp;<input id="abandon" class="btn btn-primary" type="button" value="报废"/>--%>
			<%--</shiro:hasPermission>--%>

        </div>
        
    </form:form>
    
    <tags:message content="${message}"/>
<div style="width:100%; overflow: auto">
    <table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th class="span2">门店</th>
        <th class="span1">快递公司</th>
        <th class="span2">面单号</th>
        <th class="span1">面单单价</th>
        <th class="span1">面单来源</th>
        <%--<th class="span1">面单状态</th>--%>
        <th class="span1">添加人</th>
        <th class="span2">添加时间</th>
        <%--<th class="span1">领用人</th>--%>
        <%--<th class="span2">领用时间</th>--%>
        <%--<th class="span1">变更人</th>--%>
        <%--<th class="span2">变更时间</th>--%>
        <th class="span1">操作</th>
        </tr></thead>
        <tbody>
        <c:forEach items="${page.list}" var="info">
            <tr>
                <td>${info.store.storeName}</td>
                <td>${info.expressCompany.companyName}</td>
                <td>${info.waybillNo}</td>
                <td>${info.price}</td>
                <td>${fns:getDictLabel(info.source, 'waybillInfo_source', '')}</td>
                <%--<td>${fns:getDictLabel(info.status, 'waybillInfo_status', '')}</td>--%>
                <td>${info.addManName}</td>
                <td><fmt:formatDate value="${info.addDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
                <%--<td>${info.receiveManName}</td>--%>
                <%--<td><fmt:formatDate value="${info.receiveDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>--%>
                <%--<td>${info.updateManName}</td>--%>
                <%--<td><fmt:formatDate value="${info.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>--%>
                <td>
					<shiro:hasPermission name="ww:waybillInfo:delete">
						<a href="${ctx}/wenwen/waybillInfo/delete?id=${info.waybillNo}" onclick="return confirm('确定从数据库删除该条数据?')" >删除</a>
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
