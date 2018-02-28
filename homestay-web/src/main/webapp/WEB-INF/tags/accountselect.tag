<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="输入框值（Name）"%>
<%@ attribute name="checked" type="java.lang.Boolean" required="false" description="是否显示复选框"%>
<%@ attribute name="allowClear" type="java.lang.Boolean" required="false" description="是否允许清除"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled"%>
<div class="input-append">
	<input id="${id}Id" name="${name}" class="${cssClass}" type="hidden" value="${value}"${disabled eq 'true' ? ' disabled=\'disabled\'' : ''}/>
	<input id="${id}Name" name="${labelName}" readonly="readonly" type="text" value="${labelValue}" maxlength="50"${disabled eq "true"? " disabled=\"disabled\"":""}"
		class="${cssClass}" style="${cssStyle}"/><a id="${id}Button" href="javascript:" class="btn${disabled eq 'true' ? ' disabled' : ''}"><i class="icon-search"></i></a>&nbsp;&nbsp;
</div>
<script type="text/javascript">
	$("#${id}Button").click(function(){
		// 是否限制选择，如果限制，设置为disabled
		if ($("#${id}Id").attr("disabled")){
			return true;
		}
		// 正常打开
		top.$.jBox.open("iframe:${ctx}/tbbaccount/withdraw/accountinfo/list", "选择账户", 500, 600, {
			buttons:{"确定":"ok", ${allowClear?"\"清除\":\"clear\", ":""}"关闭":true}, submit:function(v, h, f){
				if (v=="ok"){
					var selectedAccount = h.find("iframe")[0].contentWindow.selectedAccount;//h.find("iframe").contents();

					if(selectedAccount && selectedAccount.accountId){
						$("#${id}Id").val(selectedAccount.accountId);
						$("#${id}Name").val(selectedAccount.accountName + ":" + selectedAccount.accountPhone);
					} else {
						return false;
					}

				}//<c:if test="${allowClear}">
				else if (v=="clear"){
					$("#${id}Id").val("");
					$("#${id}Name").val("");
                }//</c:if>
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
			}
		});
	});
</script>
