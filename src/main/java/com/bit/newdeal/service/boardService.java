package com.bit.newdeal.service;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.newdeal.dao.boardDao;
import com.bit.newdeal.dto.Board;

@Service
public class boardService {
  @Autowired
  SqlSession session;
  
  public List<Board> containerOne() {
    return session.getMapper(boardDao.class).containerOne();
  }
  
  public List<Board> containerTwo() {
    return session.getMapper(boardDao.class).containerTwo();
  }
  
  public Board selectOneBoard(int no) {
    return session.getMapper(boardDao.class).selectOneBoard(no);
  }
  
  public List<Board> selectAllBoard() {
    return session.getMapper(boardDao.class).selectAllBoard();
  }
  
  public int insertBoard(Board board) {
    return session.getMapper(boardDao.class).insertBoard(board);
  }
  
  public int updateBoard(Board board) {
    return session.getMapper(boardDao.class).updateBoard(board);
  }
  
  public List<Board> searchBoard(HashMap<String, Object> params) {
    return session.getMapper(boardDao.class).searchBoard(params);
  }
  
  public List<Board> selectMyBoard(String id){
	  return session.getMapper(boardDao.class).selectMyBoard(id);
  }
}
