package com.springbook.biz.Meeting;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.board.Board;



@Controller
public class MeetingController {
	
	@Autowired
	private MeetingRepository DAO;
	
	@PostMapping("insertMeeting.do")
	public String insertMeeting(Meeting Meeting) {
		DAO.save(Meeting);
	  return "index.jsp";
	}
	@RequestMapping("getMeeting.do")
	public String getMeeting(Model model,Meeting Meeting) {
		Meeting = DAO.findById(Meeting.getMeetingNo()).get();
		DAO.save(Meeting); // 데이터베이스에 저장
		model.addAttribute("Meeting",Meeting);
	  return "getMeeting.jsp";
	}



	 
	
	
}
