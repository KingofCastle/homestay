<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no,email=no"/>
    <title>兔波波APP下载</title>
    <style>
        body { margin: 0; padding: 0; min-height: 100%; font-family: "PingFang SC", "Helvetica Neue", Helvetica, "Microsoft YaHei", STHeiTi, Arial, sans-serif;}
        .hide { display: none; }
        a { text-decoration: none; color: #333; }
        
        #Phone-block { font-size: 0.18rem; }
        .main { height: 3rem; padding-top: 1.6rem;}
        h1,h3 { text-align: center; margin: 0; color: #ffe123; background: #fff;}
        .btn-block {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding-top: 0.3rem;
            background: #ececec;
        }
        #link-zhushou {
            display: block;
            background: #ffe123;
            width: 2.55rem;
            line-height: 0.5rem;
            margin: 0 0 0.3rem 0.6rem;
            border: 1px solid #000;
            border-radius: 0.06rem;
            text-align: center;
        }

        #Android-WeChat-block {
            font-size: 0.18rem;
            padding: 1.6rem 0.3rem 0;
        }
    </style>
</head>  
<body>
    <!-- Change the 'rem' while initializing this page -->
    <script type='text/javascript'>
        document.documentElement.style.fontSize = document.documentElement.clientWidth / 3.75 + 'px';
    </script>

    <!-- Phone -->
    <div id="Phone-block" class="hide">
        <div class="main">
            <h1>兔波波</h1>
            <h3>T O O B O B</h3>
        </div>
        <div class="btn-block">
            <a id="link-zhushou" href="#">兔波波助手</a>
        </div>
    </div>

    <!-- Android-WeChat -->
    <div id="Android-WeChat-block" class="hide">
        <p>提示：</p>
        <p>请点击右上角，选择“在浏览器中打开”</p>
    </div>

    <!-- PC -->
    <div id="PC-block"  class="hide">
    </div>
    <script>
    window.onload=function () {
        /**
         * [urls 跳转地址]
         * @type {Object}
         * 安卓：微信中无法直接下载apk，需要用户使用默认浏览器打开。
         * IOS：微信可以直接提醒用户打开APPStore，不用检测是否是微信打开。
         * PC端：直接转向到jeepei.com就行。
         */
        var urls = {
            androidURL: '', // 安卓不需要跳转
            iosURL: '',     // ISO不需要跳转
            pcURL: 'http://jeepei.com/',
        }

        /**
         * [loadHrefs 骑手端|商家端链接地址]
         * @type {Object}
         */
        var loadHrefs = {
            // IOS
            iosURL: [
                'https://itunes.apple.com/cn/app/%E5%85%94%E6%B3%A2%E6%B3%A2%E9%85%8D%E9%80%81/id1236627460?mt=8',
            ],
            // 安卓
            androidURL: [
                'http://tubobo-sc.oss-cn-shanghai.aliyuncs.com/android/toobob-assistant.apk',
            ],
        }
        /**
         * [browser 设备判断]
         * @type {Object}
         */
        var browser = {
            versions: function() {
                var u = navigator.userAgent;
                var app = navigator.appVersion;
                return {
                    trident: u.indexOf('Trident') > -1, //IE内核
                    presto: u.indexOf('Presto') > -1, //opera内核
                    webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                    gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                    mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                    ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                    android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
                    iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
                    iPad: u.indexOf('iPad') > -1, //是否iPad
                    iPod: u.indexOf('iPod') > -1,
                    webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                    weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                    qq: u.match(/\sQQ/i) == " qq" //是否QQ
                };
            }(),
            language: (navigator.browserLanguage || navigator.language).toLowerCase()
        }

        /**
         * [setTagHrefs 给a标签添加对应设备的链接地址]
         * @param {Array}
         */
        function setTagHrefs(hrefs) {
            var ids = ['link-zhushou'];
            document.getElementById(ids[0]).href = hrefs[0];
        }

        //页面跳转判断
        var urlType = '';
        if (browser.versions.iPhone||browser.versions.iPad||browser.versions.iPod) {
            //这里做了ios的判断
            urlType = 'iosURL';
            setTagHrefs(loadHrefs[urlType]);
            document.getElementById('Phone-block').className = '';

        } else if (browser.versions.android) {
            //这里做了android的判断
            urlType = 'androidURL';

            if(browser.versions.weixin){
                document.getElementById('Android-WeChat-block').className = '';
            }else{
                setTagHrefs(loadHrefs[urlType]);
                document.getElementById('Phone-block').className = '';
            }

        } else {
            //不是以上两个系统就认为是PC版吧！
            document.getElementById('PC-block').className = '';

            urlType = 'pcURL';
            window.location.href=urls[urlType];
        }
    }
    </script>  
</body>  
</html>  