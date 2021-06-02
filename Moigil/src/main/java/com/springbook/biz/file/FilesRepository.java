package com.springbook.biz.file;

import org.springframework.data.jpa.repository.JpaRepository;

public interface  FilesRepository extends JpaRepository<Files, Integer> {

	Files findByFno(int fno);
}