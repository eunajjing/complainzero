package com.bit.newdeal.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
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
    return session.getMapper(memberDao.class).insertMember(member);
  }
  
  public int updateMember(Member member, MultipartHttpServletRequest multipart) throws Exception {
	  
	  String dbProfile = "";
	  MultipartFile profile = multipart.getFile("img");
	  long fileSize = profile.getSize();
	  
	  if(fileSize > 0) {
		  String originFileName = profile.getOriginalFilename();
		  String path = multipart.getSession().getServletContext().getRealPath("resources/img/profile/");
/*
		  System.out.println(multipart.getClass().getResource(""));
		  System.out.println(multipart.getClass().getResource("").getPath());
		  */
		  String saveFile = path + originFileName;
		  profile.transferTo(new File(saveFile));
		  
		  dbProfile = originFileName;
		  member.setProfile(dbProfile);
	  }
	  
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
