<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>充送活动管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
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

///////////////////////////////////////////////////////////////////////////////////////
            var MaxInputs = 8; //maximum input boxes allowed
            var InputsWrapper = $("#InputsWrapper"); //Input boxes wrapper ID
            var AddButton = $("#AddMoreFileBox"); //Add button ID

            var InputsWrapper1 = $("#InputsWrapper1"); //Input boxes wrapper ID
            var AddButton1 = $("#AddMoreFileBox1"); //Add button ID

            var x = '<%=request.getAttribute("length")%>';
            var x1 = '<%=request.getAttribute("length1")%>';
            var index = x;
            var index1 = x1;
            $(AddButton).click(function (e)  //on add input button click
            {
                if (x <= MaxInputs) //max input box allowed
                {
                    //add input box
                    $(InputsWrapper).append('<div><label>满&nbsp;</label>' +
                        '<input type="text" name="fk" value="" class="required coupon"/>' +
                        '<label>&nbsp;送&nbsp;</label>' +
                        '<input type="text" name="fv" value="" class="required coupon1"/>' +
                        '<a href="#" class="removeclass">&nbsp;删除&nbsp;</a></span></p></div>');
                    x++; //text box increment
                    index++;
                }
                return false;
            });

            $(InputsWrapper).on("click", ".removeclass", function (e) { //user click on remove text
                if (x > 1) {
                    $(this).parent('div').remove(); //remove text box
                    x--; //decrement textbox
                    index--;
                }
                return false;
            })

            $(AddButton1).click(function (e)  //on add input button click
            {
                if (x1 <= MaxInputs) //max input box allowed
                {
                    //add input box
                    $(InputsWrapper1).append('<div><label>满&nbsp;</label>' +
                        '<input type="text" name="rk" value="" class="required coupon"/>' +
                        '<label>&nbsp;送&nbsp;</label>' +
                        '<input type="text" name="rv" value="" class="required coupon1"/>' +
                        '<a href="#" class="removeclass1">&nbsp;删除&nbsp;</a></span></p></div>');
                    x1++; //text box increment
                    index1++;
                }
                return false;
            });

            $(InputsWrapper1).on("click", ".removeclass1", function (e) { //user click on remove text
                if (x1 > 1) {
                    $(this).parent('div').remove(); //remove text box
                    x1--; //decrement textbox
                    index1--;
                }
                return false;
            })
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <%--<li class="active"><a>所有充送活动</a></li>--%>
    <c:forEach items="${merTypes.type}" var="type">
        <li ><a href="${ctx}/wenwen/marketingcenter/list?merchantType=${type.name}">${type.name}充送活动</a>
        </li>
    </c:forEach>
</ul>
<form id="inputForm" action="${ctx}/wenwen/marketingcenter/save" method="post" class="form-horizontal">
    <tags:message content="${message}"/>

    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">当前商家类型:</label>
                <div class="controls">
                    <input type="text" name="merchantName" value="${merchantName}" readonly="true"/>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">首充设置:</label><a href="#" id="AddMoreFileBox" class="btn btn-info">添加</a>
                <div class="controls">
                    <div id="InputsWrapper">
                        <c:if test="${empty params.param}">
                            <div>
                                <label>满</label>
                                <input type="text" name="fk" value="" class="required coupon"/>
                                <label>送</label>
                                <input type="text" name="fv" value="" class="required coupon1"/>
                            </div>
                        </c:if>
                        <c:forEach items="${params.param}" var="plan" varStatus="ind">
                            <div>
                                <label>满</label>
                                <input type="text" name="fk" value="${plan.k}" class="required coupon"/>
                                <label>送</label>
                                <input type="text" name="fv" value="${plan.v}" class="required coupon1"/>
                                <c:if test="${ind.index ne 0}"> <a href="#" class="removeclass">&nbsp;删除</a></c:if>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span20">
            <div class="control-group">
                <label class="control-label">续充设置:</label><a href="#" id="AddMoreFileBox1" class="btn btn-info">添加</a>
                <div class="controls">
                    <div id="InputsWrapper1">
                        <c:if test="${empty reParams.param}">
                            <div>
                                <label>满</label>
                                <input type="text" name="rk" value="" class="required coupon"/>
                                <label>送</label>
                                <input type="text" name="rv" value="" class="required coupon1"/>
                            </div>
                        </c:if>
                        <c:forEach items="${reParams.param}" var="plan1" varStatus="i">
                            <div>
                                <label>满</label>
                                <input type="text" name="rk" value="${plan1.k}" class="required coupon"/>
                                <label>送</label>
                                <input type="text" name="rv" value="${plan1.v}" class="required coupon1"/>
                                <c:if test="${i.index ne 0}"><a href="#" class="removeclass1">&nbsp;删除</a></c:if>
                            </div>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>


    <div class="form-actions">
        <shiro:hasPermission name="ww:marketingcenter:edit">
            <input class="btn btn-primary" type="submit" value="提交"/>
        </shiro:hasPermission>
    </div>

</form>
</body>
</html>
