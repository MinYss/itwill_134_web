<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
    <h1>JSTL&lt;fmt:formatDate&gt;</h1>
    
    <c:set var="now" value="<%= new Date() %>"></c:set>     <!--  (now라는 변수에 저장) -->
    <%--<fmt:formatDate> 태그는 java.sql.Date, java.sql.Timestamp, java.util.Date 타입만 지원
    
    (주의) java.time.LocalDate, java.time.LocalDateTime은 지원하지 않음!
    --%>
    
    <h2>${now}</h2> <%-- now.toString() --%>    <!-- (Date클래스가 가지고 있는 toString) -->
    <h2>
        <fmt:formatDate value="${now}"/>        <!--  (now 변수에 있는 값) -->
    </h2>
    <h2>
        <fmt:formatDate value="${now}" type="date" />   <!--(날짜만 출력) -->
    </h2>
    <h2>
        <fmt:formatDate value="${now}" type="time" />   <!--(시간만 출력) -->
    </h2>
    <h2>
        <fmt:formatDate value="${now}" type="both" />   <!--(날짜와 시간 출력) -->
    </h2>
    <h2>
        <fmt:formatDate value="${now}" type="both" dateStyle = "full"  timeStyle="full" />   
    </h2>
    <h2>
        <fmt:formatDate value="${now}" type="both" dateStyle = "short"  timeStyle="short" />   
    </h2>
    <h2>
    <%-- 시간 객체를 원하는 (문자열) 패턴으로 포멧팅 후 변수에 저장--%>
        <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" />   
    </h2>
</body>
</html>