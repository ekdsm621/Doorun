package com.doorun.myapp.user.controller;


import javax.servlet.http.HttpServletRequest;
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
		
		
		if (vo.getLogin() == null || vo.getLogin().equals("")) {
			throw new IllegalArgumentException("�α��� ����");
		}
		
		UserVO user = userService.getUser(vo);
		if (user != null) {			
			session.setAttribute("name", user.getName());
			session.setAttribute("password", user.getPassword());
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
		
		userService.insert(vo);
		return "login.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) {
		
		userService.update(vo);
		return "updateUser.jsp";
	}
	
	@RequestMapping("/updatepw.do")
	public String updatePw(UserVO vo, HttpServletRequest req, HttpSession session) {
		
		String currentPassword =req.getParameter("currentPassword");
		if(currentPassword.equals(session.getAttribute("password"))) {
			userService.updatePassword(vo);
			return "updateUser.jsp";
		}else {
			System.out.println("실패");
			return "updateUser.jsp";
		}
	}
	
	@RequestMapping(value="/findpw.do", method=RequestMethod.GET)
	public String findPw(UserVO vo,Model model,HttpSession session) throws Exception{
		
		
		System.out.println("1");
		if(userService.findPwCheck(vo)==0) {
			System.out.println("1");
			model.addAttribute("msg", "아이디와 이메일를 확인해주세요");
			
			return "";
		}else {
			System.out.println("2");
			userService.sendEmail(vo.getEmail(),session);
			model.addAttribute("member", vo.getEmail());
		
		return"";
		}
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
