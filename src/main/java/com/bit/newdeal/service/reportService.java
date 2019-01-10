package com.bit.newdeal.service;

import java.util.List;
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
  
  public int insertReport(Report report) {
    return session.getMapper(reportDao.class).insertReport(report);
  }
  
  public int updateReport(Report report) {
    return session.getMapper(reportDao.class).updateReport(report);
  }
}
