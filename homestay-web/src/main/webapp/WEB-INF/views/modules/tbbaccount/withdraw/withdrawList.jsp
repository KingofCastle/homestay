<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>提现记录</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/dialog.jsp" %>
	<style type="text/css">.sort{color:#0663A2;cursor:pointer;}</style>
	<script type="text/javascript">
		$(document).ready(function() {



			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出当前数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/tbbaccount/withdraw/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});

//			$(".confirmLink").click(function (event) {
//				event.preventDefault();
//				var href = $(this).attr("href");
//
////				var html = "html:<div style='padding:10px;'>输入流水号：<input type='text' id='orderNo' name='orderNo' maxlength='64' /></div>";
//				var html;
//
//				top.$.jBox(html,
//						{ title:"确认此操作吗？",
//						buttons: { '确定': 'ok','关闭':'close' },
//						submit: function (v, h, f) {
//							if(v == 'close') {
//								return true;
//							} else {
////								var regu =/^\w{1,64}$/;
////								var re = new RegExp(regu);
////								var orderNO = f.orderNo;
////								if (orderNO == '') {
////									$.jBox.tip("请输入流水号。", 'error', { focusId: "orderNo" }); // 关闭设置 yourname 为焦点
////									return false;
////								} else if (!re.test(orderNO)){
////									$.jBox.tip("流水号只能是1到64位数字或字母。", 'error', { focusId: "orderNo" }); // 关闭设置 yourname 为焦点
////									return false;
////								}
//
//
//								loading('正在提交，请稍等...');
//								location = href;
//							}
//							return true;
//						} });
//			});
		});



		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/tbbaccount/withdraw");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/tbbaccount/withdraw">提现记录</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="condition" action="${ctx}/tbbaccount/withdraw" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}"/>
		<div>
			<label>用户：</label>
				<%--<form:input path="accountId" value="${accountId}" type="text" maxlength="50" class="input-small"  />--%>
			<tags:accountselect id="accountId" name="accountId" value="${condition.accountId}" labelName="nameAndPhone" labelValue="${nameAndPhone}" allowClear="true"  ></tags:accountselect>

			<label>交易状态：</label>
				<%--INIT("0", "处理中"), SUCCEED("1", "成功"), CLOSE("2", "关闭");--%>
				<%--<input id="status" name="status" value="${status}" type="text" maxlength="50" class="input-small"  />--%>
			<form:select path="status"  type="text" maxlength="50" class="input-small"  >
				<option></option>
				<form:options items="${fns:getDictList('WITHDRAW_STATUS')}" itemValue="value" itemLabel="label" ></form:options>
			</form:select>

			<label>提现类型：</label>
			<form:select path="target"  type="text" maxlength="50" class="input-small"  >
				<option></option>
				<form:options items="${fns:getDictList('WITHDRAW_TARGET')}" itemValue="value" itemLabel="label" ></form:options>
			</form:select>

			<label>提现时间：</label>
				<form:input path="createDateTimeBegin"   readonly="readonly" maxlength="20" class="input-small Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,maxDate:'%y-%M-%d'});"/>
				至<form:input path="createDateTimeEnd" id="createDateTimeEnd"  readonly="readonly" maxlength="20" class="input-small Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false,maxDate:'%y-%M-%d'});"/>

			&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="搜索" onclick="return page();"/>
			&nbsp;<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
		</div>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>用户ID</th><th>姓名</th><th>手机号</th><th>银行</th><th>银行卡号</th><th>提现时间</th><th>提现金额（元）</th><th>交易状态</th><th>提现类型</th><th>第三方流水号</th><th>备注</th><shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="info">
			<tr>
				<td>${info.userId}</td>
				<td>${info.name}</td>
				<td>${info.phone}</td>
				<td>${info.bankName}</td>
				<td>${info.bankCard}</td>
				<td><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${info.amount}</td>
				<td>${fns:getDictLabel(info.status, "WITHDRAW_STATUS", "")}</td>
				<td>${fns:getDictLabel(info.target, "WITHDRAW_TARGET", "")}</td>
				<td>${info.jkOrderNo}</td>
				<td>${info.remark}</td>
				<shiro:hasPermission name="sys:user:edit"><td>
					<c:if test="${info.status == 'INIT' or info.status == 'FAIL'}" >
						<a href="${ctx}/tbbaccount/withdraw/confirm?withdrawId=${info.withdrawId}" onclick="return confirmx('确认打款吗？', this.href)">确认打款</a>
						<a href="${ctx}/tbbaccount/withdraw/reject?withdrawId=${info.withdrawId}" onclick="return confirmx('拒绝打款吗？', this.href)">驳回</a>
						<%--<a href="${ctx}/tbbaccount/withdraw/confirm?withdrawId=${info.withdrawId}" class="confirmLink" >确认打款</a>--%>
						<%--<a href="${ctx}/tbbaccount/withdraw/reject?withdrawId=${info.withdrawId}" class="confirmLink" >拒绝打款</a>--%>
						<%--onclick="return confirmx('确认打款成功吗？', this.href)"--%>
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>