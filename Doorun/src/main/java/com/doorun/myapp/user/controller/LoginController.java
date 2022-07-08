package com.doorun.myapp.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doorun.myapp.user.dao.UserDAO;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		
		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		
		UserVO user = userDAO.getUser(vo);
		if (user != null) {			
			session.setAttribute("userName", user.getName());
			return "login.do";
		} else
			return "login.jsp";
	}
}
