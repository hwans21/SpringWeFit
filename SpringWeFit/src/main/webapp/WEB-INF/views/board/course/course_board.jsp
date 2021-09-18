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





        .vid {
            margin: 25px 5px;
            padding: 5px;
            border: 1px solid #ccc;
            /* background: rgb(0, 173, 181); */
            
        }



        .vid .video {
            /* border: 1px solid #fff; */
            background: #fff;
            padding: 10px;
        }


        .subject {
            height: 70px;
            margin: 20px 30px;
        }

        .category {
            display: block;
            text-align: left;
            margin: 5px 0;
            padding: 5px 0;
            border-bottom: 1px solid #ccc; 
            font-size: 13px;
            font-weight: 500;
            color: #5a5a5a;
        }

        .auth {
            text-align: left;
            font-size: 15px;
            padding: 0 13px;
            overflow: hidden;
            margin-top: 30px;
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


      

    </style>
</head>

<body>
    
    <div class="container-fluid h-100">

        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>
        
   
        <!-- <div class="row">
                
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
        </div> -->

        <div class="row">
            <div class="col-sm-10">
                <div>
                    <span id="title">운동 강의</span>
                </div>
            </div>
        </div>           
        <div id="btn-list" class="row" align="right">
            <div class="btn-group text-center " role="group" aria-label="Basic outlined example">
                <button type="button" class="btn btn-info btn-active id="all">전체</button>
                <button type="button" class="btn btn-info">수영</button>
                <button type="button" class="btn btn-info">배드민턴</button>
                <button type="button" class="btn btn-info">스쿼시</button>
                <button type="button" class="btn btn-info">자전거</button>
                <button type="button" class="btn btn-info">달리기</button>
                <button type="button" class="btn btn-info">등산</button>
                <button type="button" class="btn btn-info">홈트짐트</button>
                <button type="button" class="btn btn-info">필라테스</button>
                <button type="button" class="btn btn-info">골프</button>
                <button type="button" class="btn btn-info">스케이트</button>
                <button type="button" class="btn btn-info">기타</button>&nbsp;&nbsp;&nbsp;
            </div>
            
            <input type="text" placeholder="Search">
              
            <button type="button" class="btn" aria-label="Left Align">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </button>
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
                    <tr class="course">  
                    	<c:forEach var="vo" begin="1" end="3" items="${courseList}">                                   
<%-- 		                	<c:forEach begin="1" end="3"> --%>
		                        <td scope="col" class="text-center">
		                            <div class="vid">                               
		                                <div class="video" onclick="location.href='#'">
		                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid01.jpg" width="280px" alt="vid01"></a>                                 
		                                    <p class="subject"><span class="category">${vo.cbCategory}</span><a href="#">${vo.cbTitle}</a></p>
		                                    <p class="auth">관리자
		                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
		                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
		                                    </p>
		                                </div>
		                            </div>
		                        </td>
<%-- 	                       </c:forEach> --%>
                        </c:forEach> 
                        
                        <%-- <td scope="col" class="text-center">
                            <div class="vid">                               
                                <div class="video" onclick="location.href='/FRONT/views/board/course/course_detail.html'">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid01.jpg" width="280px" alt="vid01"></a>                                 
                                    <p class="subject"><span class="category">홈트짐트</span><a href="#">층간 소음 걱정 없이 체중 감량 보장! 딱 5분 운동!</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid02.jpg" width="280px" alt="vid02"></a>
                                    <p class="subject"><span class="category">홈트짐트</span><a href="#">강한 어깨와 삼두를 위한 맨몸운동 루틴 (feat. 90도 물구나무)</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>   
                        </td>
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid03.jpg" width="280px" alt="vid03"></a>
                                    <p class="subject"><span class="category">홈트짐트</span><a href="#">※50분 올인원 운동※ 체중감량에 최적화된 루틴 (No 층간소음)</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>   
                        </td>                                         
                    </tr> 

                    <tr>    
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid04.jpg" width="280px" alt="vid04"></a>
                                    <p class="subject"><span class="category">테니스</span><a href="#">[포핸드] 스윙스피드가 조금만 빨라져도 상대가 당황하기 시작합니다</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid05.jpg" width="280px" alt="vid05"></a>
                                    <p class="subject"><span class="category">탁구</span><a href="#">[탁구레슨]백핸드 드라이브 쉽게 배워 보세요!!</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid06.jpg" width="280px" alt="vid06"></a>
                                    <p class="subject"><span class="category">배드민턴</span><a href="#">[달인콕tv 배드민턴 레슨] 상대를 속이는 기술4탄 (훼이크 드롭 3가지방법)</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>    
                    </tr>
                    
                    <tr>    
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid07.jpg" width="280px" alt="vid07"></a>
                                    <p class="subject"><span class="category">스쿼시</span><a href="#">스쿼시 그립잡기</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid08.jpg" width="280px" alt="vid08"></a>
                                    <p class="subject"><span class="category">수영</span><a href="#">하쌤수영/하은주수영/ 부드러운 자유형 꿀팁</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td scope="col" class="text-center">
                            <div class="vid">
                                <div class="video">
                                    <a href="#"><img src="${pageContext.request.contextPath }/resources/img/course/vid09.jpg" width="280px" alt="vid09"></a>
                                    <p class="subject"><span class="category">탁구</span><a href="#">[[ 김정훈 탁구레슨 ]] no.23 펜홀더 쇼트. 1부</a></p>
                                    <p class="auth">관리자
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>2</b></span>
                                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>100</b></span>
                                    </p>
                                </div>
                            </div>
                        </td>   --%>    
                   </tr>                                 
                </tbody>
              </table>
        </div>

            <div class="row" align="right">
                <button type="button" class="btn btn-outline-primary" onclick="location.href='<c:url value="/courseBoard/write" />' "><b>글쓰기</b></button>
            </div>


        <div class="row text-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
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
    
    <script defer>
 	
    	const msg = '${msg}';
    	if(msg === 'registSuccess') {
    		alert('정상 등록 처리되었습니다.');
    	}
    	
		$(document).ready(function(){
		      
		      
		      $('.vid').hover(function() {   
		          $(this).css('background-color', 'rgb(0, 173, 181)');
		          
		      });
		
		      $('.vid').mouseleave(function() {   
		          $(this).css('background-color', '#fff');
		          
		      });
		
		
		  });
      
  </script>
</body>
</html>