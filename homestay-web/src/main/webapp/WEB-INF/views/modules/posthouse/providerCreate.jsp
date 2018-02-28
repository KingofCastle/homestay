<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>创建驿站服务商</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#inputForm").validate({
                submitHandler: function(form){
                    var pName = $("#provinceCode").find("option:selected").text();
                    var cName = $("#cityCode").find("option:selected").text();
                    var dName = $("#areaCode").find("option:selected").text();
                    $("#pcdName").val(pName+" "+cName+" "+dName);
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
            // 初始化省市下拉选
            var pcdJsonList = eval('${fns:queryPcdJson()}');
            addressInit(pcdJsonList, "provinceCode", "cityCode", "areaCode", $("#provinceName").val(), $("#cityName").val(), $("#areaName").val());
            $('#provinceCode').select2();
            $('#cityCode').select2();
            $('#areaCode').select2();

            $("#provinceCode").change(function(){
                $("#provinceName").val($(this).find("option:selected").text());
            });
            $("#cityCode").change(function(){
                $("#cityName").val($(this).find("option:selected").text());
            });
            $("#areaCode").change(function(){
                $("#areaName").val($(this).find("option:selected").text());
            });
        });
    </script>

</head>
<body>
<form:form id="inputForm" modelAttribute="providerVo" action="${ctx}/posthouse/provider/create" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <tags:message content="${message}"/>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">服务商名称:</label>
                <div class="controls">
                    <form:input path="name" htmlEscape="false" maxlength="30" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">

            <div class="control-group">
                <label class="control-label">省市区:</label>
                <div class="controls">
                    <input name="returnProvinceCode" value="${providerVo.provinceCode}" type="hidden" />
                    <input name="returnCityCode" value="${providerVo.cityCode}" type="hidden"  />
                    <input name="returnAreaCode" value="${providerVo.areaCode}" type="hidden"  />
                    <form:select path="provinceCode" class="required" id="provinceCode"></form:select>
                    <form:select path="cityCode" class="required" id="cityCode" ></form:select>
                    <form:select path="areaCode" class="required" id="areaCode" ></form:select>
                    <form:hidden path="pcdName"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">详细地址:</label>
                <div class="controls">
                    <form:input path="detailAddress" htmlEscape="false" maxlength="100" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">营业执照:</label>
        <div class="controls">
            <form:hidden path="licenceFrontUrl" htmlEscape="false" maxlength="255" class="input-xlarge required" />
            <tags:uploadpicture input="licenceFrontUrl" type="images" projectName="postHouse"/>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">BD邀请码:</label>
                <div class="controls">
                    <form:input path="bdCode" htmlEscape="false" maxlength="30" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <label>运营者信息</label>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">姓名:</label>
                <div class="controls">
                    <form:input path="operatorName" htmlEscape="false" maxlength="30" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">身份证号:</label>
                <div class="controls">
                    <form:input path="idCardNo" htmlEscape="false" maxlength="18" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">联系电话:</label>
                <div class="controls">
                    <form:input path="operatorPhone" htmlEscape="false" maxlength="11" size="11" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">身份证正反面:</label>
                <div class="controls">
                    <form:hidden path="idCardFrontUrl" htmlEscape="false" maxlength="255" class="input-xlarge required" />
                    <tags:uploadpicture input="idCardFrontUrl" type="images" projectName="postHouse"/>
                    <form:hidden path="idCardBackUrl" htmlEscape="false" maxlength="255" class="input-xlarge required" />
                    <tags:uploadpicture input="idCardBackUrl" type="images" projectName="postHouse"/>
                </div>
            </div>
        </div>
    </div>
    <label>结算账号：</label>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">银行卡号:</label>
                <div class="controls">
                    <form:input path="bankCardNo" htmlEscape="false" maxlength="20" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">户主姓名:</label>
                <div class="controls">
                    <form:input path="bankCardOwnerName" htmlEscape="false" maxlength="30" class="required"/>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">银行卡开户行:</label>
                <div class="controls">
                    <form:input path="bankName" htmlEscape="false" maxlength="30" class="required"/>
                </div>
            </div>
        </div>
    </div>

    <%--  </div>
  </div>--%>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="保存"/>&nbsp;
        <input class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
