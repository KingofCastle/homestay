<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>账户余额明细</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {


        });

        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/userInfo/riderUserList">骑手用户</a></li>
    <li><a href="${ctx}/wenwen/userInfo/merchantUserList">商家用户</a></li>
    <li>
        <c:if test="${flag eq 'merchant'}">
            <a href="${ctx}/wenwen/userInfo/merchantUserForm?id=${entity.userId}">商家详情</a>
        </c:if>
        <c:if test="${flag eq 'rider'}">
            <a href="${ctx}/wenwen/userInfo/riderUserForm?id=${entity.userId}">骑手详情</a>
        </c:if>
    </li>
    <li class="active"><a href="#">账户明细</a></li>
</ul>
<br/>

<form:form id="searchForm" modelAttribute="entity" action="${ctx}/wenwen/userInfo/userAccountForm?id=${entity.id}" method="post"
           class="form-horizontal">

    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>

    <tags:message content="${message}"/>

    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">账户:</label>
                <div class="controls">
                    <label class="lbl" >${entity.id}</label>
                </div>
            </div>
        </div>
        <%--<div class="span50">--%>
            <%--<div class="control-group">--%>
                <%--<label class="control-label">用户编号:</label>--%>
                <%--<div class="controls">--%>
                    <%--<label class="lbl">${entity.userId}</label>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">姓名:</label>
                <div class="controls">
                    <label class="lbl">${entity.name}</label>
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
                    <label class="lbl">${entity.idCard}</label>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">银行:</label>
                <div class="controls">
                    <label class="lbl">${entity.bankName}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">卡号:</label>
                <div class="controls">
                    <label class="lbl">${entity.bankCard}</label>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span50">
            <div class="control-group">
                <label class="control-label">余额:</label>
                <div class="controls">
                    <label class="lbl">${entity.balance/100}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">押金:</label>
                <div class="controls">
                    <label class="lbl" >${entity.deposit/100}</label>
                </div>
            </div>
        </div>
        <div class="span50">
            <div class="control-group">
                <label class="control-label">冻结:</label>
                <div class="controls">
                    <label class="lbl">${entity.frozen/100}</label>
                </div>
            </div>
        </div>
    </div>

    <br><br>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>opsId</th>
            <th>交易类型</th>
            <th>交易金额</th>
            <th>当前余额</th>
            <th>当前冻结</th>
            <th>当前押金</th>
            <th>发生时间</th>
        </tr>
        </thead>
        <c:forEach items="${page.list}" var="entity">
            <tr>
                <td>${entity.opsId}</td>
                <td>${entity.type}</td>
                <td>${entity.amount/100}</td>
                <td>${entity.currentBalance/100}</td>
                <td>${entity.currentFrozen/100}</td>
                <td>${entity.currentDeposit/100}</td>
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/></td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">${page}</div>
    <%--<div class="form-actions" align="center">--%>
    <%--<input class="btn btn-primary" type="button" value="审核通过"/>--%>
    <%--<input class="btn btn-primary" type="button" value="提 交"/>--%>
    <%--</div>--%>
    <div class="form-actions" align="center">
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>
