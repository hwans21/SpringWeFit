
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            padding-left: 15px;
        }
        .auth span:nth-child(1),span:nth-child(2){
            float: left;
            padding-left: 0px;
        }
        .auth span:nth-child(2){
            padding-left: 15px;
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
    </style>
</head>

<body>

    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>

        <div class="container text-center">

            <!-- <div class="row">
                <h2 class="font-weight-bold text-center">운동 강의</h2>
            </div> -->

            <div class="row">
                <div class="col-sm-8">
                    <div class="titlebox">
                        <h2>오늘먹은 식단</h2>
                    </div>
                </div>
                <div id="btn-list" class="row" align="right">

                    <!--검색 조건-->
                    <select class="search-condition">
                        <option>제목</option>
                        <option>작성자</option>
                    </select>

                    <input type="text" placeholder="Search">

                    <button type="button" class="btn" aria-label="Left Align">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                </div>
            </div>


            <div class="row margin-top-5">
                <!-- <table class="table table-hover table-responsive"> -->
                <table class="table">
                    <!-- <thead class="bg-info">
                        <tr>       
                            <th scope="col" class="text-center">제목</th>
                            <th scope="col" class="text-center">글쓴이</th>
                            <th scope="col" class="text-center">날짜</th>                      
                        </tr>
                    </thead> -->
                    <tbody>
                    	<c:forEach var="diet" items="${dietList}" begin="0" end="6">
		                	<tr class="course">
		                            <th scope="col" class="text-center"  onclick="location.href='<c:url value='/dietBoard/dietDetail?dbNum=${diet.dbNum}' />'">
		                                <div class=vid>
		                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/food/계란 치즈 오픈샌드위치.jpg" width="280px" height="160px"
		                                            alt="vid01"></a>
		                                    <p class="subject"><a href="#">${diet.dbTitle}</a></p>
		                                    <p class="auth">
		                                        <span class="writeday">${diet.dbRegDate}</span>
		                                        <span class="nickname">관리자</span>
		                                        
		                                        
		                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
		                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
		                                    </p>
		
		                                </div>
		                            </th>
		                            <th scope="col" class="text-center"  onclick="location.href='<c:url value='/dietBoard/dietDetail?dbNum=${diet.dbNum}' />'">
		                                <div class=vid>
		                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/계란말이+고구마.jpg" width="280px" height="160px"
		                                            alt="vid02"></a>
		                                    <p class="subject"><a href="#">${diet.dbTitle}</a></p>
		                                    <p class="auth">
		                                        
		                                        <span class="writeday">${diet.dbRegDate}</span>
		                                        <span class="nickname">관리자</span>
		                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
		                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
		                                    </p>
		                                </div>
		                            </th>
		                            <th scope="col" class="text-center"  onclick="location.href='<c:url value='/dietBoard/dietDetail?dbNum=${diet.dbNum}' />'">
		                                <div class=vid>
		                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/닭가슴살 두부유부초밥.jpg" width="280px" height="160px"
		                                            alt="vid03"></a>
		                                    <p class="subject"><a href="#">${diet.dbTitle}</a></p>
		                                    <p class="auth">
		                                        <span class="writeday">${diet.dbRegDate}</span>
		                                        <span class="nickname">관리자</span>
		                                        
		                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
		                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
		                                    </p>
		                                </div>
		                            </th>
	                        </tr>
						</c:forEach>
						<!-- 
                        <tr>
                            <th scope="col" class="text-center">
                                <div class=vid>
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/두부유부초밥.jpg" width="280px" height="160px"
                                            alt="vid04"></a>
                                    <p class="subject"><a href="#">두부유부초밥</a></p>
                                    <p class="auth">
                                        <span class="writeday">18.08.12</span>
                                        <span class="nickname">관리자</span>
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </th>
                            <th scope="col" class="text-center">
                                <div class=vid>
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/딸기사과 오픈 샌드위치.jpg" width="280px" height="160px"
                                            alt="vid05"></a>
                                    <p class="subject"><a href="#">딸기사과 오픈 샌드위치</a></p>
                                    <p class="auth">
                                        <span class="writeday">18.08.12</span>
                                        <span class="nickname">관리자</span>
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </th>
                            <th scope="col" class="text-center">
                                <div class=vid>
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/계란 치즈 오픈샌드위치.jpg" width="280px" height="160px"
                                            alt="vid06"></a>
                                    <p class="subject"><a href="#">계란 치즈 오픈샌드위치</a></p>
                                    <p class="auth">
                                        <span class="writeday">18.08.12</span>
                                        <span class="nickname">관리자</span>
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </th>
                        </tr>

                        <tr>
                            <th scope="col" class="text-center">
                                <div class=vid>
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/소고기 야채볶음.jpg" width="280px" height="160px"
                                            alt="vid07"></a>
                                    <p class="subject"><a href="#">소고기 야채볶음</a></p>
                                    <p class="auth">
                                        <span class="writeday">18.08.12</span>
                                        <span class="nickname">관리자</span>
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </th>
                            <th scope="col" class="text-center">
                                <div class=vid>
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/수제요거트,바나나.jpg" width="280px" height="160px"
                                            alt="vid08"></a>
                                    <p class="subject"><a href="#">수제요거트,바나나</a></p>
                                    <p class="auth">
                                        <span class="writeday">18.08.12</span>
                                        <span class="nickname">관리자</span>
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </th>
                            <th scope="col" class="text-center">
                                <div class=vid>
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/food/아보카도 치즈 오픈 토스트.jpg" width="280px" height="160px"
                                            alt="vid09"></a>
                                    <p class="subject"><a href="#">아보카도 치즈 오픈 토스트</a></p>
                                    <p class="auth">
                                        <span class="writeday">18.08.12</span>
                                        <span class="nickname">관리자</span>
                                        <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </th>
                            
                        </tr>
                        
                    </tbody>
                    -->
                </table>
            </div>

            <div class="row" align="right">
                <button type="button" id="write" class="btn btn-outline-primary float-right" onclick="location.href='<c:url value='/dietBoard/dietWrite'  />'"><b>글쓰기</b></button>

            </div> <!-- 관리자만 보이게 하기 -->


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

            
        </div>
        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
    </div>

    
</body>

</html>