package com.bit.newdeal;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.newdeal.dto.memberDto;
import com.bit.newdeal.service.testService;

@Controller
public class HomeController {
	
	  @Autowired
	  private testService test;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		/*
		ArrayList<memberDto> map = new ArrayList<>();
		map.add(test.test());
		
		session.setAttribute("session", map);
		*/
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "NewFile", method = RequestMethod.GET)
	public String about() {
		System.out.println("1");
		return "NewFile";
	}
	
}
