package com.bit.newdeal.dto;

import java.util.Date;

public class Alarm {
  private String alarmCode;
  private Date alarmDate;
  private String isFrom;
  private int readCheck;
  private int ano;
  private int bno;
  
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
  public int getReadCheck() {
    return readCheck;
  }
  public void setReadCheck(int readCheck) {
    this.readCheck = readCheck;
  }
  public int getAno() {
    return ano;
  }
  public void setAno(int ano) {
    this.ano = ano;
  }
  public int getBno() {
    return bno;
  }
  public void setBno(int bno) {
    this.bno = bno;
  }
  @Override
  public String toString() {
    return "Alarm [alarmCode=" + alarmCode + ", alarmDate=" + alarmDate + ", isFrom=" + isFrom
        + ", readCheck=" + readCheck + ", ano=" + ano + ", bno=" + bno + "]";
  }
}
