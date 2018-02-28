<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>广播距离设置</title>
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


<ul class="nav nav-tabs">
    <li ><a href="${ctx}/wenwen/legworkFee/view">兔快送任务定价设置</a></li>
    <shiro:hasPermission name="ww:legworkDispatchRadius:view">
        <li class="active"><a >兔快送广播距离设置</a></li>
    </shiro:hasPermission>
</ul>

    <form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/legWorkDispatchRadius/execute" method="post"
               class="form-horizontal"    >
        <form:hidden path="id"/>
        <tags:message content="${message}"/>
        <div class="top">
        <div id="displayForm" >
            <br/>
            <h3  >
                广播距离设置:       <input name="dispatchRadiusKiloMiles" type="number" value="${entity.dispatchRadiusKiloMiles}" step="0.1"  min="0.1" max="998.99"/>公里
            </h3>
        </div>
        </div>
        </br>
        </br>
        <td><input type="submit" name="Submit" value="提交" class="btn"  /></td>
</form:form>










</body>
</html>
