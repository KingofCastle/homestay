<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>溢价</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/biz/weatherOverFee.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            // 初始化省市下拉选
            var pcdJsonList = eval('${fns:queryPcdJson()}');
            var provinceCode = $('input[name="provinceCode"]').val();
            var cityCode = $('input[name="cityCode"]').val();
//            alert(provinceCode+","+cityCode);
            provinceCityAddressInit(pcdJsonList, "receiverProvinceCode", "receiverCityCode",
                provinceCode, cityCode);
            if (provinceCode != '') {
//                $("#receiverProvinceCode").find("option[value="+provinceCode+"]").attr("selected",true);
//                var name = $("#receiverProvinceCode").find("option[value="+provinceCode+"]").html();
//                $("#s2id_receiverProvinceCode").find("span").html(name);
            }
            if (cityCode != '') {
//                $("#receiverCityCode").find("option[value="+cityCode+"]").attr("selected",true);
//                var cityName = $("#receiverCityCode").find("option[value="+cityCode+"]").html();
//                $("#s2id_receiverCityCode").find("span").html(cityName);
            }
            $("#receiverProvinceCode").change(function () {
                $("#receiverProvinceName").val($(this).find("option:selected").text());
            });
            $("#receiverCityCode").change(function () {
                $("#receiverCityName").val($(this).find("option:selected").text());
                var province = $("#receiverProvinceCode").val();
                var city = $("#receiverCityCode").val();
                window.location.href = "${ctx}/wenwen/weatherFeeOver/view?cityCode=" + city + "&provinceCode=" + province + "&flag=open";
            });

            $("#weatherPeekBtn").click(function () {
                getSelectedDistrict();
                $('input[name="weatherIsOpen"]').val($('input[name="choice"]:checked').val());
                $('input[name="weatherOverFee"]').val($('input[name="fee"]').val());
                $("#inputForm").submit();
            });
            $("#switchClose").click(function () {
                if ($(this).attr("checked")) {
                    $("#displayForm").hide();
                } else {
                    $("#displayForm").show();
                }
            });
            $("#switchOpen").click(function () {
                if ($(this).attr("checked")) {
                    $("#displayForm").show();
                } else {
                    $("#displayForm").hide();
                }
            });
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });

        });
        function getSelectedDistrict() {
            var id_array = new Array();
            $('input[name="districtCheckbox"]:checked').each(function () {
                id_array.push($(this).attr("code"));//向数组中添加元素
            });
            var idstr = id_array.join(',');//将数组元素连接起来以构建一个字符串
//            alert(idstr);
            $('input[name="districtCodes"]').val(idstr);

        }

    </script>

</head>
<body>

<ul class="nav nav-tabs">
    <li class="active"><a>天气溢价设置</a></li>
    <shiro:hasPermission name="ww:peekFeeOver:view">
        <li><a href="${ctx}/wenwen/peekFeeOver/view">高峰溢价设置</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="ww:merchantTaskDeliverFee:view">
        <li><a href="${ctx}/wenwen/merchantTaskDeliverFee/list?orderType=crowdOrder">商家任务定价设置</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="ww:dispatchRadius:view">
        <li><a href="${ctx}/wenwen/dispatchRadius/view">广播距离设置</a></li>
    </shiro:hasPermission>
</ul>


<div class="top">
    <tags:message content="${message}"/>
    </br>
    <h4>
        天气溢价:
        <label><input id="switchClose" name="choice" type="radio" value="false"
                      <c:if test="${!weatherIsOpen}">checked</c:if>/>关闭 </label>
        <label><input id="switchOpen" name="choice" type="radio" value="true"
                      <c:if test="${weatherIsOpen}">checked</c:if>/>开启 </label>
    </h4>
    </br>
    </br>
    <div id="displayForm"
         <c:if test="${!weatherIsOpen}">style="display:none"
    </c:if>
    <h4>溢价金额设置:  <input name="fee" type="number" value="1.5" step="0.01"/>元  (对下方勾选区域生效)
        <%--<label><input name="fee" type="number" value="${weatherOverFee}" max="999" min="0" step="0.01"  />元 </label>--%>
    </h4>
    <div class="info">
        <div>
            <h4>覆盖范围 (${provinceName}--${cityName}) </h4>
            </br>
            <div class="row">
                <div class="span10">

                    <select id="receiverProvinceCode" name="receiverPcdCode"></select>

                    <select id="receiverCityCode" name="receiverPcdCode"></select>
                </div>
            </div>

            </br>
            <c:forEach items="${districtList}" var="district">
                <label><input name="districtCheckbox" code="${district.code}" type="checkbox"
                              <c:if test="${district.opened}">checked="checked"</c:if> value=""/>${district.name}
                    <c:if test="${district.opened}"> : ${district.weatherOverFee} 元</c:if>
                </label>
            </c:forEach>

        </div>
    </div>
</div>


</div>


</br>
</br>
<td><input id="weatherPeekBtn" type="submit" name="Submit" value="提交" class="btn"/></td>
<form:form id="inputForm" modelAttribute="weatherOverFeeDTO" action="${ctx}/wenwen/weatherFeeOver/execute" method="post"
           style="display:none">

    <input name="districtCodes"/>
    <input name="cityCode" value="${cityCode}"/>
    <input name="weatherIsOpen"/>
    <input name="weatherOverFee"/>
    <input name="provinceCode" value="${provinceCode}"/>
</form:form>


<script>


</script>

</body>
</html>
