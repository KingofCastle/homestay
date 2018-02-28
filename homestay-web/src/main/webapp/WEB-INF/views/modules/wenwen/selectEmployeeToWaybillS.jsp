<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>选择快递员</title>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
		var employeeId = "";//选中的employeeId放在这里
		var employeeTree;
		
		// 初始化
		$(document).ready(function(){
			employeeTree = $.fn.zTree.init($("#employeeTree"), setting, employeeNodes);
		});

		var setting = {view: {selectedMulti:false,nameIsHTML:true,showTitle:false},
				data: {simpleData: {enable: true}},
				callback: {onClick: treeOnClick}};
		
		var employeeNodes=[
	            <c:forEach items="${employeeList}" var="employee">
	            {id:"${employee.id}", name:"${employee.name}"},
	            </c:forEach>];

		//点击选择项回调
		function treeOnClick(event, treeId, treeNode, clickFlag){
			if("employeeTree"==treeId){
				employeeId = treeNode.id;
			}
		}
				
	</script>
</head>
<body>
<!-- 	<div id="selectEmployee" class=" span12"> -->
		<div class="span12">
			<p>待选人员：</p>
			<div id="employeeTree" class="ztree"></div>
		</div>
<!-- 	</div> -->
</body>
</html>
