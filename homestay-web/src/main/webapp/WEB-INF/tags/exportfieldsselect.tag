<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="隐藏域编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称"%>
<%@ attribute name="submitFormId" type="java.lang.String" required="true" description="提交的FromID"%>
<%@ attribute name="submitUrl" type="java.lang.String" required="true" description="提交的Url"%>
<%@ attribute name="exportClass" type="java.lang.String" required="true" description="需要导出的类名（WayBillSEntity，WayBillRController，EmployeeEntity，FeedBackEntity）"%>

<div class="input-append">

    <input id="${id}" name="${name}" type="hidden" value=""/>
    &nbsp;<input id="${id}btnExport" class="btn btn-primary" type="button" value="导出"/>
</div>
<script type="text/javascript">
$(document).ready(function() {

    // export data begin
    $("#${id}btnExport").click(function(){
        //pop the fields select box begin
		top.$.jBox.open("iframe:${ctx}/tag/treeselect?url="+encodeURIComponent("/export/fields?exportClass=${exportClass}")+"&checked=true",
		"选择导出字段", 300, 420, 
		{
		 buttons:{"确定":"ok", "关闭":true},
		 submit:function(v, h, f){
		     if (v=="ok"){
		         var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
		         var ids = [], names = [], nodes = [];
		         nodes = tree.getCheckedNodes(true);
		         for(var i=0; i<nodes.length; i++) {
		             ids.push(nodes[i].id);
		             names.push(nodes[i].name);
		         }
		         $("#${id}").val(ids);
		         
		         
		         var isSubmit = false;
		         var content = "请选择要导出的数据列。";
		         if(names && names.length>0) {
		             content = "确认要导出数据列【" + names.join("、") + "】吗？";
		             isSubmit = true;
		         }
		         top.$.jBox.confirm(content,"系统提示",function(v,h,f){
		             if(isSubmit && v=="ok"){
		            	 var submitForm = $("#${submitFormId}");
		            	 var originSubmitUrl = submitForm.attr("action");
		            	 submitForm.attr("action","${submitUrl}");
		            	 submitForm.submit();
		            	 submitForm.attr("action",originSubmitUrl);
		             }
		         },{buttonsFocus:1});
		         top.$('.jbox-body .jbox-icon').css('top','55px');
		     }
		 },
		 loaded:function(h){
		     $(".jbox-content", top.document).css("overflow-y","hidden");
		 }
		});
        //pop the fields select box end
    }); // export data end
	
});

</script>
