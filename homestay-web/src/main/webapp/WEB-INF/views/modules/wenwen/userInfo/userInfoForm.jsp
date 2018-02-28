<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>用户详情</title>

    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            var userId = $("#userId").val();

            var flag = $("#flag").val();
            //商家信息审核通过
            $("#verifySuccess").click(function () {
                if (confirm("确认商家认证通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/merchantStatusVerify?identifyType=MERCHANT&id=" + userId + "&merchantStatus=SUCCESS"+"&merTypeId="+$("#merTypeId").val();
                }
            });

            //商家信息审核不通过 废弃
            $("#verifyFailSub").click(function () {
                if (confirm("确认商家认证不通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/merchantStatusVerify?identifyType=MERCHANT&id=" + userId + "&merchantStatus=FAIL&failReason="+$("#failReason").val()+"&reasonDetail="+$("#reasonDetail").val();
                }
            });
            //商家冻结
            $("#frozen").click(function () {
                if (confirm("确认商家冻结吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/merchantStatusVerify?identifyType=MERCHANT&id=" + userId + "&merchantStatus=FROZEN";
                }
            });


            //货主信息审核通过
            $("#verifySuccessConsignor").click(function () {
                if (confirm("确认货主认证通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/merchantStatusVerify?identifyType=CONSIGNOR&id=" + userId + "&merchantStatus=SUCCESS";
                }
            });

            //货主信息审核不通过
            $("#verifyFailConsignor").click(function () {
                if (confirm("确认货主认证不通过吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/merchantStatusVerify?identifyType=CONSIGNOR&id=" + userId + "&merchantStatus=FAIL";
                }
            });
            //货主冻结
            $("#frozenConsignor").click(function () {
                if (confirm("确认货主冻结吗？")) {
                    window.location.href = "${ctx}/wenwen/userInfo/merchantStatusVerify?identifyType=CONSIGNOR&id=" + userId + "&merchantStatus=FROZEN";
                }
            });
        });



    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/userInfo/riderUserList">骑手用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/merchantUserList">商家用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/driverUserList">司机用户</a></li>
    <c:if test="${flag eq 'merchant'}">
        <li class="active"><a href="#">商家详情</a></li>
    </c:if>
    <c:if test="${flag eq 'rider'}">
        <li class="active"><a href="#">骑手详情</a></li>
    </c:if>
    <li><a href="${ctx}/wenwen/userInfo/userAccountForm?id=${entity.accountId}&from=${flag}">账户明细</a></li>

</ul>
<br/>

<form:form id="inputForm" modelAttribute="entity" action="${ctx}/wenwen/userInfo/merchantStatusVerify"  method="post" class="form-horizontal">
    <form:hidden path="userId" />
    <input id="userId" name ="id" type="hidden" value="${entity.userId}"/>
    <input id="identifyType" name="identifyType" type="hidden" value="MERCHANT"/>
    <input id="merchantStatus" name="merchantStatus" type="hidden" value="FAIL"/>



    <input id="flag" type="hidden" value="${flag}"/>
    <tags:message content="${message}"/>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">用户编号:</label>
                <div class="controls">
                    <label class="lbl">${entity.userId}</label>
                </div>
            </div>
        </div>
        <c:if test="${flag eq 'merchant'}">
            <div class="span50">
                <div class="control-group">
                    <label class="control-label">认证类型:</label>
                    <div class="controls">
                        <label class="lbl" >${fns:getDictLabel(entity.identifyType, 'tubobo_user_identify_type', '')}</label>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">货主认证状态:</label>
                <div class="controls">
                    <c:if test="${flag eq 'merchant'}">
                        <label class="lbl" >${fns:getDictLabel(entity.consignorStatus, 'tubobo_user_authentication', '')}</label>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">商家认证状态:</label>
                <div class="controls">
                    <c:if test="${flag eq 'merchant'}">
                        <label class="lbl" >${fns:getDictLabel(entity.merchantStatus, 'tubobo_user_authentication', '')}</label>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">申请时间:</label>
                <div class="controls">
                    <label class="lbl"><fmt:formatDate value="${entity.applyDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">通过时间:</label>
                <div class="controls">
                    <label class="lbl"><fmt:formatDate value="${entity.verifyDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">所属城市:</label>
                <div class="controls">
                    <label class="lbl">${entity.addressCity}</label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">bd邀请码:</label>
                <div class="controls">
                    <label class="lbl">${entity.bdCode}</label>
                </div>
            </div>
        </div>

        <div class="span50">
            <div class="control-group">
                <label >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bd邀请码绑定时间:</label>
                    <label >
                        <fmt:formatDate value="${entity.bdUpdateDate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/>
                    </label>
            </div>
        </div>

    </div>


    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">资金账户:</label>

                <div class="controls">
                    <label class="lbl" >${entity.accountId}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">银行:</label>
                <div class="controls">
                    <label class="lbl">${accountInfo.bankName}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">卡号:</label>
                <div class="controls">
                    <label class="lbl">${accountInfo.bankCard}</label>
                </div>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${flag eq 'rider'}">
            <div class="row">
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">骑手姓名:</label>
                        <div class="controls">
                            <label class="lbl">${entity.realName}</label>
                        </div>
                    </div>
                </div>
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">联系方式:</label>
                        <div class="controls">
                            <label class="lbl">${entity.phone}</label>
                        </div>
                    </div>
                </div>
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">身份证号:</label>
                        <div class="controls">
                            <label class="lbl">${entity.idCardNo}</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">身份证正面照:</label>
                        <div class="controls">
                            <img src="${entity.idCardImageFront}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">身份证反面照:</label>
                        <div class="controls">
                            <img src="${entity.idCardImageBack}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">健康证:</label>
                        <div class="controls">
                            <img src="${entity.healthCardImage}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${flag eq 'merchant'}">
            <div class="row">
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">店铺名称:</label>
                        <div class="controls">
                            <label class="lbl">${entity.merchantName}</label>
                        </div>
                    </div>
                </div>
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">联系方式:</label>
                        <div class="controls">
                            <label class="lbl">${entity.phone}</label>
                        </div>
                    </div>
                </div>
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">身份证号:</label>
                        <div class="controls">
                            <label class="lbl">${entity.idCardNo}</label>
                        </div>
                    </div>
                </div>
                <div class="span50">
                    <div class="control-group">
                        <label class="control-label">店铺地址:</label>
                        <div class="controls">
                            <label class="lbl">${entity.addressProvince} ${entity.addressCity} ${entity.addressDistrict} ${entity.addressStreet} ${entity.addressDetail}</label>
                        </div>
                    </div>
                </div>
             </div>

            <div class="row">
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">身份证正面照:</label>
                        <div class="controls">
                            <img src="${entity.idCardFrontImageUrl}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">身份证反面照:</label>
                        <div class="controls">
                            <img src="${entity.idCardBackImageUrl}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">第一张店铺合照:</label>
                        <div class="controls">
                            <img src="${entity.shopImageUrl}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">第二张店铺合照:</label>
                        <div class="controls">
                            <img src="${entity.shopImageUrl2}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">卫生许可证:</label>
                        <div class="controls">
                            <img src="${entity.hygieneLicense}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
                <div class="span20">
                    <div class="control-group">
                        <label class="control-label">营业执照:</label>
                        <div class="controls">
                            <img src="${entity.shopLicencesImgUrl}" height="300" width="300"/>
                        </div>
                    </div>
                </div>
            </div>
        </c:when>
    </c:choose>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">营业执照编号:</label>
                <div class="controls">
                    <label class="lbl">${entity.shopLicencesNo}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">所属服务商ID:</label>
                <div class="controls">
                    <label class="lbl">${entity.providerId}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">所属服务商名称:</label>
                <div class="controls">
                    <label class="lbl">${entity.providerName}</label>
                </div>
            </div>
        </div>

        <div class="span50">
            <div class="control-group">
                <label class="control-label">商家类型:</label>
                <div class="controls">
                    <label class="lbl">
                        <c:forEach var="value" items="${merchantTypeList}">
                                <c:if test="${entity.merTypeId == value.id}">
                                    <c:out value="${value.name}"/>
                                </c:if>
                        </c:forEach>
                    </label>
                </div>
            </div>
        </div>

    </div>
    <div class="form-actions" align="center" id="div1">
        <c:if test="${flag eq 'merchant' || flag eq 'rider'}">
            <%--<shiro:hasPermission name="ww:userInfo:verify">--%>
            <input class="btn btn-primary " type="button" id="choseMerType"  value="通过(商家)"/>&nbsp;
            <input class="btn btn-primary" type="button" id="verifyFail" value="不通过(商家)"/>&nbsp;
            <div id="reason"  hidden style="display: none">
                <h3>请选择审核失败原因</h3>
                <br/>
                <select id="failReason" name="failReason">
                    <option value="请选择">请选择</option>
                    <option value="身份证照片不合格">身份证照片不合格</option>
                    <option value="店铺照片不合格">店铺照片不合格</option>
                    <option value="营业执照照片不合格">营业执照照片不合格</option>
                    <option value="本人与身份证不符">本人与身份证不符</option>
                    <option value="身份证已过期">身份证已过期</option>
                    <option value="其他" >其他(请在下方填写说明)</option>
                </select>

       <%--         <form:select path="failReason" class="input-small select_changeAndSubmit">
                    <form:option value="" label="-请选择原因-"/>
                    <form:options itemValue="value" itemLabel="label" items="${fns:getDictList('merchant_order_status')}"
                                  htmlEscape="false"/>
                </form:select>--%>
                <br/>
                <div id="reasonDetailh3" style="display: none">
                    请填写原因:
                    <br/>
                    <textarea  id="reasonDetail" type="text" name="reasonDetail" maxlength="30" ></textarea>
<%--
                    <input id="reasonDetail" type="text" name="reasonDetail" maxlength="30" >

--%>
                </div>
                <input class="btn btn-primary" type="submit" id="verifyFailSub11" value="确认提交(审核失败)"/>&nbsp;
                <br/>
                <br/>
            </div>

            <div id="choseMerchantType"  hidden style="display: none">
                <h3>请选择商家类型</h3>
                <br/>
                <select id="merTypeId" name="merTypeId">
                    <option value="${value.id}">
                            -请选择-
                    </option>
                    <c:forEach var="value" items="${merchantTypeList}">
                        <option value="${value.id}">
                                ${value.name}
                        </option>
                    </c:forEach>
                </select>
                <input class="btn btn-primary" type="button" id="verifySuccess" value="通过(商家)"/>&nbsp;
            </div>

                <input class="btn btn-primary" type="button" id="frozen" value="冻结(商家)"/>&nbsp;
            <%--</shiro:hasPermission>--%>
        </c:if>
        <c:if test="${flag eq 'merchant'}">
            <%--<shiro:hasPermission name="ww:userInfo:verify">--%>
            <input class="btn btn-primary" type="button" id="verifySuccessConsignor" value="通过(货主)"/>&nbsp;
            <input class="btn btn-primary" type="button" id="verifyFailConsignor" value="不通过(货主)"/>&nbsp;
            <input class="btn btn-primary" type="button" id="frozenConsignor" value="冻结(货主)"/>&nbsp;
            <%--</shiro:hasPermission>--%>
        </c:if>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>


    </div>

    <%--<div class="form-actions">--%>
    <%--&lt;%&ndash;<c:if test="${task.taskStatus eq 'INIT' || task.taskStatus eq 'REALLOT' || task.taskStatus eq 'ALLOTED' || task.taskStatus eq 'ASSIGNED'}">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<shiro:hasPermission name="ww:merchant:task:view">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<input class="btn btn-primary" type="button" id="cancelButton" value="取消订单"/> &nbsp;&nbsp;&ndash;%&gt;--%>
    <%--&lt;%&ndash;</shiro:hasPermission>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
    <%--<input class="btn btn-primary" type="button" value="返 回" onclick="window.location.href='${ctx}/wenwen/userInfo/list'"/>--%>
    <%--</div>--%>
</form:form>
<script>
    $("#verifyFail").click(function () {
        document.getElementById("reason").style.display="block";
        document.getElementById("verifySuccess").style.display="none";
        document.getElementById("choseMerType").style.display="none";
        document.getElementById("verifyFail").style.display="none";
        document.getElementById("verifySuccessConsignor").style.display="none";
        document.getElementById("verifyFailConsignor").style.display="none";
        document.getElementById("frozenConsignor").style.display="none";
        document.getElementById("frozen").style.display="none";
    });

    $("#choseMerType").click(function () {
        document.getElementById("choseMerchantType").style.display="block";
        document.getElementById("verifyFail").style.display="none";
        document.getElementById("verifySuccessConsignor").style.display="none";
        document.getElementById("verifyFailConsignor").style.display="none";
        document.getElementById("frozenConsignor").style.display="none";
        document.getElementById("frozen").style.display="none";
        document.getElementById("choseMerType").style.display="none";
    });

    $(document).on("change",'select#failReason',function(){
        var reason=this.value
        if (reason=="其他"){
            document.getElementById("reasonDetailh3").style.display="block";

        }else{
            document.getElementById("reasonDetailh3").style.display="none";

        }

         });
</script>
</body>
</html>
