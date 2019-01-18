package com.bit.newdeal.dto;

import java.util.Date;

public class Comment {
  private int cno;
  private int bno;
  private String id;
  private String cContent;
  private Date writeDate;
  private boolean cDelete;
  
  public int getCno() {
    return cno;
  }
  public void setCno(int cno) {
    this.cno = cno;
  }
  public int getBno() {
    return bno;
  }
  public void setBno(int bno) {
    this.bno = bno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getcContent() {
    return cContent;
  }
  public void setcContent(String cContent) {
    this.cContent = cContent;
  }
  public Date getWriteDate() {
    return writeDate;
  }
  public void setWriteDate(Date writeDate) {
    this.writeDate = writeDate;
  }
  public boolean iscDelete() {
    return cDelete;
  }
  public void setcDelete(boolean cDelete) {
    this.cDelete = cDelete;
  }
}
