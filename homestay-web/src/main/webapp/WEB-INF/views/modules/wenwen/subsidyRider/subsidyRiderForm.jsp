<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2017/7/12
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>骑手补贴添加</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {
            // 初始化省市下拉选
            var pcdJsonList = eval('${fns:queryPcdJson()}');
            var provinceCode = $('input[name="returnProvinceCode"]').val();
            var cityCode = $('input[name="returnCityCode"]').val();
            var areaCode = $('input[name="returnAreaCode"]').val();

            //addressInit(pcdJsonList, "provinceCode", "cityCode", "areaCode", $("#provinceName").val(), $("#cityName").val(), $("#areaName").val());
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


            $("#inputForm").validate({
                rules:{
                    sort: { number:true, maxlength:10 }
                },
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
        });
    </script>
</head>
<body>
    <ul class="nav nav-tabs">
        <li><a href="${ctx}/wenwen/subsidyRider/view?orderType=crowdOrder">骑手补贴设置记录</a></li>
        <li class="active"><a href="#">补贴详情</a></li>
    </ul><br/>

    <form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/subsidyRider/save" method="post" enctype="multipart/form-data" class="form-horizontal">
        <form:hidden path="id"/>
        <tags:message content="${message}"/>
        <input name="orderType" value="${orderType}" type="hidden"/>
        <input name="returnProvinceCode" value="${entity.provinceCode}" type="hidden"/>
        <input name="returnCityCode" value="${entity.cityCode}" type="hidden"/>
        <input name="returnAreaCode" value="${entity.areaCode}" type="hidden"/>

        <div class="row">
            <div class="control-group">


            <label class="control-label">补贴城市:</label>
                        &nbsp;&nbsp;&nbsp; &nbsp; 省:
                        <form:select path="provinceCode" class="required" id="provinceCode">
<%--
                            <form:option value="${entity.provinceName}"></form:option>
--%>

                        </form:select>
                        <form:hidden path="provinceName"/>
                        市:
                        <form:select path="cityCode" class="required" id="cityCode" >
<%--
                            <form:option value="${entity.cityName}"></form:option>
--%>
                        </form:select>
                        <form:hidden path="cityName"/>
                        区:<form:select path="areaCode" class="required" id="areaCode">

<%--
                          <form:option value="${entity.areaName}"></form:option>
--%>

                           </form:select>
                        <form:hidden path="areaName"/>
            </div>


        </div>
      <c:if test="${entity.provinceCode!=null}">
        <div class="row">
            <div class="control-group">


                <label class="control-label">&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp当前补贴城市:</label>
                &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;省:
                    ${entity.provinceName}
                市:
                    ${entity.cityName}
                区:
                    ${entity.areaName}
            </div>


        </div>
        </c:if>

        <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">补贴开始星期:</label>
                <form:select path="subsidyWeekStart" class="input-small">
                    <form:options items="${fns:getDictList('week')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                </form:select>
            </div>
        </div>
         </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">补贴结束星期:</label>
                <form:select path="subsidyWeekEnd" class="input-small">
                    <form:options items="${fns:getDictList('week')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                </form:select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">补贴开始时间:</label>
                <form:select path="subsidyHourStart" class="input-small">
                    <form:options items="${fns:getDictList('hour')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                </form:select>
                <label>时&nbsp;&nbsp;</label>
                <form:select path="subsidyMinuteStart" class="input-small">
                    <form:options items="${fns:getDictList('minute')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                </form:select>
                <label>分</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">补贴结束时间:</label>
                <form:select path="subsidyHourEnd" class="input-small">
                    <form:options items="${fns:getDictList('hour')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                </form:select>
                <label>时&nbsp;&nbsp;</label>
                <form:select path="subsidyMinuteEnd" class="input-small">
                    <form:options items="${fns:getDictList('minute')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
                </form:select>
                <label>分&nbsp;&nbsp;(注：当结束时间为00:00:00时，默认时间设为23:59:59)</label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span10">
            <div class="control-group">
                <label class="control-label">补贴金额:</label>
                <form:input path="subsidyAmount" htmlEscape="false" maxlength="5" class="required"/>
                <label>元</label>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
        <input class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
    </form:form>
</body>
</html>
