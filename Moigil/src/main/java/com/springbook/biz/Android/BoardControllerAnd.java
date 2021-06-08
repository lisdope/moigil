package com.springbook.biz.Android;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springbook.biz.board.Board;



@Controller
public class BoardControllerAnd {
	@Autowired
	private BoardRepositoryAnd DAO;
	
	@GetMapping("/allBoard")
	public List<Board> findAllBoards(){
		System.out.println("보드리스트 호출 확인");
		return DAO.findAll();
	}
	
//	@PostMapping("/insert")
//	public void insertBoard(Board board) {
//		boardService.insertBoard(board);
//	}
//	
//	@PutMapping("/modifyBoard")
//	public void modifyBoard(Board board) {
//		boardService.modifyBoard(board);
//	}

	
//	@DeleteMapping("/deleteBoard")
//	public void deleteBoard(@RequestParam("targets") String targets) {
//		String[] boardIds = targets.split(",");
//		for(String boardId : boardIds) {
//			Optional<Board> target = DAO.findById(boardId);
//			if(target.isPresent()) {
//				DAO.deleteById(boardId);
//				
//			}else {
//				throw new RuntimeException();
//			}
//		}
//	}
}
	


