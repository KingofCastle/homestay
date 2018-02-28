<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>区域管理</title>
	<meta name="decorator" content="default"/>
	<!-- <%@include file="/WEB-INF/views/include/treetable.jsp" %> -->
	<link href="${ctxStatic}/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet" type="text/css" />
	<script src="${ctxStatic}/treeTable/jquery.treeTable.js" type="text/javascript"></script>

	<script type="text/javascript">
        $(document).ready(function() {
            var option = {
                expandLevel : 2,
                beforeExpand : function($treeTable, id) {
                    //判断id是否已经有了孩子节点，如果有了就不再加载，这样就可以起到缓存的作用
                    if ($('.' + id, $treeTable).length) { return; }
                    getSubData($treeTable, id);
                }
            };
            var that = $("#treeTable").treeTable(option);
            getSubData(that, "1");
        });

        function getSubData($treeTable, parentId) {
            var ctx = "${ctx}";
            var hasPermission = false;
            <shiro:hasPermission name="sys:area:edit">
            hasPermission = true;
            </shiro:hasPermission>

            $.ajax({
                type: "GET",
                url: "${ctx}/sys/area/subData?parentId="+parentId,
                dataType: "json",
                success: function(data){
                    if (data.length > 0) {
                        $("tr#"+parentId+"").attr("haschild","true");
                    } else {
                        var el = $("tr#"+parentId+" td:first span:last");
                        el.removeClass("default_active_node");
                        el.addClass("default_node");
                        if (el.hasClass("default_hover_open")) {
                            el.removeClass("default_hover_open");
                            el.addClass("default_leaf");
                        }
                        if (el.hasClass("default_hover_last_open")) {
                            el.removeClass("default_hover_last_open");
                            el.addClass("default_last_leaf");
                        }

                        return;
                    }
                    var html = '';
                    for (var i = 0; i < data.length; i++) {
                        var area = data[i];
                        if (parentId == "1")
                            parentId = "0";
                        html += '<tr id="'+area.id+'" pId="'+parentId+'">';
                        html += '<td><a href="'+ctx+'/sys/area/form?id='+area.id+'">'+area.name+'</a></td>';
                        html += '<td>'+area.code+'</td>';
                        html += '<td>'+area.typeName+'</td>';

                        html += '<td>'+area.open+'</td>';
                        var remarks = "";
                        if (area.remarks)
                            remarks = area.remarks;
                        html += '<td>'+remarks+'</td>';
                        if (hasPermission) {
                            html += '<td>';
                            html += '<a href="'+ctx+'/sys/area/form?id='+area.id+'">修改</a>\n';
                            html += '<a href="'+ctx+'/sys/area/delete?id='+area.id+'" onclick="return confirmx(\'要删除该区域及所有子区域项吗？\', this.href)">删除</a>\n';
                            html += '<a href="'+ctx+'/sys/area/form?parent.id='+area.id+'">添加下级区域</a> ';
                            html += '</td>';
                        }
                        html += '</tr>';
                    }
                    $treeTable.addChilds(html);
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
	<li class="active"><a href="${ctx}/sys/area/">区域列表</a></li>
	<shiro:hasPermission name="sys:area:edit"><li><a href="${ctx}/sys/area/form">区域添加</a></li></shiro:hasPermission>
</ul>
<tags:message content="${message}"/>
<table id="treeTable" class="table table-striped table-bordered table-condensed">
	<tr><th>区域名称</th><th>区域编码</th><th>区域类型</th><th>车配开通状态</th><th>备注</th><shiro:hasPermission name="sys:area:edit"><th>操作</th></shiro:hasPermission></tr>
</table>
</body>
</html>