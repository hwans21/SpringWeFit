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
            font-size: 40px;
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
            height: 1000px;
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
                    <button type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/dietBoard/dietModify?dbNum=${dietList.dbNum}" />'">수정하기</button>
                    <button type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/dietBoard/dietList" />'">목록으로</button>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="titlebox">
                            <h2>${dietList.dbTitle}</h2>
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
                        
                        <table>
                            

                            <tr>
                                <td>작성일:<fmt:formatDate value="${dietList.dbRegDate}"  pattern="yyyy-MM-dd HH:mm"/>  </td>
                                <td><span class="glyphicon glyphicon-eye-open"></span>${dietList.dbLookCount}</td>
                                <td>

									<c:if test="${loginuser != null }">
	                                    <button id="lovelyBtn" class="btn btn-info pull-right"><span
	                                            class="glyphicon glyphicon-heart"></span> 좋아요</button>
									</c:if>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p style="line-height: 150%;">
                                   		${dietList.dbContent}
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>

									<c:if test="${loginuser != null }">
	                                    <button id="reportBtn" class="btn btn-info pull-right"><span
	                                            class="glyphicon glyphicon-thumbs-down"></span> 신고하기</button>
									
									</c:if>
									
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

            </div>
            <div class="col-md-4 col-sm-12 test">
                <div class="row">
                    <span id="replyCountSpan" class="reply reply-count">댓글 : ???개</span>
                </div>
                <div class="row">
                    <form id="reply-form">
                        <div class="input-group input-group-lg">
                        
                            <input id="replyInput" type="text" class="form-control" placeholder="댓글을 작성해주세요" 
                            	aria-describedby="basic-input">
                            <span class="input-group-btn" id="basic-input">
	                            <button id="replyBtn" type="button" class="btn btn-default">
	                                <span class="glyphicon glyphicon-send"></span>
	                            </button>
                            </span>
                        </div>
                    </form>
                </div>
                
                <div id="replyList" class="row container-fluid">
                	
                </div>
                <!-- <button class="form-control" id="moreList">더보기</button> -->
            </div>
        </div>



        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>


    </div>

    <script defer>
			        function sleep(ms) {
			            const wakeUpTime = Date.now() + ms;
			            while (Date.now() < wakeUpTime) { }
			        }

  
					replyLoad(1, true);
	     
	        		// 댓글입력
	        		function replyRegist() {
	
						$.ajax({
							type: "post",
							url: "<c:url value='/dietReply/replyRegist' />",
							headers: {
								"Content-Type" : "application/json"
							}, 
							data: JSON.stringify({
								"memberNum" : '${loginuser.memberNum}',
								"drContent" : $('#replyInput').val(),
								"dbNum" : '${dietList.dbNum}'
							}),   
							success: function (data) { 
								console.log('데이터 통신 성공' + data);
								//댓글 목록 불러오기
								replyLoad(1, true);
								alert('댓글등록완료!');
							},
							error : function (request, status, error) {
								alert('등록 통신 실패! 관리자에게 문의하세요.');
								console.log("code" + request.status + "\n" + "message:" + request.responseText + "\n" + "error" + error);
							}
						});  //비동기통신 종료 
						
					} // 댓글입력 종료 
					
					/*
					//더보기 버튼 이벤트 처리
					$('#moreList').click(function() {
						replyLoad(page++ , false); //페이지 수만 늘리고 false값을 줘서 (더보기니까) 댓글을 누적한다.
						
					});//더보기버튼 함수 종료
					*/
					
					let page = 1;
					let strAdd = "";
					
	        		
					
					//무한 스크롤
			        $(document).ready(function () {
           
			            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
			            replyLoad(1,true);
			            pageNum=2;
			
			        });
				        $(window).resize(function () {
				            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
				        });
					
			        $('.test:last-child').scroll(function () {
			
			            let replyTotalHeight = 0;
			            let count=0;
			            
			            $('.test:last-child >.row').each(function () {
			                replyTotalHeight = replyTotalHeight + $(this).height()
			                count++;
			            });
			            if ($('.test:last-child').scrollTop() + $('.test:last-child').height() >= replyTotalHeight) {
			                replyLoad(pageNum,false);
			                pageNum = pageNum+1;
			            }
			            console.log(count);
							
			        });//무한 스크롤 종료
						
					//댓글 목록 불러오기 요청 (페이징)
					function replyLoad(pageNum, reset) {
					
						const dbNum = '${dietList.dbNum}';
							
						$.getJSON(
							"<c:url value='/dietReply/replyList/' />" + dbNum + '/' + pageNum ,
							
							function(data) {
								
								
								let total = data.total; //총 댓글 수
								console.log('총 댓글 갯수' + total);
								$('#replyCountSpan').html('댓글 :'+ data.total+'개');
								let Data = data.list; //댓글 리스트
								
								if(total <= page * 10) {
									$('#moreList').css('display' , 'none');
								}else {
									$('#moreList').css('display' , 'block');
								}
								
								
				               if(reset === true) {
				            	   strAdd = '';
				               }
				               
				               //응답 데이터의 길이가 0이하면 함수 종료
				               if(Data.length <= 0) {
				            	   return;
				               }
								
								let loginuserName = "${loginuser.memberNick!=null? loginuser.memberNick:''}";
			        			for (let i = 0; i < Data.length; i++) {
			                        strAdd += '<div class="row reply-item" style="display:none;">';
			                        strAdd += '<div class="reply reply-box">';
			                        strAdd += '<span class="reply-writer">'+Data[i].memberNick+'</span> <small>'+timeStamp(Data[i].drRegDate)+'</small>'
			                        if(Data[i].memberNick === loginuserName){
				                        strAdd += '&nbsp;&nbsp;&nbsp;&nbsp;<span class="mod-del"><button class="replyModBtn'+Data[i].drNum+'">수정</button> <button class="replyDelBtn'+Data[i].drNum+'">삭제</button></span>'
			                        	
			                        }
			                        strAdd += '<br><span class="reply-content">'+Data[i].drContent+'</span>'
			                        strAdd += '</div>';
			                        strAdd += '</div>';
			                    }
			                    $('#replyList').html(strAdd);
			                    $('.reply-item').fadeIn(500);
				            }
				                 
						); // end getJSON
					
					
					} // 댓글불러오기 함수 종료
					
					
					
					
					// 댓글 수정
					function replyModify(frClassName) {
						if('${loginuser == null ? true : false}') {
							alert('로그인을 하세요!');
						}
						
						$.ajax({
							type: "post",
							url: "<c:url value='/dietReply/dietReplyModify' />",
							headers: {
								"Content-Type" : "application/json"
							},
							data: JSON.stringify ({
								"memberNum" : '${loginuser.memberNum}',
								"drContent" : $('#replyInput').val(),
								"drNum" : frClassName   
							}), 
							success : function (data) {
								console.log('통신 성공' + data);
								alert('댓글 수정 완료');
							},
							error : function (request, status, error) {
			                    alert('수정 통신에 실패했습니다. 관리자에게 문의하세요');
			                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
							
							
							}); // 비동기통신 종료
					} // 댓글 수정 종료
					
					
					// 댓글 삭제
					
					
					
					
		        	function replyCount() {
		        		$.ajax({
		        			type: "GET",
		        			url: "<c:url value='/dietBoard/replyCount?dbNum=${dietList.dbNum}' />",
		        			success : function (data) {
								console.log('통신성공!' + data);
								$('replyCountSpan').html('댓글:' + data + '개');
							},
							error : function (request, status, error) {
			                    alert('조회수 통신에 실패했습니다. 관리자에게 문의하세요');
			                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
		        		});  //비동기 통신 끝
		        	}  //replyCount() 끝
	        	
		        	
		        	//좋아요 함수
					$('#lovelyBtn').click(function () {
	
					
							const arr = {
									"dbNum" : '${dietList.dbNum}',
									"memberNum" : '${loginuser.memberNum}'
							};
							$.ajax({ 
								type: "post",
								url: "<c:url value='/dietBoard/dietLikely' />",
								headers: {
									"Content-Type" : "application/json"
									},
								data: JSON.stringify(arr),
								success: function (data) {
									console.log('데이터 통신 성공!' + data);
									if(data === 'success') {
										alert('좋아요 등록완료');
									}else{
				                  		alert('이미 좋아요를 누르셨습니다.');
									}
								},
									error: function () {
									alert('좋아요 통신에 실패했습니다. 관리자에게 문의하세요');
									}
							}); //좋아요 비동기 종료
					}); //좋아요 함수 종료
		        	
					
		        	
					$('#reportBtn').click(function(){
	
			    		const arr = {
			    			"dbNum" : '${dietList.dbNum }',
			    			"memberNum" : '${loginuser.memberNum }'
			    		}; 
			    		$.ajax({
			                type: "POST", 
			                url: "<c:url value='/dietBoard/dietReport' />",
			                headers: {
			                    "Content-Type": "application/json"
			                },
			                data: JSON.stringify(arr),
			                success: function (data) {
			                    console.log('통신성공!' + data);
			                    if(data === 'success'){
			                    	alert('신고 완료했습니다.');
			                    }else {
			                    	alert('이미 신고를 하셨습니다.');
			                    }
			                },
			                error: function () {
			                    alert('신고하기 통신에 실패했습니다. 관리자에게 문의하세요');
			                }
			            }); //신고 비동기 처리 끝
					}); // 신고 함수 끝
	        	
	        	
			 
				
	        	  $('#replyBtn').click(function(){
	              	replyRegist();
	              	$('#replyInput').val('');
	              });
	        	
				
					
					
	              // 날짜 처리 함수
	              function timeStamp(millis) {
	                  const date = new Date(); //현재 날짜
	                  // 현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
	                  const gap = date.getTime() - millis;
	                  // 댓글1시간전 담 -> 방금전, 댓글 하루전 -> 몇시간전, 하루이상 2021-08-13
	                  let time; // 리턴할 시간
	                  if (gap < 60 * 60 * 24 * 1000) { // 1일 미만인 경우
	                      if (gap < 60 * 60 * 1000) { //1시간 미만일 경우
	                          time = '방금 전';
	                      } else {
	                          time = parseInt(gap / (60 * 60 * 1000)) + "시간 전";
	                      }
	                  } else { //1일 이상일경우
	                      const today = new Date(millis);
	                      const year = today.getFullYear(); //년
	                      const month = today.getMonth() + 1; //월
	                      const day = today.getDate(); //일
	                      const hour = today.getHours(); // 시
	                      const minute = today.getMinutes(); // 분
	                      time = year + "년" + month + "월" + day + "일" + hour + "시" + minute + "분";
	
	                  }
	                  return time;
	              }
	        
        	
        
        
    </script>
    
</body>

</html>







