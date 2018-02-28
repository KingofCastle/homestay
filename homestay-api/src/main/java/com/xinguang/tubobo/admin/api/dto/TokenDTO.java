package com.xinguang.tubobo.admin.api.dto;

import java.io.Serializable;

public class TokenDTO implements Serializable{

	private String token;
	private String refreshToken;
	private String name;
	private String phone;

	public TokenDTO(String token, String refreshToken, String name, String phone) {
		this.token = token;
		this.refreshToken = refreshToken;
		this.name = name;
		this.phone = phone;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getRefreshToken() {
		return refreshToken;
	}

	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
