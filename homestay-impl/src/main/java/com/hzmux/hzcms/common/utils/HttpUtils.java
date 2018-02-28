package com.hzmux.hzcms.common.utils;

import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;


public class HttpUtils {

	private static Logger logger = LoggerFactory.getLogger(HttpUtils.class);

	//请求建立连接超时时间
	private static Integer CONNECTTIMEOUT = 5000;
	//请求响应数据超时时间
	private static Integer SOCKETTIMEOUT = 10000;
	
	public static String get(String url) {
    	String responseText;
    	CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        try {
        	HttpGet method = new HttpGet(url);
        	method.setConfig(RequestConfig.custom().setConnectTimeout(CONNECTTIMEOUT).setSocketTimeout(SOCKETTIMEOUT).build());
        	response = httpClient.execute(method);
        	
            HttpEntity resEntity = response.getEntity();
            responseText = EntityUtils.toString(resEntity,"UTF-8");
			EntityUtils.consume(resEntity);
//			logger.info("get {}, responseText:{}",url,responseText);
            
        } catch (Exception e) {
			logger.error("get {} error.",url);
			logger.error(e.toString());
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
	
	public static String post(String url,String jsonParams){
		String responseText;
		CloseableHttpClient httpClient = HttpClients.createDefault();
		CloseableHttpResponse response = null;
		try {
			HttpPost method = new HttpPost(url);
			method.setConfig(RequestConfig.custom().setConnectTimeout(CONNECTTIMEOUT).setSocketTimeout(SOCKETTIMEOUT).build());
			if (StringUtils.isNotBlank(jsonParams)) {
				StringEntity reqEntity = new StringEntity(jsonParams,"UTF-8");
				reqEntity.setContentType("application/json");
				method.setEntity(reqEntity); 
			}
			response = httpClient.execute(method);
			
			HttpEntity resEntity = response.getEntity();
			responseText = EntityUtils.toString(resEntity,"UTF-8");
			EntityUtils.consume(resEntity);
//			logger.info("post {}, requesetParams:{}, responseText:{} ",url,jsonParams,responseText);

		} catch (Exception e) {
			logger.error("post {} error, requesetParams:{}. ",url,jsonParams);
			logger.error(e.toString());
			responseText = e.getMessage();
		}
		if(null !=response){
			try {
				response.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return responseText;
	}
}