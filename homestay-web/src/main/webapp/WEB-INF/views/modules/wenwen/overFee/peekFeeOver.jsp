<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>高峰溢价</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
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


        var i = 100;
        function addfile() {
            var oTR = document.createElement("tr");
            var oTH = document.createElement("th");
            var oTD = document.createElement("td");
            var oD = document.getElementById('files');
            tr = oD.appendChild(oTR);
            th = tr.appendChild(oTH);
            td = tr.appendChild(oTD);
            td.setAttribute("id", "td_" + i);
            th.setAttribute("id", "th_" + i);

            /*
             td.innerHTML = '  <h4  > <select name="weekStart" style="width:90px;"> <OPTION value="1">星期一</OPTION> <OPTION value="2">星期二</OPTION> <OPTION value="3">星期三</OPTION> <OPTION value="4">星期四</OPTION> <OPTION value="5">星期五</OPTION> <OPTION value="6">星期六</OPTION> <OPTION value="7">星期天</OPTION> </select> <label>  ----- </label> <select name="weekEnd" style="width:90px;"> <OPTION value="1">星期一</OPTION> <OPTION value="2">星期二</OPTION> <OPTION value="3">星期三</OPTION> <OPTION value="4">星期四</OPTION> <OPTION value="5">星期五</OPTION> <OPTION value="6">星期六</OPTION> <OPTION value="7">星期天</OPTION> </select> &nbsp; &nbsp; &nbsp; &nbsp; <input name="hourStart" type="number" step="1" max="23"  min="0" style="width:70px;"/> <label>时&nbsp;&nbsp;</label> <input name="minuteStart" type="number" step="1" max="59" min="0" style="width:70px;" /> <label>分   -----  </label> <input name="hourEnd" type="number" step="1" max="23" min="0" style="width:70px;"  /> <label>时&nbsp;&nbsp;</label> <input name="minuteEnd" type="number" step="1" max="59" min="0" style="width:70px;" /> <label>分</label> &nbsp;  &nbsp;    <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile(' + i + ');">删除</a> </h4> ';
             */
            td.innerHTML = '  <h4  > <select name="weekStart" style="width:90px;"> <OPTION value="1">星期一</OPTION> <OPTION value="2">星期二</OPTION> <OPTION value="3">星期三</OPTION> <OPTION value="4">星期四</OPTION> <OPTION value="5">星期五</OPTION> <OPTION value="6">星期六</OPTION> <OPTION value="7">星期天</OPTION> </select> <label>  ----- </label> <select name="weekEnd" style="width:90px;"> <OPTION value="1">星期一</OPTION> <OPTION value="2">星期二</OPTION> <OPTION value="3">星期三</OPTION> <OPTION value="4">星期四</OPTION> <OPTION value="5">星期五</OPTION> <OPTION value="6">星期六</OPTION> <OPTION value="7">星期天</OPTION> </select> &nbsp; &nbsp; &nbsp; &nbsp; <input name="hourStart" type="number" step="1" max="23"  min="0" style="width:70px;"/> <label>时&nbsp;&nbsp;</label>  <select name="minuteStart" style="width:90px;"> <OPTION value="0" >00</OPTION> <OPTION value="30" >30</OPTION> </select> <label>分   -----  </label> <input name="hourEnd" type="number" step="1" max="23" min="0" style="width:70px;"  /> <label>时&nbsp;&nbsp;</label> <select name="minuteEnd" style="width:90px;"> <OPTION value="0" >00</OPTION> <OPTION value="30" >30</OPTION> </select> <label>分</label> &nbsp;  &nbsp;    <input type="button" id="add" value="增加" onclick="addfile();">  <a href="javascript:delefile(' + i + ');">删除</a> </h4> ';


            i++;
        }


        function delefile(id) {
            document.getElementById('th_' + id).innerHTML = "";
            document.getElementById('td_' + id).innerHTML = "";
        }

    </script>

</head>
<body>

<%--<ul class="nav nav-tabs">
    <li class="active">溢价设置</li>
</ul>--%>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/weatherFeeOver/view?provinceCode=330000&cityCode=330100">天气溢价设置</a></li>
    <shiro:hasPermission name="ww:weatherFeeOver:view">
        <li class="active"><a>高峰溢价设置</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="ww:merchantTaskDeliverFee:view">
        <li><a href="${ctx}/wenwen/merchantTaskDeliverFee/list?orderType=crowdOrder">商家任务定价设置</a></li>
    </shiro:hasPermission>
    <shiro:hasPermission name="ww:dispatchRadius:view">
        <li><a href="${ctx}/wenwen/dispatchRadius/view">广播距离设置</a></li>
    </shiro:hasPermission>

</ul>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/peekFeeOver/execute" method="post"
           class="form-horizontal">
    <tags:message content="${message}"/>
    <div class="top">


        <h4>
            高峰溢价:
            <label><input name="choice" id="switchClose" type="radio" value="false"
                          <c:if test="${!peekIsOpenBack}">checked</c:if>/>关闭 </label>
            <label><input name="choice" id="switchOpen" type="radio" value="true"
                          <c:if test="${peekIsOpenBack}">checked</c:if>/>开启 </label>
        </h4>
        </br>
        </br>
        <div id="displayForm" <c:if test="${!peekIsOpenBack}">style="display:none"</c:if>>
                <%--
                            <h4  >溢价金额:   <label><input name="fee" type="number" value="${peekOverFee}" max="999" min="0" step="0.01"  />元 </label></h4>
                --%>
            <h4>溢价金额:


                    <%--
                                    <input name="fee" type="text" value="${peekOverFee}"  />元
                    --%>

<%--
                <form:input path="fee" type="text" value="${peekOverFee}"/>元
--%>
                <input name="fee" type="number" value="${peekOverFee}" step="0.01" />元



            </h4>
            </br>
            </br>
            <h4>高峰期设置: &nbsp; </h4>

            <table>
                <tbody id="files" name="filess">


                <c:forEach items="${list}" var="item" varStatus="status">
                    <tr>
                        <th id="th_${status.index}">
                        <td id="td_${status.index}">
                            <h4>
                                <select name="weekStart" style="width:90px;">
                                    <OPTION value="1" <c:if test="${'1' eq item.weekStart}">selected</c:if>>星期一</OPTION>
                                    <OPTION value="2" <c:if test="${'2' eq item.weekStart}">selected</c:if>>星期二</OPTION>
                                    <OPTION value="3" <c:if test="${'3' eq item.weekStart}">selected</c:if>>星期三</OPTION>
                                    <OPTION value="4" <c:if test="${'4' eq item.weekStart}">selected</c:if>>星期四</OPTION>
                                    <OPTION value="5" <c:if test="${'5' eq item.weekStart}">selected</c:if>>星期五</OPTION>
                                    <OPTION value="6" <c:if test="${'6' eq item.weekStart}">selected</c:if>>星期六</OPTION>
                                    <OPTION value="7" <c:if test="${'7' eq item.weekStart}">selected</c:if>>星期天</OPTION>
                                </select>

                                <label> ----- </label>
                                <select name="weekEnd" style="width:90px;">
                                    <OPTION value="1" <c:if test="${'1' eq item.weekEnd}">selected</c:if>>星期一</OPTION>
                                    <OPTION value="2" <c:if test="${'2' eq item.weekEnd}">selected</c:if>>星期二</OPTION>
                                    <OPTION value="3" <c:if test="${'3' eq item.weekEnd}">selected</c:if>>星期三</OPTION>
                                    <OPTION value="4" <c:if test="${'4' eq item.weekEnd}">selected</c:if>>星期四</OPTION>
                                    <OPTION value="5" <c:if test="${'5' eq item.weekEnd}">selected</c:if>>星期五</OPTION>
                                    <OPTION value="6" <c:if test="${'6' eq item.weekEnd}">selected</c:if>>星期六</OPTION>
                                    <OPTION value="7" <c:if test="${'7' eq item.weekEnd}">selected</c:if>>星期天</OPTION>
                                </select>
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <input name="hourStart" type="number" step="1" max="23" min="0" style="width:70px;"
                                       value="${item.hourStart}"/>
                                <label>时&nbsp;&nbsp;</label>
                                    <%--    <input name="minuteStart" type="number" step="1" max="59" min="0" style="width:70px;"
                                               value="${item.minuteStart}"/>--%>

                                <select name="minuteStart" style="width:90px;">
                                    <OPTION value="0" <c:if test="${'0' eq item.minuteStart}">selected</c:if>>00
                                    </OPTION>
                                    <OPTION value="30" <c:if test="${'30' eq item.minuteStart}">selected</c:if>>30
                                    </OPTION>
                                </select>
                                <label>分 ----- </label>
                                <input name="hourEnd" type="number" step="1" max="23" min="0" style="width:70px;"
                                       value="${item.hourEnd}"/>
                                <label>时&nbsp;&nbsp;</label>
                                    <%-- <input name="minuteEnd" type="number" step="1" max="59" min="0" style="width:70px;"
                                            value="${item.minuteEnd}"/>--%>

                                <select name="minuteEnd" style="width:90px;">
                                    <OPTION value="0" <c:if test="${'0' eq item.minuteEnd}">selected</c:if>>00</OPTION>
                                    <OPTION value="30" <c:if test="${'30' eq item.minuteEnd}">selected</c:if>>30
                                    </OPTION>
                                </select>
                                <label>分</label>
                                &nbsp; &nbsp; <input type="button" id="add" value="增加" onclick="addfile();"> <a
                                    href="javascript:delefile(${status.index});">删除</a>


                            </h4>
                        </td>

                        </th>

                    </tr>

                </c:forEach>


                </tbody>
            </table>


        </div>


    </div>


    </br>
    </br>
    <td><input type="submit" name="Submit" value="提交" class="btn"  <%--onclick="alert('提交成功')"--%>/></td>
    </br>
    </br>
    <td>注:跨0点设置时请参照如下格式:23:30-0:00  0:00-1:30</td>

</form:form>


</body>
</html>
