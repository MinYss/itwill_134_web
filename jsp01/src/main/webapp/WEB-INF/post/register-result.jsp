<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
    
    <h1>블로그 작성 완료 페이지</h1>
    <div>
        <label>번호</label>
        <input type="number" value="${post.id}" readonly />
    </div>
    <div>
        <label>제목</label>
        <input type="text" value="${post.title}" readonly />
    </div>
    <div>
        <label>내용</label>
        <textarea rows="5" cols="80" readonly>${post.content}</textarea>
    </div>
    <div>
        <label>작성 시간</label>
        <input type="datetime-local" value="${post.createTime}" readonly />
    </div>    
    
</body>
</html>