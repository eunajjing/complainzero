package com.bit.newdeal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bit.newdeal.service.memberService;
import com.bit.newdeal.service.reportService;
import com.bit.newdeal.service.suggestService;

@Controller
public class adminController {
  @Autowired
  private reportService reportService;
  @Autowired
  private suggestService suggestService;
  @Autowired
  private memberService memberService;
  
  @RequestMapping("selectReport.do")
  public ModelAndView selectReport() {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("reportList", reportService.selectReport());
    mav.setViewName("selectReportForm");
    
    return mav;
  }
  
  @RequestMapping("selectAllSuggest.do")
  public ModelAndView selectAllSuggest() {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("suggestList", suggestService.selectAllSuggest());
    mav.setViewName("adminForm_suggest");
    
    return mav;
  }
  
  @RequestMapping("selectOneSuggest.do")
  public String selectOneSuggest(String id, Model model) {
    model.addAttribute("suggest", suggestService.selectOneSuggest(id));
    
    return "suggestView";
  }
  
  @RequestMapping("updateApproveSuggest.do")
  public void updateApproveSuggest(int sno) {
    suggestService.updateSuggest(sno);
    // updateSuggest 확인해봐야함
  }
  
  @RequestMapping("updateRefuseSuggest.do")
  public void updateRefuseSuggest(int sno) {
    suggestService.updateSuggest(sno);
    // updateSuggest 확인해봐야함
  }
  
  @RequestMapping("adminForm.do")
  public ModelAndView adminForm() {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("memberList", memberService.selectAllMember());
    mav.setViewName("adminForm_member");
    
    return mav;
  }
  
  @RequestMapping("searchMember.do")
  public void searchMember() {
    // 보류
  }
  
  @RequestMapping("searchAllMember.do")
  public void searchAllMember() {
    // 보류
  }
  
  @RequestMapping("blackList.do")
  public void blackList(String id) {
    // 서비스, dao에 enabled 업데이트 함수 필요
  }
}
