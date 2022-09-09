<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<div class="listResult">
 <div class="sum">
 <span style="display:none"></span>
 
		
  총 합계 : ${param.totalPrice }원
  // prodId, amount정보도 필요한데
  // 이건 장바구니 페이지에 데이터가 있고 그걸 넘겨와야하는데
  // 장바구니 페이지에서 이 데이터는 cart.js에서 insertCart로 넘겨서 처리하고
  // 
  // 그러면 readCard.do의 데이터 정보를 이 페이지로 넘길 수는 없나
  // 
  
   <form method="get" action="../readCart.do">
   	<input type="submit" style="display:none">
   </form>
 </div>
 <div class="orderOpne">
  <button type="button" class="orderOpne_bnt">주문 정보 입력</button>
 </div>
</div>
<div class="orderInfo">
 <form role="form" method="post" autocomplete="off">
    
  <input type="hidden" name="amount" value="${sum}" />
    
  <div class="inputArea">
   <label for="">수령인</label>
   <input type="text" name="orderRec" id="orderRec" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="orderPhon">수령인 연락처</label>
   <input type="text" name="orderPhon" id="orderPhon" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr1">우편번호</label>
   <input type="text" name="userAddr1" id="userAddr1" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr2">1차 주소</label>
   <input type="text" name="userAddr2" id="userAddr2" required="required" />
  </div>
  
  <div class="inputArea">
   <label for="userAddr3">2차 주소</label>
   <input type="text" name="userAddr3" id="userAddr3" required="required" />
  </div>
  
  <div class="inputArea">
   <button type="submit" class="order_btn">주문</button>
   <button type="button" class="cancel_btn">취소</button> 
  </div>
  
 </form> 
</div>
