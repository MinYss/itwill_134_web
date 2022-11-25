<%@page import="edu.web.jsp01.domain.Post"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
    <h1>Post 전체 목록</h1>
    
    
    <table>
        <thead>
             <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성 시간</th>
            </tr>
        </thead>
        <tbody>
            <p:forEach var = "p" items="${posts}">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.title}</td>
                    <td>${p.content}</td>
                    <td>${p.createTime}</td>
                </tr>
            </p:forEach>
        </tbody>
    </table>
    
</body>
</html>