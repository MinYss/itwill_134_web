<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2</title>
</head>
<body>
    <div>
        <h1>회원 정보 수정 페이지</h1>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/"></c:url>
                    <a href ="${mainPage}">메인 페이지</a>
                </li>
                <li>
                    <c:url var="userListPage" value="/user"></c:url>
                    <a href ="${userListPage}">회원 관리 페이지</a>
                </li>
                <li>
                    <c:url var="userDetailPage" value="/user/detail">
                        <c:param name="id" value="${user.id}"></c:param>
                    </c:url>
                    <a href ="${userDetailPage}">회원 상세 정보</a>
                </li>
                
            </ul>
        </nav>
        
        <main>
            <form id ="userForm">
                <div>
                    <label for="id">번호</label>
                    <input id ="id" type="text" name="id" value="${user.id}" readonly />
                </div>
                <div>
                    <label for ="username">아이디</label>
                    <input type="text" name="username" value ="${user.username}" readonly />
                </div>
                <div>
                    <label for ="password">비밀번호</label>
                    <input type="text" name="password" value ="${user.password}" readonly />
                </div>
                <div>
                    <label for ="email">이메일</label>
                    <input type="text" name="email" value ="${user.email}" readonly />
                </div>
                <div>
                    <label for ="points">포인트</label>
                    <input type="number" name="points" value ="${user.points}" required autofocus />
                </div>
                <div>
                    <button id ="btnDelete">삭제</button>
                    <button id ="btnUpdate">수정</button>
                </div>
            </form>
        </main>
    </div>
    
    <c:url var="userDeletePage" value="/user/delete"></c:url>
    <c:url var="userUpdatePage" value="/user/modify"></c:url>
    
    <script>
    const form = document.querySelector("#userForm");
    
    const btnDelete = document.querySelector("#btnDelete");

    btnDelete.addEventListener('click', function(event){
        event.preventDefault(); 
    	
    	const check = confirm('정말 삭제하겠습니까?');
    	if(check) {
    		form.action = '${userDeletePage}';
    		form.method = 'post';
    		form.submit();
    	}
    });
    
    
    const btnUpdate = document.querySelector("#btnUpdate");
    
    btnUpdate.addEventListener('click', function(event){
        event.preventDefault(); 
    
    const check = confirm('정말 수정하겠습니까?');
    if(check) {
        form.action = '${userUpdatePage}';
        form.method = 'post';
        form.submit();
    
        }
    });
    </script>
    
</body>
</html>