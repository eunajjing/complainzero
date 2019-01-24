package com.bit.newdeal.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
  
  @RequestMapping(value = {"main.do", "/"})
  public ModelAndView main(@RequestParam(required=false, value="data") String data,
                           @RequestParam(required=false, value="length") String length) {
    ModelAndView mav = new ModelAndView();

    if(data != null && length != null) {
      String[] arr = data.split(",");
      String result = null;
      Alarm alarm = new Alarm();
      ArrayList<Alarm> list = new ArrayList<Alarm>();
      Date alarmDate = null;
      
      for(int i = 0; i < arr.length; i++) {
        result = arr[i].replace("\"", "").replace("[", "").replace("{", "")
                       .replace("}", "").replace("]", "");
         
        switch(result.substring(0, result.indexOf(":"))) {
          case "ano" :
            alarm.setAno(Integer.parseInt(result.substring(result.indexOf(":") + 1))); break;
          case "alarmCode" :
            alarm.setAlarmCode(result.substring(result.indexOf(":") + 1)); break;
          case "bno" :
            if(!(result.substring(result.indexOf(":") + 1).equals("null"))) {
              alarm.setBno(Integer.parseInt(result.substring(result.indexOf(":") + 1))); break;
            }
          case "isFrom" :
            alarm.setIsFrom(result.substring(result.indexOf(":") + 1)); break;
          case "alarmDate" : 
            try {
              alarmDate = new SimpleDateFormat("yyyy-MM-dd")
                  .parse(result.substring(result.indexOf(":") + 1, result.indexOf("T")));
              alarm.setAlarmDate(alarmDate); break;
            } catch (ParseException e) {
              e.printStackTrace();
            }
          case "readCheck" :
            alarm.setReadCheck(Integer.parseInt(result.substring(result.indexOf(":") + 1))); 
            list.add(alarm); 
            alarm = new Alarm(); break;
        }
      }
      mav.addObject("alarmList", list);
      mav.addObject("length", length);
      mav.addObject("temp", 1);
    }
    
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
  
  @RequestMapping(value="insertLikes.do", method=RequestMethod.POST)
  public @ResponseBody void insertLikes(Principal principal, @RequestParam("bno") int bno) {
      
      boardService.insertLike(principal.getName(), bno);
  }
  
  @RequestMapping(value="deleteLikes.do", method=RequestMethod.POST)
  public @ResponseBody void deleteLikes(Principal principal, @RequestParam("bno") int bno) {
      boardService.deleteLike(principal.getName(), bno);
  }
}
