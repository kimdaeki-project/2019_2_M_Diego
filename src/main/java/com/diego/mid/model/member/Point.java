package com.diego.mid.model.member;

import java.sql.Date;

public class Point {
	private String id;
	private Integer point_value;
	private Date point_date;
	private String contents;
	private Integer total_point; 
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getPoint_value() {
		return point_value;
	}
	public void setPoint_value(Integer point_value) {
		this.point_value = point_value;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getTotal_point() {
		return total_point;
	}
	public void setTotal_point(Integer total_point) {
		this.total_point = total_point;
	}
	
}
