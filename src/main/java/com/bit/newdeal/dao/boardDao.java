package com.bit.newdeal.dao;

import java.util.HashMap;
import java.util.List;
import com.bit.newdeal.dto.Board;

public interface boardDao {
  public List<Board> containerOne();
  public List<Board> containerTwo();
  public Board selectOneBoard(int no);
  public List<Board> selectAllBoard();
  public int insertBoard(Board board);
  public int updateBoard(Board board);
  public List<Board> searchBoard(HashMap<String, Object> params);
  public List<Board> selectMyBoard(String id);
  public int deleteBoard(int bno);
  public int insertLike(HashMap<String, Object> map);
  public int deleteLike(HashMap<String, Object> map);
}
