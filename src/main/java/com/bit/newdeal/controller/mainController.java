package com.bit.newdeal.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.bit.newdeal.dto.Alarm;
import com.bit.newdeal.dto.Report;
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
  
  @RequestMapping("main.do")
  public ModelAndView main() {
    ModelAndView mav = new ModelAndView();
    
//    mav.addObject("popList", boardService.containerOne());
//    mav.addObject("lastList", boardService.containerTwo());
    mav.setViewName("main");
    
    return mav;
  }
  
  @RequestMapping(value = "insertAlarm.do", method = RequestMethod.POST)
  public void insertAlarm(Alarm alarm) {
    alarmService.insertAlarm(alarm);
  }
  
  @RequestMapping(value = "updateAlarm.do", method = RequestMethod.PUT)
  public void updateAlarm(int ano) {
//    alarmService.updateAlarm(alarm); 생각해봐야함
  }
  
  @RequestMapping(value = "selectAlarm.do", method = RequestMethod.GET)
  public List<Alarm> selectAlarm(String id) {
    return alarmService.selectAlarm(id);
  }
  
  @RequestMapping(value = "selectAllAlarm.do", method = RequestMethod.GET)
  public ModelAndView selectAllAlarm(String id) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("alarmList", alarmService.selectAlarm(id));
    mav.setViewName("alarmForm");
    
    return mav;
  }
  
  @RequestMapping("insertReport.do")
  public void insertReport(Report report) {
    reportService.insertReport(report);
  }
  
  @RequestMapping("insertLikes.do")
  public void insertLikes(String id, int bno) {
    
  }
  
  @RequestMapping("deleteLikes.do")
  public void deleteLikes(String id, int bno) {
    
  }
}
