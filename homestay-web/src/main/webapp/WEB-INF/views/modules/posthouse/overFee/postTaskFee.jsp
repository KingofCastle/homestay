<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>驿站任务定价设置</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/biz/weatherOverFee.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var pcdJsonList = eval('${fns:queryPcdJson()}');
            var provinceCode = $('input[name="returnProvinceCode"]').val();
            var cityCode = $('input[name="returnCityCode"]').val();
            var areaCode = $('input[name="returnAreaCode"]').val();

            addressInit(pcdJsonList, "provinceCode", "cityCode", "areaCode", provinceCode,cityCode, areaCode);

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
            td.innerHTML =' <h4><input name="beginDistance" type="number" step="0.1"   min="0.1" max="9998.9"  />  < 送货距离< =  <input name="endDistance" type="number" step="0.1" min="0.1" max="9998.9" />              ,公里，每公里加  <input name="perFee" type="number"  step="0.1"   min="0.1" max="998.9" />元     &nbsp;  &nbsp;  <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile('+i+');">删除</a>  </h4>';

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
<%--    <li ><a href="${ctx}/wenwen/weatherFeeOver/view?provinceCode=330000&cityCode=330100">天气溢价设置</a></li>
    <shiro:hasPermission name="ww:peekFeeOver:view">
        <li ><a href="${ctx}/wenwen/peekFeeOver/view">高峰溢价设置</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="ww:dispatchRadius:view">
        <li ><a href="${ctx}/wenwen/dispatchRadius/view">广播距离设置</a></li>
    </shiro:hasPermission>--%>
    <shiro:hasPermission name="ww:weatherFeeOver:list">
        <li class="active"><a >驿站任务定价设置</a></li>
    </shiro:hasPermission>
</ul>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/merchantTaskDeliverFee/execute" method="post"
           class="form-horizontal"    >
    <tags:message content="${message}"/>
    <div class="top">
        <div id="displayForm" >

            <input name="orderType" value="${orderType}" type="hidden" />
            <input name="returnProvinceCode" value="${provinceCode}" type="hidden" />
            <input name="returnCityCode" value="${cityCode}" type="hidden"  />
            <input name="returnAreaCode" value="${areaCode}"  type="hidden" />




            <div class="row">
                <div class="control-group">
                    <label class="control-label">城市:</label>
                    &nbsp;&nbsp;&nbsp; &nbsp; 省:
                    <form:select path="provinceCode" class="required" id="provinceCode"></form:select>
<%--                    <form:hidden path="provinceName"/>--%>
                    市:
                    <form:select path="cityCode" class="required" id="cityCode" ></form:select>
        <%--           <form:hidden path="cityName"/>--%>
                    区:<form:select path="areaCode" class="required" id="areaCode"></form:select>
         <%--          <form:hidden path="areaName"/>--%>
                </div>
                <div>
                    <h4>
                        当前区域
                    </h4>
                    <h3>
                        <span>${entity.provinceName}${entity.cityName}${entity.areaName}</span>
                    </h3>
                </div>
            </div>
            <div class="row">
                <div class="control-group">
            <label>定价模板 ：</label>
            <select id="merchantDeliverFeeTemS" name="temId" path="merchantDeliverFeeTemS" class="input-small select_changeAndSubmit">
                <c:forEach var="value" items="${merchantDeliverFeeTemS}">
                    <option value="${value.id}">
                            ${value.name}
                    </option>
                </c:forEach>
            </select>
                </div>
                <div>
                    <h4>
                        当前模板
                    </h4>
                        <span>${temName}</span>
                </div>
            </div>

            <br>
            <h3  >
                起送费用:
            </h3>
            <h4>
                <input name="initDistance" type="number" value="${initDistance}" step="0.1" min="0.1" max="9998.9" />公里内,配送费 <input name="initFee"  min="0.1" max="998.99" type="number" value="${initFee}"  step="0.1"/>元
            </h4>
            <h3  >
                按距离加价:
            </h3>
            <div id="first">
                <table>
                    <tbody id="files" name="filess">
                        <%-- <h4>
                             <input name="beginDistance" type="number"  step="0.01" />  < 送货距离11< =  <input name="endDistance" type="number"  step="0.01" />              ,公里，每公里加  <input name="perFee" type="number"  step="0.01" />元     &nbsp;  &nbsp;    <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile('+i+');">删除</a>
                         </h4>--%>
                    <c:forEach items="${list}" var="item"  varStatus="status">
                        <tr>
                            <th id="th_${status.index}">
                            <td id="td_${status.index}">
                                <h4>
                                    <input name="beginDistance" type="number"  step="0.1"  value="${item.beginDistance}" min="0.1" max="9998.9"/>  < 送货距离< =  <input name="endDistance" type="number"  step="0.1"  min="0.1" max="9998.9" value="${item.endDistance}"/>              ,公里，每公里加  <input name="perFee" type="number"  step="0.1" value="${item.perFee}"  min="0.1" max="998.9"/>元     &nbsp;  &nbsp;    <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile(${status.index});">删除</a>

                                </h4>
                            </td>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </br>
    </br>
    <td><input type="submit" name="Submit" value="提交" class="btn"  /></td>
</form:form>

</body>
</html>
