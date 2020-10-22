<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style style="text-decoration:none">
* {
   text-decoration: none;
   margin: 0;
   padding: 0;
}

header {
   position: sticky;
   top: 0;
   left: 0;
   width: 100%;
   height: 100px;
   display: flex;
   /* justify-content: space-between;*/
   align-items: center;
   transition: 0.6s;
   z-index: 100;
   background-color: cornflowerblue;
}

footer {
   position: fixed;
   bottom: 0;
   left: 0;
   width: 100%;
   height: 25%;
   display: flex;
   /* justify-content: space-between;*/
   align-items: center;
   z-index: 100;
   background-color: cornflowerblue;
}

header ul {
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
}

ul {
   list-style: none;
   line-height: 10px;
}

header ul li a {
   position: relative;
   margin: 0 5px;
   color: white;
   letter-spacing: 2px;
   font-weight: 500;
   transition: 0.6s;
   font-size: 16px;
}

.side-logo-container {
   display: flex;
}

.text {
   display: flex;
}
</style>
<body>
   <header>
      <div class="side-logo-container" style="display: flex;">
         <span style="font-size: 40px; cursor: pointer; margin-right: 7px;"
            class="side-open-btn">&#9776;</span> <a
            href="http://localhost:8090/sapare/mainPage.do" class="logo"><img
            src="image/header/sapare.jpg" width=50px; height=50px;></a>
      </div>

      <div class="text">
         <input type="text" placeholder="검색어를 입력해 주세요"
            style="width: 300px; height: 23px;">
         <button>
            <img src="image/header/search.gif" width=20px; height=20px;>
         </button>
      </div>
      <ul>
         <li><a href="itemUploadPage.do" class="headerba">판매등록</a></li>
         <li><a href="log/sign" class="headerba">로그인/회원가입</a></li>
         <li><a href="my?page=main" class="headerba">마이페이지</a></li>
      </ul>
   </header>


   <section></section>


   <footer> </footer>
</body>
</html>