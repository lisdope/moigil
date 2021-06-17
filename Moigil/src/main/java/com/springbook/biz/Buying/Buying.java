package com.springbook.biz.Buying;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.springbook.biz.board.Board;

import lombok.Data;

@Data
@Entity
@SequenceGenerator(
		  name = "BUYING_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "BUYING_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Buying")
public class Buying {
	@Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="BUYING_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer buyingNo;	// 상품번호
	private String buyingProduct;//상품이름
	private Integer buyingCost;	// 상품가격(단가)
	private Integer buyingQnty;	// 상품수량
//	private Integer buyingPayment;	// 결제 금액
//	private Integer userCode;	// 유저코드
//	private String grade;		// 유저등급
//	private String buyingDate;	// 구매 날짜
//	
//	@PrePersist // 방법 2 방법1 널값 default 적용 (insert 되기전 실행됨)
//	public void prePersist() {
//		this.buyingDate = this.buyingDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : this.buyingDate;
//	}
	
}
