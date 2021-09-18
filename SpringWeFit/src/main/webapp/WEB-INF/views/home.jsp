<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>
	<style>
        
        
        .section{
            height: 1200px;
        }
        .sidebar{
            background-color: yellow;
            position: fixed;
            right: 15px ;
            top: 250px;
        }
        .section .main_img {
            width: 100%;
            height: 400px;
        }
        .carousel-inner .item {
            vertical-align: middle;
            width: 100%;
            height: 650px;
        }

        .carousel-inner .item img {
            max-width:100%; 
            max-height:100%;
            display:inline-block;
            vertical-align:middle;
        }

        .item h3{
            color: black;
            font-weight: bold;
            font-size: 24px;
            line-height: 30px;
        }

        .container {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 800px;
        }
       

       

    </style>
    
    <div class="container-fluid h-100">

        <div class="row">
            <%@ include file="include/header.jsp" %>
        </div>

        <div class="row"> 
            <div class="section">
                <img src="${pageContext.request.contextPath }/resources/img/main/main.jpg" alt="" class="main_img">

                <div class="container">
                   
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                  
                    <div class="carousel-inner">    

                        <div class="item active">
                        <a href="/FRONT/views/board/course/ck_course_board2.html"> <!-- 해당 이미지가 있는 게시글로 링크 -->
                            <img src="${pageContext.request.contextPath }/resources/img/course/vid01.jpg" alt="" style="width:100%;">
                            <div class="carousel-caption">
                                <h3>운동강의<br>함께 따라해봐요! </h3>
                            </div>
                        </a>
                        </div>
                    
                        <div class="item">
                        <a href="#"> <!-- 해당 이미지가 있는 게시글로 링크 -->
                            <img src="${pageContext.request.contextPath }/resources/img/location/site01.jpg" alt="" style="width:100%;">
                            <div class="carousel-caption">
                                <h3>운동하기<br>함께 운동해요!</h3>
                            </div>
                        </a>
                        </div>
                        
                        <div class="item">
                        <a href="#"> <!-- 해당 이미지가 있는 게시글로 링크 -->
                            <img src="${pageContext.request.contextPath }/resources/resource/img/product/슈펜 테크 운동화.jpg" alt="" style="width:100%;">
                            <div class="carousel-caption">
                                <h3>중고장터<br>뭐든 사고팔아요!</h3>
                            </div>
                        </a>
                        </div>

                    </div>
                  
                      <!-- 화살표 -->
                      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                  </div>

            </div>
            
        </div>

        <div class="row">
            <%@ include file="include/footer.jsp" %>
        </div>
		
        
    </div>
    
</body>
</html>