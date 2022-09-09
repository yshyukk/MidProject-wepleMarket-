package com.dev.service.cart;

import java.util.List;

import com.dev.dao.BuyDAO;
import com.dev.vo.Buy;
import com.dev.vo.Cart;

public class CartService {

	// 싱글톤
	private static CartService cartService = null;
	BuyDAO dao = BuyDAO.getInstance();
	private CartService() {
		
	}
	
	public static CartService getInstance() {
		if(cartService == null) {
			cartService = new CartService();
		} 
		return cartService;
	}
	

	// 장바구니 전체 조회
	public List<Cart> showCart(String userId) {
		return dao.showCart(userId); 
	}
	

	// 장바구니의 상품 하나 조회
	public Cart showOneProd(String userId, int prodId, int isShare) {
		return dao.showOneProd(userId, prodId, isShare);
	}
	
	// 장바구니에 상품 넣기
	public void insertIntoCart(Buy cartProduct) {
		dao.insertIntoCart(cartProduct);
	}
	
	// 장바구니 품목 수정(수량만)
	public boolean updateCart(int prodId, int buyAmount, String userId, int isShare) {
		return dao.updateCart(prodId, buyAmount, userId, isShare);
	}
	
	// 장바구니에서 상품 삭제
	public boolean deleteFromCart(int prodId, String userId, int isShare) {
		return dao.deleteFromCart(prodId, userId, isShare);
	}
	
	// 장바구니 비우기
	public boolean deleteAllCart(String userId) {
		return dao.deleteAllCart(userId);
	}
}
	