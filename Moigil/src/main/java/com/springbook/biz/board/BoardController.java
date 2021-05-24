package com.springbook.biz.board;




import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class BoardController {
	
	@Autowired
	private BoardRepository DAO;
	
	
	


	@PostMapping("insertBoard.do")
	public String insertBoard(Board board) {
		DAO.save(board);
	  return "getBoardList.do";
	}
	@RequestMapping("getBoardList.do")
	public String getBoardlist(Model model,@RequestParam(name="PageNo",defaultValue = "0")Integer pNo){
		Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"boardNo");
		Page<Board> page = DAO.findAll(pageable);
		model.addAttribute("page", page);
		return "getBoardList.jsp";
	}
	
	
	

	 
	
	
}
