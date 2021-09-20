<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <style>
        
        .footer{
            background-color: red;
            height: 50px;
        }
        .section{
            background-color: yellowgreen;
            height: 500px;

        }
        .sidebar{
            background-color: yellow;
            position: fixed;
            right: 15px ;
            top: 250px;
        }
       
        .container {
          font-family: "NanumGothic";
        }

        #title {
          color: rgb(0, 173, 181);
          font-size: 45px;
          font-weight: bold;
        }

        input {
          padding: 5px;
          border: 1px solid lightgray;
          border-radius: 10px;
          width: 200px;
        }

        .page-link {
          color:rgb(0, 173, 181);
        }
        #btn-list {
          margin-top: 15px;
          margin-bottom: 25px;
        }
        .panel-heading > a {
            color: black;
        }

        #searchbar {
          margin-top: 20px;
        }
        
        #tags {
          color:black;
        }
        /* 서브 메뉴 */
        .sub_menu {
            
            width: 100%;
            height: 50px;
            background-color: rgb(0, 173, 181);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.8);
        }
        .sub2 {
            display: inline-block;
            margin:0 auto;
        }

        .sub2 > a:link, .sub2 > a:visited, .sub2 > a:active{
            margin: 5px 35px;
            font-size: 15px;
            line-height: 50px;
            text-decoration: none;
            color: #fff;
        }

        .sub2 a:hover { 
            color: #fff;
            font-weight: 600;
        }
        #sub_menu3 {
            text-align: center;
            box-sizing: border-box; /*중요*/
        }

    </style>
</head>

<body>
    
    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>
        <div class="row">
          <ul id="sub_menu3" class="sub_menu">
              <li class="sub2"><a href="<c:url value="/noticeBoard/" />">공지사항</a></li>
                <li class="sub2"><a href="<c:url value="/freeBoard/" />">자유게시판</a></li>
                <li class="sub2"><a href="/FRONT/views/board/qna/qna_board.jsp">질문게시판</a></li>
          </ul>
        </div>
        <div class="container">

            <div class="row">
              <div class="col-sm-5">
                <span id="title">질문게시판</span>
              </div>

              <div class="col-sm-7">
                <div class="row input-group">
                  <input type="text" class="form-control" placeholder="Search for..." id="searchbar">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="searchbar">검색</button>
                  </span>
              </div>


              </div>


            </div>

            <br>
           
           
            
            <br>

            <div class="row panel panel-info margin-top-5">
                <div class="panel-heading text-center">
                    <a href="#" id="tags">#운동</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#인바디측정</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#골프</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#배드민턴</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#테니스</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#크로스핏</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#다이어트</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#영양</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#필라테스</a>&nbsp;&nbsp;
                    <a href="#" id="tags">#홈트</a>&nbsp;&nbsp;
                </div>
                
            </div>

          

            <div class="row margin-top-5">
                <table class="table table-hover table-responsive">
                    <thead class="bg-info">
                      <tr>
                        <th scope="col" class="text-center">번호</th>
                        <th scope="col" class="text-center">제목</th>
                        <th scope="col" class="text-center">글쓴이</th>
                        <th scope="col" class="text-center">날짜</th>
                        <th scope="col" class="text-center">조회</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr onclick="location.href='/FRONT/views/board/qna/qna_detail.html'">
                        <th scope="col" class="text-center">23</th>
                        <th scope="col">상체 키우고 싶은데 몇 분할이 좋을까요?</th>
                        <th scope="col" class="text-center">헬린이</th>
                        <th scope="col" class="text-center">2021-09-02</th>
                        <th scope="col" class="text-center">153</th>
                      </tr>
                    
                        <tr onclick="location.href='/FRONT/views/board/qna/qna.html'">
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                          <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                          <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                          <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                          <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                           <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                          <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">근육이 정말 안느네요. 단백질 더 먹어야 할까요?</th>
                          <th scope="col" class="text-center">며르치</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                        </tr>
                        
                    </tbody>
                  </table>
            </div>

            <div class="row" align="right">
              
                <button type="button" id="write" class="btn btn-outline-primary float-right" onclick="location.href='/FRONT/views/board/qna/qna_write.html'"><b>질문하기</b></button>

              
             </div>


            <div class="row text-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                  </nav>
            </div> 

        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
        
    </div>
    
    
</body>
</html>