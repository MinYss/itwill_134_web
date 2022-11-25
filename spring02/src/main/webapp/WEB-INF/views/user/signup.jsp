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
            <h2>회원가입</h2>
        </header>
        
        
        <div>
            <main>
                <form method="post">
                    <div>
                        <input type="text" name="username" placeholder="아이디" required autofocus />
                    </div>
                    <div>
                        <input type="password" name="password" placeholder="비밀번호" required />
                    </div>
                    <div>
                        <input type="email" name="email" placeholder="이메일" required/>
                    </div>
                    <div>
                        <input type="submit" value="회원가입" />
                    </div>
                </form>
            </main>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" 
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
            crossorigin="anonymous"></script>
</body>
</html>