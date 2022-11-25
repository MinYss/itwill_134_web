package edu.web.jsp01.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.web.jsp01.domain.Post;

/**
 * Servlet implementation class PostListController
 */
@WebServlet(name = "/postListController", urlPatterns = {"/post/read"})
public class PostListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostListController() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    System.out.println("postListController.doGet() 호출");
        

        request.setCharacterEncoding("UTF-8");
        
        ArrayList<Post> list = new ArrayList<>();
        LocalDateTime createTime = LocalDateTime.now();
        for(int i =1; i <11; i++) {
            Post p = new Post( i, "제목" + i, "내용입니다!!!" +i, createTime);
            list.add(p);
        }

        request.setAttribute("posts", list);
        
        // View(JSP)로 이동
        request.getRequestDispatcher("/WEB-INF/post/read.jsp")
            .forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	   
	}

}