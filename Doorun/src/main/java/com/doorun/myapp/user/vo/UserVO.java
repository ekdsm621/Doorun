package com.doorun.myapp.user.vo;

import java.sql.Date;


public class UserVO {
	private String login;

	private String name;
	private String id;
	private String password;
	private String email;
	private String phone;
	private double totaldistance;
	private double totalduration;
	private String profile_image;
	private String introduce;
	private String nickname;
	
	private String postcode;
	private String address_road;
	private String address_detail;
	
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getTotaldistance() {
		return totaldistance;
	}
	public void setTotaldistance(double totaldistance) {
		this.totaldistance = totaldistance;
	}
	public double getTotalduration() {
		return totalduration;
	}
	public void setTotalduration(double totalduration) {
		this.totalduration = totalduration;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress_road() {
		return address_road;
	}
	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	@Override
	public String toString() {
		return "UserVO [login=" + login + ", name=" + name + ", id=" + id + ", password=" + password + ", email="
				+ email + ", totaldistance=" + totaldistance + ", totalduration=" + totalduration + ", profile_image="
				+ profile_image + ", introduce=" + introduce + ", nickname=" + nickname + ", postcode=" + postcode
				+ ", address_road=" + address_road + ", address_detail=" + address_detail + "]";
	}
	
	
	
	

}
