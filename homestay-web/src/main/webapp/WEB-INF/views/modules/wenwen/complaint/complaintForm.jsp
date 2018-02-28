<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>投诉单详情</title>
    <meta name="decorator" content="default"/>
    <style type="text/css">

    </style>
    <script type="text/javascript">
        $(document).ready(function () {

        

        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/wenwen/task/complaint/list">所有记录</a></li>
    <li class="active"><a href="#">投诉单详情</a></li>
</ul>
<br/>

<tags:message content="${message}"/>
<form:form id="inputForm" action="" method="post"
           class="form-horizontal">
<div class="control-group">   
    <table class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>订单信息</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>订单编号</td>
            <td><label class="lbl" id="taskId">${task.orderNo}</label></td>
        </tr>
        <tr>
            <td>收货人</td>
            <td><label class="lbl">${task.reciveName}</label></td>
        </tr>
        <tr>
            <td>收货电话</td>
            <td><label class="lbl">${task.recivePhone}</label></td>
        </tr>
        <tr>
            <td>收货地址</td>
            <td><label class="lbl">${task.reciveAddress}</label></td>
        </tr>
        <tr>
            <td>配送费</td>
            <td><label class="lbl">${task.deliveryFee/100} 元</label></td>
        </tr>
        <tr>
            <td>骑手小费</td>
            <td><label class="lbl">${task.tipFee/100} 元</label></td>
        </tr>
        <tr>
            <td>应付金额</td>
            <td><label class="lbl">${task.payAmount/100} 元</label></td>
        </tr>
        <tr>
            <td>支付状态</td>
            <td><label class="lbl">${task.payStatusName}</label></td>
        </tr>
        <tr>
            <td>备注</td>
            <td><label class="lbl">${task.remarks}</label></td>
        </tr>
        <tr>
            <td>所属城市</td>
            <td><label class="lbl">${task.senderCity}</label></td>
        </tr>
    </tbody>
    </table>
</div>
<div class="control-group">
    <table class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>商家信息</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>商家编号</td>
            <td><label class="lbl"><a href="${ctx}/wenwen/userInfo/merchantUserForm?id=${task.merchantId}">${task.merchantId}</a></label></td>
        </tr>
        <tr>
            <td>商家名称</td>
            <td><label class="lbl">${task.merchantName}</label></td>
        </tr>
        <tr>
            <td>商家地址</td>
            <td><label class="lbl">${task.merchantAddress}</label></td>
        </tr>
        <tr>
            <td>商家电话</td>
            <td><label class="lbl">${task.merchantPhone}</label></td>
        </tr>
    </tbody>
    </table>
</div>
<div class="control-group">
    <table class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>骑手信息</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>骑手编号</td>
            <td><label class="lbl"><a href="${ctx}/wenwen/userInfo/riderUserForm?id=${task.riderId}">${task.riderId}</a></label></td>
        </tr>
        <tr>
            <td>骑手名称</td>
            <td><label class="lbl">${task.riderName}</label></td>
        </tr>
        <tr>
            <td>骑手电话</td>
            <td><label class="lbl">${task.riderPhone}</label></td>
        </tr>
    </tbody>
    </table>
</div>
<div class="control-group">
    <table class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>状态信息</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>订单状态</td>
            <td><label class="lbl">${task.orderStatusName}</label></td>
        </tr>
        <tr>
            <td>创建订单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></label></td>
        </tr>
        <tr>
            <td>接单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.acceptTime}" pattern="yyyy-MM-dd hh:mm:ss"/></label></td>
        </tr>
        <tr>
            <td>取货时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.pickTime}" pattern="yyyy-MM-dd hh:mm:ss"/></label></td>
        </tr>
    </tbody>
    </table>
</div>
<div class="control-group">
    <table class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th>投诉信息</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>创建人</td>
            <td><label class="lbl">${task.createBy}</label></td>
        </tr>
        <tr>
            <td>创建投诉单时间</td>
            <td><label class="lbl"><fmt:formatDate value="${task.createDate}" pattern="yyyy-MM-dd hh:mm:ss"/></label></td>
        </tr>
        <tr>
            <td>投诉原因</td>
            <td><label class="lbl">${task.reason}</label></td>
        </tr>
        <tr>
            <td>处理人</td>
            <td><label class="lbl">${task.updateBy}</label></td>
        </tr>
        <tr>
            <td>处理方案</td>
            <td><label class="lbl">${task.handleMsg}</label></td>
        </tr>
        <tr>
            <td>处罚对象</td>
            <td><label class="lbl">${task.handleObjectName}</label></td>
        </tr>
        <tr>
            <td>处罚金额</td>
            <td><label class="lbl">${task.forfeit/100.0 == 0?"":(task.forfeit/100.0)} 元</label></td>
        </tr>
    </tbody>
    </table>
</div>
    <c:if test="${task.complaintStatus eq '0'}">
        <div class="form-actions">
            <a href="${ctx}/wenwen/task/complaint/form?id=${complaintId}&merchantId=${task.merchantId}&riderId=${task.riderId}&orderNo=${task.orderNo}" class="fancybox btn" data-fancybox-type="iframe" >处理投诉</a>
        </div>
    </c:if>
</form:form>
</body>
</html>
