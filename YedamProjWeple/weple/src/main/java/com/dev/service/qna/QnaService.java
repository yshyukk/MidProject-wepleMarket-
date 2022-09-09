package com.dev.service.qna;

import java.util.List;

import com.dev.dao.QnaDAO;
import com.dev.vo.Board;
import com.dev.vo.Criteria;
import com.dev.vo.ReviewInfo;

public class QnaService {

	private static QnaService instance = new QnaService();

	QnaDAO qdao = new QnaDAO();

	private QnaService() {
	}

	public static QnaService getInstance() {
		return instance;
	}

	// 문의 게시판 리스트(페이징)
	public List<Board> qnaListPaging(Criteria cri){
		return qdao.qnaListPaging(cri);
	}
	// 문의 게시판 리스트
	public List<Board> qnaList(int prodId){
		return qdao.qnaList(prodId);
	}
	// 내가 쓴 게시판 리스트
	public List<Board> qnaMyListPaging(Criteria cri, String writer){
		return qdao.qnaMyListPaging(cri, writer);
	}
	public List<Board> qMyList(String writer){
		return qdao.qMyList(writer);
	}
	
	
	// 내가 쓴 최근 상품 문위
	public Board getRecentReview(String userId, int prodId) {
		return qdao.getRecentReview(userId, prodId);
	}
	
	
	// 상품 문의 등록
	public boolean addQna(Board vo) {
		 return qdao.addQna(vo);
	}
	public boolean deleteQna(Board vo) {
		return qdao.deleteQna(vo);
	}
	public void updateQna(Board vo) {
		qdao.updateQna(vo);
	}
	public List<Board> viewContent(Board vo) {
		return qdao.viewContent(vo);
	}
	
	/*
	 * 해당 상품에 대한 문의 리스트
	 */
	public List<Board> getProdQnAList(int prodId) {
		return qdao.getProdQnAList(prodId);
	}
	
	
}
