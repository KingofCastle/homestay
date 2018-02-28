<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>问问助手下载</title>
<script>

$(function(){ 

    var browser = {
        versions: function() {
            var u = navigator.userAgent, app = navigator.appVersion;
            return {//移动终端浏览器版本信息 
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
            };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    }
    
    var weixinBrowser = navigator.userAgent.toLowerCase();  
    if(weixinBrowser.match(/MicroMessenger/i)=="micromessenger") {//判断是不是微信浏览器
    	
    }else{
        $("#weixinBrowser_div").addClass("dpno");
        
        if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
            $("#download_app_a").attr("href","https://itunes.apple.com/cn/app/tai-he-wang/id954734297?mt=8");
            window.location="https://itunes.apple.com/cn/app/tai-he-wang/id954734297?mt=8";
        }else if (browser.versions.android) {
            $("#download_app_a").attr("href","${ctx}/360taihe.apk");
            window.location="${ctx}/360taihe.apk";
        }
    }
});
</script>
<style>
*{
	margin:0;
	padding:0;
}

.dpno{
    display: none;
}

.appLink{
	width:100%;
}

.textCenter{
	text-align: center;
}

.linkHref{
	display:block;
	background: url("${ctxStatic}/images/appGuide/Download.png") no-repeat;
	width:848px;
	height:160px;
	/* margin-top:55px;
	margin-bottom: 65px; */
	margin:55px auto 65px;
}

.appLogo{
	display:block;
	margin:0 auto 200px;
}

.maskLayer{
	width:100%;
	position: absolute;
	z-index:2;
	left:0;
	top:0;
}
</style>
</head>
<body>
<div  class="appLink">
	<img src="${ctxStatic}/images/appGuide/appdownLinktop1.png" width="100%" />
</div>
	<a id="download_app_a" target="_blank" class="linkHref" href=""></a>
	<img src="${ctxStatic}/images/appGuide/logo.png" width="242" height="77" class="appLogo"/>
	<div id="weixinBrowser_div" class="maskLayer">
		<img src="${ctxStatic}/images/appGuide/maskLayer.png" width="100%"/>
	</div>
</body>
</html>