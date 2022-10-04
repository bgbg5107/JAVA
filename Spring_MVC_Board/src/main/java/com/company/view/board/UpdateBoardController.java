package com.company.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.company.Spring_MVC_Board.board.BoardDAO;
import com.company.Spring_MVC_Board.board.BoardDO;

public class UpdateBoardController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("EUC-KR");
		System.out.println("게시물 수정 처리완료");
		
		String seq = request.getParameter("seq");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDO boardDO = new BoardDO();
		boardDO.setSeq(Integer.parseInt(seq));
		boardDO.setTitle(title);
		boardDO.setContent(content);
		
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.updateBoard(boardDO);
		
		//insert,update,delete 모델정보 필요없고 view정보만 필요
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:getBoardList.do"); //view 정보만 저장
		
		return mav;
	}

}
