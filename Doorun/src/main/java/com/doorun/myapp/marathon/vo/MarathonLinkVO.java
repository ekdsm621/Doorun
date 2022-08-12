package com.doorun.myapp.marathon.vo;

public class MarathonLinkVO {
	
	public MarathonLinkVO() {};
	
	LinkVO link;
	MarathonVO marathon;
	
	public LinkVO getLink() {
		return link;
	}
	public void setLink(LinkVO link) {
		this.link = link;
	}
	public MarathonVO getMarathon() {
		return marathon;
	}
	public void setMarathon(MarathonVO marathon) {
		this.marathon = marathon;
	}
	
	public MarathonLinkVO(MarathonVO marathon , LinkVO link) {
		super();
		this.link = link;
		this.marathon = marathon;
	}
	
	
	

}
