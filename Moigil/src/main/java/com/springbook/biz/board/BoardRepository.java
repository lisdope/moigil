package com.springbook.biz.board;




import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface BoardRepository extends JpaRepository<Board, Integer> {
   

	// @Query("SELECT r FROM Reply r WHERE r.boardNo =:boardNo order by r.userReplyNo desc")
	   //ArrayList<Reply> ReplylistDesc(@Param("boardNo")Integer boardNo);
	
	//Page<User> findAllByAccount(Pageable pageable, String account);
	Page<Board> findAllByAreaCode(Pageable pageable, String string);
}
