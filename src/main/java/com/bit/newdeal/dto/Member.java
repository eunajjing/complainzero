package com.bit.newdeal.dto;

public class Member {
	private String id;
	private String pw;
	private String nickname;
	private int enabled;
	private String profile;
	private String roleCode;

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", nickname=" + nickname + ", enabled=" + enabled + ", profile=" + profile
				+ ", roleCode=" + roleCode + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRoleCode() {
		return roleCode;
	}

	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
}
