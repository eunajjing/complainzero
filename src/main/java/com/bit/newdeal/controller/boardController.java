package com.bit.newdeal.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
    
   mav.addObject("boardList", boardService.selectAllBoard());
   mav.setViewName("board/boardForm");
   
    return mav;
  }
  
  @RequestMapping("searchBoard.do")
  public void searchBoard() {
    // 필요없을수도 있음
  }
  
  @RequestMapping("writeBoardForm.do")
  public void writeBoardForm() {}
  
  
  @RequestMapping("writeBoard.do")
  public void writeBoard() {}
  
  @RequestMapping("selectOneBoard.do")
  public ModelAndView selectOneBoard(int bno) {
    ModelAndView mav = new ModelAndView();

    mav.addObject("boardDetail", boardService.selectOneBoard(bno));
    mav.addObject("commentList", commentService.selectComment(bno));
   
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
  
  @RequestMapping("boardDeleteForm.do")
  public @ResponseBody void boardDelete(@PathVariable(value="bno") int bno) {
	  boardService.deleteBoard(bno);
  }
  
  
  
  @RequestMapping(value = "boardCommentSelect.do", method = RequestMethod.GET)
  public @ResponseBody void boardCommentSelect(int bno, Model model){
	  model.addAttribute("comment", commentService.selectComment(bno));
  }
  
  @RequestMapping(value = "boardCommentInsert.do", method = RequestMethod.POST)
  public @ResponseBody void boardCommentInsert(Comment comment, Principal principal) {
	  
	  comment.setMid(principal.getName());
	  
    commentService.insertComment(comment);
  }
  
  @RequestMapping(value = "boardCommentUpdate.do", method = RequestMethod.PUT)
  public void boardCommentUpdate(Comment comment) {
    commentService.updateComment(comment);
  }
  
  @RequestMapping(value = "boardCommentDelete.do/{cno}")
  public @ResponseBody void boardCommentDelete(@PathVariable(value="cno") int cno) {
	  
    commentService.deleteComment(cno);
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
  
  //유저회원 내글조회
  @RequestMapping("myBoard.do")
  public ModelAndView myBoard(Principal principal) {
    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> params = new HashMap<String, Object>();
    
    params.put("board", boardService.selectMyBoard(principal.getName()));
    params.put("comment", commentService.mySelectComment(principal.getName()));
//    params.put("likes", ); id로 찾고 글 번호로 조인해서 리스트 뽑아옴
    mav.addObject("myBoard", params);
    mav.setViewName("mypage/user/userMyPage_board");
    
    return mav;
  }
  
  //제공자유저 내 제안서 조회
  @RequestMapping("mySuggest.do")
  public ModelAndView mySuggest(Principal principal) {
    ModelAndView mav = new ModelAndView();
    /*mav.addObject("mySuggest", suggestService.selectOneSuggest(principal.getName()));*/
    mav.setViewName("mypage/enter/enterUserMyPage_suggest");
    
    return mav;
  }
}
