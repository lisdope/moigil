package com.springbook.biz.user;

import lombok.extern.log4j.Log4j;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springbook.biz.board.Board;


@Controller
@Log4j
public class UserController {
	@Autowired
	private UserRepository DAO;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index() {
	return "index2.jsp";
	}
	
	@PostMapping("/login.do") // 로그??
	  public String login(User user, HttpSession session) {
	      User login = DAO.findUser(user.getId(), user.getPw());
	      session.setAttribute("user", login);
	      if(login != null) {
	          return "index2.jsp";
	      }
	      return "index2.jsp";
	  }
	
	@PostMapping("createUser.do") // 계정?�성
	  public String create(User user) {
		DAO.save(user);
	      return "index2.jsp";
	  }
	
	@RequestMapping("logout.do") // 로그?�웃
	  public String logout(HttpSession session) {
		session.invalidate();
	      return "index2.jsp";
	  }

	@PostMapping("updateUser.do") // ?�보?�정
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
			req.setAttribute("msg", "?�용 불�??�합?�다.");
			req.setAttribute("result", "1");
			return "idChk.jsp";
		}
			req.setAttribute("msg", "?�용 가?�합?�다.");
			req.setAttribute("result", "0");
		return "idChk.jsp";
	}

	@RequestMapping("/getId.do")
	public String getId(HttpServletRequest req){
		String name = req.getParameter("name");
		req.setAttribute("userId", DAO.getId(name));
		if(DAO.getId(name) != null) {
			return "foundId.jsp";
		}else {
			return "getId.jsp";
		}
	}
	
	@RequestMapping("/getPw.do")
	public String getPw(HttpServletRequest req){
		String id = req.getParameter("id");
				req.setAttribute("userPw", DAO.getPw(id));
		if(DAO.getPw(id) != null) {
			return "foundPw.jsp";
		}else {
			return "getPw.jsp";
		}
	}
	
	 
	@RequestMapping(value="upload.do", method=RequestMethod.POST)
	@ResponseBody
	public String uploadSingle(@RequestParam("Image") MultipartFile file, HttpServletRequest request) throws IOException {
		ServletContext path = request.getSession().getServletContext();
    String filePath = path.getRealPath("/Upload") + "/" + file.getOriginalFilename();
    
    String filename = file.getOriginalFilename();
    
    File dest = new File(filePath);
    file.transferTo(dest); // ?�일 ?�로?? ?�업 ?�행
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
	

