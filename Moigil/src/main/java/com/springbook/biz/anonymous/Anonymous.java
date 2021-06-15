package com.springbook.biz.anonymous;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@SequenceGenerator(
		  name = "Anonymous_SEQ_GENERATOR", // 시퀀스 제러레이터 이름
		  sequenceName = "Anonymous_SEQ", // 매핑할 데이터베이스 시퀀스 이름 
		  initialValue = 1, // 시작값
		  allocationSize = 1) // 메모리를통해 할당 사이즈
@Table(name="TB_Anonymous")
public class Anonymous {
	@Id
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="Anonymous_SEQ_GENERATOR" //식별자 생성기를 설정해놓은  설정        
            )
	private Integer anonymousNo;
	private String anonymousTitle;
	private String anonymousContents;
	private String anonymousDate;
	private Integer anonymousHits; // 조회수
	private String anonymousId;
	private String anonymousPw;
	
	@PrePersist // 방법 2 방법1 널값 default 적용 (insert 되기전 실행됨)
	public void prePersist() {
		this.anonymousDate = this.anonymousDate == null ? new SimpleDateFormat("yyyy-MM-dd").format(new Date()) : this.anonymousDate;
		this.anonymousHits = this.anonymousHits == null ? 0 :this.anonymousHits;
	}
}
