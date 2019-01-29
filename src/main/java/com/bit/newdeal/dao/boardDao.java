package com.bit.newdeal.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.newdeal.dto.Board;
import com.bit.newdeal.dto.Criteria;
import com.bit.newdeal.dto.SearchCriteria;

public interface boardDao {
  public List<Board> containerOne();
  public List<Board> containerTwo();
  public Board selectOneBoard(int no);
  public List<Board> selectAllBoard(SearchCriteria cri);
  public int insertBoard(Board board);
  public int updateBoard(Board board);
  public List<Board> searchBoard(HashMap<String, Object> params);
  public List<Board> selectMyBoard(String id);
  public int readCount(int bno);
  public int deleteBoard(int bno);
  public int selectLike(HashMap<String, Object> map);
  public int insertLike(HashMap<String, Object> map);
  public int deleteLike(HashMap<String, Object> map);
  public List<Board> likeBoard(String id);
public int likeCount(int bno);
public List<Board> listCriteria(Criteria cri);
  public int countPaging(SearchCriteria cri);
  public Board selectOneBoardAddSuggestion(int bno);
  public Board selectOne(String mid);
}
