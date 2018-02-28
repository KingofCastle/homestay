<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>请选择</title>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
		var dataId = "";//选中的dataId放在这里
		var dataTree;
		
		// 初始化
		$(document).ready(function(){
			dataTree = $.fn.zTree.init($("#dataTree"), setting, dataNodes);
		});

		var setting = {view: {selectedMulti:false,nameIsHTML:true,showTitle:false},
				data: {simpleData: {enable: true}},
				callback: {onClick: treeOnClick}};
		
		var dataNodes=[
	            <c:forEach items="${mapList}" var="data">
	                {
	                	id:"${data.value}", 
	                	name:"${data.label}"
	            	},
	            </c:forEach>
	            	];

		//点击选择项回调
		function treeOnClick(event, treeId, treeNode, clickFlag){
			if("dataTree"==treeId){
				dataId = treeNode.id;
			}
		}
				
	</script>
</head>
<body>
		<div class="span20">
			<p></p>
			<div id="dataTree" class="ztree"></div>
		</div>
</body>
</html>
