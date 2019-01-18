package com.bit.newdeal.dao;

import java.util.List;
import java.util.Map;
import com.bit.newdeal.dto.Report;

public interface reportDao {
  public List<Report> selectReport();
  public int insertReport(Report report);
  public int updateReport(Map<String, Object> params);
}
