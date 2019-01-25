package com.bit.newdeal.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.newdeal.dto.Alarm;
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

	@RequestMapping(value = "insertAlarm.do", method = RequestMethod.POST)
	public void insertAlarm(Alarm alarm) {
		alarmService.insertAlarm(alarm);
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

	@RequestMapping(value="insertReport.do", method= RequestMethod.POST)
	public @ResponseBody boolean insertReport(@ModelAttribute Report report, Principal principal) {
		
		report.setIsFrom(principal.getName());
		
		return reportService.insertReport(report);
	}

	@RequestMapping(value = "insertLikes.do", method = RequestMethod.POST)
	public @ResponseBody void insertLikes(Principal principal, @RequestParam("bno") int bno) {

		boardService.insertLike(principal.getName(), bno);
	}

	@RequestMapping(value = "deleteLikes.do", method = RequestMethod.POST)
	public @ResponseBody void deleteLikes(Principal principal, @RequestParam("bno") int bno) {
		boardService.deleteLike(principal.getName(), bno);
	}

  
  
  @RequestMapping(value = "updateAlarm.do/{ano}", method = RequestMethod.PUT)
  public void updateAlarm(@PathVariable int ano) {
    alarmService.updateAlarm(ano);
  }
}
