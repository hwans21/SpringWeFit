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
						
                                    <button id="lovelyBtn" class="btn btn-info pull-right"><span
                                            class="glyphicon glyphicon-heart"></span> 좋아요</button>
                                            
                                    <!-- 
                                    <c:if test="${loginuser != null }">
										
	                                    <button id="lovelyBtn" class="btn btn-info pull-right"><span
	                                            class="glyphicon glyphicon-heart"></span> 좋아요</button>
									</c:if>
                                     -->     

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
                                            class="glyphicon glyphicon-thumbs-down"></span>신고하기</button>

                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

            </div>
            
            <!-- 댓글창 -->
            <div class="col-md-4 col-sm-12 test">
                
                <div class="row">
                    <span id="replyCountSpan" class="reply reply-count">댓글 : ???개</span>
                </div>
                <div class="row">
                        <div class="input-group input-group-lg">

                            <input type="text" id="replyInput" class="form-control" placeholder="댓글을 작성해주세요"
                                aria-describedby="basic-input">
                            <span class="input-group-btn" id="basic-input">
                                <button id="replyBtn" type="button" class="btn btn-default">
                                	<span class="glyphicon glyphicon-send"></span>
                                </button>
                            </span>
                        </div>
                </div>
                <div id="replyList" class="row">
	                                
	                	
	                    		
                </div>

            </div>
        </div>



        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>


    </div>

	<script defer>
		let strAdd = '';
	   	let pageNum = 2;
	   	let boolRegist = true;
	   	let prClassName = '';
	       function sleep(ms) {
	           const wakeUpTime = Date.now() + ms;
	           while (Date.now() < wakeUpTime) { }
	       }
       
	       
	   
		//댓글 목록 페이징 처리
		function replyLoad(pageNum, reset){
        	$.getJSON(
        		"<c:url value='/placeReply/placeReplyList/${placeList.pbNum}/' />" + pageNum,
        		function(data){
        			console.log(data);
        			$('#replyCountSpan').html('댓글 :'+data.total+'개');
                    if(reset === true){
                        strAdd='';
                    }
                    let loginuserName = "${loginuser.memberNick!=null? loginuser.memberNick:''}";
        			for (let i = 0; i < data.list.length; i++) {
                        strAdd += '<div class="row reply-item" style="display:none;">';
                        strAdd += '<div class="reply reply-box">';
                        strAdd += '<span class="reply-writer">'+data.list[i].memberNick+'</span> <small>'+timeStamp(data.list[i].prRegDate)+'</small>'
                        if(data.list[i].memberNick === loginuserName){
	                        strAdd += '&nbsp;&nbsp;&nbsp;&nbsp;<span class="mod-del"><small class="replyModBtn'+data.list[i].prNum+'">수정</small> <small class="replyDelBtn'+data.list[i].prNum+'">삭제</small></span>'
                        	
                        }
                        strAdd += '<br><span class="reply-content">'+data.list[i].prContent+'</span>'
                        strAdd += '</div>';
                        strAdd += '</div>';
                    }
                    $('#replyList').html(strAdd);
                    $('.reply-item').fadeIn(500);
        		}	
        		
        			
        	); // end getJson
        }
       
    	//날짜 처리 함수
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
       
    
     	//댓글 버튼 클릭 시 
		$('#replyBtn').click(function(){
	    	if(boolRegist){
	        	replyRegist();
	        	$('#replyInput').val('');
	    	} else {
	    		placeReplyModify(prClassName);
	    		$('#replyInput').val('');
	    	}
	    });
	    $('#replyInput').keydown(function(e){
	    	if(e.keyCode === 13){
	    		if(boolRegist){
		        	replyRegist();
		        	$('#replyInput').val('');
	        	} else {
	        		placeReplyModify(prClassName);
	        		$('#replyInput').val('');
	        	}
	    	}
	    })
	    
	    //loc_detail.jsp 로드시 댓글 목록
	        $(document).ready(function () {
           
            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
            replyLoad(1,true);
            pageNum=2;

        });
	    
	    $(window).resize(function () {
            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
        });
        $('.test:last-child').scroll(function () {
            /*
                document height -> 모든 row들의 높이 합
                문서 전체의 높이를 의미합니다.
                window height -> div.test의 높이
                화면의 높이를 의미합니다.
                scroll top
                스크롤의 top이 위치하고 있는 높이를 의미합니다
                
            */
            let replyTotalHeight = 0;
            let count=0;
            
            $('.test:last-child >.row').each(function () {
                replyTotalHeight = replyTotalHeight + $(this).height()
                count++;
            });
            if ($('.test:last-child').scrollTop() + $('.test:last-child').height() >= replyTotalHeight) {
                // 로딩이미지 보여주기
                // $('.test:last-child').append(`
                //     <div id="loadingImg" class="row">
                //         <img src="${pageContext.request.contextPath }/resources/img/load.gif" alt="">
                //     </div>
                // `);
                // $('#loadingImg').remove();
                replyLoad(pageNum,false);
                pageNum = pageNum+1;
            }
            console.log(count);

            // console.log($('.test:last-child').scrollTop()+","+$('.test:last-child').height()+","+)
        });
        // $(window).scroll(function(){
        //     if($(window).scrollTop()+$(window).height()+1 >= $(document).height()){
        //         console.log('스크롤 하단 감지');
        //     }
        // });
	    
	  
	    //댓글 등록
	    function replyRegist(){
	    	<!--
			if(${loginuser==null? true:false}){
				alert('로그인이 필요합니다.');
				return;
			}
			-->
			
        	$.ajax({
                type: "POST",
                url: "<c:url value='/placeReply/replyRegist' />",
                headers:{
                    "Content-Type":"application/json"
                },
                data: JSON.stringify({
                    "memberNum":${loginuser.memberNum==null? -1:loginuser.memberNum},
                    "prContent":$('#replyInput').val(),
                    "pbNum":${placeList.pbNum}
                }),
                dataType: "text",
                success: function (data) {
                    console.log('통신성공!' + data);	
            		       		
            		replyLoad(1,true);
            		pageNum=2;
            		alert('댓글 등록 완료!!');
                },
                error: function (request, status, error) {
                    alert('통신에 실패했습니다. 관리자에게 문의하세요');
                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            }); //비동기 처리 끝
        }
	    
	    //댓글 수정 시
	    function placeReplyModify(prClassName){
			if(${loginuser==null? true:false }){
				alert('로그인이 필요합니다.');
				return;
			}
			
        	$.ajax({
                type: "POST",
                url: "<c:url value='/placeReply/placeReplyModify' />",
                headers:{
                    "Content-Type":"application/json"
                },
                data: JSON.stringify({
                    "memberNum":${loginuser.memberNum==null? -1:loginuser.memberNum },
                    "prContent":$('#replyInput').val(),
                    "prNum":prClassName
                }),
                dataType: "text",
                success: function (data) {
                    console.log('통신성공!' + data);	
            		       		
            		replyLoad(1,true);
            		pageNum=2;
            		alert('댓글 수정 완료');
                },
                error: function (request, status, error) {
                    alert('통신에 실패했습니다. 관리자에게 문의하세요');
                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            }); //비동기 처리 끝
        	boolRegist = true;
            prClassName = '';
            replyLoad(1,true);
            pageNum=2;
		}

	    $('#replyList').click(function(e){
    		if(e.target.className.indexOf('replyModBtn') != -1){
    			$('#replyInput').val($(e.target).parent('.mod-del').nextAll('.reply-content').html());
    			boolRegist = false;
    			prClassName = $(e.target).attr('class');
    		}
    		if(e.target.className.indexOf('replyDelBtn') != -1){
    			if(${loginuser==null? true:false}){
    				return;
    			}
    			const arr = {
   					"memberNum": ${loginuser.memberNum==null? -1:loginuser.memberNum },
                   	"prNum": e.target.className	
    			}
    			$.ajax({
                    type: "POST",
                    url: "<c:url value='/placeReply/placeReplyDelete' />",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    dataType: "text", //서버로부터 어떤 형식으로 받을지(생략가능)
                    data: JSON.stringify(arr),
                    success: function (data) {
                        console.log('통신성공!' + data);
                      	if(data==="success"){
                      		alert('삭제 완료했습니다.');
			    			replyLoad(1,true);
			    			pageNum=2;
                      	} 
                    },
                    error: function () {
                        alert('통신에 실패했습니다. 관리자에게 문의하세요');
                    }
                });
    		}
    	});
	
		
		
	    
	    
	</script>
	
	
</body>

</html>