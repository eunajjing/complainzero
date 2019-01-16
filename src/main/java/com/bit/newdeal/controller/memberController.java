package com.bit.newdeal.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
  
  @RequestMapping("join.do")
  public String join(Member member) {
    memberService.insertMember(member);
    
    return "redirect:main.do";
  }
  
  @RequestMapping("login.do")
  public String login(String id, String pw, HttpSession session) {
    // 로그인 처리
    session.setAttribute("sessionID", id);
    
    return "redirect:main.do";
  }
  
  @RequestMapping("deleteMember.do")
  public String deleteMember(Principal principal, String pw) {
	  
    memberService.deleteMember(principal.getName());
    
    return "redirect:main.do";
  }
  
  @RequestMapping("logout.do")
  public String logout(HttpSession session) {
    session.invalidate();
    
    return "redirect:main.do";
  }
  
  @RequestMapping(value="updateMember.do", method= RequestMethod.PUT, headers={"Content-type=application/json"})
  public @ResponseBody void updateMember(@RequestBody Member member) {
    memberService.updateMember(member);
  }
  
  @RequestMapping("enterUserMyPage.do")
  public String enterUserMyPage(String id, Model model) {
    id = "test@test.com";
    model.addAttribute("member", memberService.selectOneMember(id));
    
    return "mypage/enter/enterUserMyPage_update";
  }
  
  @RequestMapping("userMyPage.do")
  public String userMyPage(String id, Model model) {
	id = "test@test.com";
    model.addAttribute("member", memberService.selectOneMember(id));
    
    return "mypage/user/userMyPage_update";
  }

  @RequestMapping(value="pwCheck.do", method=RequestMethod.POST)
  public @ResponseBody boolean pwCheck(@RequestBody String epw) {
	  
	  System.out.println(epw);
	  /*
	  String encodePassword = memberService.pwCheck(pw);
	  String rawPassword = pw;
		
	  boolean result = bCryptPasswordEncoder.matches(rawPassword, encodePassword);
	  */
	  boolean result = true;
	  
	  return result;
  }
}
