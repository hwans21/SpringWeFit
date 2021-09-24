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
        .titlebox h2 {
            border-bottom: 1px solid rgb(0, 173, 181);
            margin: 20px 0px;
            padding-bottom: 20px;
            font-size: 20px;
            font-weight: bold;
            color: rgb(0, 173, 181);
        }
        table tr td {
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }
        .titlefoot {
            float: right;
            margin: 20px;
        }
        .video-wrap {
            position: relative;
            padding-bottom: 56.25%;
            padding-top: 30px;
            height: 0;
            overflow: hidden;
        }
        .video-wrap iframe,
        .video-wrap object,
        .video-wrap embed {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        .carousel-inner>.item>img {
            top: 0;
            left: 0;
            min-width: 100%;
            min-height: 400px;
        }
        #carousel-example-generic {
            /* 케러셀(이미지 슬라이드) 높이 고정 및 배경색 조정*/
            height: 800px;
            background-color: rgba(0, 0, 0, 0.8);
        }
        .test {
            height: 1000px;
            overflow: auto;
        }
        .test:last-child .row {
            margin-top: 20px;
            margin-left: 20px.;
        }
        .reply {
            font-size: 20px;
            font-weight: 600;
        }
        .reply small {
            font-size: 15px;
            font-weight: 400;
        }
        .reply-box {
            padding-bottom: 20px;
            border-bottom: 1px solid #ccc;
        }
    </style>
</head>

<body>

    <div class="container-fluid h-100">

        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>

        <div class="container-fluid">
            <div class="col-md-8 col-sm-12 test">
                <div class="row">
                    <button type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/placeBoard/placeModify?pbNum=${placeList.pbNum}" />'">수정하기</button>
                    <button type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/placeBoard/placeList" />'">목록으로</button>
                </div>
                
              
                <div class="row">
                    <div class="col-sm-12">
                        <div class="titlebox">
                            <h2>${placeList.pbTitle}</h2>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="container-fluid">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"
                            data-interval="false">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="4"></li>

                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img src="${pageContext.request.contextPath }/resources/img/location/site01.jpg" width="100%" alt="...">

                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath }/resources/img/location/site02.jpg" width="100%" alt="...">

                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath }/resources/img/location/site03.jpg" width="100%" alt="...">

                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath }/resources/img/location/site04.jpg" width="100%" alt="...">

                                </div>
                                <div class="item">
                                    <img src="${pageContext.request.contextPath }/resources/img/location/site05.jpg" width="100%" alt="...">

                                </div>

                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button"
                                data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button"
                                data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>


                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="container-fluid">
                        <div class="col-sm-12">
                            <img width="100%" height="auto" src="${pageContext.request.contextPath }/resources/img/location/mapexam.png" alt="">
                        </div>

                        <table>
                            <tr>
                                <td>주소 :${placeList.pbAddrBasic} ${placeList.pbAddrDetail}</td>

                                
                                <td>
                                    <a href="https://map.kakao.com/link/to/장소명,33.450701,126.570667">
                                        <button class="btn btn-info pull-right">길찾기</button>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>작성일:${placeList.pbRegDate}</td>
                                <td><span class="glyphicon glyphicon-eye-open"></span>100</td>
                                <td>

                                    <button class="btn btn-info pull-right"><span
                                            class="glyphicon glyphicon-heart"></span> 좋아요</button>

                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p style="line-height: 150%;">

						                ${placeList.pbContent}  
						                          
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>

                                    <button class="btn btn-info pull-right"><span
                                            class="glyphicon glyphicon-thumbs-down"></span> 신고하기</button>

                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

            </div>
            
            <!-- 댓글창 -->
            <div class="col-md-4 col-sm-12 test">
                <!-- 댓글 입력창 -->
                <div class="row">
                    <span id="replyCountSpan" class="reply reply-count">댓글 : ???개</span>
                </div>
                <div class="row">
                    <form id="reply-form">
                        <div class="input-group input-group-lg">

                            <input id="replyInput" type="text" class="form-control" placeholder="댓글을 작성해주세요"
                                aria-describedby="basic-input">
                            <span class="input-group-btn" id="basic-input">
                                <button id="replyBtn" type="button" class="btn btn-default"><span
                                        class="glyphicon glyphicon-send"></span></button>
                            </span>
                        </div>
                    </form>
                </div>
                
                <!-- 댓글 리스트 -->
                <div class="row">
                    <div class="reply reply-box">
                        <span class="reply-writer">작성자</span> <small>1시간 전</small><br><br>
                        <span class="reply-content">댓글 내용입니다.</span>
                    </div>
                </div>

            </div>
        </div>



        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>


    </div>

	<script>
	
    $('#replyBtn').click(function(){
    	replyRegist();
    	$('#replyInput').val('');
    });
    
    $('#replyInput').keyup(function(e){
    	e.preventDefault();
    	if(e.keyCode==13){
        	$('#replyBtn').click();
    	}
    });
	
	
	    
		$('#lovelyBtn').click(function(){
			const arr = {
				"pbNum" : ${content.pbNum},
				"memberNum" : ${loginuser.memberNum}
			};
			$.ajax({
	            type: "POST",
	            url: "<c:url value='/placeBoard/placeLikely' />",
	            headers: {
	                "Content-Type": "application/json"
	            },
	            dataType: "text", //서버로부터 어떤 형식으로 받을지(생략가능)
	            data: JSON.stringify(arr),
	            success: function (data) {
	                console.log('통신성공!' + data);
	              	if(data==="success"){
	              		alert('좋아요 등록완료');
	              	} else{
	              		alert('이미 좋아요를 누르셨습니다.')
	              	}
	            },
	            error: function () {
	                alert('통신에 실패했습니다. 관리자에게 문의하세요');
	            }
	        }); //좋아요  비동기 처리 끝
	        
	        
		});
		
		$('#reportBtn').click(function(){
			const arr = {
				"pbNum" : ${content.pbNum },
				"memberNum" : ${loginuser.memberNum }
			};
			$.ajax({
	            type: "POST",
	            url: "<c:url value='/placeBoard/placeReport' />",
	            headers: {
	                "Content-Type": "application/json"
	            },
	            dataType: "text", //서버로부터 어떤 형식으로 받을지(생략가능)
	            data: JSON.stringify(arr),
	            success: function (data) {
	                console.log('통신성공!' + data);
	              	if(data==="success"){
	              		alert('신고 완료했습니다.');
	              	} else{
	              		alert('이미 신고를 하셨습니다.')
	              	}
	            },
	            error: function () {
	                alert('통신에 실패했습니다. 관리자에게 문의하세요');
	            }
	        }); //좋아요  비동기 처리 끝
	        
	        
		});
	</c:if>
	
	</script>
	
	
</body>

</html>