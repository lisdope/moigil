package com.springbook.biz.board;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface BoardRepository extends JpaRepository<Board, Integer> {
   
	Page<Board> findAll(Pageable pageable);
	
	@Query(
			value ="SELECT p FROM Board p WHERE p.boardTitle LIKE %:boardTitle% OR p.boardContents LIKE %:boardContents%",
			countQuery = "SELECT COUNT(p.userCode) FROM Board p WHERE p.boardTitle LIKE %:boardTitle% OR p.boardContents LIKE %:boardContents%"
			)
	Page<Board> findAllSerach(String title, String content, Pageable pageable);
	
	
}
