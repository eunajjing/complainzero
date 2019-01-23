package com.bit.newdeal.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.newdeal.dao.reportDao;
import com.bit.newdeal.dto.Report;

@Service
public class reportService {
  @Autowired
  SqlSession session;
  
  public List<Report> selectReport() {
    return session.getMapper(reportDao.class).selectReport();
  }
  
  public boolean insertReport(Report report) {
	int result = session.getMapper(reportDao.class).insertReport(report);
    return (result > 0)?true:false;
  }
  
  public int updateReport(Map<String, Object> params) {
    return session.getMapper(reportDao.class).updateReport(params);
  }
}
