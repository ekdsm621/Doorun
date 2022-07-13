package com.doorun.myapp.user.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doorun.myapp.user.dao.UserService;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class UserController {
	
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session , Model model) {
		
		System.out.println(vo.getEmail());
		System.out.println(vo.getPassword());
		
		if (vo.getLogin() == null || vo.getLogin().equals("")) {
			throw new IllegalArgumentException("�α��� ����");
		}
		
		UserVO user = userService.getUser(vo);
		if (user != null) {			
			model.addAttribute("user", user);
			return "updateUser.jsp";  
		} else
			return "login.jsp";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
	
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {
		
		System.out.println(vo.getId());
		System.out.println(vo.getName());
		System.out.println(vo.getPassword());
		System.out.println(vo.getEmail());
		
		userService.insert(vo);
		return "login.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) {
		
		userService.update(vo);
		return "updateUser.jsp";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteBoard(UserVO vo) {
		
		userService.delete(vo);
		return "";
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(UserVO vo, Model model) {
		
		model.addAttribute("user", userService.getUser(vo));
		return "";
	}
	
	@RequestMapping("/getUserList.do")
	public String getUserList(UserVO vo, Model model) {
		
		model.addAttribute("UserList", userService.getUserList(vo));
		return "";
	}
	
	 
	

}
