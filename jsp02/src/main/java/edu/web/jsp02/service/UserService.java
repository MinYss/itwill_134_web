package edu.web.jsp02.service;

import java.util.List;

import edu.web.jsp02.domain.User;
import edu.web.jsp02.dto.PostUpdateDto;
import edu.web.jsp02.dto.UserSignUpDto;
import edu.web.jsp02.dto.UserUpdateDto;

public interface UserService {
	
    public List<User> read();
    
    public int signUp(UserSignUpDto dto);

    public User read(Integer id);
    	
    public int delete(Integer id);
    
    public int update(UserUpdateDto dto);

    public User signIn(String username, String password);
        
}
