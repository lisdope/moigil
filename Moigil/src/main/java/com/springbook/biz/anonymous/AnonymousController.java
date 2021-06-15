package com.springbook.biz.anonymous;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class AnonymousController {

	@Autowired
	private AnonymousRepository DAO;
	
	@PostMapping("addAnonymous")
	public void addAnonymous(Anonymous Anonymous) {
		DAO.save(Anonymous);
	}
	
	@PutMapping("editAnonymous")
	public void updateAnonymous(Anonymous Anonymous) {
		DAO.save(Anonymous);
	}
	
	@GetMapping("pagelist")
	public Page<Anonymous> getPagelist(@RequestParam(name="page",defaultValue = "0")Integer pNo
			){
		Pageable pageable = PageRequest.of(pNo, 5,Sort.Direction.ASC,"AnonymousNo");
		Page<Anonymous> page = DAO.findAll(pageable);
		return page;
	}
	@GetMapping("read/{no}")
	public Optional<Anonymous> getAnonymous(@PathVariable Integer no) {
		Anonymous Anonymous = DAO.findById(no).get();
		Anonymous.setAnonymousHits(Anonymous.getAnonymousHits()+1);
		DAO.save(Anonymous);
		return DAO.findById(no);
	}
	@DeleteMapping("delete/{no}")
	public void deleteAnonymous(@PathVariable Integer no) {
		DAO.deleteById(no);
	}
	@GetMapping("edit/{no}")
	public String editAnonymous(@PathVariable Integer no) {
		Anonymous anonymous = DAO.findById(no).get();
		return anonymous.getAnonymousPw();
	}
	

	
}
