package com.example.spring02.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserSignInDto;
import com.example.spring02.dto.UserSignUpDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.mapper.UserMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class UserService {

    private final UserMapper userMapper;
    
    
    public List<User> read() {
        log.info("read()");
        return userMapper.selectOrderByDesc();
    }
    
   public User read(Integer id) {
       log.info("detail(id={})", id);
       return userMapper.selectById(id);
    }
    
   public int delete(Integer id) {
       log.info("delete(id={})", id);
       return userMapper.deleteById(id);
   }
   
   public int update(UserUpdateDto dto) {
       log.info("update(dto={})", dto);
       return userMapper.updateUserById(dto.toEntity());
   }

   public int signUp(UserSignUpDto dto) {
       log.info("signup(dto={})",dto);
       return userMapper.insert(dto.toEntity());
   }
   
   public User signIn(UserSignInDto dto) {
       log.info("signin(dto={})", dto);
               
       return userMapper.selectByUsernameAndPassword(dto.toEntity());
   }
   
   
}


