package com.example.spring02.web;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.spring02.domain.User;
import com.example.spring02.dto.UserSignInDto;
import com.example.spring02.dto.UserSignUpDto;
import com.example.spring02.dto.UserUpdateDto;
import com.example.spring02.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/user")
@Controller
public class UserController {

    private final UserService userService;
    
    @GetMapping("/list")
    public String list(Model model) {
        log.info("list()");
        
        List<User> list = userService.read();
        model.addAttribute("user", list);
        log.info("# of list={}", list.size());
        
        return "/user/list";
    }
    
    // 상세보기
    @GetMapping("/detail")
    public String detail(Integer id, Model model) {
        log.info("detail(id={}", id);
        
        User user = userService.read(id);
        model.addAttribute("user", user);
        
        return "/user/detail";
    }
    
    // 수정 페이지
    @GetMapping("/modify")
    public String modify(Integer id, Model model) {
        log.info("modify(id={})", id);
        
        User user = userService.read(id);
        model.addAttribute("user", user);
        
        return "/user/modify";
    }
    
    
    // 삭제하기
    @PostMapping("/delete")
    public String delete(Integer id) {
        log.info("delete(id={})", id);
        
        userService.delete(id);
        
        return "redirect:/user/list";
    }
    
    
    // 수정하기
    @PostMapping("/update")
    public String update(UserUpdateDto dto) {
        log.info("update(dto={})", dto);
        
        userService.update(dto);
        
        return "redirect:/user/list";
    }
    
    // 회원가입
    @GetMapping("/signup")
    public String signup() {
        log.info("signup()");
        
        return "/user/signup";
    }
    
    @PostMapping("/signup")
    public String signUp(UserSignUpDto dto) {
        log.info("signUp(dto={})", dto);
        
        userService.signUp(dto);
        
        return "redirect:/user/signin";
    }
    
    // 로그인
    @GetMapping("/signin")
    public String signin() {
        log.info("signin()");
        
        return "/user/signin";
    }
    
    @PostMapping("/signin")
    public String signin(UserSignInDto dto, Model model, HttpServletRequest req) {
        log.info("signin(dto={})", dto);
        
        User user = userService.signIn(dto);
        if(user == null) {
            log.info("로그인 실패");
            return "/user/signin";
        }

        HttpSession session = req.getSession();
        session.setAttribute("user", user.getUsername());
        return "redirect:/";
    }
    
}
