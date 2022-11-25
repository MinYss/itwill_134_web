<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

</head>
<body>
    <h1>블로그 작성 페이지</h1>
    
    <form method="post">
        <input type ="number" name= "id" placeholder="번호" />
        <br/>
        <input type ="text" name= "title" placeholder="제목" />
        <br/>
        <textarea rows="5" cols="80" name= "content" placeholder="내용" required></textarea>
        <br/> 
        <input type ="datetime-local" name= "createTime" placeholder="작성 시간" />
        <br/>
        <input type ="submit" value="등록" />
        
    </form>
</body>
</html>