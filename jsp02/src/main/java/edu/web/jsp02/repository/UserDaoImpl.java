package edu.web.jsp02.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zaxxer.hikari.HikariDataSource;

import edu.web.jsp02.datasource.HikariDataSourceUtil;
import edu.web.jsp02.domain.User;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserDaoImpl implements UserDao {
    
    private HikariDataSource ds;

    private static UserDaoImpl instance = null;
    
    private UserDaoImpl() {
        ds= HikariDataSourceUtil.getInstance().getDataSource();
    }
    
    public static UserDaoImpl getInstance() {
        if(instance == null) {
            instance= new UserDaoImpl();
        }
        return instance;
    }
    
    private User recordToEntity(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("ID");
        String username = rs.getString("USERNAME");
        String password = rs.getString("PASSWORD");
        String email = rs.getString("EMAIL");
        Integer points = rs.getInt("POINTS");
        
        User entity = User.builder()
                .id(id).username(username).password(password).email(email).points(points)
                .build();
                
        return entity;
    }
    

    public static final String SQL_SELECT = "select * from USERS order by ID desc";
    
    @Override
    public List<User> select() {
        log.info("select()");
        log.info("SQL : {}", SQL_SELECT);
        
        List<User> list = new ArrayList<>();
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT);
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()) {
                User user = recordToEntity(rs);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        
        return list;
    }

    public static final String SQL_INSERT = "insert into USERS(USERNAME, PASSWORD, EMAIL) values(?, ?, ?)";
	@Override
	public int insert(User entity) {
		log.info("insert(entity={})", entity);
		log.info(SQL_INSERT);
		
		int result = 0;
		
		try {
			@Cleanup
			Connection conn = ds.getConnection();
			
			@Cleanup
			PreparedStatement stmt = conn.prepareStatement(SQL_INSERT);
			
			// prepared statement의 바인딩 파라미터(binding parameter) 값들을 세팅.
			stmt.setString(1, entity.getUsername());
			stmt.setString(2, entity.getPassword());
			stmt.setString(3, entity.getEmail());
			
			// SQL 실행
			result = stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static final String SQL_SELECT_BY_ID = "select * from USERS where ID=?";
	
	@Override
	public User selectByID(Integer id) {
		log.info("selectById(id= {})", id);
		
		User entity = null;
		
		try {
			@Cleanup
			Connection conn = ds.getConnection();

			@Cleanup
			PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
			log.info(SQL_SELECT_BY_ID);
			
			stmt.setInt(1, id);
		
			@Cleanup
			ResultSet rs = stmt.executeQuery();
			if(rs.next() ) {
				entity = recordToEntity(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	public static final String SQL_DELETE = "delete from USERS where ID=?";
	
	@Override
	public int delete(Integer id) {
		log.info("delete(id={}", id);
		
		int result = 0;
		
		try {
			@Cleanup
			Connection conn = ds.getConnection();
			
			@Cleanup
			PreparedStatement stmt = conn.prepareStatement(SQL_DELETE);
			log.info(SQL_DELETE);
			
			stmt.setInt(1, id);
			
			result = stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static final String SQL_UPDATE = "update USERS set POINTS=? where ID= ?";
	
	@Override
	public int update(User entity) {
		log.info("update(entity={}", entity);
		
		int result = 0;
		
		try {
			@Cleanup
			Connection conn = ds.getConnection();
		
			@Cleanup
			PreparedStatement stmt = conn.prepareStatement(SQL_UPDATE);
			log.info(SQL_UPDATE);
			
			stmt.setInt(1, entity.getPoints());
			stmt.setInt(2, entity.getId());
		
			result = stmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public static final String SQL_SELECT_BY_USERNAME_AND_PASSWORD =
	        "select * from USERS where USERNAME =? and PASSWORD = ?"; 
	
    @Override
    public User selectByUsernameAndPassword(User user) {
        log.info("selectByUsernameAndPassword({})", user);
        
        User entity = null;  // DB에서 select한 결과를 저장할 객체
        
        try {
            @Cleanup
            Connection conn = ds.getConnection();
            
            @Cleanup
            PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_BY_USERNAME_AND_PASSWORD);
            log.info(SQL_SELECT_BY_USERNAME_AND_PASSWORD);
            
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            
            @Cleanup
            ResultSet rs = stmt.executeQuery();
            if(rs.next()) { // 검색 결과가 있으면
                entity = recordToEntity(rs);
            }

           /* if (rs.next()) { // select 결과가 있으면
                Integer id = rs.getInt("ID");
                String username = rs.getString("USERNAME");             
                String password = rs.getString("PASSWORD");             // 위에 recordToEntity가 있기 때문에 이렇게 적으면 안 됨. 
                String email = rs.getString("EMAIL");
                int points = rs.getInt("POINTS");
                
                entity = User.builder()
                        .id(id).username(username).password(password)
                        .email(email).points(points)
                        .build();
            }   */
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return entity;      // 없으면 entity가 null을 return을 하는 메서드가 되는것.
    }
    

}
