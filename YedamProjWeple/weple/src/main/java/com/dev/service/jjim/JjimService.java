package com.dev.service.jjim;

import com.dev.dao.JjimDAO;
import com.dev.dao.UserDAO;

public class JjimService {
	private static JjimService instance = new JjimService();
	UserDAO dao = new UserDAO();
	
	private JjimService() {}
	public static JjimService getInstance() {
		return instance;
	}
	
	
	
	JjimDAO jdao = new JjimDAO();
	
	
	//찜 체크 확인
	public int checkJjim(int prod, String user) {
		return jdao.checkJjim(prod, user);
	}
	
	//찜 해제
	public void removejjim(int prod, String user) {
		jdao.deletejjim(prod, user);
	}
	
	//찜 등록
	public void insertjjim(int prod, String user) {
		jdao.addjjim(prod, user);
	}
}
