package com.company.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.Spring_MVC_Board.board.BoardDAO;
import com.company.Spring_MVC_Board.board.BoardDO;

public class GetBoardListController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		
		System.out.println("전체 게시물 목록 처리");
		
		String searchField = "";
		String searchText = "";
		
		if(request.getParameter("searchCondition")!="" && request.getParameter("searchKeyword")!="") {
			searchField = request.getParameter("searchCondition");
			searchText = request.getParameter("searchKeyword");
		}
		
		BoardDO boardDO = new BoardDO();
		BoardDAO boardDAO = new BoardDAO();
		
		List<BoardDO> boardList = boardDAO.getBoardList(searchField, searchText);
		/**********************MVC와 다른 부분***************************/
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", boardList); //session저장하면 서버에 부담이 됨, 결과값 저장은 addObject, Model 정보저장
		mav.setViewName("getBoardList"); //View 정보 저장
		
		return mav;
	}

}
