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
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage1}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage2 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage2}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage3 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage3}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage4 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage4}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage5 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage5}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage6 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage6}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage7 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage7}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage8 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage8}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage9 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage9}" width="100%" alt="...">
	
	                                </div>
                                </c:if>
                            	<c:if test="${detail.mbRealImage10 != null }">
	                                <div class="item active">
	                                    <img src="/upload/board/market/${detail.memberNick }/${detail.mbRealImage10}" width="100%" alt="...">
	
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
                                    <a href="https://map.kakao.com/link/to/장소명,33.450701,126.570667">
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
                                <button id="reply-btn" type="button" class="btn btn-default"><span
                                        class="glyphicon glyphicon-send"></span></button>
                            </span>
                        </div>
                    </form>
                </div>
                
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

    <script defer>
        function sleep(ms) {
            const wakeUpTime = Date.now() + ms;
            while (Date.now() < wakeUpTime) { }
        }
        function replyAppendTest() {
            for (let i = 0; i <= 10; i++) {
                $('.test:last-child').append(`
                    <div class="row">
                        <div class="reply reply-box">
                            <span class="reply-writer">작성자</span> <small>1시간 전</small><br><br>
                            <span class="reply-content">댓글 내용입니다.</span>
                        </div>
                    </div>
                `);
            }
        }
        $(document).ready(function () {
            
            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
            replyAppendTest();

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
        
        $(document).ready(function() {
			
        	$('#reply-btn').click(function(){
        		
        		const mbNum = '${detail.mbNum}';
        		const mrContent = $('#mrContent').val();
        		const memberNum = '${loginuser.memberNum}';
        		
        		const replyInfo = {
        				"mrContent" : mrContent,
        				"mbNum" : mbNum,
        				"memberNum" : memberNum
        		};
        		
        		$.ajax({
        			type : "POST",
        			url : "<c:url value='/marketReply/regist' />",
        			headers : {
        				"Content-Type" : "application/json"
        			},
        			dataType : "text",
        			data : JSON.stringify(replyInfo),
        			success : function(result){
        				console.log("댓글등록 완료" + result)
        				if(result === 'regSuccess'){
        					alert('댓글등록 완료')
        					$('#mrContent').val('');
        					getList(1, true);
        				}else{
        					alert('댓글 등록 실패')
        				}
        			},
        			error : function(){
        				console.log('통신실패')
        			}
        		});
        		
        		
        	});
        	
		});



    </script>
</body>

</html>