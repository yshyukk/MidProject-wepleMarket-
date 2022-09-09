package com.dev.common.crawling;

import java.sql.SQLRecoverableException;
import java.util.List;

import com.dev.service.product.ProductService;
import com.dev.vo.Inventory;
import com.dev.vo.Product;

public class InvtCrawling {
	static ProductService service = ProductService.getInstance();
	final static List<Product> list = service.getProdTotalList();
	
	public static void main(String[] args) throws SQLRecoverableException {
		String[] regionList = { "daejeon", "incheon", "daegu", "gwangju", "seoul", "ulsan", "busan" };

		for (int i = 0; i < 3; i++) {
			for (Product vo : list) {
				Inventory invt = new Inventory();
				invt.setAmount((int) (Math.random() * 10) + 1);
				invt.setProdId(vo.getProdId());
				invt.setRegion(regionList[(int) (Math.random() * regionList.length)]);

				if ((int) (Math.random() * 2) == 0) {
					service.addInventory(invt);
				} else {
					service.outInventory(invt);
				}
			}
		}

//		System.out.println((int) (Math.random() * 3));
	}
}