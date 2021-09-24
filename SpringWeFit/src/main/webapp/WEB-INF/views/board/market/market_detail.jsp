<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                    <button type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/marketBoard/market_modify?mbNum=${detail.mbNum }" />'">수정하기</button>
                    <button type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/marketBoard/market_board" />'">목록으로</button>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="titlebox">
                            <h2>${detail.mbTitle }</h2>
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
                    				<c:forEach var="index" begin="1" end="${detail.mbImageCount-1 }">
                    					<li data-target="#carousel-example-generic" data-slide-to="${index }"></li>
                    				</c:forEach>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                            	<c:if test="${detail.mbRealImage1 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage1}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage2 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage2}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage3 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage3}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage4 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage4}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage5 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage5}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage6 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage6}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage7 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage7}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage8 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage8}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage9 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage9}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage10 != null }">
	                                <div class="item">
	                                    <img src="/upload/board/market/${detail.memberNum }/${detail.mbRealImage10}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                               

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
                        <!-- <div class="col-sm-10">주소 : 제주특별자치도 제주시 첨단로 242</div>
                        <div class="col-sm-2">
                            <a href="https://map.kakao.com/link/to/장소명,33.450701,126.570667">
                                <button class="btn btn-info pull-right">길찾기</button>
                            </a>
                        </div> -->
                        <table>
                        	<tr>
                            	<td>가격: ${detail.mbPrice }</td>
                            </tr>
                            <tr>
                                <td>${detail.mbAddrBasic }</td>
                                <td>${detail.mbAddrDetail }</td>
                                <td>
                                    <a href="https://map.kakao.com/link/to/${detail.mbAddrBasic }">
                                        <button class="btn btn-info pull-right">길찾기</button>
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>작성일:${detail.mbRegDate }</td>
                                <td><span class="glyphicon glyphicon-eye-open"></span>100</td>
                                <td>

                                    <button id="lovelyBtn" class="btn btn-info pull-right">
                                    <span class="glyphicon glyphicon-heart"></span> 좋아요</button>

                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p style="line-height: 150%;">

                                        ${detail.mbContent }
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>

                                    <button id="reportBtn" class="btn btn-info pull-right"><span
                                            class="glyphicon glyphicon-thumbs-down"></span> 신고하기</button>

                                </td>
                            </tr>

                        </table>
                    </div>
                </div>

            </div>
            <div class="col-md-4 col-sm-12 test">
                
                <div class="row">
                    <span class="reply reply-count">댓글 : ???개</span>
                </div>
                
                <div class="row">
                    <form id="reply-form">
                        <div class="input-group input-group-lg">

                            <input type="text" id="mrContent" class="form-control" placeholder="댓글을 작성해주세요"
                                aria-describedby="basic-input">
                            <span class="input-group-btn" id="basic-input">
                                <button id="replyBtn" type="button" class="btn btn-default"><span
                                        class="glyphicon glyphicon-send"></span></button>
                            </span>
                        </div>
                    </form>
                </div>
                
               <!--  <div class="row">
                    <div class="reply reply-box">
                        <span class="reply-writer">작성자</span> <small>1시간 전</small><br><br>
                        <span class="reply-content">댓글 내용입니다.</span>
                    </div>
                </div> -->

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
        
        
        function replyCount(){
        	$.ajax({
        		type : "GET",
        		url : "<c:url value='/marketReply/marketReplyCount?mbNum=${detail.mbNum}' />",
        		dataType : "text",
        		success : function(data){
        			console.log('통신성공' + data);
        			$('#replyCountSpan').html('댓글: '+data + '개');
        		},
        		error : function(request, status, error){
        			alert('통신에 실패했습니다. 관리자에게 문의하세요');
        			console.log("code" + request.status+ "\n" + "message:" + request.responseText + "\n" + error);
        		}
        	});
        } //replyCount 끝
        
        function replyLoad(pageNum){
        	$.getJSON(
        			"<c:url value='/marketReply/marketReplyList/${detail.mbNum}' />" + pageNum,
        			function(data){
        				console.log(data);
        				for (let i = 0; i < data.list.length; i++){
        					$('.test:last-child').append(`
        							<div class="row">
        								<div class="reply reply-box">
        									<span class="reply-writer">`+data.list[i].memberNick`</span><small>`+timeStamp(data.list[i].mr.RegDate)+`</small><br><br>
        									<span class="reply-content">`+data.list[i].mrContent+`</span>
        								</div>
        							</div>
        					`);
        				}
        			}
        			); //end getJson
        }
        
        
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
        
        $('#replyBtn').click(function(){
        	replyRegist();
        	$('#replyInput').val('');
        });
        
        $('#replyInput').keyup(function(e){
        	e.preventDefault();
        	if(e.keyCode==13){
        		$('#replyBtn').click();
        	}
        })
        
        
     
        $(document).ready(function () {
            
            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
            replyCount();
            replyLoad(1);

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
                replyAppendTest();
            }
            console.log(count);
            



            // console.log($('.test:last-child').scrollTop()+","+$('.test:last-child').height()+","+)
        });
        // $(window).scroll(function(){
        //     if($(window).scrollTop()+$(window).height()+1 >= $(document).height()){
        //         console.log('스크롤 하단 감지');
        //     }
        // });
        
        $('#lovelyBtn').click(function(){
    		const arr = {
    			"mbNum" : ${detail.mbNum },
    			"memberNum" : ${loginuser.memberNum }
    		};
    		$.ajax({
                type: "POST",
                url: "<c:url value='/marketBoard/marketLikely' />",
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
    			"mbNum" : ${detail.mbNum },
    			"memberNum" : ${loginuser.memberNum }
    		};
    		$.ajax({
                type: "POST",
                url: "<c:url value='/marketBoard/marketReport' />",
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
            }); //신고  비동기 처리 끝
            
            
    	});
        
        function replyRegist(){
        	$.ajax({
                type: "POST",
                url: "<c:url value='/marketReply/regist' />",
                headers:{
                    "Content-Type":"application/json"
                },
                data: JSON.stringify({
                    "memberNum":${loginuser.memberNum},
                    "mrContent":$('#mrContent').val(),
                    "mbNum":${detail.mbNum}
                }),
                dataType: "text",
                success: function (data) {
                    console.log('통신성공!' + data);	
            		$('.test:last-child').html(`
        				<div class="row">
                            <span id="replyCountSpan"class="reply reply-count">댓글 : ???개</span>
                        </div>
                        <div class="row">
                            <form id="reply-form">
                                <div class="input-group input-group-lg">

                                    <input id="mrContent" type="text" class="form-control" placeholder="댓글을 작성해주세요"
                                        aria-describedby="basic-input">
                                    <span class="input-group-btn" id="basic-input">
                                        <button id="replyBtn" type="button" class="btn btn-default"><span
                                                class="glyphicon glyphicon-send"></span></button>
                                    </span>
                                </div>
                            </form>
                        </div>		
            		`);
            		
            		replyCount();
            		replyLoad(1);
            		pageNum=2;
            		alert('댓글 등록 완료!!');
                },
                error: function (request, status, error) {
                    alert('통신에 실패했습니다. 관리자에게 문의하세요');
                    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            }); //비동기 처리 끝
        }



    </script>
</body>

</html>