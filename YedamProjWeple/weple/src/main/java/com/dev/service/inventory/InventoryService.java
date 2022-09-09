
package com.dev.service.inventory;

import java.sql.SQLRecoverableException;

import com.dev.dao.InventoryDAO;

public class InventoryService {
	// 싱글톤
	private static InventoryService inventoryService = null;
	private InventoryService() {
		
	}
	public static InventoryService getInstance() {
		if(inventoryService == null) {
			inventoryService = new InventoryService();
		}
		return inventoryService;
	}
	
	InventoryDAO iDAO = new InventoryDAO();
	
	public int getOutAmount(String region, int prodId) throws SQLRecoverableException {
		return iDAO.getOutAmount(region, prodId);
	}
}
