package com.doorun.myapp.user.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class UserVO {
	private String login;

	private String name;
	private String id;
	private String password;
	private String email;
	private String phone;
	private double total_distance;
	private double total_duration;
	private String profile_image;
	private String introduce;
	private String nickname;
	
	private MultipartFile imageFile;
	
	private String postcode;
	private String address_road;
	private String address_detail;
	
	private String member_type;
	
	private int firstday;
	private int secondday;
	private int thirdday;
	private int fourthday;
	private int fifthday;
	private int sixthday;
	private int seventhday;
	
	private String firstday_date;
	private String secondday_date;
	private String thirdday_date;
	private String fourthday_date;
	private String fifthday_date;
	private String sixthday_date;
	private String seventhday_date;
	
	
	
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
	public double getTotal_distance() {
		return total_distance;
	}
	public void setTotal_distance(double total_distance) {
		this.total_distance = total_distance;
	}
	public double getTotal_duration() {
		return total_duration;
	}
	
	public void setTotal_duration(double total_duration) {
		this.total_duration = total_duration;
	}
//	public void setTotalduration(double total_duration) {
//		this.total_duration = total_duration;
//	}
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
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	
	
	
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	
	
	
	public int getFirstday() {
		return firstday;
	}
	public void setFirstday(int firstday) {
		this.firstday = firstday;
	}
	public int getSecondday() {
		return secondday;
	}
	public void setSecondday(int secondday) {
		this.secondday = secondday;
	}
	public int getThirdday() {
		return thirdday;
	}
	public void setThirdday(int thirdday) {
		this.thirdday = thirdday;
	}
	public int getFourthday() {
		return fourthday;
	}
	public void setFourthday(int fourthday) {
		this.fourthday = fourthday;
	}
	public int getFifthday() {
		return fifthday;
	}
	public void setFifthday(int fifthday) {
		this.fifthday = fifthday;
	}
	public int getSixthday() {
		return sixthday;
	}
	public void setSixthday(int sixthday) {
		this.sixthday = sixthday;
	}
	public int getSeventhday() {
		return seventhday;
	}
	public void setSeventhday(int seventhday) {
		this.seventhday = seventhday;
	}

	
	
	
	public String getFirstday_date() {
		return firstday_date;
	}
	public void setFirstday_date(String firstday_date) {
		this.firstday_date = firstday_date;
	}
	public String getSecondday_date() {
		return secondday_date;
	}
	public void setSecondday_date(String secondday_date) {
		this.secondday_date = secondday_date;
	}
	public String getThirdday_date() {
		return thirdday_date;
	}
	public void setThirdday_date(String thirdday_date) {
		this.thirdday_date = thirdday_date;
	}
	public String getFourthday_date() {
		return fourthday_date;
	}
	public void setFourthday_date(String fourthday_date) {
		this.fourthday_date = fourthday_date;
	}
	public String getFifthday_date() {
		return fifthday_date;
	}
	public void setFifthday_date(String fifthday_date) {
		this.fifthday_date = fifthday_date;
	}
	public String getSixthday_date() {
		return sixthday_date;
	}
	public void setSixthday_date(String sixthday_date) {
		this.sixthday_date = sixthday_date;
	}
	public String getSeventhday_date() {
		return seventhday_date;
	}
	public void setSeventhday_date(String seventhday_date) {
		this.seventhday_date = seventhday_date;
	}
	@Override
	public String toString() {
		return "UserVO [login=" + login + ", name=" + name + ", id=" + id + ", password=" + password + ", email="
				+ email + ", total_distance=" + total_distance + ", total_duration=" + total_duration + ", profile_image="
				+ profile_image + ", introduce=" + introduce + ", nickname=" + nickname + ", postcode=" + postcode
				+ ", address_road=" + address_road + ", address_detail=" + address_detail + "]";
	}
	
	
	
	

}
