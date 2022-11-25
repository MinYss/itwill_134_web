package edu.web.jsp01;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */
@WebServlet(name = "firstServlet", urlPatterns = { "/ex1" })        //(WebServlet을 사용 안 할수도 있다. 지금 상태에서 이 줄을 삭제 하면 404 에러 뜸)
// -> 처리하는 요청 주소(request URL)와 서블릿 객체 이름을 WAS(Web Application Server - Tomcat)에 등록.
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FirstServlet() {     
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    // -> GET 방식의 요청일 때 WAS(Tomcat)가 호출하는 메서드.
    // -> 파라미터 request: 클라이언트(브라우저)가 보낸 요청(request)에 대한 정보를 가지고 있는 객체.
    // -> 파라미터 response: WAS가 클라이언트로 보낼 응답(response)을 작성하기 위한 기능들을 가지고 있는 객체.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)     // (request와 response로 요청에대한 정보 뽑아내고 응답함)
	        throws ServletException, IOException {
        
        // 응답의 한글이 깨지지 않도록 하기 위해서.
        // 반드시 response.getWriter() 메서드를 호출하기 전에 사용해야 함.
        response.setContentType("text/html; charset=UTF-8");    // (setContentType보다 getWriter를 먼저하면 charset을 가지고 있지 않은 setContentType을 가지고 오기 때문에 한글 깨짐 )
        
        LocalDateTime now = LocalDateTime.now(); // WAS의 현재 시간      ( (지역변수 선언) - 현재 시간 정보 얻을 수 있음 )
        
        
		PrintWriter writer = response.getWriter();  // 응답을 write할 수 있는 객체.
		// 응답으로 보낼 HTML 코드들을 작성.
		writer.append("<!doctype html>")
		    .append("<html>")
		    .append("     <head>")
		    .append("         <meta charset='UTF-8'>")
		    .append("         <title>Servlet</title>")
		    .append("     </head>")
		    .append("     <body>")
		    .append("         <h1>첫번째 서블릿(Servlet)</h1>")
		    .append("         <h2>")
		    .append(now.toString())               // (동적인 내용 새로고침 할 때마다 시간 바뀜.)
		    .append("         </h2>")
		    .append("     </body>")
		    .append("</html>");
    }                                             // (내용 복잡 - 요청을 처리할때만 servlet을 사용 (그래서 JSP가 나옴))
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    // -> POST 방식의 요청일 때 WAS가 호출하는 메서드.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
