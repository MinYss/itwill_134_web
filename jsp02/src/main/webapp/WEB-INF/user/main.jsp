<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2</title>
<style>

.table {
    border: 1px solid gray;
    border-collapse: separate;
    padding : 8px;
}

.table-light {
    color: gray;
    background-color: light-gray;
}



</style>
</head>
<body>
    <div>
        <h1>회원 메인 페이지</h1>

        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href ="${mainPage}">메인 페이지</a>
                </li>
                <li>
                    <c:url var="userSignUp" value="/user/signup"></c:url>
                    <a href = "${userSignUp}">회원가입</a>
                </li>
            </ul>
        </nav>
   
        <main>
            <table class="table">
                <thead class="table-light">
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">포인트</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${users}">
                    <tr>
                        <td  scope="row">${p.id}</td>
                        <td>
                            <c:url var="userDetailPage" value="/user/detail">
                                <c:param name="id" value="${p.id}"></c:param>
                            </c:url>
                            <a href="${userDetailPage}">${p.username}</a>
                        </td>
                        <td>${p.points}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
    
</body>
</html>