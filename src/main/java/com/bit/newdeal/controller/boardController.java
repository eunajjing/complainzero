package com.bit.newdeal.controller;

import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.bit.newdeal.dto.Board;
import com.bit.newdeal.dto.Comment;
import com.bit.newdeal.dto.Suggest;
import com.bit.newdeal.service.boardService;
import com.bit.newdeal.service.commentService;
import com.bit.newdeal.service.suggestService;

@Controller
public class boardController {
  @Autowired
  private boardService boardService;
  @Autowired
  private commentService commentService;
  @Autowired
  private suggestService suggestService;
  
  @RequestMapping("boardForm.do")
  public ModelAndView boardForm() {
    ModelAndView mav = new ModelAndView();
    
   // mav.addObject("boardList", boardService.selectAllBoard());
    mav.setViewName("board/boardForm");
    
    return mav;
  }
  
  @RequestMapping("searchBoard.do")
  public void searchBoard() {
    // 필요없을수도 있음
  }
  
  @RequestMapping("writeBoardForm.do")
  public String writeBoardForm() {
    return "board/writeBoardForm";
  }
  
  @RequestMapping("selectOneBoard.do")
  public ModelAndView selectOneBoard(int bno) {
    ModelAndView mav = new ModelAndView();
    
    // mav.addObject("boardDetail", boardService.selectOneBoard(bno));
    mav.setViewName("board/boardDetail");
    
    return mav;
  }
  
  @RequestMapping("updateBoardForm.do")
  public void updateBoardForm() {}
  
  @RequestMapping("updateBoard.do")
  public String updateBoard(Board board) {
    int bno = board.getBno();
    boardService.updateBoard(board);
    
    return "redirect:selectOneBoard.do?bno=" + bno;
  }
  
  @RequestMapping("deleteBoard.do")
  public String deleteBoard(int bno) {
    // 서비스, dao delete 만들어야함
    return "redirect:boardForm.do";
  }
  
  @RequestMapping(value = "boardCommentInsert.do", method = RequestMethod.POST)
  public void boardCommentInsert(Comment comment) {
    commentService.insertComment(comment);
  }
  
  @RequestMapping(value = "boardCommentUpdate.do", method = RequestMethod.PUT)
  public void boardCommentUpdate(Comment comment) {
    commentService.updateComment(comment);
  }
  
  @RequestMapping(value = "boardCommentDelete.do", method = RequestMethod.DELETE)
  public void boardCommentDelete(int cno) {
    // 서비스, dao delete 만들어야함
  }
  
  @RequestMapping("writeSuggest.do")
  public String writeSuggest(Suggest suggest) {
    suggestService.insertSuggest(suggest);
    
    return "redirect:mySuggest.do";
  }
  
  @RequestMapping("deleteSuggest.do")
  public String deleteSuggest(int sno) {
    suggestService.updateSuggest(sno);
    
    return "redirect:mySuggest.do";
  }
  
  @RequestMapping("myBoard.do")
  public ModelAndView myBoard(String id) {
    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> params = new HashMap<String, Object>();
    
    id = "test@test.com";
    params.put("board", boardService.selectMyBoard(id));
    params.put("comment", commentService.mySelectComment(id));
//    params.put("likes", ); id로 찾고 글 번호로 조인해서 리스트 뽑아옴
    mav.addObject("myBoard", params);
    mav.setViewName("mypage/user/userMyPage_board");
    
    return mav;
  }
  
  @RequestMapping("mySuggest.do")
  public ModelAndView mySuggest(String id) {
    ModelAndView mav = new ModelAndView();
    id = "test@test.com";
    /*mav.addObject("mySuggest", suggestService.selectOneSuggest(id));*/
    mav.setViewName("mypage/enter/enterUserMyPage_suggest");
    
    return mav;
  }
}
