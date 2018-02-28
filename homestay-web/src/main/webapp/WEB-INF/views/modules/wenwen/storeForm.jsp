<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>门店详情</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=${fns:getConfig('gdKeyWeb')}"></script>
	<style type="text/css">
		body, html, #container {
			height: 300px;
			width: 500px
		}

		.panel {
			background-color: #ddf;
			color: #333;
			border: 1px solid silver;
			box-shadow: 3px 4px 3px 0px silver;
			position: absolute;
			top: 420px;
			right: 1100px;
			border-radius: 5px;
			overflow: hidden;
			line-height: 20px;
		}

		#input {
			width: 250px;
			height: 25px;
			border: 0;
		}
	</style>

</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/wenwen/store/">所有记录</a></li>
		<li class="active"><a href="#">门店详情</a></li>
	</ul><br/>


	<form:form id="inputForm" modelAttribute="store" action="${ctx}/wenwen/store/save" method="post" class="form-horizontal">
	    <form:hidden path="storeId"/>
	    <form:hidden path="storeName"/>
		<tags:message content="${message}"/>
		<input id="longitude" name="longitude" type="hidden" value="${store.longitude}"/>
		<input id="latitude" name="latitude" type="hidden" value="${store.latitude}"/>
		<div class="control-group">
			<label class="control-label">门店编号:</label>
			<div class="controls">
				<label class="lbl">${store.storeCode}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">门店名称:</label>
			<div class="controls">
				<label class="lbl">${store.storeName}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">门店电话:</label>
			<div class="controls">
				<form:input path="storePhone" htmlEscape="false" maxlength="15" class="required phone"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">门店类型:</label>
			<div class="controls">
				<label class="lbl">${fns:getDictLabel(store.storeType, 'sys_office_type', '')}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">门店来源:</label>
			<div class="controls">
				<label class="lbl">${fns:getDictLabel(store.storeSource, 'sys_office_source', '')}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">区域代码:</label>
			<div class="controls">
				<label class="lbl">${store.areaCode}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标准地址:</label>
			<div class="controls">
				<label class="lbl">${store.storeAddressStandard}</label>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">详细地址:</label>
			<div class="controls">
				<form:input path="storeAddressDetail" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">开通快递公司:</label>
			<div class="controls">
				<label class="lbl">
					<c:forEach items="${store.expressCompanyList}" var="company">
                        ${company.companyName}
                    </c:forEach>
				</label>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">地理位置:</label>
			<div class="controls">
				<div id="container" tabindex="0"></div>
				<div class='panel'>
					<input id='input' value='点击地图显示地址/输入地址显示位置' onfocus='this.value=""'>

					<div id='message'></div>
				</div>
			</div>
		</div>

		<c:if test="${store.longitude != null}"><div class="control-group">经度:${store.longitude} 纬度:${store.latitude}</div></c:if>


		<div class="control-group">
			<label class="control-label">乐收登录名:</label>
			<div class="controls">
				<form:input path="lsLoginName" htmlEscape="false" maxlength="20" class=""/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">乐收登录密码:</label>
			<div class="controls">
				<form:input path="lsLoginPwd" htmlEscape="false" maxlength="50" class=""/>
			</div>
		</div>

		<div class="form-actions">
			<input id="btnAppoint" class="btn btn-primary" type="submit" value="保存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

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
			var map = new AMap.Map('container', {
				resizeEnable: true,
				zoom: 13,
				center: [120.19, 30.23]
			});
			var longitude = $("#longitude").val();

			if (longitude) {
				map = new AMap.Map('container', {
					resizeEnable: true,
					zoom: 13,
					center: [${store.longitude}, ${store.latitude}]
				});
			}


			AMap.plugin('AMap.Geocoder', function () {
				var geocoder = new AMap.Geocoder({
					city: "010"//城市，默认：“全国”
				});
				var marker = new AMap.Marker({
					map: map,
					bubble: true
				})
				var input = document.getElementById('input');
				var message = document.getElementById('message');
				map.on('click', function (e) {
					marker.setPosition(e.lnglat);
					$("#longitude").val(e.lnglat.lng);
					$("#latitude").val(e.lnglat.lat);
					geocoder.getAddress(e.lnglat, function (status, result) {
						if (status == 'complete') {
							input.value = result.regeocode.formattedAddress
							message.innerHTML = ''
						} else {
							message.innerHTML = '无法获取地址'
						}
					})
				})

				input.onchange = function (e) {
					var address = input.value;
					geocoder.getLocation(address, function (status, result) {
						if (status == 'complete' && result.geocodes.length) {
							$("#longitude").val(result.geocodes[0].location.lng);
							$("#latitude").val(result.geocodes[0].location.lat);
							marker.setPosition(result.geocodes[0].location);
							map.setCenter(marker.getPosition())
							message.innerHTML = ''
						} else {
							message.innerHTML = '无法获取位置'
						}
					})
				}

			});
		});
		function init() {
			var map = new AMap.Map('container', {
				center: [117.000923, 36.675807],
				zoom: 6
			});

		}
	</script>

</body>
</html>
