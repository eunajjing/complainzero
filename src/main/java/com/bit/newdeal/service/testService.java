package com.bit.newdeal.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.newdeal.dao.testDao;
import com.bit.newdeal.dto.memberDto;

@Service
public class testService {
	@Autowired
	SqlSession session;
	
	public memberDto test() {
		return session.getMapper(testDao.class).test();
	}
}
