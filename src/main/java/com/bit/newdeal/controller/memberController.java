package com.bit.newdeal.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import java.security.Principal;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.newdeal.dto.Member;
import com.bit.newdeal.service.memberService;

@Controller
public class memberController {
  @Autowired
  private memberService memberService;
  
  @RequestMapping("loginForm.do")
  public void loginForm() {}
  
  @RequestMapping("joinForm.do")
  public String joinForm() {
    return "member/joinForm_guest";
  }
  
  @RequestMapping("joinFormEnter.do")
  public String joinFormEnter() {
    return "joinForm_enter";
  }
  
  @RequestMapping(value = "join.do", method = RequestMethod.POST)
  public String join(Member member) {
	  //, MultipartHttpServletRequest request
	memberService.insertMember(member);
    return "redirect:main.do";
  }
  
  @RequestMapping("login.do")
  public String login(String id, String pw, HttpSession session) {
    // 로그인 처리
    session.setAttribute("sessionID", id);
    
    return "redirect:main.do";
  }
  
  //회원탈퇴 (enabled 0으로 변경)
  @RequestMapping("deleteMember.do")
  public String deleteMember(Principal principal, HttpSession session) {
	  
    memberService.deleteMember(principal.getName());
    session.invalidate();
    
    return "redirect:main.do";
  }
  
  @RequestMapping("logout.do")
  public String logout(HttpSession session) {
    session.invalidate();
    
    return "redirect:main.do";
  }
  

  //자기정보 변경
  @RequestMapping(value="updateMember.do", method= RequestMethod.POST)
  public @ResponseBody void updateMember(Member member, MultipartHttpServletRequest multipart) throws Exception {

    memberService.updateMember(member, multipart);
  }
  
  //제공자 마이페이지
  @RequestMapping("enterUserMyPage.do")
  public String enterUserMyPage(Principal principal, Model model, Member member) {
    String id = principal.getName();
    
    member = memberService.selectOneMember(id);
    
    String profile = "img/profile/" + memberService.selectOneMember(id).getProfile();
    
    member.setProfile(profile);
    
    model.addAttribute("member", member);
    
    return "mypage/enter/enterUserMyPage_update";
  }
  
  //유저 마이페이지
  @RequestMapping("userMyPage.do")
  public String userMyPage(Principal principal, Model model) {
	  String id = principal.getName();
    model.addAttribute("member", memberService.selectOneMember(id));
    
    return "mypage/user/userMyPage_update";
  }
  

  //삭제 전 비밀번호 확인
  @RequestMapping(value="pwCheck.do", method=RequestMethod.POST)
  public @ResponseBody boolean pwCheck(@RequestBody String epw, Principal principal) {
	  
	  String encodePassword = memberService.pwCheck(principal.getName());
	  String rawPassword = epw;
	  /*
	  boolean result = bCryptPasswordEncoder.matches(rawPassword, encodePassword);
	  */
	  boolean result = true;
	  
    /* 여기서 권한 체크 후 
     각 권한별 마이페이지로 이동
      adminForm.do - 관리자
      enterUserMyPage.do - 기업회원
      userMyPage.do - 일반회원
    */
	  return result;
  }
  
  @RequestMapping("idcheck.do")
  public @ResponseBody boolean idcheck(String id) {
	  return memberService.idcheck(id);
  }
  
  @RequestMapping("nicknameCheck.do")
  public @ResponseBody boolean nicknameCheck(String nickname) {
	  return memberService.nicknameCheck(nickname);
  }
  
  @RequestMapping("emailcheck.do")
  public @ResponseBody String emailcheck(String id) throws UnsupportedEncodingException, MessagingException {
	  return memberService.mailSend(id);
  }
}
