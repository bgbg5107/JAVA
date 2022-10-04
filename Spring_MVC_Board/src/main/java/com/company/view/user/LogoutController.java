package com.company.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LogoutController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그아웃 처리완료");
		
		HttpSession session = request.getSession();
		session.invalidate(); //현재 세션 객체를 무효화시킨다.
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:login.jsp");
		return mav; 
	}
}
