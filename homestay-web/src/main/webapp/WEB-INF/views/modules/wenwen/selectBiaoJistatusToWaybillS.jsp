<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>选择状态</title>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
		var statusValue = "";//
		var statusTree;
		
		// 初始化
		$(document).ready(function(){
			statusTree = $.fn.zTree.init($("#statusTree"), setting, statusNodes);
		});

		var setting = {view: {selectedMulti:false,nameIsHTML:true,showTitle:false},
				data: {simpleData: {enable: true}},
				callback: {onClick: treeOnClick}};
		
		var statusNodes=[
	            <c:forEach items="${biaojiStatusList}" var="s">
	            {id:"${s.value}", name:"${s.label}"},
	            </c:forEach>];

		//点击选择项回调
		function treeOnClick(event, treeId, treeNode, clickFlag){
			if("statusTree"==treeId){
				statusValue = treeNode.id;
			}
		}
				
	</script>
</head>
<body>
	<div id="selectEmployee" class=" span12">
		<div class="span12">
			<p>选择状态：</p>
			<div id="statusTree" class="ztree"></div>
		</div>
	</div>
</body>
</html>
