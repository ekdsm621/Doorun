package com.doorun.myapp.meeting.vo;

public class MeetingVO {
	private int id;
	private String master;
	private String title;
	private String content;
	private String location;
	private String meeting_date;
	private String longitude;
	private String latitude;
	private int total_member;
	private int joined_member;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getMeeting_date() {
		return meeting_date;
	}
	public void setMeeting_date(String meeting_date) {
		this.meeting_date = meeting_date;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getTotal_member() {
		return total_member;
	}
	public void setTotal_member(int total_member) {
		this.total_member = total_member;
	}
	public int getJoined_member() {
		return joined_member;
	}
	public void setJoined_member(int joined_member) {
		this.joined_member = joined_member;
	}
}