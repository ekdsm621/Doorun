package com.doorun.myapp.user.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.run.vo.RunVO;
import com.doorun.myapp.user.dao.UserService;
import com.doorun.myapp.user.vo.UserVO;

@Controller
public class UserController {
	
	
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session , Model model ) {
		
		UserVO user;
		if(vo.getPassword()==null) {
			user = userService.getKakaoUser(vo);
			if(user == null) {
				return "kakaoInsert.jsp";
			}
		}else {
			user = userService.getUser(vo);
		}
		if (user != null) {			
			session.setAttribute("id", user.getId());
			session.setAttribute("profile_image", user.getProfile_image());
			session.setAttribute("nickname", user.getNickname());
			session.setAttribute("member_type", user.getMember_type());
			model.addAttribute("user", user);
			return "updateUser.jsp";  
		} else
			session.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
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
	@ResponseBody
	@RequestMapping("/sendSMS.do")
	public String sendSMS(String phoneNumber) {
		
		
		System.out.println("컨트롤러");

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        userService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) throws IllegalStateException, IOException {
		
		MultipartFile uploadFile = vo.getImageFile();
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/git/Doorun/Doorun/src/main/webapp/upload_img/profile_img/"+fileName));
			vo.setProfile_image(fileName);
			userService.update(vo);
		}else {
			userService.update2(vo);
			System.out.println("asfasdfasdf");
		}
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
	

	

}
