<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>自定义时间报表</title>
	<script src="${ctxStatic}/echarts/echarts.common.min.js" type="text/javascript"></script>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			initChart();
		    $('#myTab a').click(function (e) {
		        e.preventDefault();
		        $(this).tab('show');
		      })

			$(".select_changeAndSubmit").change(function(){
                $("#searchForm").submit();
            });
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }

		function initChart() {
			var chartData = eval('${graphData }');
// 			alert(chartData[0][0].storeName)
//             i:store; j:date
            var dates=new Array(), storeNames=new Array();
            var shoujianDatas=new Array(), paijianDatas = new Array(),
            zitiDatas = new Array(),peisongDatas = new Array(), delayDatas = new Array(), returnBackDatas = new Array();
			for(var i=0; i<chartData.length; i++) {
				for(var j=0; j<chartData[i].length; j++) {
					if(!storeNames[i]) {
						storeNames[i] = chartData[i][j].storeName;
						shoujianDatas[i]= {name:storeNames[i],type:'line'};
						paijianDatas[i]= {name:storeNames[i],type:'line'};
						zitiDatas[i]= {name:storeNames[i],type:'line'};
						peisongDatas[i]= {name:storeNames[i],type:'line'};
						delayDatas[i]= {name:storeNames[i],type:'line'};
						returnBackDatas[i]= {name:storeNames[i],type:'line'};
					}
					if(!shoujianDatas[i].data) {
						shoujianDatas[i].data = new Array();
						paijianDatas[i].data = new Array();
						zitiDatas[i].data = new Array();
						peisongDatas[i].data = new Array();
						delayDatas[i].data = new Array();
						returnBackDatas[i].data = new Array();
					}
					shoujianDatas[i].data[j] = chartData[i][j].shoujianNum;
					paijianDatas[i].data[j] = chartData[i][j].paijianNum;
					zitiDatas[i].data[j] = chartData[i][j].zitiNum;
					peisongDatas[i].data[j] = chartData[i][j].peisongNum;
					delayDatas[i].data[j] = chartData[i][j].delayNum;
					returnBackDatas[i].data[j] = chartData[i][j].returnBackNum;
					
					if(!dates[j]) {
						dates[j] = chartData[i][j].date;
					}
				}
			}
			// legendData:storeNames,xAxisData:dates,
			function ChartOption(title, legendData, xAxisData,series) {
                this.title= { text: title};
                this.tooltip= { trigger: 'axis'};
                this.legend= { data:legendData, top:'bottom'};
                this.xAxis= { data: xAxisData};
                this.yAxis= {
                    type:'value',
                    minInterval: 10,
//                  max:'dataMax',
                    axisLabel: {
                        formatter: '{value}'
                    }
                };
                this.series= series;
            }
			// 
			var shoujianOption = new ChartOption("",storeNames,dates,shoujianDatas);
			var paijianOption = new ChartOption("",storeNames,dates,paijianDatas);
			var zitiOption = new ChartOption("",storeNames,dates,zitiDatas);
			var peisongOption = new ChartOption("",storeNames,dates,peisongDatas);
			var delayOption = new ChartOption("",storeNames,dates,delayDatas);
			var returnBackOption = new ChartOption("",storeNames,dates,returnBackDatas);
			// 基于准备好的dom，初始化echarts实例
			var shoujianChart = echarts.init(document.getElementById('shoujianChart'));
			var paijianChart = echarts.init(document.getElementById('paijianChart'));
			var zitiChart = echarts.init(document.getElementById('zitiChart'));
			var peisongChart = echarts.init(document.getElementById('peisongChart'));
			var delayChart = echarts.init(document.getElementById('delayChart'));
			var returnBackChart = echarts.init(document.getElementById('returnBackChart'));
	        // 使用刚指定的配置项和数据显示图表。
	        shoujianChart.setOption(shoujianOption);
	        paijianChart.setOption(paijianOption);
	        zitiChart.setOption(zitiOption);
	        peisongChart.setOption(peisongOption);
	        delayChart.setOption(delayOption);
	        returnBackChart.setOption(returnBackOption);
	        
	        // init tab data table
	        var shoujianTableDiv = $("#shoujianTableDiv");
	        var shoujianTable = shoujianTableDiv.children("table");
	        
	        // head
	        var th = shoujianTable.find("thead th").first();
	        var td = shoujianTable.find("tbody td").first();
	        for(var i = 0; i < dates.length; i++) {
	        	th.after(th.clone());
	        	td.after(td.clone());
	        }
            for(var j = 0; j <= dates.length; j++) {
                shoujianTable.find("thead th").eq(j+1).html(dates[j]);
            }
	        var tr = shoujianTable.find("tbody tr").first();
	        for(var i = 1; i < shoujianDatas.length; i++) {
	        	tr.after(tr.clone());
	        }

	        var paijianTable = shoujianTable.clone();
	        var zijijianTable = shoujianTable.clone();
	        var peisongjianTable = shoujianTable.clone();
	        var ziliujianTable = shoujianTable.clone();
	        var tuihuijianTable = shoujianTable.clone();

// 	        shoujianDatas
// 	        paijianDatas
// 	        zitiDatas
// 	        peisongDatas
// 	        delayDatas
// 	        returnBackDatas
	        
	        
            for(var i = 0; i < shoujianDatas.length; i++) {
            	for(var j = 0; j <= dates.length; j++) {
                    if(j==0) {
                        shoujianTable.find("tbody tr").eq(i).find("td").eq(j).html(shoujianDatas[i].name);
                        paijianTable.find("tbody tr").eq(i).find("td").eq(j).html(paijianDatas[i].name);
                        zijijianTable.find("tbody tr").eq(i).find("td").eq(j).html(zitiDatas[i].name);
                        peisongjianTable.find("tbody tr").eq(i).find("td").eq(j).html(peisongDatas[i].name);
                        ziliujianTable.find("tbody tr").eq(i).find("td").eq(j).html(delayDatas[i].name);
                        tuihuijianTable.find("tbody tr").eq(i).find("td").eq(j).html(returnBackDatas[i].name);
                    }else {
                        shoujianTable.find("tbody tr").eq(i).find("td").eq(j).html(shoujianDatas[i].data[(j-1)]);
                        paijianTable.find("tbody tr").eq(i).find("td").eq(j).html(paijianDatas[i].data[(j-1)]);
                        zijijianTable.find("tbody tr").eq(i).find("td").eq(j).html(zitiDatas[i].data[(j-1)]);
                        peisongjianTable.find("tbody tr").eq(i).find("td").eq(j).html(peisongDatas[i].data[(j-1)]);
                        ziliujianTable.find("tbody tr").eq(i).find("td").eq(j).html(delayDatas[i].data[(j-1)]);
                        tuihuijianTable.find("tbody tr").eq(i).find("td").eq(j).html(returnBackDatas[i].data[(j-1)]);
                    }
            	}
            }
	        
	        $("#paijian").prepend(shoujianTableDiv.clone().empty().append(paijianTable));
	        $("#zijijian").prepend(shoujianTableDiv.clone().empty().append(zijijianTable));
	        $("#peisongjian").prepend(shoujianTableDiv.clone().empty().append(peisongjianTable));
	        $("#ziliujian").prepend(shoujianTableDiv.clone().empty().append(ziliujianTable));
	        $("#tuihuijian").prepend(shoujianTableDiv.clone().empty().append(tuihuijianTable));
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
        <li><a href="${ctx}/wenwen/reportData/list">日报</a></li>
        <li class="active"><a>周报</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="reportData" action="${ctx}/wenwen/reportData/betweenTwoDay" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
        <label>门店 ：</label>
        <form:select path="storeId" class="select_changeAndSubmit">
            <form:option value="" label="-全部-"/>
            <form:options itemValue="value" itemLabel="label" items="${fns:queryStoreListByOfficeId(fns:getUser().office.id)}" htmlEscape="false"/>
        </form:select>

        <label>报表日期：</label><input name="createDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                value='<fmt:formatDate value="${reportData.createDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
               - <input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
                value='<fmt:formatDate value="${reportData.updateDate}" pattern="yyyy-MM-dd"/>' onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'});"/>
        
		&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
        
	</form:form>

<ul class="nav nav-tabs" id="myTab">
  <li class="active"><a href="#gather">汇总</a></li>
  <li><a href="#shoujian">收件</a></li>
  <li><a href="#paijian">派件</a></li>
  <li><a href="#zijijian">自提件</a></li>
  <li><a href="#peisongjian">配送件</a></li>
  <li><a href="#ziliujian">滞留件</a></li>
  <li><a href="#tuihuijian">退回件</a></li>
</ul>
<div class="tab-content">
  <div class="tab-pane active" id="gather">
	<tags:message content="${message}"/>
    <div style="width:100%; overflow: auto">
	<table id="contentTable"  style="table-layout:fixed;" class="table table-striped table-bordered table-condensed">
		<thead><tr>
        <th  class="span1" >门店</th>
        <th  class="span1" >派件人数</th>
        
        <th  class="span1" >派件数</th>
        <th  class="span1" >收件数</th>
        <th  class="span1" >收派比</th>

        <th  class="span1" >平均<br>派件数</th>
        <th  class="span1" >平均<br>收件数</th>
        
        <th  class="span1" >签收</th>
        <th  class="span1" >签收率</th>
        <th  class="span1" >自提件</th>
        <th  class="span1" >自提占比</th>
        <th  class="span1" >配送件</th>
        <th  class="span1" >配送占比</th>
        <th  class="span1" >滞留件</th>
        <th  class="span1" >滞留占比</th>
        <th  class="span1" >退回件</th>
        <th  class="span1" >退回占比</th>
        
<!--         <th  class="span1" >投诉</th> -->
<!--         <th  class="span1" >投诉占比</th> -->
		</tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="reportData">
			<tr>
				<td>${reportData.storeName}</td>
                <td>${reportData.employeeNum}</td>
                
                <td>${reportData.paijianNum}</td>
                <td>${reportData.shoujianNum}</td>
                <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.shoujianNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>

                <td><fmt:formatNumber value="${reportData.paijianNum/days}" maxFractionDigits="2"/></td>
                <td><fmt:formatNumber value="${reportData.shoujianNum/days}" maxFractionDigits="2"/></td>
                
                <td>${reportData.signNum}</td>
                <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.signNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
                <td>${reportData.zitiNum}</td>
                <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.zitiNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
                <td>${reportData.peisongNum}</td>
                <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.peisongNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
                <td>${reportData.delayNum}</td>
                <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.delayNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>
                <td>${reportData.returnBackNum}</td>
                <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.returnBackNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td>

<%--                 <td>${reportData.feedBackNum}</td> --%>
<%--                 <td><c:if test="${reportData.paijianNum gt 0}"><fmt:formatNumber value="${reportData.feedBackNum/reportData.paijianNum*100}" maxFractionDigits="2"/>%</c:if></td> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
    </div>
  </div>
  <div class="tab-pane " id="shoujian">
    <div id="shoujianTableDiv">
    <table id="contentTable"  style="width:100%;table-layout:fixed;" class="table table-striped table-bordered table-condensed">
        <thead><tr>
        <th  class="span1" >门店</th>
        </tr></thead>
        <tbody>
            <tr> <td></td> </tr>
        </tbody>
    </table>
    </div>
    <div id="shoujianChart" class=""  style="width:1500px;height:300px;"></div>
  </div>
  <div class="tab-pane " id="paijian">
    <div id="paijianChart" class=""  style="width:1500px;height:300px;"></div>
  </div>
  <div class="tab-pane " id="zijijian">
    <div id="zitiChart" class=""  style="width:1500px;height:300px;"></div>
  </div>
  <div class="tab-pane " id="peisongjian">
    <div id="peisongChart" class=""  style="width:1500px;height:300px;"></div>
  </div>
  <div class="tab-pane " id="ziliujian">
    <div id="delayChart" class=""  style="width:1500px;height:300px;"></div>
  </div>
  <div class="tab-pane " id="tuihuijian">
    <div id="returnBackChart" class=""  style="width:1500px;height:300px;"></div>
  </div>
</div>
	<div class="pagination">${page}</div>
</body>
</html>




