package com.example.spring02.mapper;

import java.util.List;

import com.example.spring02.domain.User;

public interface UserMapper {

    List<User> selectOrderByDesc();

    int insert(User entity);
    
    User selectById(Integer id);
    
    int updateUserById(User entity);
    
    int deleteById(Integer id);

    User selectByUsernameAndPassword(User entity);

    
    
}
