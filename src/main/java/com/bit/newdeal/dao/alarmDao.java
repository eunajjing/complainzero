package com.bit.newdeal.dao;

import java.util.List;
import com.bit.newdeal.dto.Alarm;

public interface alarmDao {
  public List<Alarm> selectAlarm(String id);
  public int insertAlarm(Alarm alarm);
  public int updateAlarm(int ano);
}
