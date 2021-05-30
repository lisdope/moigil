package com.springbook.biz.user;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import lombok.extern.log4j.Log4j;


@Controller

public class UserController {
	@Autowired
	private UserRepository DAO;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index() {
	return "index2.jsp";
	}
	
	
	@PostMapping("login.do") // 로그인
	  public String login(User user, HttpSession session) {
	      User login = DAO.findUser(user.getId(), user.getPw());
	      session.setAttribute("user", login);
	      if(login != null) {
	          return "index2.jsp";
	      }
	      return "index2.jsp";
	  }
	
	@PostMapping("createUser.do") // 계정생성
	  public String create(User user) {
		DAO.save(user);
	      return "index2.jsp";
	  }
	
	@RequestMapping("logout.do") // 로그아웃
	  public String logout(HttpSession session) {
		session.invalidate();
	      return "index2.jsp";
	  }

	@PostMapping("updateUser.do") // 회원정보수정
	  public String updateUser(User user, HttpSession session) {
		DAO.save(user); // save 메서?�는 ?�으�? insert ?�주�? 바뀐�?분�? update?�줌
		session.setAttribute("user", user);
		return "index2.jsp";
	  }
//	@PostMapping("updateUser.do") // ?�보?�정
//	  public String updateUser(User user, HttpSession session) {
//		DAO.save(user); // save 메서?�는 ?�으�? insert ?�주�? 바뀐�?분�? update?�줌
//		session.setAttribute("user", user);
//		return "index2.jsp";
//	  }
	
	
	@RequestMapping("deleteUser.do") // 계정??��
	  public String deleteUser(User user) {
		DAO.deleteById(user.getUserCode());
	      return "index2.jsp";
	  }
	
	@RequestMapping(value="/idChk.do") // 중복체크
	public String idchk(HttpServletRequest req) {
		String id = req.getParameter("id");
		Integer idchk = DAO.idChk(id);
		if(idchk >= 1) {
			req.setAttribute("msg", "사용불가합니다.");
			req.setAttribute("result", "1");
			return "idChk.jsp";
		}
			req.setAttribute("msg", "사용가능합니다.");
			req.setAttribute("result", "0");
		return "idChk.jsp";
	}

	@RequestMapping("/getId.do") // 아이디 찾기
	   public String getId(HttpServletRequest req){
	      try{
	    	 String name = req.getParameter("name");
		     String email = req.getParameter("email");   
	    	 User user = DAO.getId(name, email);
	    	 req.setAttribute("userId", user.getId());
	          	return "foundId.jsp";
	      }catch (NullPointerException e) {
	         return "getId.jsp";
	      }
	   }
	   
	   
	   @RequestMapping("/getPw.do") // 비밀번호 찾기
	   public String getPw(HttpServletRequest req){
	      try{
	         String id = req.getParameter("id");
	         String email = req.getParameter("email");
	         User getPw = DAO.getPw(id, email);
	         req.setAttribute("userPw", getPw.getPw());
	         	return "foundPw.jsp";
	      }catch (NullPointerException e) {
	         return "getPw.jsp";
	      }
	   }

	
	 
	@RequestMapping(value="upload.do", method=RequestMethod.POST) 
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
	
	@RequestMapping(value = "update_mypage.do", method = RequestMethod.POST)
	public String update_mypage(User user, HttpSession session, RedirectAttributes rttr) throws Exception{
		DAO.save(user);
		session.setAttribute("user",user);
		rttr.addFlashAttribute("msg", "?�원?�보 ?�정 ?�료");
		return "redirect:/myPage.jsp";
	}
	

	// 비�?번호 변�?
	@RequestMapping(value = "update_pw.do", method = RequestMethod.POST)
	public String update_pw(User user, HttpSession session) throws Exception{
		DAO.save(user);
		session.setAttribute("user",user);
		return "index.jsp";
	}

}
	

