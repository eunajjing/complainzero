package com.bit.newdeal.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import javax.mail.MessagingException;
import java.io.File;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.bit.newdeal.dao.memberDao;
import com.bit.newdeal.dto.Member;
import com.bit.newdeal.util.MailHandler;
import com.bit.newdeal.util.TempKey;

@Service
public class memberService {
  @Autowired
  SqlSession session;
  @Autowired
  BCryptPasswordEncoder bCryptPasswordEncoder;
  @Autowired
  private JavaMailSenderImpl mailSender;
  
  public Member selectOneMember(String id) {
    return session.getMapper(memberDao.class).selectOneMember(id);
  }
  
  public List<Member> selectAllMember() {
    return session.getMapper(memberDao.class).selectAllMember();
  }
  
  @Transactional
  public int insertMember(Member member) {
	  //, MultipartHttpServletRequest request
	  member.setPw(bCryptPasswordEncoder.encode(member.getPw()));
	  int result = session.getMapper(memberDao.class).insertMember(member);
	  result += session.getMapper(memberDao.class).insertrole(member);
	  return result;
  }
  
  public int updateMember(Member member, MultipartHttpServletRequest multipart) throws Exception {
	  
	  String dbProfile = "";
	  MultipartFile profile = multipart.getFile("img");
	  long fileSize = profile.getSize();
	  
	  if(fileSize > 0) {
		  int index = profile.getOriginalFilename().lastIndexOf(".");
		  String ext = profile.getOriginalFilename().substring(index + 1);
		  String originFileName = member.getId();
		  String path = multipart.getSession().getServletContext().getRealPath("resources/img/profile/");
		  String saveFile = path + originFileName + '.' + ext;
		  profile.transferTo(new File(saveFile));
		  
		  dbProfile = originFileName + '.' + ext;
		  member.setProfile(dbProfile);
	  }
	  
    return session.getMapper(memberDao.class).updateMember(member);
  }
  
  public List<Member> searchMember(HashMap<String, Object> params) {
    return session.getMapper(memberDao.class).searchMember(params);
  }
  
  public int blackList(String id) {
    return session.getMapper(memberDao.class).blacklist(id);
  }


  public int deleteMember(String id) {
	  return session.getMapper(memberDao.class).deleteMember(id);
  }
  
  public String pwCheck(String id) {
	  return session.getMapper(memberDao.class).pwCheck(id);

  }

	  public boolean idcheck(String id) {
	Member member = session.getMapper(memberDao.class).selectOneMember(id);
	return (member == null) ? true : false;
  }
  
  public boolean nicknameCheck(String nickname) {
	  int result = session.getMapper(memberDao.class).nicknameCheck(nickname);
	  return (result == 0) ? true : false;
  }
  
  public String mailSend(String id) throws MessagingException, UnsupportedEncodingException {
	  /*String key = new TempKey().getKey(50, false);
	  MailHandler sendMail = new MailHandler(mailSender);
	  sendMail.setSubject("[Complain] 인증 번호 발송");
	  sendMail.setText(key);
	  sendMail.setFrom("complainZero@complainZero.com", "complainZero");
	  sendMail.setTo(id);
	  sendMail.send();
	  return key;*/
	  return "";
  }
}
