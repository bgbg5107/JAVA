package com.company.view.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.annotation.user.UserDAO;
import com.company.annotation.user.UserDTO;

public class CartController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserid(userid);
		userDTO.setPwd(pwd);
		
		UserDAO userDAO = new UserDAO();
		UserDTO user = userDAO.login(userid, pwd);
		return null;
	}

}
