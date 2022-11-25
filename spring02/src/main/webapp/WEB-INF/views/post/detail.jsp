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
            <h2>상세 페이지</h2>
        </header>
        
        <nav>
            <ul class="nav bg-light" >
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
                    <c:url var="postUpdatePage" value="/post/modify">
                    <c:param name="id" value="${post.id}"></c:param>
                    </c:url>
                    <a class="nav-link active" href="${postUpdatePage}">수정 페이지</a>
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
                                type="text" name="id" value="${post.id}" readonly />
                        </div>
                        <div>
                            <label for="title"  class="form-label">제목</label>
                            <input id="title" class="form-control" 
                                type="text" name="title" value="${post.title}" readonly />
                        </div>
                        <div>
                            <label for="content"  class="form-label">내용</label>
                            <textarea id="content" name="content" class="form-control" 
                                 readonly>${post.content}</textarea>
                        </div>
                        <div>
                            <label for="author"  class="form-label">작성자</label>
                            <input id="author" class="form-control" 
                                 type="text" name="author" value="${post.author}" readonly />
                        </div>
                        <div>
                            <label for="createdTime" class="form-label">작성시간</label>
                            <input id="createdTime" class="form-control" 
                                 type="text" value="${post.created_time}" readonly />
                        </div>
                        <div>
                            <label for="modifiedTime" class="form-label">수정시간</label>
                            <input id="modifiedTime" class="form-control" 
                                type="text" value="${post.modified_time}" readonly />
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>