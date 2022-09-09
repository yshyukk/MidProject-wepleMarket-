package com.dev.controller.mypage;

import java.io.IOException;

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

public class addressUpdateController implements Controller {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		resp.setContentType("text/json;charset=utf-8");
	
		UserService service = UserService.getInstance();
		
		String id = (String) session.getAttribute("userId");
		String adn = req.getParameter("addr_name");
		String pst = req.getParameter("post");
		String ard1 = req.getParameter("address1");
		String ard2 = req.getParameter("address2");
		String ard3 = req.getParameter("address3");
		
		Addr vo = new Addr();
		vo.setUserId(id);
		vo.setAddrName(adn);
		vo.setZipCode(Integer.parseInt(pst));
		vo.setAddr(ard1);
		vo.setAddr2(ard3);
		vo.setAddrDetail(ard2);
		
		service.modifyAddress(vo);
		
		req.setAttribute("user", vo);
		
		
		// 저장한 주소 정보 가져오기
		Addr newad = service.getAddr(id, adn);
		
		// json
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
		jObject.put("addrName", newad.getAddrName());
		jObject.put("addr", newad.getAddr());
		jObject.put("post", newad.getZipCode());
		jObject.put("addr2", newad.getAddr2());
		jObject.put("addrDetail", newad.getAddrDetail());
		jArray.add(jObject);
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(jArray));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

}
