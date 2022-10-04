package com.company.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.Spring_MVC_Board.user.UserDAO;
import com.company.Spring_MVC_Board.user.UserDO;

public class LoginController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("�α��� ó�� �Ϸ�");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		UserDO userDO = new UserDO();
		userDO.setId(id);
		userDO.setPassword(password);
		
		UserDAO userDAO = new UserDAO();
		UserDO user = userDAO.getUser(userDO);
		
		//MVC FW ���� ����� �ٸ� �κСڡڡڡڡڡڡڡڡڡ�
		ModelAndView mav = new ModelAndView(); //��ü ����
		
		if(user != null) {//�α��� ����
			HttpSession session = request.getSession();
			session.setAttribute("idkey", id);
			mav.setViewName("redirect:getBoardList.do"); //View ���� ����
			System.out.println("�α��� ����");
		}else { //�α��� ���� �� 
			mav.setViewName("redirect:login.jsp");
			System.out.println("�α��� ����");
		}
		
		return mav; //����Ÿ���� ModelAndView , MVC�� ����Ÿ���� String
	}

}
