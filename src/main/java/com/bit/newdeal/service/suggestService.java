package com.bit.newdeal.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.newdeal.dao.suggestDao;
import com.bit.newdeal.dto.Suggest;

@Service
public class suggestService {
  @Autowired
  SqlSession session;
  
  public List<Suggest> selectOneSuggest(String id) {
    return session.getMapper(suggestDao.class).selectOneSuggest(id);
  }
  
  public List<Suggest> selectAllSuggest() {
    return session.getMapper(suggestDao.class).selectAllSuggest();
  }
  
  public boolean insertSuggest(Suggest suggest) {
	  int result = session.getMapper(suggestDao.class).insertSuggest(suggest);
    return result > 0 ? true : false;
  }
  
  public int updateSuggest(int sno) {
	    return session.getMapper(suggestDao.class).updateSuggest(sno);
	  }
  
  public List<HashMap> selectMySuggest(String id){
	  return session.getMapper(suggestDao.class).selectMySuggest(id);
  }
}
