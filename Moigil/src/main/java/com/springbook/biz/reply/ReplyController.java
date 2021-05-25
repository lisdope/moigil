package com.springbook.biz.reply;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyController {
	@Autowired
	private ReplyRepository DAO;
	
	@RequestMapping("getReplyList.do")
	public String getReplyList(Model model,ArrayList<Reply> reply) {
		reply = DAO.ReplylistDesc();
		model.addAttribute("ReplyList",reply);
		return "Board.do";
	}
	
	@RequestMapping("insertReply.do")
	public String insertBoard(Reply reply) {
		DAO.save(reply);
	  return "getReplyList.do";
	}
	
	@RequestMapping("deleteReply.do")
	public String deleteReply(Reply reply){
		DAO.deleteById(reply.getUserReplyNo());
		return "getReplyList.do";
	}
	
	@RequestMapping("editReply.do")
	  public String editBoard(@RequestParam("userReplyNo")Integer no,Model model) {
		Reply reply = DAO.findById(no).get();
		model.addAttribute("reply",reply);
	      return "getReply.jsp";
	  }
	

	 
	
	
}
