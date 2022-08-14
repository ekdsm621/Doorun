	package com.doorun.myapp.run.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doorun.myapp.run.dao.RunService;
import com.doorun.myapp.run.vo.RunVO;


@Controller
public class RunController {
	
	@Autowired
	private RunService runService;
	
	@RequestMapping("/getRecordList.do")
	public String getRecordList(RunVO vo, Model model, HttpSession session) {
		
		vo.setMember_id((String)session.getAttribute("id"));
		
		model.addAttribute("recordList",runService.getRecordList(vo));
		
		return "getRecordList.jsp";
	}
	
	@RequestMapping("/detailRecord.do")
	public String detailRecord(RunVO vo, Model model, HttpSession session,HttpServletRequest req) {
		
		List<RunVO> locationList = runService.getMap(vo);
		
		double startLat = Double.parseDouble(locationList.get(0).getLatitude());
		double endLat = Double.parseDouble(locationList.get(locationList.size()-1).getLatitude());
		double startLong = Double.parseDouble(locationList.get(0).getLongitude());
		double endLong =Double.parseDouble(locationList.get(locationList.size()-1).getLongitude());
			
		double centerLat = Double.sum(startLat, endLat)/2;
		double centerLong = Double.sum(startLong, endLong)/2;


		double distance = runService.distance(startLat, startLong, endLat, endLong);
		
		Map<String, Double> map = new HashMap<String, Double>();
		map.put("startLat", startLat);
		map.put("endLat", endLat);
		map.put("startLong", startLong);
		map.put("endLong", endLong);
		map.put("centerLat", centerLat);
		map.put("centerLong", centerLong);
		map.put("distance", distance);
		
		req.setAttribute("locationList",locationList);
		req.setAttribute("map", map);
		
		return "detail_Record.jsp";
		
	}
	

}
