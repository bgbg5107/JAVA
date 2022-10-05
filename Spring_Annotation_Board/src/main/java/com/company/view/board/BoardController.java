package com.company.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.annotation.board.BoardDAO;
import com.company.annotation.board.BoardDO;

/*
 * 스프링MVC 구조의 5개 XxxController를 통합한 컨트롤러 클래스이다. 
	==> POJO(Plain Old Java Object) 클래스란? ★★★★★★
	==> 부모 클래스로부터 상속도 받지 않고, 어떤 인터페이스로부터 구현도 받지 않은 순수한 자바 클래스
	
	BoardController 클래스 선언부 위에 @Controller 어노테이션을 붙이면 스프링 컨테이너는 
	@Controller에 선언된 객체를 자동으로 Controller 객체로 인식한다.
	
	★★★★ Command 객체는 Controller 메소드 매개변수로 받은 DO(Data Object)객체라고 보면 된다.
	★★★★ Command 객체란? 
	★★★★  ==> 클라이언트가 보내주는 파라미터가 자동으로 담겨서 반환되는 객체를 말한다. 이것은 '자동객체변환'이라는 말로도 이해할 수 있는데, MVC 패턴에서 가장 큰 핵심기술에 해당한다.
 */

@Controller
public class BoardController {
	//전체 게시글 목록 처리 메소드
	//getBoardListController 역할
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardDO boardDO, BoardDAO boardDAO, Model model, String searchCondition, String searchKeyword) {
		model.addAttribute("boardList", boardDAO.getBoardList(searchCondition, searchKeyword));
		return "getBoardList.jsp";
	}
	
	//게시글 상세보기 처리 메소드, Model은 select 작업에만 필요(결과있는것)
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardDO boardDO, BoardDAO boardDAO, Model model) {
		model.addAttribute("board", boardDAO.getBoard(boardDO));
		return "getBoard.jsp";
	}
	
	//새 게시글 등록처리 메소드
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.insertBoard(boardDO);
		return "getBoardList.do";
	}
	
	//게시글 수정처리 메소드
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.updateBoard(boardDO);
		return "getBoardList.do";
	}
	
	//게시글 삭제처리 메소드
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.deleteBoard(boardDO);
		return "getBoardList.do";
	}
	
	
}
