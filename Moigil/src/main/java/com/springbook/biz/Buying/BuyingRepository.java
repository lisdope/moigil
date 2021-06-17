package com.springbook.biz.Buying;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springbook.biz.board.Board;

public interface BuyingRepository extends JpaRepository<Buying, Integer> {

}
