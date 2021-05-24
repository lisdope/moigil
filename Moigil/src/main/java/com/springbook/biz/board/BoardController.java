package com.springbook.biz.board;




import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springbook.biz.reply.Reply;


@Controller
public class BoardController {
	
	@Autowired
	private BoardRepository DAO;
	
	
	


	@RequestMapping("getBoard.do")
	public String getBoard(Model model,Board board) {
		board = DAO.findById(board.getBoardNo()).get();
		board.setBoardHits(board.getBoardHits()+1); // 조회수 1증가
		DAO.save(board); // 데이터베이스에 저장
		model.addAttribute("board",board);
	  return "getReplyList.do";
	}
	@RequestMapping("getBoardList.do")
	public String getBoardList(Model model,ArrayList<Board> board, ArrayList<Board> board_n) {
		board = DAO.boardlistDesc();
		board_n = DAO.boardlistDesc_n();
		model.addAttribute("boardList",board);
		model.addAttribute("boardList_n",board_n);
		
		return "getBoardList.jsp";
	}
	
	@RequestMapping("editBoard.do") // 글수정
	  public String editBoard(@RequestParam("boardNo")Integer no,Model model) {
		Board board = DAO.findById(no).get();
		model.addAttribute("board",board);
	      return "updateBoard.jsp";
	  }
	
	

	 
	
	
}
