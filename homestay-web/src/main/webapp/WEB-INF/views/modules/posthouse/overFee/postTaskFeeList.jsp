<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>商家任务定价设置</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/biz/weatherOverFee.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var pcdJsonList = eval('${fns:queryPcdJson()}');
            var provinceCode = $('input[name="returnProvinceCode"]').val();
            var cityCode = $('input[name="returnCityCode"]').val();
            var areaCode = $('input[name="returnAreaCode"]').val();

            addressInit(pcdJsonList, "provinceCode", "cityCode", "areaCode", provinceCode,cityCode, areaCode);
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

            $("#Submit").click(function () {
                getSelectedDistrict();
                $("#inputForm").submit();
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

        var i=100;
        function addfile() {
            var oTR  = document.createElement("tr");
            var oTH = document.createElement("th");
            var oTD = document.createElement("td");
            var oD=document.getElementById('files');
            tr = oD.appendChild(oTR);
            th = tr.appendChild(oTH);
            td = tr.appendChild(oTD);
            td.setAttribute("id","td_" + i);
            th.setAttribute("id","th_" + i);
            td.innerHTML =' <input name="beginDistance" type="number" step="0.1"   min="0.1" max="9998.9"  />  < 送货距离< =  <input name="endDistance" type="number" step="0.1" min="0.1" max="9998.9" />              ,公里，每公里加  <input name="perFee" type="number"  step="0.1"   min="0.1" max="998.9" />元     &nbsp;  &nbsp;  <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile('+i+');">删除</a> ';

            i++;
        }


        function delefile(id){
            document.getElementById('th_'+id).innerHTML = "";
            document.getElementById('td_'+id).innerHTML = "";
        }

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

<%--<ul class="nav nav-tabs">
    <li class="active">溢价设置</li>
</ul>--%>
<ul class="nav nav-tabs">
    <shiro:hasPermission name="ww:weatherFeeOver:list">
        <li class="active"><a >驿站任务定价设置</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/merchantTaskDeliverFee/list" method="post"
           class="breadcrumb form-search">
<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
<input id="orderType" name="orderType" type="hidden" value="${orderType}"/>

<div class="row">
    <label>所属城市：</label>
    <form:select path="cityCode" class="input-small select_changeAndSubmit" name="cityCode">
        <form:option value="" label="-请选择-"/>
        <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('city_name')}" htmlEscape="false"/>
    </form:select>
    <label>定价模板 ：</label>
    <select id="merchantDeliverFeeTemS" name="temId" path="merchantDeliverFeeTemS" class="input-small select_changeAndSubmit">
        <option value="${value.id}">
            -请选择-
        </option>
        <c:forEach var="value" items="${merchantDeliverFeeTemS}">
            <option value="${value.id}">
                    ${value.name}
            </option>
        </c:forEach>
    </select>
    &nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/><br><br>
</div>

</form:form>
    <tags:message content="${message}"/>

<a href="${ctx}/wenwen/merchantTaskDeliverFee/view?areaCode=&orderType=postOrder">新增驿站任务定价设置</a>

                <table>
                    <tbody id="files" name="filess">
                    <c:forEach items="${list}" var="item"  varStatus="status">
                        <tr>
                            <td>
                                   <span> 省:${item.provinceName}&nbsp; 市: ${item.cityName}&nbsp; 区:   ${item.areaName}  &nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </td>
                            <td>
                                <h6  >
                                    起送费用:
                                </h6>
                                <span>  ${item.initDistance}公里内,配送费 ${item.initFee}元 &nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </td>
                            <td>
                                <h6  >
                                按距离加价:
                            </h6>
                                <span>   ${item.beginDistance} 〈 送货距离 〈=  ${item.endDistance}公里，每公里加 ${item.perFee}元  &nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </td>

                            <td>
                                <h6  >
                                    模板名称:
                                </h6>
                                    <c:forEach var="value" items="${merchantDeliverFeeTemS}">
                                            <c:if test="${item.temId == value.id}">
                                                <c:out value="${value.name}"/>
                                            </c:if>
                                    </c:forEach>
                            </td>
                            <td>   &nbsp;&nbsp;&nbsp;&nbsp; <a href="${ctx}/wenwen/merchantTaskDeliverFee/view?areaCode=${item.areaCode}&orderType=${item.orderType}&temId=${item.temId}">修改</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
</body>
</html>