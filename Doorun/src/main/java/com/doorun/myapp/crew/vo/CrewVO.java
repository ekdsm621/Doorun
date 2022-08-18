package com.doorun.myapp.crew.vo;

import org.springframework.web.multipart.MultipartFile;

public class CrewVO {
	
	private int id;
	private String name;
	private String master;
	private String image_file;
	private String background_img;
	private String describe;
	private String distance;
	private int member;
	private MultipartFile uploadFile1;
	private MultipartFile uploadFile2;
	private String temp_area;
	private String temp_area2;
	private String area;
	
	
	public CrewVO() {
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getMaster() {
		return master;
	}
	
	


	public void setMaster(String master) {
		this.master = master;
	}


	public String getImage_file() {
		return image_file;
	}


	public void setImage_file(String image_file) {
		this.image_file = image_file;
	}
	
	


	public String getBackground_img() {
		return background_img;
	}


	public void setBackground_img(String background_img) {
		this.background_img = background_img;
	}


	public String getDescribe() {
		return describe;
	}


	public void setDescribe(String describe) {
		this.describe = describe;
	}


	public int getMember() {
		return member;
	}


	public void setMember(int member) {
		this.member = member;
	}


	public MultipartFile getUploadFile1() {
		return uploadFile1;
	}


	public void setUploadFile1(MultipartFile uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}


	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}


	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}


	public String getDistance() {
		return distance;
	}


	public void setDistance(String distance) {
		this.distance = distance;
	}


	public String getTemp_area() {
		return temp_area;
	}


	public void setTemp_area(String temp_area) {
		this.temp_area = temp_area;
	}


	public String getTemp_area2() {
		return temp_area2;
	}


	public void setTemp_area2(String temp_area2) {
		this.temp_area2 = temp_area2;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
