package com.bit.newdeal.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.newdeal.dao.alarmDao;
import com.bit.newdeal.dto.Alarm;

@Service
public class alarmService {
  @Autowired
  SqlSession session;
  
  public List<Alarm> selectAlarm(String id) {
    return session.getMapper(alarmDao.class).selectAlarm(id);
  }
  
  public int insertAlarm(Alarm alarm) {
    return session.getMapper(alarmDao.class).insertAlarm(alarm);
  }
  
  public int updateAlarm(Alarm alarm) {
    return session.getMapper(alarmDao.class).updateAlarm(alarm);
  }
}
