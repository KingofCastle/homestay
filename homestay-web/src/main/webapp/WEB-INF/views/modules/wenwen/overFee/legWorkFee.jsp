<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>兔快送定价设置</title>
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
            td.innerHTML =' <h4><input name="beginDistance" type="number" step="0.1"   min="0.1" max="9998.9"  />  < 送货距离< =  ' +
                '<input name="endDistance" type="number" step="0.1" min="0.1" max="9998.9" />,公里，每' +
                '<input name="eachDistance" type="number"  step="0.1"  min="0.1" max="9998.9"/>公里加  ' +
                '<input name="perFeeDistance" type="number"  step="0.1"   min="0.1" max="998.9" />元&nbsp;&nbsp;' +
                '<input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile('+i+');">删除</a>  </h4>';

            i++;
        }
        var i02=100;
        function addfile02() {
            var oTR  = document.createElement("tr");
            var oTH = document.createElement("th");
            var oTD = document.createElement("td");
            var oD=document.getElementById('files02');
            tr = oD.appendChild(oTR);
            th = tr.appendChild(oTH);
            td = tr.appendChild(oTD);
            td.setAttribute("id","td02_" + i02);
            th.setAttribute("id","th02_" + i02);
            td.innerHTML ='<h4><input name="beginWeight" type="number"  step="0.1"   min="0.1" max="98.9"/>< 物品重量< ='+
                '<input name="endWeight" type="number"  step="0.1"  min="0.1" max="98.9"/>,公斤，每'+
                '<input name="eachWeight" type="number"  step="0.1"  min="0.1" max="98.9"/>公斤加'+
                '<input name="perFeeWeight" type="number"  step="0.1" min="0.1" max="998.9"/>元&nbsp;&nbsp;'+
                '<input type="button" id="add" value="增加" onclick="addfile02();">  <a href="javascript:delefile('+i02+');">删除</a>  </h4>';
            i02++;
        }
        function delefile(id){
            document.getElementById('th_'+id).innerHTML = "";
            document.getElementById('td_'+id).innerHTML = "";
        }
        function delefile02(id){
            document.getElementById('th02_'+id).innerHTML = "";
            document.getElementById('td02_'+id).innerHTML = "";
        }
    </script>

</head>
<body>
<ul class="nav nav-tabs">
    <li ><a class="active">兔快送任务定价设置</a></li>
    <shiro:hasPermission name="ww:legworkDispatchRadius:view">
        <li ><a href="${ctx}/wenwen/legWorkDispatchRadius/view">兔快送广播距离设置</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/legworkFee/execute" method="post" class="form-horizontal">
    <tags:message content="${message}"/>
    <div class="top">
        <div id="displayForm" >
            <br/>
            <h3>起送费用:</h3>
            <h4>
                <input name="initDistance" type="number" value="${initDistance}" step="0.1" min="0.1" max="9998.9" />公里内,重量
                <input name="initWeight" type="number" value="${initWeight}" step="0.1" min="0.1" max="9998.9" />公斤以内,配送费
                <input name="initFee"  min="0.1" max="998.9" type="number" value="${initFee}"  step="0.1"/>元
            </h4>
            <h3>按距离加价:</h3>
            <div id="first">
                <table>
                    <tbody id="files" name="filess">
                    <c:forEach items="${distanceList}" var="item"  varStatus="status">
                        <tr>
                            <th id="th_${status.index}">
                            <td id="td_${status.index}">
                                <h4>
                                    <input name="beginDistance" type="number"  step="0.1"  value="${item.beginDistance}" min="0.1" max="9998.9"/>< 送货距离< =
                                    <input name="endDistance" type="number"  step="0.1"  min="0.1" max="9998.9" value="${item.endDistance}"/>,公里，每
                                    <input name="eachDistance" type="number"  step="0.1"  min="0.1" max="9998.9" value="${item.eachDistance}"/>公里加
                                    <input name="perFeeDistance" type="number"  step="0.1" value="${item.perFeeDistance}"  min="0.1" max="998.9"/>元&nbsp;&nbsp;
                                    <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile(${status.index});">删除</a>
                                </h4>
                            </td>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <h3>按重量加价:</h3>
            <div id="second">
                <table>
                    <tbody id="files02" name="filess">
                    <c:forEach items="${weightList}" var="item"  varStatus="status">
                        <tr>
                            <th id="th02_${status.index}">
                            <td id="td02_${status.index}">
                                <h4>
                                    <input name="beginWeight" type="number"  step="0.1"  value="${item.beginWeight}" min="0.1" max="98.9"/>< 物品重量< =
                                    <input name="endWeight" type="number"  step="0.1"  min="0.1" max="98.9" value="${item.endWeight}"/>,公斤，每
                                    <input name="eachWeight" type="number"  step="0.1"  min="0.1" max="98.9" value="${item.eachWeight}"/>公斤加
                                    <input name="perFeeWeight" type="number"  step="0.1" value="${item.perFeeWeight}"  min="0.1" max="998.9"/>元&nbsp;&nbsp;
                                    <input type="button" id="add02" value="增加" onclick="addfile02();">  <a href="javascript:delefile02(${status.index});">删除</a>
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
    <td>
        <input type="submit" name="Submit" value="提交" class="btn"  />
    </td>
</form:form>
</body>
</html>