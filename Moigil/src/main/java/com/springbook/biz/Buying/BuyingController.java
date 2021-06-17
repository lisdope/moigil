package com.springbook.biz.Buying;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springbook.biz.gallery.Gallery;


@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class BuyingController {
	
	@Autowired
	private BuyingRepository buyRepository;
	
	// 글 리스트 보기
	@GetMapping("buyList")
	public List<Buying> buyList() {
		System.out.println("구매 리스트 요청 옴");
		return buyRepository.findAll();
	}
    
	@PostMapping("insertBuying")
	public String insertBuying( Buying buying ) {
		buyRepository.save(buying);
		return "물품 등록 성공";
		
	}
	@GetMapping("bRead/{buyingNo}")
	public Optional<Buying> getBuying(@PathVariable Integer buyingNo) {
		System.out.println(buyingNo);
		System.out.println(buyRepository.findById(buyingNo));
		return buyRepository.findById(buyingNo);
	}
	
	@PutMapping("editBuying")
	public String updateBuying( Buying buying ) {
		buyRepository.save(buying);
		return "물품 수정 성공";
	}
	
	@DeleteMapping("bDelete/{buyingNo}")
	public String deleteBuying(@PathVariable Integer buyingNo) {
		buyRepository.deleteById(buyingNo);
		return "물품 삭제 성공";
	}
    
}
