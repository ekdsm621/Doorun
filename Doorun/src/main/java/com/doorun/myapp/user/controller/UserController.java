package com.doorun.myapp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.user.dao.UserDAO;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {	
		
		dao.insert(vo);
		return "";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) {
		
		dao.update(vo);
		return "";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteBoard(UserVO vo) {
		
		dao.delete(vo);
		return "";
	}
	
	@RequestMapping("/getUser.do")
	public String getUser(UserVO vo, Model model) {
		
		model.addAttribute("user", dao.getUser(vo));
		return "";
	}
	
	@RequestMapping("/getUserList.do")
	public String getUserList(UserVO vo, Model model) {
		
		model.addAttribute("UserList", dao.getUserList(vo));
		return "";
	}
	
	
	

}
