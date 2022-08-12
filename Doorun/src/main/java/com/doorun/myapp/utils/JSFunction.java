package com.doorun.myapp.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


public class JSFunction {
	public static void alertLocation(HttpServletResponse resp, String msg) {
		 try {
			 resp.setContentType("text/html;charset=UTF-8");
			 PrintWriter writer = resp.getWriter();
			 String script=""
					 +"<script>"
					 +"   alert('"+msg+"');"
					 +"</script>";
			 writer.print(script);
		} catch (Exception e) {}
	}
	
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			 resp.setContentType("text/html;charset=UTF-8");
			 PrintWriter writer = resp.getWriter();
			 String script=""
					 +"<script>"
					 +"   alert('"+msg+"');"
					 +"   history.back();"
					 +"</script>";
			 writer.print(script);
			
			
			
			
		} catch (Exception e) {}
	}
	

	

}
