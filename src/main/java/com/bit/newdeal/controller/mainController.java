package com.bit.newdeal.controller;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bit.newdeal.dto.Report;
import com.bit.newdeal.dto.SearchCriteria;
import com.bit.newdeal.service.alarmService;
import com.bit.newdeal.service.boardService;
import com.bit.newdeal.service.reportService;

@Controller
public class mainController {
  @Autowired
  private boardService boardService;
  @Autowired
  private alarmService alarmService;
  @Autowired
  private reportService reportService;
  
  @RequestMapping(value = { "main.do", "/" })
  public ModelAndView main(SearchCriteria cri) {
      ModelAndView mav = new ModelAndView();

      mav.addObject("boardList", boardService.selectAllBoard(cri));
      
      mav.setViewName("main");

      return mav;
  }
  
  @RequestMapping(value = "updateAlarm.do/{ano}", method = RequestMethod.PUT)
  public void updateAlarm(@PathVariable int ano) {
    alarmService.updateAlarm(ano);
  }
  
  @RequestMapping(value="insertReport.do", method= RequestMethod.POST)
  public @ResponseBody boolean insertReport(@ModelAttribute Report report, Principal principal) {
      
      report.setIsFrom(principal.getName());
      System.out.println(report.toString());
      
      return reportService.insertReport(report);
  }
  
  @RequestMapping(value="insertLikes.do", method=RequestMethod.POST)
  public @ResponseBody void insertLikes(Principal principal, @RequestParam("bno") int bno) {
      boardService.insertLike(principal.getName(), bno);
  }
  
  @RequestMapping(value="deleteLikes.do", method=RequestMethod.POST)
  public @ResponseBody void deleteLikes(Principal principal, @RequestParam("bno") int bno) {
      boardService.deleteLike(principal.getName(), bno);
  }
}
