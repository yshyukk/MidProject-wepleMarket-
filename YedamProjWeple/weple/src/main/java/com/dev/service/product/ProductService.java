
package com.dev.service.product;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLRecoverableException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.dev.dao.InventoryDAO;
import com.dev.dao.ProductDAO;
import com.dev.dao.UserDAO;
import com.dev.vo.Criteria;
import com.dev.vo.Inventory;
import com.dev.vo.Product;

public class ProductService {
	private static ProductService instance = new ProductService();
	UserDAO dao = new UserDAO();
	
	private ProductService() {}
	public static ProductService getInstance() {
		return instance;
	}
	
	
	InventoryDAO idao = new InventoryDAO();
	ProductDAO pdao = new ProductDAO();
	
	
	// 입고 수량 추가
	public void addInventory(Inventory vo) throws SQLRecoverableException {
		int in = idao.getInAmount(vo.getRegion(), vo.getProdId());
		int out = idao.getOutAmount(vo.getRegion(), vo.getProdId());
		int stock = in-out+vo.getAmount();
		vo.setStock(stock);
		vo.setInOut(0);
		
		idao.insert(vo);
	}
	
	// 출고 수량 추가
	public void outInventory(Inventory vo) throws SQLRecoverableException {
		int in = idao.getInAmount(vo.getRegion(), vo.getProdId());
		int out = idao.getOutAmount(vo.getRegion(), vo.getProdId());
		
		if (in-out == 0) {
			return;
		}
		
		if(in-out-vo.getAmount() < 0); {
			vo.setAmount(in-out);
		}
		
		int stock = in-out-vo.getAmount();
		
		
		vo.setStock(stock);
		vo.setInOut(1);
		
		idao.insert(vo);
	}
	
	// 상품 전체 목록
	public List<Product> getProdTotalList() {
		List<Product> list = new ArrayList<>();
		list = pdao.showAllList();
		return list;
	}
	
	// 하위 카테고리id 목록
	public List<Integer> getCatgId(int get, int where, int id) {
		return pdao.getCatgId(get, where, id);
	}
	
	// 카테고리별 상품 조회
	public List<Product> getProdUsingCatgId(int where, int id, String user) {
		return pdao.searchProductUsingCatgId(where, id, user);
	}
	

	// 카테고리 아이디 리스트 조회
	public List<Integer> getProdCatgIdUsingCatgLevel(int where, int id) {
		return pdao.searchProdCatgIdUsingCatgLevel(where+1, id);
	}

	// prod_id로 products테이블에서 상품 조회하는 메소드(prod_id, prod_name, prod_price만
	public Product selectOneProd(int prodId) {
		return pdao.selectOneProd(prodId);
	}
	
	// 하위 카테고리 리스트
	@SuppressWarnings("unchecked")
	public Map<String, String> getCatgName() throws IOException, ParseException {         
		JSONParser parser = new JSONParser();         
		// JSON 파일 읽기        
		System.out.println(this.getClass().getResource("./catg.json").getPath());
		String realPath = this.getClass().getResource("./catg.json").getPath();
		Reader reader = new FileReader(realPath); 
		JSONObject jsonObject = (JSONObject) parser.parse(reader);         
		Map<String, String> list = (Map<String, String>) jsonObject.get("level3");           
		return list;
	}
	
	// 상품아이디로 판매지역 리스트 가져오기
	public List<String> getSalesRegions(int prodId) {
		return pdao.searchSalesRegions(prodId);
		
	}
	
	// 마감임박 공유상품 리스트 가져오기
	public List<Product> getSharedProd() {
		return pdao.searchSharedProd();
	}
	
	// 카테고리별 랜덤12개씩 리스트
	public Set<Product> getRandomProd() {
		return pdao.selectRandomProd();
	}
	
	// 상품 구매수량 랭킹 리스트
	public List<Product> getRankProd() {
		return pdao.selectProdRank();
	}
	
	// 신규 입고 상품 리스트
	public List<Product> getNewProd() {
		return pdao.selectNewProd();
	}
	
	// 나의 찜 목록
	public List<Product> getMyJjimProd(String userId) {
		return pdao.getMyJjimList(userId);
	}
  
	public List<Product> jjimListPaging(Criteria cri, String userId){
		return pdao.jjimListPaging(cri, userId);

	}
	
	// 현재 prodId와 isShare여부로 현재 상품의 공동구매 인원 수 조회해오기
	public int ParticipatePeopleNum(int prodId) {
		return pdao.ParticipatePeopleNum(prodId);
	}
	// 공동구매 인원 수 업로드(누적, 빼기는 controller에서 처리하자)
	public void updateParticipatePeople(int participate, int prodId) {
		pdao.updateParticipatePeople(participate, prodId);

	}
}
	
