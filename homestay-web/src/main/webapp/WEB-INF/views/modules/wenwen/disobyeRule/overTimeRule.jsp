<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>商家任务定价设置</title>
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
                td.innerHTML =' <h6><input name="beginMinute" type="number"  min="0" max="999" /> < 超出时间 ＜＝ <input name="endMinute"  min="0" max="999" type="number"  step="1"/>分钟,骑手惩罚<input name="punishFee"  min="0" max="999" type="number" step="0.1"/>元,赔付商家<input name="paidFee"  min="0" max="999" type="number"  step="0.1"/>元<input type="button" id="add" value="增加" onclick="addfile();"> <a href="javascript:delefile('+i+');">删除</a></h6>'

                i++;
            }
            function delefile(id){
                document.getElementById('th_'+id).innerHTML = "";
                document.getElementById('td_'+id).innerHTML = "";
            }
    </script>

</head>
<body>

<%--<ul class="nav nav-tabs">
    <li class="active">溢价设置</li>
</ul>--%>
<ul class="nav nav-tabs">
    <li ><a href="${ctx}/wenwen/overTimeRule/view?orderType=crowdOrder">超时送达违规设置</a></li>
    <shiro:hasPermission name="ww:timeout:view">
        <li ><a href="${ctx}/wenwen/violations/timeoutPickup/view?orderType=crowdOrder">超时到店违规设置</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="ww:distance:view">
        <li ><a href="${ctx}/wenwen/violations/distance/view?orderType=crowdOrder">距离违规设置</a></li>
    </shiro:hasPermission>
</ul>
    <form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/overTimeRule/execute" method="post"
               class="form-horizontal"    >
        <tags:message content="${message}"/>
        <input id="orderType" name="orderType" value="${orderType}" type="hidden">
    <div class="top">
        <div id="displayForm" >
            <br/>
            <h4  >
                预计送达时间规则：
            </h4>
            <br/>
            <input name="overTimeType" value=true type="hidden">
            <h6>
                <input name="initDistance" type="number" value="${initDistance}" step="0.1" min="0" max="999" />公里内，配送时间<input name="initMinute"  min="0" max="999" type="number" value="${initMinute}"  step="1"/>分钟，配送距离每增加1公里，配送时间增加<input name="raiseMinute"  min="0" max="999" type="number" value="${raiseMinute}"  step="1"/>分钟
            </h6>
            <br/>
            <h6>
         <%--       <input name="beginMinute" type="number" value="${beginMinute}"  min="0" max="999" />< 超出时间 <= <input name="endMinute"  min="0" max="999" type="number" value="${endMinute}"  step="1"/>分钟,骑手惩罚<input name="punishFee"  min="0" max="999" type="number" value="${punishFee}"  step="1"/>元,赔付商家<input name="paidFee"  min="0" max="999" type="number" value="${paidFee}"  step="1"/>元
--%>
            </h6>
            <div id="first">
                <table>
                    <tbody id="files" name="filess">
                    <c:forEach items="${list}" var="item"  varStatus="status">
                        <tr>
                            <th id="th_${status.index}">
                            <td id="td_${status.index}">
                                <h6><input name="beginMinute" type="number" value="${item.beginMinute}"  min="0" max="999" />< 超出时间 ＜＝ <input name="endMinute"  min="0" max="999" type="number" value="${item.endMinute}"  step="1"/>分钟,骑手惩罚<input name="punishFee"  min="0" max="999" type="number" value="${item.punishFee}"  step="0.1"/>元,赔付商家<input name="paidFee"  min="0" max="999" type="number" value="${item.paidFee}"  step="0.1"/>元&nbsp;  &nbsp;    <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile(${status.index});">删除</a></h6>
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
