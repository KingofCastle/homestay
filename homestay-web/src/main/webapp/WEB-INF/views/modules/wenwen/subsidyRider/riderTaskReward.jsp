<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>骑手任务奖励设置</title>
    <meta name="decorator" content="default"/>
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

          $("#typeClose").click(function () {
              if ($(this).attr("checked")) {
                  $("#displayForm").hide();
              } else {
                  $("#displayForm").show();
              }
          });
          $("#typeOpen").click(function () {
              if ($(this).attr("checked")) {
                  $("#displayForm").show();
              } else {
                  $("#displayForm").hide();
              }
          });
      });


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
                td.innerHTML =' <h4>任务数量累计 <input name="satisfyNumStr" type="number" step="1"   min="1" max="999"  />  单，补贴骑手  ' +
                    '<input name="rewardStr" type="number"  step="1"   min="1" max="999" />元     &nbsp;  &nbsp;  ' +
                    '<input type="button" id="add" value="增加梯度" onclick="addfile();">  <a href="javascript:delefile('+i+');">删除</a>  </h4>';
                i++;
            }

            function delefile(id) {
                document.getElementById('th_' + id).innerHTML = "";
                document.getElementById('td_' + id).innerHTML = "";
            }

      function submit_sure() {
          var satisfyNumStr=document.getElementsByName("satisfyNumStr");
          var rewardStr=document.getElementsByName("rewardStr");
          if(satisfyNumStr.length!=rewardStr.length){
              alert("阶梯奖励达标数量和奖励数量不一致!");
              return false;
          }
          console.log('satisfyNumStr',satisfyNumStr);
          for (var i=0;i<satisfyNumStr.length;i++){
              if(satisfyNumStr[i].value === '' || rewardStr[i].value === '' ){
                  alert("第"+(i + 1) +"个阶梯奖励为空,请填写数字");
                  return false;
              }
          }
          return confirm("确定要提交奖励规则吗?");
      }
    </script>

</head>
<body>

<ul class="nav nav-tabs">
    <shiro:hasPermission name="ww:weatherFeeOver:view">
        <li class="active"><a >骑手任务奖励设置</a></li>
    </shiro:hasPermission>
</ul>

    <form:form id="inputForm" modelAttribute="rewardRule" action="${ctx}/wenwen/riderTaskReward/execute" method="post"
               class="form-horizontal" onsubmit="return submit_sure()">
        <tags:message content="${message}"/>
    <br class="top">
        <h4>
            <c:choose>
                <c:when test="${not empty rewardRule.id}">
                    <input name="id" type="hidden" value="${rewardRule.id}">
                    任务奖励活动开关:
                    <label><input name="isOpen" id="switchClose" type="radio" value="1"
                                  <c:if test="${rewardRule.isOpen.equals('1')}">checked</c:if>/>关闭 </label>
                    <label><input name="isOpen" id="switchOpen" type="radio" value="0"
                                  <c:if test="${rewardRule.isOpen.equals('0')}">checked</c:if>/>开启 </label>
                </c:when>
                <c:otherwise>
                    <label><input name="isOpen" type="hidden" value="0"></label>
                </c:otherwise>
            </c:choose>
        </h4>
        </br>
        </br>
        <h4>
            <input name="returnProvinceCode" value="${rewardRule.provinceCode}" type="hidden" />
            <input name="returnCityCode" value="${rewardRule.cityCode}" type="hidden"  />
            <input name="returnAreaCode" value="${rewardRule.areaCode}" type="hidden"  />
        </h4>
        <h4>
                城市:
                &nbsp;&nbsp;&nbsp; &nbsp; 省:
                <form:select path="provinceCode" class="required" id="provinceCode"></form:select>
                市:
                <form:select path="cityCode" class="required" id="cityCode" ></form:select>
                <%--&lt;%&ndash;区:&ndash;%&gt;--%>
                <%--<form:select path="areaCode" class="required" id="areaCode" ></form:select>--%>
        </h4>
        <br>
        </br>
        <h4>
            当前区域:&nbsp;
            <span>${rewardRule.provinceName}${rewardRule.cityName}${rewardRule.areaName}</span>
        </h4>
        </br>
    </div>

        <div id="displayForm" <c:if test="${rewardRule.isOpen.equals('1')}">style="display:none"</c:if>>
            <br/>

            <h4>
                奖励类型:<form:select path="ruleType" items="${allRuleType}" itemValue="value" itemLabel="label" htmlEscape="false"></form:select>
            </h4>
            <br/>
            </br>
            <h4>
                时间限制:<form:checkboxes path="timeLimitStr" items="${rewardRule.allTimeRangeArr}" htmlEscape="false" style="margin-left:15px"/>
            </h4>
            </br>
            <br/>
            <div id="first">
                <table>
                    <tbody id="files" name="filess">
                    <c:forEach items="${list}" var="item"  varStatus="status">
                    <tr>
                        <th id="th_${status.index}">
                            <td id="td_${status.index}">
                           <h4>任务数量累计
                               <input name="satisfyNumStr" type="number"  step="1"  value="${item.satisfyNumStr}" min="1" max="999"/>   单，补贴骑手
                               <input name="rewardStr" type="number"  step="1" value="${item.rewardStr}"  min="1" max="999"/>元     &nbsp;  &nbsp;
                               <input type="button" id="add" value="添加梯度" onclick="addfile();">  <a href="javascript:delefile(${status.index});">删除</a>
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
            <input type="submit" name="Submit" value="提交" class="btn" />
            <input type="button" name="" value="返回" class="btn" onclick="history.back()" />
        </td>
</form:form>


</body>
</html>
