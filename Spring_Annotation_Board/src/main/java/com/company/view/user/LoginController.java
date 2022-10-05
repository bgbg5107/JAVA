package com.company.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.annotation.user.UserDAO;
import com.company.annotation.user.UserDO;

/*
 * POJO Ŭ����
 */

@Controller
public class LoginController{
	@RequestMapping("/login.do")
	public String login(UserDO userDO, UserDAO userDAO, HttpSession session) {
		UserDO user = userDAO.getUser(userDO);
		
		if(user != null) { //�α��μ���
			session.setAttribute("idkey", user.getId());
			System.out.println("�α��� ����");
			return "getBoardList.do";
		}else {
			System.out.println("�α��� ����");
			return "login.jsp";
		}
	}
	

}
