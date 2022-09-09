package com.dev.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.controller.addr.ShowDefaultAddrController;
import com.dev.controller.cart.CartController;
import com.dev.controller.cart.CartDeleteAllController;
import com.dev.controller.cart.CartDeleteController;
import com.dev.controller.cart.CartInsertController;
import com.dev.controller.cart.CartReadController;
import com.dev.controller.cart.CartUpdateController;
import com.dev.controller.cart.ShowOneProdInCartController;
import com.dev.controller.cart.showAllProdInCartController;
import com.dev.controller.jjim.jjimUpdateController;
import com.dev.controller.main.MainController;
import com.dev.controller.mypage.DeliveryAddrController;
import com.dev.controller.mypage.JjimController;
import com.dev.controller.mypage.MyPageController;
import com.dev.controller.mypage.OrderHistoryController;
import com.dev.controller.mypage.ProdQnAController;
import com.dev.controller.mypage.UserUpdateController;

import com.dev.controller.mypage.addressChangeController;
import com.dev.controller.mypage.addressDeleteController;
import com.dev.controller.mypage.addressDeleteFormController;
import com.dev.controller.mypage.addressListDefaultController;

import com.dev.controller.mypage.addressListFormController;
import com.dev.controller.mypage.addressOutController;
import com.dev.controller.mypage.addressUpdateController;
import com.dev.controller.notice.CreateCommentsController;
import com.dev.controller.notice.DeleteCommentsController;
import com.dev.controller.notice.SendRepleNumController;
import com.dev.controller.notice.SendToCreateCommentsController;
import com.dev.controller.notice.ShowCommentsController;
import com.dev.controller.notice.ShowNoticeBoardController;
import com.dev.controller.notice.ShowNoticeDetailController;
import com.dev.controller.notice.UpdateCommentsController;
import com.dev.controller.order.ShowPayFormController;
import com.dev.controller.order.insertOrderController;
import com.dev.controller.order.selectOrderDetailController;
import com.dev.controller.product.CatgDispController;
import com.dev.controller.product.CatgProdListController;
import com.dev.controller.product.NewerController;
import com.dev.controller.product.ProductDetailController;
import com.dev.controller.product.RankController;
import com.dev.controller.qna.DeleteQnaController;
import com.dev.controller.qna.InsertQnaController;
import com.dev.controller.qna.MyQnaListPagingController;
import com.dev.controller.qna.QnaListController;
import com.dev.controller.qna.UpdateQnaController;
import com.dev.controller.qna.ViewContentController;
import com.dev.controller.review.AddReviewController;
import com.dev.controller.review.CountContentController;
import com.dev.controller.review.DeleteReviewController;
import com.dev.controller.review.InsertResultListController;
import com.dev.controller.review.InsertReviewController;
import com.dev.controller.review.MyListPagingController;
import com.dev.controller.review.MyProdReviewController;
import com.dev.controller.review.RealTimeReviewController;
import com.dev.controller.review.ReviewListPagingController;
import com.dev.controller.user.UserInsertController;
import com.dev.controller.user.UserInsertFormController;
import com.dev.controller.user.loginController;
import com.dev.controller.user.loginFormController;
import com.dev.controller.user.logoutController;
import com.dev.controller.user.userDeleteController;
import com.dev.controller.user.userDeleteFormController;
import com.dev.controller.user.userInfoUpdateController;
import com.dev.controller.user.userInfoUpdateFormController;
import com.dev.controller.welcome.WelcomeController;



@SuppressWarnings("serial")
public class FrontController extends HttpServlet {
	String enc;
	Map<String, Controller> mappings;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		enc = config.getInitParameter("charset");
		
		mappings = new HashMap<>();
		
		mappings.put("/welcome.do", new WelcomeController()); // 웰컴페이지
		
		mappings.put("/main.do", new MainController());	// 쇼핑몰 메인페이지
		mappings.put("/mypage.do", new MyPageController());	// 유저 마이페이지
		
		mappings.put("/updateCart.do", new CartUpdateController()); // 장바구니 수량 수정
		mappings.put("/deleteCart.do", new CartDeleteController()); // 장바구니 삭제
		mappings.put("/insertCart.do", new CartInsertController()); // 장바구니 등록
		mappings.put("/deleteAllCart.do", new CartDeleteAllController()); // 장바구니 비우기
		mappings.put("/readCart.do", new CartReadController());
		mappings.put("/showOneProdInCart.do", new ShowOneProdInCartController()); // (장바구니) 공동구매, 일반구매 클릭시 보여주기
		mappings.put("/showAllProdInCart.do", new showAllProdInCartController()); // (장바구니) 메인이나, 장바구니 클릭시 보여주기
		mappings.put("/insertOrder.do", new insertOrderController()); // 발송지 정보 입력받고, json받아와서 order에 넣기
		
		mappings.put("/userInsertForm.do", new UserInsertFormController());//회원가입폼
		mappings.put("/userInsert.do", new UserInsertController());			//회원가입
		mappings.put("/login.do", new loginController());					//로그인
		mappings.put("/loginForm.do", new loginFormController());			//로그인폼
		mappings.put("/logout.do", new logoutController());					//로그아웃
		mappings.put("/userInfoUpdate.do", new userInfoUpdateController());			//회원정보수정 처리
		mappings.put("/userInfoUpdateForm.do", new userInfoUpdateFormController());	//회원정보수정 화면
		mappings.put("/userDelete.do", new userDeleteController());			//회원탈퇴
		mappings.put("/userDeleteForm.do", new userDeleteFormController());			//회원탈퇴
//		mappings.put("/findId.do", new userFindController());			//아이디찾기
//		mappings.put("/findIdForm.do", new userFindFormController());			//아이디찾기

		mappings.put("/addressUpdate.do", new addressUpdateController());			//배송지 추가
		
		mappings.put("/addressDelete.do", new addressDeleteController());			//배송지 삭제
		mappings.put("/addressDeleteForm.do", new addressDeleteFormController());	//배송지 삭제폼
		
		//mappings.put("/addressUpdate.do", new addressListController());	//배송지 조회
		mappings.put("/addressListDefault.do", new addressListDefaultController());	//기본 배송지 조회
		mappings.put("/addressUpdateForm.do", new addressListFormController());	//배송지 조회
		mappings.put("/addressChange.do", new addressChangeController());	//기본 배송지로 지정
		mappings.put("/addressOut.do", new addressOutController());	//기본 배송지에서 제외
    
		
		// 리뷰관련 mappings
		mappings.put("/addReview.do", new AddReviewController());//리뷰 등록 클릭 -> 등록화면 폼까지	
		mappings.put("/insertReview.do", new InsertReviewController());//등록화면 -> 등록완료 
		mappings.put("/insertResultList.do", new InsertResultListController()); //등록 후 홈, 마이리스트, 주문내역으로 이동
		mappings.put("/deleteReview.do", new DeleteReviewController());//삭제선택 -> 삭제완료
		mappings.put("/countContent.do", new CountContentController());
		mappings.put("/reviewListPaging.do", new ReviewListPagingController());//paging 리뷰리스트
		mappings.put("/myListPaging.do", new MyListPagingController());//paging 내리뷰 리스트
		mappings.put("/myProdReview.do", new MyProdReviewController()); //주문내역에서 작성한 리뷰 보기
		
		
		mappings.put("/cart.do", new CartController()); // cart화면보여주는 것
		//배송지 관리
		mappings.put("/deliveryAddr.do", new DeliveryAddrController());
		//찜한 상품
		mappings.put("/jjim.do", new JjimController());
		// 주문하기(배송지입력)화면보여주기
		mappings.put("/showPayForm.do", new ShowPayFormController());
		//주문내역
		mappings.put("/orderHistoryMain.do", new OrderHistoryController());
		//주문상세내역
		mappings.put("/selectOrderDetail.do", new selectOrderDetailController());
		// 기본배송지 보여주기
		mappings.put("/showDefaultAddr.do", new ShowDefaultAddrController());
		
		//문의내역
		mappings.put("/prodQnA.do", new ProdQnAController());
		//회원정보수정
		mappings.put("/userUpdate.do", new UserUpdateController());

		
		mappings.put("/catgDisp.do", new CatgDispController()); // 카테고리 화면
		mappings.put("/rank.do", new RankController());		// 랭킹 화면
		mappings.put("/newer.do", new NewerController());	// 신상품 화면
		mappings.put("/realTimeReview.do", new RealTimeReviewController());	// 실시간 리뷰 화면
		mappings.put("/catgProdList.do", new CatgProdListController()); // 카테고리 상품 리스트 출력
		mappings.put("/productDetail.do", new ProductDetailController());
		mappings.put("/jjimUpdate.do", new jjimUpdateController());
		
		//문의게시판
		mappings.put("/qnaList.do", new QnaListController()); //상품상세페이지 상품 문의 목록 //(완료)
		mappings.put("/myQnaListPaging.do", new MyQnaListPagingController()); // 내가 쓴 상품문의 목록(삭제까지 완료)
		//mappings.put("/addQna.do", new AddQnaController()); // 등록 버튼 눌렀을떄 실행되는 애
		mappings.put("/insertQna.do", new InsertQnaController()); // 등록정보 보내는 애 //(완료)
		mappings.put("/deleteQna.do", new DeleteQnaController());// (완료)
		mappings.put("/updateQna.do", new UpdateQnaController());
		mappings.put("/viewContent.do", new ViewContentController());
		
		// 공지사항게시판
		mappings.put("/showNoticeBoard.do", new ShowNoticeBoardController()); // 공지사항게시판 전체목록
		mappings.put("/showNoticeDetail.do", new ShowNoticeDetailController()); // 글 클릭했을때 보여줄 공지사항세부
		mappings.put("/showComments.do", new ShowCommentsController());
		mappings.put("/deleteComments.do", new DeleteCommentsController());
		mappings.put("/updateComments.do", new UpdateCommentsController());
		mappings.put("/sendRepleNum.do", new SendRepleNumController());
		mappings.put("/createComments.do", new CreateCommentsController());
		mappings.put("/sendToCreateComments.do", new SendToCreateCommentsController());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(enc);
		
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String path = uri.substring(contextPath.length());
		System.out.println(path);
		
		Controller cntr = mappings.get(path);
		cntr.execute(req, resp);
	}
}
