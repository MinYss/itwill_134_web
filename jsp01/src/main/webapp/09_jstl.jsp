<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         <%--(prefix와 uri만 사용해라)--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
    <h1>JSTL</h1>
    <h2>JSP(Java Server Page) Standard Tag Library</h2>
    <%--
    JSTL 사용하기:
        1. POM.xml에 의존성 추가(jstl:jstl:1.2)
        2. JSP에 사용할 태그 라이브러리 종류를 taglib 지시문(directive)으로 설정.
     --%>

    <c:set var="username" value="admin"></c:set>             <!-- ( c:을 하고 ctrl 스페이스를 하면 코어 라이브러리가 가지고 있는 태그들이 보여진다. )-->
    <%-- pageContext.setAttribute("username", "admin"); --%>
    
    <h3><%= pageContext.getAttribute("username") %></h3>            <!--( <h3>은 모두 admin의 값을 출력. 아래로 갈수록 간단하게 사용할 수 있음. )-->
    <h3><c:out value="${username}"></c:out></h3>                
    <h3>${username}</h3>    <%-- %{pageScope.username} --%>
    
    
</body>
</html>