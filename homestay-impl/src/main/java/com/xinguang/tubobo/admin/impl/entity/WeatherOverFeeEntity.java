package com.xinguang.tubobo.admin.impl.entity;

import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;
import org.mongodb.morphia.annotations.Indexed;

import java.io.Serializable;
import java.util.Date;

/**
 *
 */
//@Entity()
public class WeatherOverFeeEntity implements Serializable{
	private String choice;
	private String fee;
	private String receiverPcdCode;

	private String weekStart;
	private String weekEnd;
	private String hourStart;
	private String minuteStart;
	private String hourEnd;
	private String minuteEnd;

	public String getWeekStart() {
		return weekStart;
	}

	public void setWeekStart(String weekStart) {
		this.weekStart = weekStart;
	}

	public String getWeekEnd() {
		return weekEnd;
	}

	public void setWeekEnd(String weekEnd) {
		this.weekEnd = weekEnd;
	}

	public String getHourStart() {
		return hourStart;
	}

	public void setHourStart(String hourStart) {
		this.hourStart = hourStart;
	}

	public String getMinuteStart() {
		return minuteStart;
	}

	public void setMinuteStart(String minuteStart) {
		this.minuteStart = minuteStart;
	}

	public String getHourEnd() {
		return hourEnd;
	}

	public void setHourEnd(String hourEnd) {
		this.hourEnd = hourEnd;
	}

	public String getMinuteEnd() {
		return minuteEnd;
	}

	public void setMinuteEnd(String minuteEnd) {
		this.minuteEnd = minuteEnd;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}


	public String getReceiverPcdCode() {
		return receiverPcdCode;
	}

	public void setReceiverPcdCode(String receiverPcdCode) {
		this.receiverPcdCode = receiverPcdCode;
	}
}
