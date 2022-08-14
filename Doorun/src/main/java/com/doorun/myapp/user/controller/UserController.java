package com.doorun.myapp.user.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.doorun.myapp.crew.vo.CrewVO;
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
			return "/index.jsp";  
		} else
			session.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "login.jsp";
	}
	
	@RequestMapping(value = "/UserSetting.do")
	public String UserSetting(UserVO vo, HttpSession session , Model model ) {
		
		UserVO user;
		vo.setId((String)session.getAttribute("id"));
		user = userService.getUserWithId(vo.getId());
		model.addAttribute("user", user);
		return "updateUser.jsp";
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
		}
		return "UserSetting.do";
	}
	
	
	
	@RequestMapping("/updatepw.do")
	public String updatePw(UserVO vo, HttpSession session,HttpServletRequest req) {
		
		String inputPassword = req.getParameter("currentPassword");
		
		String id = (String) session.getAttribute("id");
		String savedPassword = userService.passwordCheck(id);
		
		if(inputPassword.equals(savedPassword)) {
			userService.updatePassword(vo);
			return "UserSetting.do";
		}else {
			System.out.println("실패");
			return "UserSetting.do";
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
	
	@RequestMapping("/userDetail.do")
	public String userDetail(HttpSession session, UserVO vo, Model model) {
		vo.setId((String)session.getAttribute("id"));
		

		
		// 프로필 + 요약
		UserVO userDesc = userService.getUserDesc(vo);
		
		// 1. 거리
		userDesc.setTotal_distance((double)Math.round(userDesc.getTotal_distance()*100)/100);
		
		// 2. 시간
		double duration = userDesc.getTotal_duration();
		int totalHour = (int)(duration / 3600);
		duration -= totalHour * 3600;
		int totalMin = (int)(duration / 60);
		duration -= totalMin * 60;
		int totalSec = (int)(duration);
		
		String totalHour_str = Integer.toString(totalHour);
		if(totalHour_str.length()==1) {
			totalHour_str= "0"+totalHour_str;
		}
		String totalMin_str = Integer.toString(totalMin);
		if(totalMin_str.length()==1) {
			totalMin_str= "0"+totalMin_str;
		}
		String totalSec_str = Integer.toString(totalSec);
		if(totalSec_str.length()==1) {
			totalSec_str= "0"+totalSec_str;
		}
		
		model.addAttribute("totalHour",totalHour_str);
		model.addAttribute("totalMin",totalMin_str);
		model.addAttribute("totalSec",totalSec_str);
		
		
		// 3. 페이스
		double pace = userDesc.getTotal_duration() / userDesc.getTotal_distance();
		int paceMin = (int)(pace / 60);
		int paceSec = (int)(pace % 60);
		
		String paceSec_str = Integer.toString(paceSec);
		if(paceSec_str.length()==1) {
			paceSec_str= "0"+paceSec_str;
		}
		model.addAttribute("userDesc",userDesc);
		model.addAttribute("paceMin",paceMin);
		model.addAttribute("paceSec",paceSec_str);
		
		// 활동 기록
		List<RunVO> userRecordList = userService.getUserRecordList(vo);
		for(RunVO run:userRecordList) {
			// 시간
			int runDuration = Integer.parseInt(run.getDuration());
			
			int tempDuration = runDuration;
			int runHour = (int)(tempDuration / 3600);
			tempDuration -= runHour * 3600;
			int runMin = (int)(tempDuration / 60);
			tempDuration -= runMin * 60;
			
			String runHour_str = Integer.toString(runHour);
			if(runHour_str.length()==1) {
				runHour_str= "0"+runHour_str;
			}
			String runMin_str = Integer.toString(runMin);
			if(runMin_str.length()==1) {
				runMin_str= "0"+runMin_str;
			}
			
			String tempDuration_str = Integer.toString(tempDuration);
			if(tempDuration_str.length()==1) {
				tempDuration_str= "0"+tempDuration_str;
			}
			
			String strDuration = runHour_str + ":" + runMin_str + ":" + tempDuration_str;
			run.setDuration(strDuration);
			
			// 페이스
			double runDistance = Double.parseDouble(run.getDistance());
			double runPace = runDuration / runDistance;
			int runPaceMin = (int)(runPace / 60);
			int runPaceSec = (int)(runPace % 60);
			
			String runPaceSec_str = Integer.toString(runPaceSec);
			if(runPaceSec_str.length()==1) {
				runPaceSec_str= "0"+runPaceSec_str;
			}
			
			String strRunPace = runPaceMin + "'" + runPaceSec + "''";
			run.setAvg_speed(strRunPace);
		}
		model.addAttribute("userRecordList", userRecordList);
		
		// 가입한 크루
		model.addAttribute("joinedCrewList", userService.getJoinedCrewList(vo));
		
		//그래프 거리 
		UserVO graph = userService.recordForGraph(vo);
		model.addAttribute("graph",graph);
		
		//그래프 날짜값
		UserVO date = userService.dateForGraph(vo);
		model.addAttribute("date",date);
		
		return "user_detail.jsp";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/emailcheck.do" , method=RequestMethod.POST )
	public String EmailCheck( String email) throws Exception {
		int result = userService.EmailCheck(email);
		String check = null;
		if (result == 1) {
			check = "n";
		}else {
			check = "y";
		}
		
		return check;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/idcheck.do" , method=RequestMethod.POST)
	public String IdCheck(String id) throws Exception {
		int result = userService.IdCheck(id);
		String check = null;
		if (result == 1) {
			check = "n";
		}else {
			check = "y";
		}
		
		return check;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nicknamecheck.do" , method=RequestMethod.POST)
	public String NicknameCheck(String nickname) throws Exception {
		int result = userService.NicknameCheck(nickname);
		String check = null;
		if (result == 1) {
			check = "n";
		}else {
			check = "y";
		}
		
		return check;
	}
	
	

	

}
