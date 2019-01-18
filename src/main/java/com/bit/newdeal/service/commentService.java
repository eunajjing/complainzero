package com.bit.newdeal.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.newdeal.dao.commentDao;
import com.bit.newdeal.dto.Comment;

@Service
public class commentService {
  @Autowired
  SqlSession session;
  
  public List<Comment> selectComment(int bno) {
    return session.getMapper(commentDao.class).selectComment(bno);
  }
  
  public List<Comment> mySelectComment(String id) {
    return session.getMapper(commentDao.class).mySelectComment(id);
  }
  
  public int insertComment(Comment comment) {
    return session.getMapper(commentDao.class).insertComment(comment);
  }
  
  public int updateComment(Comment comment) {
    return session.getMapper(commentDao.class).updateComment(comment);
  }
  
  public int deleteComment(int cno) {
	  return session.getMapper(commentDao.class).deleteComment(cno);
  }
}
