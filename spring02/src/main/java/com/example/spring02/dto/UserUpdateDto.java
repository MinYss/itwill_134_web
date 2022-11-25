package com.example.spring02.dto;

import com.example.spring02.domain.User;

public class UserUpdateDto {
    private Integer id;
    private String password;
    private String email;
    
    public User toEntity() {
        return User.builder()
                .id(id)
                .password(password)
                .email(email)
                .build();
                
    }
}
