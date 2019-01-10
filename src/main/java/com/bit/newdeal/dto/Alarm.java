package com.bit.newdeal.dto;

import java.util.Date;

public class Alarm {
  private String alarmCode;
  private Date alarmDate;
  private String isFrom;
  private boolean readCheck;
  private int ano;
  private int alarmTarget;
  
  public String getAlarmCode() {
    return alarmCode;
  }
  public void setAlarmCode(String alarmCode) {
    this.alarmCode = alarmCode;
  }
  public Date getAlarmDate() {
    return alarmDate;
  }
  public void setAlarmDate(Date alarmDate) {
    this.alarmDate = alarmDate;
  }
  public String getIsFrom() {
    return isFrom;
  }
  public void setIsFrom(String isFrom) {
    this.isFrom = isFrom;
  }
  public boolean isReadCheck() {
    return readCheck;
  }
  public void setReadCheck(boolean readCheck) {
    this.readCheck = readCheck;
  }
  public int getAno() {
    return ano;
  }
  public void setAno(int ano) {
    this.ano = ano;
  }
  public int getAlarmTarget() {
    return alarmTarget;
  }
  public void setAlarmTarget(int alarmTarget) {
    this.alarmTarget = alarmTarget;
  }
}
