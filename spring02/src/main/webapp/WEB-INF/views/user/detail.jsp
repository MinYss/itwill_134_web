<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Spring 2</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
        crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid">
        <header class="my-2 p-5 text-bg-secondary">   <!--my-2( m:margin y:y축 방향 2 이동),  p-5(padding x,y축으로 5 이동), text-bg-secondary(bg:back ground) -->
            <h1>Spring MVC &amp; MyBatis</h1>
            <h2>회원 리스트</h2>
        </header>
        
        <nav>
            <ul class="nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/"></c:url>
                    <a class="nav-link active" href="${mainPage}">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="postListPage" value="/post/list"></c:url>
                    <a class="nav-link active" href="${postListPage}">목록 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="postCreatePage" value="/post/create"></c:url>
                    <a class="nav-link active" href="${postCreatePage}">새 글 작성</a>
                </li>
                <li class="nav-item">
                    <c:url var="UserListPage" value="/user/list"></c:url>
                    <a class="nav-link active" href="${UserListPage}">회원 리스트</a>
                </li>
                <li class="nav-item">
                    <c:url var="userUpdatePage" value="/user/modify">
                    <c:param name="id" value="${user.id}"></c:param>
                    </c:url>
                    <a class="nav-link active" href="${userUpdatePage}">수정 페이지</a>
                </li>
            </ul>
        </nav>
    
        <main class="my-4">
            <div class="card">
                <div class="card-header"></div>
                <div class= "card-body">
                    <form class="m-4" method="post">
                        <div>
                            <label for="id" class="form-label">번호</label>
                            <input id="id" class="form-control" 
                                type="text" name="id" value="${user.id}" readonly />
                        </div>
                        <div>
                            <label for="username"  class="form-label">아이디</label>
                            <input id="username" class="form-control" 
                                type="text" name="username" value="${user.username}" readonly />
                        </div>
                        <div>
                            <label for="password"  class="form-label">비밀번호</label>
                            <input id="password" class="form-control" 
                                type="text" name="text" value="${user.password}" readonly />
                        </div>
                        <div>
                            <label for="email"  class="form-label">이메일</label>
                            <input id="email" class="form-control" 
                                 type="text" name="email" value="${user.email}" readonly />
                        </div>
                        <div>
                            <label for="points" class="form-label">포인트</label>
                            <input id="points" class="form-control" 
                                 type="text" value="${user.points}" readonly />
                        </div>
                    </form>
                </div>
            </div>
        </main>


    </div>
</body>
</html>