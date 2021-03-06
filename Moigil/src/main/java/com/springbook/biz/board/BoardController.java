package com.springbook.biz.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@SessionAttributes("board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardRepository DAO;
	
	//자유게시판 글 쓰기 
	@PostMapping("insertBoard.do")
	public String insertBoard(Board board,@RequestParam(name="areaCode",defaultValue = "0")String aNo) {
		DAO.save(board);
		if(aNo.equals("자유")) {
			return "redirect:getBoardList.do";
		}
		return "redirect:getBoardList.do";
		
	}
	//지역별게시판 글 쓰기 
	@PostMapping("insertBoard_Area.do")
	public String insertBoard_Area(Board board,@RequestParam(name="areaCode",defaultValue = "0")String aNo) {
		DAO.save(board);
		if(aNo.equals("자유")) {
			return "redirect:getBoardListArea.do";
		}
		return "redirect:getBoardListArea.do";
		
	}
	

	//글 리스트 불러오기 페이지단위로 부른다.
	@RequestMapping("getBoardList.do")
	public String getBoardlist(Model model,@RequestParam(name="PageNo",defaultValue = "0")Integer pNo, 
								@RequestParam(name="searchCondition",defaultValue = "0")String searchCondition,
								@RequestParam(name="searchKeyword",defaultValue = "0")String searchKeyword){
		
		if (searchCondition.equals("TITLE") && searchKeyword != null) {
			Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"boardNo");
			Page<Board> page = DAO.findByBoardtitle(searchKeyword, pageable);
			model.addAttribute("page", page);
			return "getBoardList.jsp";
		}else if (searchCondition.equals("CONTENT") && searchKeyword != null) {
			Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"boardNo");
			Page<Board> page = DAO.findByBoardcontent(searchKeyword, pageable);
			model.addAttribute("page", page);
			return "getBoardList.jsp";
		}
		Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"boardNo");
		Page<Board> page = DAO.findAll(pageable);
		model.addAttribute("page", page);
		return "getBoardList.jsp";
	}
	
	//글 리스트 불러오기 페이지단위로 부른다.
		@RequestMapping("getBoardListArea.do")
		public String getBoardlistArea(Model model,@RequestParam(name="PageNo",defaultValue = "0")Integer pNo ,@RequestParam(name="areaCode",defaultValue = "0")String aNo){
			Pageable pageable = PageRequest.of(pNo, 10,Sort.Direction.ASC,"boardNo");
			Page<Board> page = DAO.findAllByAreaCode(pageable, aNo);
			model.addAttribute("page", page);
			return "getBoardListArea.jsp";
		}
	
	// 글 보기
    @RequestMapping("getBoard.do")
	public String getBoard(Model model,Board board) {
		board = DAO.findById(board.getBoardNo()).get();
		board.setBoardHits(board.getBoardHits()+1); // 조회수 1증가
		DAO.save(board); // 데이터베이스에 저장
		model.addAttribute("board",board);
	  return "getReplyList.do";
	}
    // 글 삭제
    @RequestMapping("deleteBoard.do")
    public String deleteBoard(Board board) {
    	DAO.deleteById(board.getBoardNo());
    	return "redirect:getBoardList.do";
    }
    // 글수정
	@RequestMapping("editBoard.do") 
	  public String editBoard(@RequestParam("boardNo")Integer no,Model model) {
		Board board = DAO.findById(no).get();
		model.addAttribute("board",board);
	      return "updateBoard.jsp";
	  }
	
	@RequestMapping("BoardRatingLike.do")
	public String boardRatingLike(Model model,Board board) {
		board = DAO.findById(board.getBoardNo()).get();
		board.setBoardRatingLike(board.getBoardRatingLike()+1); // 좋아요 1증가
		DAO.save(board); // 데이터베이스에 저장
		model.addAttribute("board",board);
	  return "Board.do";
	}
	@RequestMapping("boardRatingHate.do")
	public String boardRatingHate(Model model,Board board) {
		board = DAO.findById(board.getBoardNo()).get();
		board.setBoardRatingLike(board.getBoardRatingLike()-1); // 좋아요 1감소
		DAO.save(board); // 데이터베이스에 저장
		model.addAttribute("board",board);
	  return "Board.do";
	}
	

	// 조회수 안오르는 보드
	@RequestMapping("Board.do") 
	public String board(Model model,Board board) {
		System.out.println("Board.do (전)의 : " + board.getBoardNo());
		board = DAO.findById(board.getBoardNo()).get();
		model.addAttribute("board",board);
		System.out.println("Board.do (후)의 : " + board.getBoardNo());
		return "getReplyList.do?boardNo=" + board.getBoardNo();
	}
	 
	 //자유게시판 이미지 넣기
		@RequestMapping(value="uploadBoard.do", method=RequestMethod.POST) 
		@ResponseBody
		public String saveFile(HttpServletRequest request) throws IOException {
			String imageFolder = request.getParameter("imageFolder");
			String imgFolder ="\\" + imageFolder + "\\"; //저장할 경로
			String realFolder = request.getRealPath("/") + imgFolder; //web-inf바로전 까지 저장할 경로
			MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;
			MultipartFile file = multipartRequest.getFile("imageFile"); //단일 파일 업로드
			String filename = file.getOriginalFilename();

			File ufile = new File(realFolder + file.getOriginalFilename());
			file.transferTo((ufile));

			return filename; 
		}
	
}
