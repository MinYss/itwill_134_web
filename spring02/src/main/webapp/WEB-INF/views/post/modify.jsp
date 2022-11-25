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
            <h2>수정 페이지</h2>
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
            </ul>
        </nav>
        
        <main class="my-4">
        <div class="card">
            <form id="formModify" > 
                <div class="my-2">
                    <label for="id" class="form-label">번호</label>    
                    <input id="id" class="form-control"
                        type="text" name="id" value="${post.id}" readonly />
                </div>
                <div class="my-2">
                    <label for="title" class="form-label">제목</label>
                    <input id="title" class="form-control"
                        type="text" name="title" value="${post.title}" required autofocus/>
                </div>
                <div class="my-2">
                    <label for="content" class="form-label">내용</label>
                    <textarea id="content" class="form-control"
                        rows="5" cols="80" name ="content" required>${post.content}</textarea>
                </div>
                <div class="my-2">
                    <label for="author" class="form-label">작성자</label>
                    <input id="author" class="form-control"
                        type="text" value="${post.author}" readonly />
                </div>
                <div class="my-2">
                    <button id="btnDelete" class="btn btn-danger">삭제</button>
                    <button id="btnUpdate" class="btn btn-success">업데이트</button>
                </div>
            </form>
        </div>
        </main>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
            crossorigin="anonymous"></script>
            
    <c:url var="postDeletePage" value="/post/delete"></c:url>
    <c:url var="postUpdatePage" value="/post/update"></c:url>      
            
    <script>
    // HTML 문서 로딩이 모두 끝난 이후에 function을 실행해라.
        const form = document.querySelector('#formModify')
        
    	const btnDelete = document.querySelector('#btnDelete'); //= document.querySelector('#btnDelete')
    
        btnDelete.addEventListener('click', function(event){
        	 event.preventDefault();  //버튼의 이벤트 처리 기본 동작(폼 제출)을 막음.        	
            
        	 const result = confirm('정말 삭제?');
             if(result) {
            	 form.action='${postDeletePage}'; //EL
            	 form.method ='post';
            	 form.submit();
        }
       
    });
    
        const btnUpdate = document.querySelector('#btnUpdate');
    	
        btnUpdate.addEventListener('click', function(event){
            event.preventDefault(); 

            const result = confirm('정말 수정할까요?');
            if(result) {
            	
                const title = document.querySelector('#title').value;
                
                const content = document.querySelector('#content').value;
                if(title =='' || content =='') {
                    alert('제목과 내용은 반드시 입력해야 합니다.');
                    return; 
              }

                form.action = '${postUpdatePage}';  // submit 요청을 보낼 주소
                form.method = 'post'; // submit 요청방식 
                form.submit();
            }
            
          

    });   
    
    </script>
</body>
</html>