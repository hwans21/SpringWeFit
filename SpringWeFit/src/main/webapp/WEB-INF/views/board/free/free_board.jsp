<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

        #all {
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
        /* 서브 메뉴 */
        .sub_menu {
            
            width: 100%;
            background-color: rgb(0, 173, 181);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.8);
        }
        .sub2 {
            display: inline-block;
            margin: 0 auto;
        }

        .sub2 > a:link, .sub2 > a:visited, .sub2 > a:active {
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
   
        <div class="row">
                
          <div class="col-sm-5">
            <span id="title">자유게시판</span>
          </div>

              <div class="col-sm-7">
                  <div id="btn-list" class="row" align="right">
                    <div class="btn-group text-center" role="group" aria-label="Basic outlined example">
                      <button type="button" class="btn btn-info btn-active" id="all">전체</button>
                      <button type="button" class="btn btn-info">자유글</button>
                      <button type="button" class="btn btn-info">소식/정보</button>
                      <button type="button" class="btn btn-info">홍보</button>
                      <button type="button" class="btn btn-info">꿀팁</button>
                      <button type="button" class="btn btn-info">기타</button>&nbsp;&nbsp;&nbsp;
                    </div>
                
                    <input type="text" placeholder="Search">
                  
                    <button type="button" class="btn" aria-label="Left Align">
                      <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>

                  </div>
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
                    
                    <c:forEach var="arr" items="${freeList }">
                    
                      <tr onclick="location.href='<c:url value="/freeBoard/freeDetail?fbNum=${arr.fbNum }" />'">
                        <th scope="col" class="text-center">${arr.fbNum }</th>
                        <th scope="col">${arr.fbTitle }</th>
                        <th scope="col" class="text-center">${arr.memberNick }</th>
                        <th scope="col" class="text-center"><fmt:formatDate value="${arr.fbRegDate }" pattern="yyyy-MM-dd"/></th>
                        <th scope="col" class="text-center">${arr.fbLookCount }</th>
                      </tr>
                    </c:forEach>
                    <!-- 
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                          <th scope="col" class="text-center">야옹이</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                      </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                          <th scope="col" class="text-center">야옹이</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                      </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                          <th scope="col" class="text-center">야옹이</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                      </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                          <th scope="col" class="text-center">야옹이</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                      </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                          <th scope="col" class="text-center">야옹이</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                      </tr>
                      
                        <tr>
                          <th scope="col" class="text-center">23</th>
                          <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                          <th scope="col" class="text-center">야옹이</th>
                          <th scope="col" class="text-center">2021-09-02</th>
                          <th scope="col" class="text-center">153</th>
                      </tr>
                      
                        <tr>
                            <th scope="col" class="text-center">23</th>
                            <th scope="col">[자유글] 운동 많이 하고 계시나요?</th>
                            <th scope="col" class="text-center">야옹이</th>
                            <th scope="col" class="text-center">2021-09-02</th>
                            <th scope="col" class="text-center">153</th>
                        </tr>
                        -->
                    </tbody>
                  </table>
            </div>

            <div class="row" align="right">
                <button type="button" id="write" class="btn btn-outline-primary" onclick="location.href='<c:url value="/freeBoard/freeWrite" />'"><b>글쓰기</b></button>
             </div>

            <div class="row text-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <c:if test="${pc.prev }">
	                    <li class="page-item"><a class="page-link" href="<c:url value='/freeBoard/?pageNum=${pc.beginPage-1 }' />">Prev</a></li>
                      </c:if>
                      
                      <c:forEach var="page" begin="${pc.beginPage }" end="${pc.endPage }">
                      	<li class="page-item"><a class="page-link" href="<c:url value='/freeBoard/?pageNum=${page }' />">${page }</a></li>
                      </c:forEach>
               
                      
                      <c:if test="${pc.next }">
	                    <li class="page-item"><a class="page-link" href="<c:url value='/freeBoard/?pageNum=${pc.endPage+1 }' />">Next</a></li>
                      </c:if>
                    </ul>
                  </nav>
            </div> 

        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>

        
    </div>
    
    
</body>
</html>