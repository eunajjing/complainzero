package com.bit.newdeal.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.ModelAndView;
import com.bit.newdeal.service.memberService;
import com.bit.newdeal.service.reportService;
import com.bit.newdeal.service.suggestService;

@RestController
//@RequestMapping("/admin")
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
    mav.setViewName("mypage/admin/adminForm_report");
    
    return mav;
  }
  
  @RequestMapping("selectAllSuggest.do")
  public ModelAndView selectAllSuggest() {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("suggestList", suggestService.selectAllSuggest());
    mav.setViewName("mypage/admin/adminForm_suggest");
    
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
    mav.setViewName("mypage/admin/adminForm_member");
    
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
  
  @RequestMapping(value = "blackList.do/{id}/{rno}/{num}", method=RequestMethod.PUT)
  public void blackList(@PathVariable String id, @PathVariable int rno, @PathVariable int num) {
    Map<String, Object> params = new HashMap<>();
    
    params.put("rno", rno);
    params.put("num", num);
    
    memberService.blackList(id);
    reportService.updateReport(params);
  }
}
