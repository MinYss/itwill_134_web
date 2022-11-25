package edu.web.jsp02.repository;

import java.util.List;

import edu.web.jsp02.domain.User;
import edu.web.jsp02.dto.UserSignUpDto;
import edu.web.jsp02.dto.UserUpdateDto;

public interface UserDao {
    public List<User> select();
    
    int insert(User entity);
    
    public User selectByID(Integer id);
    
    public int delete(Integer id);
    
    public int update(User entity);

    User selectByUsernameAndPassword(User user);
        
}
