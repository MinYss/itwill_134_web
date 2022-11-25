package com.example.spring02.dto;

import com.example.spring02.domain.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class UserSignInDto {
    private String username;
    private String password;
    
    
    public User toEntity() {
        return User.builder()
                .username(username)
                .password(password)
                .build();
    }
}
