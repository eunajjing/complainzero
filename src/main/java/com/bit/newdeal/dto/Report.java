package com.bit.newdeal.dto;

public class Report {
  private int rno;
  private String isFrom;
  private String isTo;
  private String targetTypeCode;
  private String targetCode;
  private String reasonCode;
  private String rContent;
  private String processCode;
  
  public int getRno() {
    return rno;
  }
  public void setRno(int rno) {
    this.rno = rno;
  }
  public String getIsFrom() {
    return isFrom;
  }
  public void setIsFrom(String isFrom) {
    this.isFrom = isFrom;
  }
  public String getIsTo() {
    return isTo;
  }
  public void setIsTo(String isTo) {
    this.isTo = isTo;
  }
  public String getTargetTypeCode() {
    return targetTypeCode;
  }
  public void setTargetTypeCode(String targetTypeCode) {
    this.targetTypeCode = targetTypeCode;
  }
  public String getTargetCode() {
    return targetCode;
  }
  public void setTargetCode(String targetCode) {
    this.targetCode = targetCode;
  }
  public String getReasonCode() {
    return reasonCode;
  }
  public void setReasonCode(String reasonCode) {
    this.reasonCode = reasonCode;
  }
  public String getrContent() {
    return rContent;
  }
  public void setrContent(String rContent) {
    this.rContent = rContent;
  }
  public String getProcessCode() {
    return processCode;
  }
  public void setProcessCode(String processCode) {
    this.processCode = processCode;
  }
}
