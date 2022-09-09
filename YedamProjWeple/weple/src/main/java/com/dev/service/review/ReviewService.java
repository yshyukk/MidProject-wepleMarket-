package com.dev.service.review;

import java.util.List;

import com.dev.dao.BoardDAO;
import com.dev.dao.BuyDAO;
import com.dev.vo.Board;
import com.dev.vo.Criteria;
import com.dev.vo.ProdReview;
import com.dev.vo.ReviewInfo;

public class ReviewService {
	private static ReviewService instance = new ReviewService();
	
	BoardDAO dao = new BoardDAO();
	BuyDAO bdao = BuyDAO.getInstance();
	
	
	private ReviewService() {}
	
	public static ReviewService getInstance() {
		return instance;
	}
	
	//리뷰등록
	public void addReivew(ReviewInfo rvo, int orderNum) {
		//리뷰 등록하고
		dao.addReivew(rvo, orderNum);
		//is_review = 1로 바꿔주고
		bdao.updateReview(orderNum, rvo.getProdId());
	}
	//리뷰 리스트 출력
	
	/*public List<ReviewInfo> reviewList(int prodId){	
		return dao.getList(prodId);
	}*/
	public List<ReviewInfo> reviewList(int prodId){	
		return dao.getList(prodId);
	}
	
	/*public List<ReviewInfo> myReviewList(String writer){
		return dao.myReivewList(writer);
	}*/
	public List<ReviewInfo> myReviewList(String writer){
		return dao.myReivewList(writer);
	}
	/*public void updateReview(Board vo){
		dao.updateReview(vo);
	}*/
	
	//리뷰 삭제
	public boolean deleteReview(ReviewInfo rvo) {
		return dao.deleteReview(rvo);
	}
	
	//orderNum 가져오기
	public Board getReviewOrderNum(int bno) {
		return dao.getReviewOrderNum(bno);
	}
	
	/*public List<Board> myContent(){
		return dao.myContent();
	}*/
	public void countStar(ReviewInfo rvo) {
		dao.countStar(rvo);
	}
	public List<ReviewInfo> reviewInfo() {
		return dao.reviewInfo();
	}
	public List<ReviewInfo> getListPaging(Criteria cri, int prodId){
		return dao.getListPaging(cri, prodId);
	//페이징
	}public List<ReviewInfo> getMyListPaging(Criteria cri, String writer){
		return dao.getMyListPaging(cri, writer);
	}
	public double contentCount(int prodId) {
		return dao.contentCount(prodId);
	}
	
	/*
	 * 실시간 리뷰
	 * 별점이 높으면서 최신순으로
	 */
	public List<ProdReview> realTimeReviewList() {
		return dao.realTimeReviewList();
	}
	
	public List<ProdReview> rtPagingList(Criteria cri){
		return dao.rtPagingList(cri);
	}
	
	
	// 내가 쓴 상품 리뷰
	public Board selectProdReview(int orderNum, int prodId) {
		return dao.selectProdReview(orderNum, prodId);
	}
	
	
	
	
}
