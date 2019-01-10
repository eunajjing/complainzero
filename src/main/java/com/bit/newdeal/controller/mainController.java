package com.bit.newdeal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.bit.newdeal.service.boardService;

@Controller
public class mainController {
  @Autowired
  private boardService boardService;
  
  @RequestMapping("main.do")
  public ModelAndView main() {
    ModelAndView mav = new ModelAndView();
    
//    mav.addObject("popList", boardService.containerOne());
//    mav.addObject("lastList", boardService.containerTwo());
    mav.setViewName("home");
    
    return mav;
  }
}
