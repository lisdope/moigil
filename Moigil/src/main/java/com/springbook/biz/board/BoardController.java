package com.springbook.biz.board;




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
	
	//글 쓰기
	@PostMapping("insertBoard.do")
	public String insertBoard(Board board) {
		DAO.save(board);
		return "getBoardList.do";
	}
	//글 리스트 불러오기 페이지단위로 부른다.
	@RequestMapping("getBoardList.do")
	public String getBoardlist(Model model,@RequestParam(name="PageNo",defaultValue = "0")Integer pNo){
		Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"boardNo");
		Page<Board> page = DAO.findAll(pageable);
		model.addAttribute("page", page);
		return "getBoardList.jsp";
	}
	// 글 보기
    @RequestMapping("getBoard.do")
	public String getBoard(Model model,Board board) {
		board = DAO.findById(board.getBoardNo()).get();
		board.setBoardHits(board.getBoardHits()+1); // 조회수 1증가
		DAO.save(board); // 데이터베이스에 저장
		model.addAttribute("board",board);
	  return "getBoard.jsp";
	}
    // 글수정
	@RequestMapping("editBoard.do") 
	  public String editBoard(@RequestParam("boardNo")Integer no,Model model) {
		Board board = DAO.findById(no).get();
		model.addAttribute("board",board);
	      return "updateBoard.jsp";
	  }
	// 조회수 안오르는 보드
	@RequestMapping("Board.do") 
	public String board(Model model,Board board) {
		board = DAO.findById(board.getBoardNo()).get();
		model.addAttribute("board",board);
	  return "getBoard.jsp";// 종착지에서 뷰를 보여줘야하는데, 또 이상한 호출을 해가지고 무한루프가 형성됨
	}
	// 글 삭제
	@RequestMapping("deleteBoard.do")
	  public String deleteBoard(Board board) {
		DAO.deleteById(board.getBoardNo());
	      return "getBoardList.do";
	  }
	
	

	 
	
	
}