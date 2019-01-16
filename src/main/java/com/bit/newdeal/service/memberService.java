package com.bit.newdeal.service;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.newdeal.dao.memberDao;
import com.bit.newdeal.dto.Member;

@Service
public class memberService {
  @Autowired
  SqlSession session;
  
  public Member selectOneMember(String id) {
    return session.getMapper(memberDao.class).selectOneMember(id);
  }
  
  public List<Member> selectAllMember() {
    return session.getMapper(memberDao.class).selectAllMember();
  }
  
  public int insertMember(Member member) {
    return session.getMapper(memberDao.class).insertMember(member);
  }
  
  public int updateMember(Member member) {
    return session.getMapper(memberDao.class).updateMember(member);
  }
  
  public List<Member> searchMember(HashMap<String, Object> params) {
    return session.getMapper(memberDao.class).searchMember(params);
  }
  
  public int updateMember(String id) {
    return session.getMapper(memberDao.class).blacklist(id);
  }
  
  public int deleteMember(String id) {
	  return session.getMapper(memberDao.class).deleteMember(id);
  }
  
  public String pwCheck(String id) {
	  return session.getMapper(memberDao.class).pwCheck(id);
  }
}
