<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>流程管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
	<script type="text/javascript">
    $(function() {
    	$('#deploy').button({
    		icons: {
    			primary: 'ui-icon-document'
    		}
    	}).click(function() {
    		$('#deployFieldset').toggle('normal');
    	});
    });
    </script>
</head>
<body>
	<tags:message content="${message}"/>
	
	<div style="text-align: right;padding: 2px 1em 2px">
		<div id="message" class="info" style="display:inline;"><b>提示：</b>点击xml或者png链接可以查看具体内容！</div>
		<a id='deploy' href='#'>部署流程</a>
		<a id='redeploy' href='${ctx }/workflow/redeploy/all' style="display:none">重新部署流程</a>
	</div>
	<fieldset id="deployFieldset" style="display: none">
		<legend>部署新流程</legend>
		<div><b>支持文件格式：</b>zip、bar、bpmn、bpmn20.xml</div>
		<form action="${ctx }/sys/workflow/deploy" method="post" enctype="multipart/form-data">
			<input type="file" name="file" />
			<input type="submit" value="Submit" />
		</form>
	</fieldset>
	
	<table class="table table-striped table-bordered ">
		<thead>
			<tr>
				<th>ProcessDefinitionId</th>
				<th>DeploymentId</th>
				<th>名称</th>
				<th>KEY</th>
				<th>版本号</th>
				<th>XML</th>
				<th>图片</th>
				<th>部署时间</th>
				<th>是否挂起</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${objects }" var="object">
				<c:set var="process" value="${object[0] }" />
				<c:set var="deployment" value="${object[1] }" />

				<%
				pageContext.setAttribute("isSuspended", ((org.activiti.engine.repository.ProcessDefinition)pageContext.getAttribute("process")).isSuspended());
				%>
				<tr>
					<td>${process.id }</td>
					<td>${process.deploymentId }</td>
					<td>${process.name }</td>
					<td>${process.key }</td>
					<td>${process.version }</td>
					<td><a target="_blank" href='${ctx }/sys/workflow/resource/deployment?deploymentId=${process.deploymentId}&resourceName=${process.resourceName }'>${process.resourceName }</a></td>
					<td><a target="_blank" href='${ctx }/sys/workflow/resource/deployment?deploymentId=${process.deploymentId}&resourceName=${process.diagramResourceName }'>${process.diagramResourceName }</a></td>
					<td>${deployment.deploymentTime }</td>
					<td>${isSuspended} | 
						<c:if test="${isSuspended }">
							<a href="${ctx }/sys/workflow/processdefinition/update/active/${process.id}">激活</a>
						</c:if>
						<c:if test="${!isSuspended }">
							<a href="${ctx }/sys/workflow/processdefinition/update/suspend/${process.id}">挂起</a>
						</c:if>
					</td>
					<td><a href='${ctx }/sys/workflow/process/delete?deploymentId=${process.deploymentId}'>删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
