package com.bit.newdeal.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.newdeal.dto.Comment;

public interface commentDao {
  public List<Comment> selectComment(int bno);
  public List<HashMap> mySelectComment(String id);
  public int insertComment(Comment comment);
  public int updateComment(Comment comment);
  public int deleteComment(int cno);
}
