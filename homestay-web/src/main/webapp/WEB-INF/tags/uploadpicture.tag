<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="input" type="java.lang.String" required="true" description="输入框"%>
<%@ attribute name="type" type="java.lang.String" required="true" description="files、images、flash、thumb"%>
<%@ attribute name="selectMultiple" type="java.lang.Boolean" required="false" description="是否允许多选"%>
<%@ attribute name="numLimit" type="java.lang.String" required="false" description="是否允许多选"%>
<%@ attribute name="formData" type="java.lang.String" required="false" description="表单数据"%>
<%@ attribute name="projectName" type="java.lang.String" required="false" description="工程名称"%>

<ol id="${input}Preview"></ol>
<div id="uploader-demo">
    <!--用来存放item-->
    <div id="${input}fileList" class="uploader-list"></div>
    <div id="${input}filePicker">选择图片</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
        // 初始化Web Uploader
        var uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            auto: true,
            // swf文件路径
            swf: '${ctxStatic}/webuploader/webuploader-0.1.5/Uploader.swf',
            // 文件接收服务端。
            server: '${ctx}/file/photo/upload/',
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#${input}filePicker',
            duplicate: true,
            <c:if test="${not empty numLimit}">
                fileNumLimit:${numLimit},
            </c:if>
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'jpg,jpeg,png',
                mimeTypes: 'image/*'
            },
            formData:{
                projectName:'${projectName}'
            }
        });
        uploader.on( 'uploadSuccess', function( file, response ) {
        	${input}SelectAction(response.url, response, file);
        });
        uploader.on( 'uploadError', function( file, reason ) {
            alert("上传失败:" + reason);
        });
        uploader.on( 'error', function(type ) {
        	if("Q_TYPE_DENIED" == type) {
	            alert("只能上传【jpg,jpeg,png】文件");
        	} else {
                if (type == "Q_EXCEED_NUM_LIMIT") {
                    alert("最多上传${numLimit}张图片");
                }else{
                    alert(type);
                }
        	}
        });
	});
	
	function ${input}SelectAction(fileUrl, data, allFiles){
		var url= fileUrl;
		//<c:if test="${selectMultiple}">
        $("#${input}").val($("#${input}").val()+($("#${input}").val(url)==""?url:"|"+url));//</c:if><c:if test="${!selectMultiple}">
        $("#${input}").val(url);//</c:if>
		${input}Preview();
	}
	function ${input}Del(obj){
		var url = $(obj).prev().attr("url");
		$("#${input}").val($("#${input}").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));
		${input}Preview();
	}
	function ${input}DelAll(){
		$("#${input}").val("");
		${input}Preview();
	}
	function ${input}Preview(){
		//删除重复
		var url ="";
		var li, urls = $("#${input}").val().split("|");
		for (var i=0; i<urls.length; i++){
			if(url.indexOf(urls[i] + "|")<0) {
				url=url+urls[i]+"|";
			}
		}
		if(url.length>0) {
			url = url.substring(0,url.length-1);
		}
		$("#${input}").val(url);
		urls=url.split("|");
		$("#${input}Preview").children().remove();
		for (var i=0; i<urls.length; i++){
			if (urls[i]!=""){
				li = "<li><a href=\""+urls[i]+"\" url=\""+urls[i]+"\" class=\"fancybox\" rel=\"gallery\"><img src=\""+urls[i]+"\" url=\""+urls[i]+"\" style=\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;\"></a>";
				li += "&nbsp;&nbsp;<a href=\"javascript:\" onclick=\"${input}Del(this);\">×</a></li>";
				$("#${input}Preview").append(li);
			}
		}
	}
	${input}Preview();
</script>