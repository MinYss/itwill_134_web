<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    <%--include 지시문의 동작방식
        include 지시문이 사용된 위치에 jsp, jspf, html 파일의 내용을 삽입하고,
        한번에 자바 클래스로 변환.
     --%>
     
    <%@ include file="header.jspf" %>        <!-- 필요한 위치에 페이지를 삽입할 수 있음. -->

    <h1>메인 페이지</h1>
    <h2>include 지시분을 사용한 페이지 삽입</h2>
    
    <%@include file = "footer.jspf" %>

</body>
</html>