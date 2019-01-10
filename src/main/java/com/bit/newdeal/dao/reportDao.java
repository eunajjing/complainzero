package com.bit.newdeal.dao;

import java.util.List;
import com.bit.newdeal.dto.Report;

public interface reportDao {
  public List<Report> selectReport();
  public int insertReport(Report report);
  public int updateReport(Report report);
}
