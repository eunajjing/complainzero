package com.bit.newdeal.service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bit.newdeal.dao.boardDao;
import com.bit.newdeal.dao.suggestDao;
import com.bit.newdeal.dto.Board;
import com.bit.newdeal.dto.Criteria;
import com.bit.newdeal.dto.SearchCriteria;

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
		
		int suggestionCount = session.getMapper(suggestDao.class).selectCount(no);
		if (suggestionCount > 0) {
			return session.getMapper(boardDao.class).selectOneBoardAddSuggestion(no);
		}else {
			return session.getMapper(boardDao.class).selectOneBoard(no);
		}		
	}

	public List<Board> selectAllBoard(SearchCriteria cri) {
		return session.getMapper(boardDao.class).selectAllBoard(cri);
	}
	
	public int updateBoard(Board board) {
		return session.getMapper(boardDao.class).updateBoard(board);
	}

	public int deleteBoard(int bno) {
		return session.getMapper(boardDao.class).deleteBoard(bno);
	}
	public int readCount(int bno) {
		return session.getMapper(boardDao.class).readCount(bno);
	}
	
	public int likeCount(int bno) {
		return session.getMapper(boardDao.class).likeCount(bno);
	}
	


	

	

	public int insertBoard(Board board, MultipartFile uFile, String path, Principal principal) {
		board.setMid(principal.getName());
		path += "resources" + File.separator + "img" + File.separator + "boardThumbNail" + File.separator;

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (uFile != null) {
			String fileName = uFile.getOriginalFilename();
			File attachFile = new File(path + fileName);
			try {
				uFile.transferTo(attachFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			board.setThumbNail(fileName);
		}

		return session.getMapper(boardDao.class).insertBoard(board);
	}


	public List<Board> searchBoard(HashMap<String, Object> params) {
		return session.getMapper(boardDao.class).searchBoard(params);
	}

	public List<Board> selectMyBoard(String id) {
		return session.getMapper(boardDao.class).selectMyBoard(id);
	}

	public File getAttachFile(HashMap<String, Object> params) {
		String fileName = null;
		String path = null;
		System.out.println("82 : " + params.get("bno"));
		if (params.get("bno") != null) {
			Board board = session.getMapper(boardDao.class).selectOneBoard((int) params.get("bno"));
			System.out.println(session.getMapper(boardDao.class).selectOneBoard((int) params.get("bno")) + "85");
			System.out.println("board.getThumbNail() : " + board.getThumbNail());
			fileName = board.getThumbNail();
			System.out.println("fileName : " + fileName);
			path = "http://localhost:8888/img/boardThumbNail/";
			System.out.println("path : " + path);
			
		} 
		
		return new File(path + fileName);
	}
	
	public int selectLike(String id, int bno) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("bno", bno);
		
		return session.getMapper(boardDao.class).selectLike(map);
	}
	
	public int insertLike(String id, int bno) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("bno", bno);
		
		return session.getMapper(boardDao.class).insertLike(map);
	}
	
	public int deleteLike(String id, int bno) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("bno", bno);
		
		return session.getMapper(boardDao.class).deleteLike(map);
	}
	
	public List<Board> likeBoard(String id) {
		return session.getMapper(boardDao.class).likeBoard(id);
	}
	
	public List<Board> listCriteria(Criteria cri){
		return session.getMapper(boardDao.class).listCriteria(cri);
	}
	
	public int countPageing(SearchCriteria cri) {
		return session.getMapper(boardDao.class).countPaging(cri);
	}
		
}
