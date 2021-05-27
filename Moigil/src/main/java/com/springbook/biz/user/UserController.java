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
	
	@PostMapping("/login.do") // ๋ก๊ทธ??
	  public String login(User user, HttpSession session) {
	      User login = DAO.findUser(user.getId(), user.getPw());
	      session.setAttribute("user", login);
	      if(login != null) {
	          return "index2.jsp";
	      }
	      return "index2.jsp";
	  }
	
	@PostMapping("createUser.do") // ๊ณ์ ?์ฑ
	  public String create(User user) {
		DAO.save(user);
	      return "index2.jsp";
	  }
	
	@RequestMapping("logout.do") // ๋ก๊ทธ?์
	  public String logout(HttpSession session) {
		session.invalidate();
	      return "index2.jsp";
	  }

	@PostMapping("updateUser.do") // ?๋ณด?์ 
	  public String updateUser(User user, HttpSession session) {
		DAO.save(user); // save ๋ฉ์?๋ ?์ผ๋ฉ? insert ?ด์ฃผ๊ณ? ๋ฐ๋๋?๋ถ์? update?ด์ค
		session.setAttribute("user", user);
		return "index2.jsp";
	  }
//	@PostMapping("updateUser.do") // ?๋ณด?์ 
//	  public String updateUser(User user, HttpSession session) {
//		DAO.save(user); // save ๋ฉ์?๋ ?์ผ๋ฉ? insert ?ด์ฃผ๊ณ? ๋ฐ๋๋?๋ถ์? update?ด์ค
//		session.setAttribute("user", user);
//		return "index2.jsp";
//	  }
	
	
	@RequestMapping("deleteUser.do") // ๊ณ์ ?? 
	  public String deleteUser(User user) {
		DAO.deleteById(user.getUserCode());
	      return "index2.jsp";
	  }
	
	@RequestMapping(value="/idChk.do") // ์ค๋ณต์ฒดํฌ
	public String idchk(HttpServletRequest req) {
		String id = req.getParameter("id");
		Integer idchk = DAO.idChk(id);
		if(idchk >= 1) {
			req.setAttribute("msg", "?ฌ์ฉ ๋ถ๊??ฅํฉ?๋ค.");
			req.setAttribute("result", "1");
			return "idChk.jsp";
		}
			req.setAttribute("msg", "?ฌ์ฉ ๊ฐ?ฅํฉ?๋ค.");
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
    file.transferTo(dest); // ?์ผ ?๋ก?? ?์ ?ํ
   return filename;
	}
	
	@RequestMapping(value = "update_mypage.do", method = RequestMethod.POST)
	public String update_mypage(User user, HttpSession session, RedirectAttributes rttr) throws Exception{
		DAO.save(user);
		session.setAttribute("user",user);
		rttr.addFlashAttribute("msg", "?์?๋ณด ?์  ?๋ฃ");
		return "redirect:/myPage.jsp";
	}
	

	// ๋น๋?๋ฒํธ ๋ณ๊ฒ?
	@RequestMapping(value = "update_pw.do", method = RequestMethod.POST)
	public String update_pw(User user, HttpSession session) throws Exception{
		DAO.save(user);
		session.setAttribute("user",user);
		return "index.jsp";
	}

}
	

