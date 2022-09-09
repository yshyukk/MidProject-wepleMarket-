package com.dev.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.Addr;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class addressChangeController implements Controller {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("addrchange");
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		UserService service = UserService.getInstance();
		
		
		String addrName = req.getParameter("addrName");
		String userId = (String) session.getAttribute("userId");
		String addr = req.getParameter("addr");
		String post = req.getParameter("post");
		
		
		// 기존 기본주소지
		List<Addr> curr = service.addressListD(userId);
		System.out.println("curr: " + curr);
		for(Addr ad : curr) {
			// default 값 없애기
			service.outAddress(ad);
		}
		
		// 새로운 기본주소지
		Addr newad = new Addr();
		newad.setAddrName(addrName);
		newad.setUserId(userId);
		System.out.println("newad.addrName: " + newad.getAddrName());
		System.out.println("newad.userId: " + newad.getUserId());
		service.changeAddress(newad);
		
		
		// json
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
		jObject.put("addrName", newad.getAddrName());
		jObject.put("addr", addr);
		jObject.put("post", post);
		jArray.add(jObject);
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(jArray));
		} catch(IOException e) {
			e.printStackTrace();
		}

	}
}