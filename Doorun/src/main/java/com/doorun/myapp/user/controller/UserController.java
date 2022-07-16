package com.doorun.myapp.user.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doorun.myapp.run.vo.LocationVO;
import com.doorun.myapp.user.dao.UserService;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class UserController {
	
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session , Model model) {
		
		UserVO user;
		if(vo.getPassword()==null) {
			user = userService.getKakaoUser(vo);
		}else {
			user = userService.getUser(vo);
		}
		if (user != null) {			
			session.setAttribute("id", user.getId());
			session.setAttribute("nickname", user.getNickname());
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
		
		if(vo.getPassword()==null) {
			userService.kakaoInsert(vo);
		}else {
			userService.insert(vo);
			
		}
		return "login.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) {
		
		userService.update(vo);
		return "updateUser.jsp";
	}
	
	@RequestMapping("/updatepw.do")
	public String updatePw(UserVO vo, HttpSession session,HttpServletRequest req) {
		
		String inputPassword = req.getParameter("currentPassword");
		
		String id = (String) session.getAttribute("id");
		String savedPassword = userService.passwordCheck(id);
		
		if(inputPassword.equals(savedPassword)) {
			userService.updatePassword(vo);
			return "updateUser.jsp";
		}else {
			System.out.println("실패");
			return "updateUser.jsp";
		}
	}
	
	@RequestMapping(value="/findpw.do", method=RequestMethod.GET)
	public String findPw(UserVO vo,Model model,HttpSession session) throws Exception{
		
		String nickename = userService.getUserWithEmail(vo);
		
		vo.setNickname(nickename);
		
		System.out.println("1");
		if(userService.findPwCheck(vo)==0) {
			System.out.println("아이디와 이메일를 확인해주세요");
			model.addAttribute("msg", "아이디와 이메일를 확인해주세요");
			
			return "";
		}else {
			System.out.println("2");
			userService.sendEmail(vo,session);
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
	
	@RequestMapping("/getMap.do")
	public String getMap(LocationVO vo, Model model,HttpServletRequest req) {
		
//		LocationVO vo1 = new LocationVO();
//		LocationVO vo2 = new LocationVO();
//		
//		vo1.setLatitude(37.47836955);
//		vo1.setLongitude(126.87926727);
//		vo2.setLatitude(37.47857905);
//		vo2.setLongitude(126.87922677);
//		List<LocationVO> list = new ArrayList<LocationVO>();
//		list.add(vo1);
//		list.add(vo2);
//		req.setAttribute("locationList",list);
		
		
		
		req.setAttribute("locationList",userService.getMap(vo));
		return "mapTest.jsp";
	}
	 
	

}
