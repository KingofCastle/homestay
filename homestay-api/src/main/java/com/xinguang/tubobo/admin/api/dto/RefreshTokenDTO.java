package com.xinguang.tubobo.admin.api.dto;

import java.io.Serializable;

public class RefreshTokenDTO implements Serializable{

	private String token;
	private String refreshToken;

	public RefreshTokenDTO(String token, String refreshToken) {
		this.token = token;
		this.refreshToken = refreshToken;
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
}
