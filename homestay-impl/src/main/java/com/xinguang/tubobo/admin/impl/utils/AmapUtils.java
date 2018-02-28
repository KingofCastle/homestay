package com.xinguang.tubobo.admin.impl.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class AmapUtils {

	public static String BASE_URL_DISTANCE = "http://restapi.amap.com/v3/distance?";

//	兔波波Web	975299afe3fbf8f4af0ede7f8555087f
//	兔波波骑手android	2512f8c8cf1f2fa640b39e186e53b39b
//	兔波波商家ios	622070b3d4591d91a34a8f4e9cf27cd8
//	兔波波商家android	6c7ffb94326d51b13e0e1c85b908bad3
//	test Android平台	342e4035abb44338ed32ed75366ea42c
	public static String AMPA_KEY = "975299afe3fbf8f4af0ede7f8555087f";

	public static String OUTPUT_XML = "XML";
	public static String OUTPUT_JSON = "JSON";

	public static String CHARSET = "UTF-8";

	//请求建立连接超时时间
	private static Integer CONNECTTIMEOUT = 3000;
	//请求响应数据超时时间
	private static Integer SOCKETTIMEOUT = 10000;


	private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

	private static final String MD5 = "MD5";

	public static void main(String[] args) {
		String origins = "116.481028,39.989643|116.581128,39.989443";
		String destination = "116.465302,40.004717";
		String output = OUTPUT_JSON;
//		0：直线距离
//		1：驾车导航距离（仅支持国内坐标）。
//		必须指出，当为1时会考虑路况，故在不同时间请求返回结果可能不同。
//		此策略和driving接口的 strategy=4策略一致
//		2：公交规划距离（仅支持同城坐标）
//		3：步行规划距离（仅支持5km之间的距离）
		String type = "3";
//		String key = AMPA_KEY;
//		JSONObject jsonObject = new JSONObject();
//		jsonObject.put("origins",origins);
//		jsonObject.put("destination",destination);
//		jsonObject.put("output",output);
//		jsonObject.put("type",type);
//		jsonObject.put("key",key);

//		String sig = getSign(jsonObject,key);
		String url = BASE_URL_DISTANCE + "key=" + AMPA_KEY + "&origins=" + origins + "&destination=" + destination + "&type=" + type + "&output=" + output;
		System.out.println(url);

		String respnse = get(url);
		System.out.println(respnse);


//		http://restapi.amap.com/v3/distance?origins=116.481028,39.989643|114.481028,39.989643|115.481028,39.989643&destination=114.465302,40.004717&output=xml&key=<用户的key>
//		http://restapi.amap.com/v3/distance?origins=116.481028,39.989643|114.481028,39.989643|115.481028,39.989643&destination=115.465302,40.004717&output=JSON&type=0&key=342e4035abb44338ed32ed75366ea42c&sig=DImwItmV2351hiBGiyyKsA==
//		http://restapi.amap.com/v3/distance?origins=116.481028,39.989643|114.481028,39.989643|115.481028,39.989643&destination=115.465302,40.004717&key=342e4035abb44338ed32ed75366ea42c&sig=LhpxRj6GeuC1IVXdh7sCGA==
	}

//	public static String getSign(JSONObject jsonObject, String ampaKey) {
//		StringBuffer content = new StringBuffer();
//		// 按照key做首字母升序排列
//		List<String> keys = new ArrayList<String>(jsonObject.keySet());
//		Collections.sort(keys, String.CASE_INSENSITIVE_ORDER);
//		for (int i = 0; i < keys.size(); i++) {
//			String key = keys.get(i);
//			String value = jsonObject.getString(key);
//			// 空串不参与签名
//			if (StringUtils.isBlank(key)) {
//				continue;
//			}
//			content.append("&" + key + "=" + value);
//		}
//		content.append(ampaKey);
//		return encoderByMd5(content.toString().replaceFirst("&",""));
//	}

//	public static String encoderByMd5(String signStr){
//		try {
//			//确定计算方法
//			MessageDigest md5 = MessageDigest.getInstance(MD5);
//			BASE64Encoder base64en = new BASE64Encoder();
//			//加密后的字符串
//			String newstr = base64en.encode(md5.digest(signStr.getBytes(CHARSET)));
//			return newstr;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "Exception";
//		}
//	}

	//	private static String encryptSignStr(String signStr){
//		MessageDigest digest = null;
//		try {
//			digest = MessageDigest.getInstance(MD5);
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
//		digest.update(signStr.getBytes());
//		byte[] bytes = digest.digest();
//		int length = bytes.length;
//		StringBuffer sb = new StringBuffer();
//
//		for (int i = 0; i < length; i++) {
//			sb.append(HEX_DIGITS[(bytes[i] >>> 4) & 0x0f]);
//			sb.append(HEX_DIGITS[bytes[i] & 0xf]);
//		}
//		return sb.toString();
//	}

	public static String get(String url) {
    	String responseText = "";
    	CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
			URL strUrl = new URL(url);
			URI uri = new URI(strUrl.getProtocol(), strUrl.getHost(), strUrl.getPath(), strUrl.getQuery(), null);


        	HttpGet method = new HttpGet(uri);
        	method.setConfig(RequestConfig.custom().setConnectTimeout(CONNECTTIMEOUT).setSocketTimeout(SOCKETTIMEOUT).build());
        	response = httpClient.execute(method);
        	
            HttpEntity resEntity = response.getEntity();
            responseText = EntityUtils.toString(resEntity,CHARSET);
			EntityUtils.consume(resEntity);
//            logger.info("get {}, responseText:{}",url,responseText);
            
        } catch (Exception e) {
//        	logger.error("get {} error.",url);
//			logger.error(e.toString());
			responseText = e.getMessage();
        } finally {
            try {
            	if (response != null) {
            		response.close();
				}
            } catch (Exception e) {
            	e.printStackTrace();
            }
        }
        return responseText;
    }


	

}