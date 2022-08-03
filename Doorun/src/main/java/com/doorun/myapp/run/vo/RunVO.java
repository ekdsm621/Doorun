package com.doorun.myapp.run.vo;

public class RunVO {
	
	//location
    private int location_id ;
    private double latitude ;
    private double longitude ;
    
    //journey
    private int id;
    private String member_id ;
    private String duration ;
    private String distance ;
    private String avg_speed ;
    private String running_date;
    
    
	public RunVO() {
	}

	public int getLocation_id() {
		return location_id;
	}

	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getAvg_speed() {
		return avg_speed;
	}

	public void setAvg_speed(String avg_speed) {
		this.avg_speed = avg_speed;
	}

	public String getRunning_date() {
		return running_date;
	}

	public void setRunning_date(String running_date) {
		this.running_date = running_date;
	}

}
