package edu.web.jsp02.web.post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.jsp02.dto.PostCreateDto;
import edu.web.jsp02.service.PostService;
import edu.web.jsp02.service.PostServiceImpl;
import lombok.extern.slf4j.Slf4j;

/**
 * Servlet implementation class PostCreateController
 */
@Slf4j
@WebServlet(name = "postCreateController", urlPatterns = {"/post/create"})
public class PostCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostCreateController() {
    postService = PostServiceImpl.getInstance();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    log.info("doGet()");
	    
	    // 포스트 작성 뷰(JSP) 이동
	    request.getRequestDispatcher("/WEB-INF/post/create.jsp")
	        .forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    log.info("doPost()");
	
	    // 요청 파라미터 분석: title, content, author 값을 찾음.
	      String title = request.getParameter("title");
	      String content = request.getParameter("content");
	      String author = request.getParameter("author");
	      
	    // PostCreateDto 타입 객체 생성
	      PostCreateDto dto = PostCreateDto.builder()
	              .title(title).content(content).author(author).build();
	      log.info("dto = {}", dto); 
	    
	    // PostService.create(dto) 메서드 호출 --> postDao 호출 --> DB에 저장.
	      int result = postService.create(dto);
	      log.info("create result = {}", result);
	      
	    // 포스트 목록 페이지 이동(redirect- 서버 밖으로 나갔다가 다시 들어오거나 다른 서버로 들어감) 
	      response.sendRedirect("/jsp02/post"); 
	      
	    // PRG(Post - Redirect - GET) 패턴 -( 포스트 방식의 요청 들어오면 응답을 Redirect하고 GET방식으로 view에 보냄 => 실제 view가 보임 )
	      
	}

}
