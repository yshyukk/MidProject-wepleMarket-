
package com.dev.service.addr;

import com.dev.dao.AddrDAO;
import com.dev.vo.Addr;

public class AddrService {
	// 싱글톤
	private static AddrService addrService = null;
	private AddrService() {
		
	}
	
	public static AddrService getInstance() {
		if(addrService == null) {
			addrService = new AddrService();
		}
		return addrService;
	}
	
	// addr정보 addrVO받아서 insert하는 메소드
	AddrDAO aDAO = new AddrDAO();
	public void insertAddr(Addr addr) {
		aDAO.insertAddr(addr);
	}
	
	public Addr selectDefault(String userId) {
		return aDAO.selectDefault(userId);
	}
}
