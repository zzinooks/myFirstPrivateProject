package com.web.root.board.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
CREATE TABLE ESMBoard(
write_no NUMBER(10) PRIMARY KEY,
savetime NVARCHAR2(10),
place NVARCHAR2(100),
company NVARCHAR2(100),
emotion NVARCHAR2(100),
reason NVARCHAR2(200),
content NVARCHAR2(3000),
happiness NUMBER(2),
concentration NUMBER(2),
activeness NUMBER(2),
power NUMBER(2),
savedate DATE DEFAULT SYSDATE,
id VARCHAR2(20) NOT NULL
);
 */
public class ESMBoardDTO {

	// 속성(property)
	private int write_no;
	private String savetime;
	private String place;
	private String company;
	private String emotion;
	private String reason;
	private String content;
	private int happiness;
	private int concentration;
	private int activeness;
	private int power;
	private String savedate;
	private String id;
	
	// 생성자
	public ESMBoardDTO() {
		super();
	}
	
	public ESMBoardDTO(int write_no, String savetime, String place, String company, String emotion, String reason,
			String content, int happiness, int concentration, int activeness, int power, String savedate, String id) {
		super();
		this.write_no = write_no;
		this.savetime = savetime;
		this.place = place;
		this.company = company;
		this.emotion = emotion;
		this.reason = reason;
		this.content = content;
		this.happiness = happiness;
		this.concentration = concentration;
		this.activeness = activeness;
		this.power = power;
		this.savedate = savedate;
		this.id = id;
	}

	// getter와 setter
	public int getWrite_no() {
		return write_no;
	}

	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getEmotion() {
		return emotion;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHappiness() {
		return happiness;
	}

	public void setHappiness(int happiness) {
		this.happiness = happiness;
	}

	public int getConcentration() {
		return concentration;
	}

	public void setConcentration(int concentration) {
		this.concentration = concentration;
	}

	public int getActiveness() {
		return activeness;
	}

	public void setActiveness(int activeness) {
		this.activeness = activeness;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	public String getSavedate() {
		return savedate;
	}

	public void setSavedate(String savedate) {
		this.savedate = savedate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
	
	
}
