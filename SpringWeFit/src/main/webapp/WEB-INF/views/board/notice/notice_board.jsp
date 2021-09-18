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
        .footer {
            background-color: red;
            height: 50px;
        }

        .section {
            background-color: yellowgreen;
            height: 500px;

        }

        .sidebar {
            background-color: yellow;
            height: 500px;
        }

        .container {
            font-family: "NanumGothic";
        }

        /* h2 {
          color: rgb(0, 173, 181);
          font-size: 35px;
          font-weight: bold;
        } */

        .titlebox h2 {
            /* border-bottom: 1px solid rgb(0, 173, 181); */
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 25px;
            font-weight: bold;
            color: rgb(0, 173, 181);
            text-align: left;
        }

        input {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 10px;
            width: 200px;
        }

        .page-link {
            color: rgb(0, 173, 181);
        }

        #btn-list {
            margin-top: 15px;
            margin-bottom: 25px;
        }






        .vid {
            margin: 15px 5px;
            padding: 10px;
            border: 1px solid #ccc;
        }

        .vid:hover {
            border: 4px solid rgb(0, 173, 181);
            box-sizing: border-box;
        }


        /* .course {      
            box-sizing: border-box;        
        } */

        .subject {
            height: 70px;
            margin: 10px;
        }

        .auth {
            text-align: left;
            font-size: 15px;
            padding: 0 13px;
            overflow: hidden;
        }

        .auth span {
            float: right;
            font-size: 14px;
            padding-left: 22px;
        }

        .glyphicon-comment {
            color: skyblue;
        }

        .glyphicon-eye-open {
            color: purple;
        }

        .glyphicon b {
            color: #000;
            padding-left: 8px;
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


                <li class="sub2"><a href="/FRONT/views/board/notice/notice_board.jsp">공지사항</a></li>
                <li class="sub2"><a href="<c:url value="/freeBoard/List" />">자유게시판</a></li>
                <li class="sub2"><a href="/FRONT/views/board/qna/qna_board.jsp">질문게시판</a></li>

            </ul>
        </div>
        <div class="container text-center">

            <!-- <div class="row">
                <h2 class="font-weight-bold text-center">운동 강의</h2>
            </div> -->

            <div class="row">
                <div class="col-sm-10">
                    <div class="titlebox">
                        <h2>공지사항</h2>
                    </div>
                </div>
            </div>

            <div id="btn-list" class="row" align="right">


                <input type="text" placeholder="Search" value="${page.keyword}">
                <button type="button" class="btn" aria-label="Left Align">
                    <span class="glyphicon glyphicon-search" aria-hidden="true" ></span>


                </button>


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


                    	<c:forEach items="${noticelist}" var="noticelist">
                        	<tr onclick="location.href='/FRONT/views/board/notice/notice_detail.html'">
                        		<td scope="col" class="text-center">${noticelist.NBNUM}</td>
  								<td scope="col"><a href="/noticeboard/view?NBNUM=${noticelist.NBNUM}">${noticelist.NBTITLE}</a></td> <!-- 이거 수정 -->
  								<td scope="col" class="text-center">${noticelist.MNUM}</td>
  								<td scope="col" class="text-center">${noticelist.NBREGDATE}</td>
  								<td scope="col" class="text-center">${noticelist.NBLOOKCOUNT}</td>
  							</tr>
  						</c:forEach>
  						


                    </tbody>
                </table>

                </table>
            </div>

            <div class="row" align="right">


                    <button type="button" id="write" class="btn btn-outline-primary float-right" onclick="location.href='/FRONT/views/board/notice/notice_write.html'"><b>작성하기</b></button>


            </div>


            <!-- <div class="row" align="right">
              <button type="button" id="write" class="btn btn-outline-primary float-right"><b>글쓰기</b></button>
             </div> -->


            <div class="row text-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>


                        <li class="page-item"><a class="page-link" href="/noticeboard/noticelistPage?num=${num}">${num}</a></li>


                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>


        </div>
        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
    </div>
   
</body>

</html>