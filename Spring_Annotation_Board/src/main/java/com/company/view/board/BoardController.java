package com.company.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.annotation.board.BoardDAO;
import com.company.annotation.board.BoardDO;

/*
 * ������MVC ������ 5�� XxxController�� ������ ��Ʈ�ѷ� Ŭ�����̴�. 
	==> POJO(Plain Old Java Object) Ŭ������? �ڡڡڡڡڡ�
	==> �θ� Ŭ�����κ��� ��ӵ� ���� �ʰ�, � �������̽��κ��� ������ ���� ���� ������ �ڹ� Ŭ����
	
	BoardController Ŭ���� ����� ���� @Controller ������̼��� ���̸� ������ �����̳ʴ� 
	@Controller�� ����� ��ü�� �ڵ����� Controller ��ü�� �ν��Ѵ�.
	
	�ڡڡڡ� Command ��ü�� Controller �޼ҵ� �Ű������� ���� DO(Data Object)��ü��� ���� �ȴ�.
	�ڡڡڡ� Command ��ü��? 
	�ڡڡڡ�  ==> Ŭ���̾�Ʈ�� �����ִ� �Ķ���Ͱ� �ڵ����� ��ܼ� ��ȯ�Ǵ� ��ü�� ���Ѵ�. �̰��� '�ڵ���ü��ȯ'�̶�� ���ε� ������ �� �ִµ�, MVC ���Ͽ��� ���� ū �ٽɱ���� �ش��Ѵ�.
 */

@Controller
public class BoardController {
	//��ü �Խñ� ��� ó�� �޼ҵ�
	//getBoardListController ����
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardDO boardDO, BoardDAO boardDAO, Model model, String searchCondition, String searchKeyword) {
		model.addAttribute("boardList", boardDAO.getBoardList(searchCondition, searchKeyword));
		return "getBoardList.jsp";
	}
	
	//�Խñ� �󼼺��� ó�� �޼ҵ�, Model�� select �۾����� �ʿ�(����ִ°�)
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardDO boardDO, BoardDAO boardDAO, Model model) {
		model.addAttribute("board", boardDAO.getBoard(boardDO));
		return "getBoard.jsp";
	}
	
	//�� �Խñ� ���ó�� �޼ҵ�
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.insertBoard(boardDO);
		return "getBoardList.do";
	}
	
	//�Խñ� ����ó�� �޼ҵ�
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.updateBoard(boardDO);
		return "getBoardList.do";
	}
	
	//�Խñ� ����ó�� �޼ҵ�
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.deleteBoard(boardDO);
		return "getBoardList.do";
	}
	
	
}
