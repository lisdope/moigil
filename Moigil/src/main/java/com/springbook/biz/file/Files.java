package com.springbook.biz.file;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="TB_Gallery")
public class Files  {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int fno;
	
	String fileTitle;
	String filename;
	String fileOriName;
	String fileurl;
}
