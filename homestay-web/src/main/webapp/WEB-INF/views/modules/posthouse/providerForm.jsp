<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>驿站服务商信息</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $("#inputForm").validate({
            submitHandler: function(form){
                loading('正在提交，请稍等...');
                form.submit();
            },
            errorContainer: "#messageBox",
            errorPlacement: function(error, element) {
                $("#messageBox").text("输入有误，请先更正。");
                if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                    error.appendTo(element.parent().parent());
                } else {
                    error.insertAfter(element);
                }
            }
        });

    </script>

</head>
<body>
<%--<form:form id="inputForm" modelAttribute="providerVo" action="${ctx}/posthouse/provider/create" method="post" class="form-horizontal">--%>
    <%--&lt;%&ndash;<form:hidden path="id"/>&ndash;%&gt;--%>
    <%--<tags:message content="${message}"/>--%>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">服务商名称:${providerInfo.name}</label>
            </div>
        </div>
    </div>
<div class="row">
    <div class="span50">
        <div class="control-group">
            <label class="control-label">省市区:${providerInfo.pcdName}</label>
        </div>
    </div>
</div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">详细地址:${providerInfo.detailAddress}</label>
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">营业执照:</label>
        <img src="${providerInfo.licenceFrontUrl}" height="300" width="300"/>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">BD邀请码:${providerInfo.bdCode}</label>
            </div>
        </div>
    </div>
    <label>运营者信息</label>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">姓名:${providerInfo.operatorName}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">身份证号:${providerInfo.idCardNo}</label>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">联系电话:${providerInfo.operatorPhone}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">身份证正反面:</label>
                <div class="controls">
                    <img src="${providerInfo.idCardFrontUrl}" height="300" width="300">
                    <img src="${providerInfo.idCardBackUrl}" height="300" width="300">
                </div>
            </div>
        </div>
    </div>
    <label>结算账号：</label>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">银行卡号:${providerInfo.bankCardNo}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">户主姓名:${providerInfo.bankCardOwnerName}</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">银行卡开户行:${providerInfo.bankName}</label>
            </div>
        </div>
    </div>
<%--</form:form>--%>
</body>
</html>
