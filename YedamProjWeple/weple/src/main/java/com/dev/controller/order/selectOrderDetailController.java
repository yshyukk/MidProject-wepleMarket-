package com.dev.controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.buy.BuyService;
import com.dev.vo.Buy;
import com.dev.vo.OrderHisDetail;

public class selectOrderDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// userId, 주문번호 넘어와야한다
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
		int orderNum = Integer.parseInt(req.getParameter("orderNum"));
		
		System.out.println(userId);
		System.out.println(orderNum);
		
		// 그거에 따라서 buy_process에서 조회하기
		BuyService buyService = BuyService.getInstance();
		List<OrderHisDetail> orderHisDetailList = buyService.showAllBuy(userId, orderNum);
		
		for (OrderHisDetail detail : orderHisDetailList) {
			System.out.println(detail);
		}
		
		
		// 조회한 데이터 넘겨서 orderHistoryDetail.jsp로 넘기기
		req.setAttribute("orderHisDetailList", orderHisDetailList);
		
		Utils.forward(req, resp, "user/orderHisDetail.tiles");
		
	}

}
