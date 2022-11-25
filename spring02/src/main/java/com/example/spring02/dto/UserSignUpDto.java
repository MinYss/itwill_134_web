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
//회원 가입에서 사용도는 DTO
public class UserSignUpDto {
    private String username;
    private String password;
    private String email;
    
 // DTO를 Entity로 변환하는 메서드
    public User toEntity() {
        return User.builder()
            .username(username)
            .password(password)
            .email(email)
            .build(); 
    }
}

