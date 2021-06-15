package com.springbook.biz.Android;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springbook.biz.user.User;

public interface UserRepositoryAnd extends JpaRepository<User, String>{
	
      
      Optional<User> findByIdAndPw(String id, String pw);
      
      
}
