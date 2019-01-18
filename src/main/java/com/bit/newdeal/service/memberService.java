package com.bit.newdeal.service;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	  //, MultipartHttpServletRequest request
	  int result = session.getMapper(memberDao.class).insertMember(member);
	  result += session.getMapper(memberDao.class).insertrole(member);
	  return result;
  }
  
  public int updateMember(Member member) {
    return session.getMapper(memberDao.class).updateMember(member);
  }
  
  public List<Member> searchMember(HashMap<String, Object> params) {
    return session.getMapper(memberDao.class).searchMember(params);
  }
  
  public boolean idcheck(String id) {
	Member member = session.getMapper(memberDao.class).selectOneMember(id);
	return (member == null) ? true : false;
  }
  
  public boolean nicknameCheck(String nickname) {
	  int result = session.getMapper(memberDao.class).nicknameCheck(nickname);
	  return (result == 0) ? true : false;
  }
}
