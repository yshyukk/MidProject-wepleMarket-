package com.dev.controller.user;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.User;

public class UserInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService service = UserService.getInstance();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		String ml1 = req.getParameter("mail1");
		String ml2 = req.getParameter("mail2");
		String nm = req.getParameter("name");
		String pst = req.getParameter("post");
		String ard1 = req.getParameter("address1");
		String ard2 = req.getParameter("address2");
		String ard3 = req.getParameter("address3");
		String pn1 = req.getParameter("pnum1");
		String pn2 = req.getParameter("pnum2");
		String pn3 = req.getParameter("pnum3");
		String bday = req.getParameter("birth");
		String gen = req.getParameter("gender");
		
		User vo = new User();
		vo.setUserId(id);
		vo.setUserPwd(pw);
		vo.setEmail1(ml1);
		vo.setEmail2(ml2);
		vo.setUserName(nm);
		vo.setZipCode(Integer.parseInt(pst));
		vo.setAddr(ard1);
		vo.setAddr2(ard3);
		vo.setAddrDetail(ard2);
		vo.setPhone1(pn1);
		vo.setPhone2(pn2);
		vo.setPhone3(pn3);
		vo.setBirth(Date.valueOf(bday));
		vo.setGender(gen);
		
		service.addUser(vo);
		
		req.setAttribute("user", vo);
		
		Utils.forward(req, resp, "account/login.tiles");
		
	}

}