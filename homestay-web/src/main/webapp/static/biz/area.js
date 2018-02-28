function parseJson(jsonList,ctx) {
    for (var i=0,l=jsonList.length;i<l;i++){
        var item = jsonList[i];
        if (item.id == 1){
            continue;
        }
        var operate = "<a href=\""+ctx+"/sys/area/form?id="+item.id+"\">修改</a> " +
            "<a href=\""+ctx+"/sys/area/delete?id="+item.id+"\" onclick=\"return confirmx('要删除该区域及所有子区域项吗？', this.href)\">删除</a> " +
            "<a href=\""+ctx+"/sys/area/form?parent.id="+item.id+"\">添加下级区域</a>";
        var pId= item.parent.id;
        if (pId == 1){
            pId=0;
        }
        var tr = "<tr id="+ item.id + " pId= "+pId+ "><td><a href=\""+ctx+"/sys/area/form?id="+item.id+"\">"
            +item.name+"</a></td><td>"+item.code+"</td><td>"+
            item.type+"</td><td>"+item.cheOpen+"</td><td>"+item.remarks+"</td><td>"+
            operate+"</td></tr>";
        $("#treeTable").append(tr);
    }
}

