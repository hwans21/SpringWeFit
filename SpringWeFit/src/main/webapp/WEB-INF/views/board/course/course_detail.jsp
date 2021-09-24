<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    
    <style>
        .titlebox h2 {
            border-bottom: 1px solid rgb(0, 173, 181);
            margin: 20px 0px;
            padding-bottom: 20px;
            font-size: 30px;
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
            overflow: hidden;
        }
        
        .m {
           margin-right: 20px;
        }
        
        .l {
           margin-right: 5px;
        }
        
        
        .mod-del {
        	float: right;
        	margin-right: 10px;
        }
        
        .mod-del > small {
        	cursor: pointer;
        	font-size: 13px;
        }
        
        .reply-box > small {
        	font-size: 13px;
        }
        
        .reply-content {
        	font-size: 15px;
        	font-weight: normal;
        }
        
        
        .modify-input {
        	overflow: hidden;
        	display: none;
        	
        }
        
        .lnr {
        	float: right; 
        	font-size: 25px;
        }
        
        .lnr-cross-circle {
        	color: red;
        	cursor: pointer;     	
        }
        
        .lnr-checkmark-circle {
        	color: green;
        	cursor: pointer;
        	margin-right: 3px;
        }
        
        #update:hover {
        	text-decoration: underline;
        }
        
        
        #reason-input {
        	margin-left: 60px;
        	/*display: none;*/
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
                    <button class="btn btn-primary pull-right m" onclick="location.href='<c:url value="/courseBoard/modify?cbNum=${article.cbNum}&pageNum=${param.pageNum}&category=${param.category}&condition=${param.condition}&keyword=${param.keyword}" />'">수정하기</button>
                    <button class="btn btn-primary pull-right l" onclick="location.href='<c:url value="/courseBoard/?pageNum=${param.pageNum}&category=${param.category}&condition=${param.condition}&keyword=${param.keyword}" />'">목록으로</button>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="titlebox">
                            <h2>${article.cbTitle}</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container-fluid">
                        <div class="col-sm-12 video-wrap">
                            <iframe width="100%" height="auto" src="${article.cbYouCode}"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen></iframe>

                        </div>

                    </div>
                </div>
                <br>

                <div class="row">
                    <div class="container-fluid">
                    
                        
                        <table style="width: 100%">
                           

                            <tr>
                                <td><p>작성일: <fmt:formatDate value="${article.cbRegDate}" pattern="yy.MM.dd" /></p></td>
                                <td><span class="glyphicon glyphicon-eye-open"></span>&nbsp;${article.cbLookCount}</td>
                                <td>						
                                    <button id="likeBtn" class="btn btn-info pull-right">
                                    	<span class="glyphicon glyphicon-heart"></span> <span id="countLike">좋아요</span></button>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p style="line-height: 150%;">
                                       ${article.cbContent}
                              <!--
                                                       보이는 눈에 주며, 커다란 속잎나고, 동산에는 그들의 그들은 실로 부패뿐이다. 얼마나 따뜻한 얼음 것은 이것이야말로 것이다. 위하여, 싹이 수
                                                       이성은 어디 길지 보라. 청춘의 모래뿐일 황금시대의 인간은 우리의 말이다. 뜨고, 이상, 끓는 구하기 미묘한 원대하고, 우리는 위하여서. 그것은
                                                       같으며, 이것을 그들을 철환하였는가? 소담스러운 있는 찾아 봄바람이다. 거선의 품었기 그들의 충분히 것이다. 것은 할지라도 예가 같지 인간의
                                                       것이다. 청춘의 가슴이 것은 유소년에게서 돋고, 소담스러운 가지에 무한한 뿐이다. 눈이 아니더면, 있는 실현에 속잎나고, 위하여서 있다.
               
                                                       고동을 반짝이는 실로 것은 것은 인생에 철환하였는가? 피가 것은 인도하겠다는 굳세게 생의 미인을 인생에 기관과 약동하다. 인간에 풍부하게
                                                       속잎나고, 싶이 산야에 유소년에게서 것이다. 수 보는 인간의 얼마나 착목한는 것은 피에 얼음이 힘있다. 굳세게 능히 그들에게 것은 이상은
                                                       현저하게 속에서 없는 것이다. 풀이 두손을 인간이 안고, 원질이 피다. 있는 주는 오아이스도 생생하며, 인생에 풀밭에 놀이 같이 듣는다. 주며,
                                                       얼음에 가치를 살 없는 꾸며 그림자는 이것은 말이다. 원대하고, 우리는 노래하며 때까지 꾸며 희망의 것이다. 심장은 그들을 청춘 우리는 산야에
                                                       것이다.  
                                   -->
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td>

                                    <button class="btn btn-info pull-right" data-toggle="modal" data-target="#modal-report"><span
                                            class="glyphicon glyphicon-thumbs-down"></span> 신고하기</button>

                                </td>
                            </tr>
						
                        </table>
                       
                    </div>
                </div>

            </div>
            <div class="col-md-4 col-sm-12 test">
                
                <div class="row">
                    <span id="reply-count" class="reply reply-count"></span>
                </div>
                <div class="row">
                    <form id="reply-form">
                        <div class="input-group input-group-lg">

                            <input type="text" id="crContent" class="form-control" placeholder="댓글을 작성해주세요" aria-describedby="basic-input">
                            <span class="input-group-btn" id="basic-input">
                                <button id="reply-btn" type="button" class="btn btn-default">
	                                <span class="glyphicon glyphicon-send"></span>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
                <div id="reply-list" class="row">
<!--                     <div class="reply reply-box">
                        <span class="reply-writer">작성자</span> <small>1시간 전</small> <span class="mod-del"><small><a href="#">수정</a></small>&nbsp;&nbsp;<small><a href="#">삭제</a></small> </span><br><br>
                        <span class="reply-content">댓글 내용입니다.</span>
                    </div> -->
                </div> 

            </div>
        </div>
        
        
        
        
        <!-- 신고 모달창  -->
        <div id="modal-report" class="modal fade">

	        <div class="modal-dialog">
	
	            <!-- Modal Content-->
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                            aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title" id="myModalLabel">게시글 신고</h4>
	                </div>
                
			        <div class="modal-body">
	                    <form id="form-report" action="<c:url value='#' />" method="post" role="form" class="form-horizontal">
	                        
	                        <!-- <div class="form-group">
	                            <label for="reason-checkbox" class="col-sm-3 control-label">비밀번호</label>
	                            <div class="col-sm-9">
	                                <input type="password" class="form-control" id="join-passwd" name="cbReportCheckbox"
	                                   placeholder="비밀번호를 입력해주세요">
	                            </div>
	                        </div>
	                        
	                        <div class="form-group">
	                            <label for="passwordchk" class="col-sm-3 control-label">비밀번호확인</label>
	                            <div class="col-sm-9">
	                                <input type="password" class="form-control" id="passwordchk"
	                                    placeholder="비밀번호를 확인해주세요">
	                            </div>
	                        </div> -->
	                        <div class="form-check">
  								<input class="form-check-input col-sm-1" type="checkbox" value="" id="reason-checkbox1" name="cbReportChk1">
  								<label class="form-check-label col-sm-11" for="flexCheckDefault">타인에 대한 욕설 또는 비방</label>
							</div>
							
							<div class="form-check">
  								<input class="form-check-input col-sm-1" type="checkbox" value="" id="reason-checkbox2" name="cbReportChk2">
  								<label class="form-check-label col-sm-11" for="flexCheckDefault">음란성 내용 및 음란물 링크</label>
							</div>
							
							<div class="form-check">
  								<input class="form-check-input col-sm-1" type="checkbox" value="" id="reason-checkbox3" name="cbReportChk3">
  								<label class="form-check-label col-sm-11" for="flexCheckDefault">같은 내용의 반복(도배)</label>
							</div>
							
							<div class="form-check">
  								<input class="form-check-input col-sm-1" type="checkbox" value="" id="reason-checkbox4" name="cbReportChk4">
  								<label class="form-check-label col-sm-11" for="flexCheckDefault">상업적 광고, 사이트 홍보</label>
							</div>
							
							<div class="form-check">
  								<input class="form-check-input col-sm-1" type="checkbox" value="" id="reason-checkbox5" name="cbReportChk5">
  								<label class="form-check-label col-sm-11" for="flexCheckDefault">폭력 또는 사행심 조장</label>
							</div>

							<div class="form-check">
  								<input class="form-check-input col-sm-1" type="checkbox" value="" id="reason-checkbox6" name="cbReportChk6">
  								<label class="form-check-label col-sm-11" for="flexCheckDefault">기타</label>
							</div>
															
	                        <div class="form-group">
	                            <div class="col-sm-9">
	                                <input type="text" class="form-control" id="reason-input" name="cbReportInput"
	                                    placeholder="신고사유를 입력해주세요">
	                            </div>
	                        </div>
	 					
	 					</form>
	                </div>
	
	                <div class="modal-footer">
	                    <button id="reportBtn" type="button" class="btn btn-primary">신고하기</button>
	                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                </div>
         
               </div>
           </div>
        </div>
    <!-- 신고 모달창 끝 -->



        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>


    </div>

    <script defer>
    
/*       const msg = '${msg}';
      if(msg === 'modifySuccess') {
         alert('수정이 완료되었습니다.');
      } */
      
      
   
        function sleep(ms) {
            const wakeUpTime = Date.now() + ms;
            while (Date.now() < wakeUpTime) { }
        }
/*         function replyAppendTest() {
            for (let i = 0; i <= 10; i++) {
                $('.test:last-child').append(`
                	<div id="reply-list" class="row">
                        <div class="reply reply-box">
                            <span class="reply-writer">작성자</span> <small>1시간 전</small><br><br>
                            <span class="reply-content">댓글 내용입니다.</span>
                        </div>
                    </div>
                `);
            }
        } */
        
        
        $(document).ready(function () {
            
            $('.test:last-child .input-group').css("width", $('.test:last-child').width() * 0.9);
            //replyAppendTest(); //여기 주석처리함.

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
                //replyAppendTest(); //여기 주석처리함.
            }
            console.log(count);
       
            // console.log($('.test:last-child').scrollTop()+","+$('.test:last-child').height()+","+)
        });
        // $(window).scroll(function(){
        //     if($(window).scrollTop()+$(window).height()+1 >= $(document).height()){
        //         console.log('스크롤 하단 감지');
        //     }
        // });

        
        
            

        
        $(function() { //start jQuery
        	
        	/* if($("reason-checkbox6").is(":checked")){
        		$('#reason-input')
        	} */
        
        	/* $("#reason-checkbox6").on('click', function() { 
        		if ($(this).prop('checked')) { 
        			$('#reason-input').attr('hidden', hidden);
        		} else { 
        			$('#reason-input').attr('hidden', hidden);
        		}  		
        	}); */

        	
        	//댓글 등록
            $('#reply-btn').click(function() {
            	
            	const cbNum = '${article.cbNum}'; //글 번호
                //const memberNum = 365; // 회원번호는 작성안했는데 로그인 세션으로 가져와야 할듯.
                const crContent = $('#crContent').val(); //댓글 내용

            
  	            if(crContent.trim() === '') {
	            	alert('댓글 내용을 입력해주세요.')
	            	return;
	            }
            
	            $.ajax({
	            	type: "post",
	            	url: "<c:url value='/courseReply/regist' />",
	            	data: JSON.stringify({
	            		"cbNum" : cbNum,
	            		"crContent" : crContent
	            	}),
	            	headers: {
	            		"Content-Type" : "application/json"
	            	},
	            	success: function(data) {
	            		$('#crContent').val('');
	            		getList(true);
	            	},
	            	error: function() {
	            		alert('등록에 실패하였습니다. 관리자에게 문의하세요.');
	            	}
	            }); // end ajax
            }); //댓글 등록 이벤트 끝
            
            
            
            //목록 요청
            let strAdd = "";
            getList(true);
            countLike();
            
            
            //목록 출력하는 getList 함수
            
            function getList(reset) {
            	
            	const cbNum = "${article.cbNum}";
            	const pageNum = 1;
            	
            	$.getJSON(
            			
            		"/wefit/courseReply/" + cbNum + "/" + pageNum,
            			
            		function(data) {
            			
            			let total = data.total;
            			let replyList = data.list;
            			
            			//console.log(data);
            			
            			if(reset === true) {
            				strAdd = '';
            			}
            			
            			
            			//댓글 개수 출력
            			$('#reply-count').html('<p>댓글 : ' + total +'개</p>');
            			
            			//댓글 내용 출력
            			for(let i=0; i<replyList.length; i++) {
            				
            				strAdd += '<div class="reply reply-box">';
            				strAdd += '<span class="reply-writer">' + replyList[i].memberNick + '</span>&nbsp;&nbsp;';
            				strAdd += '<small>'+ timeStamp(replyList[i].crRegDate) +'</small>';
            				strAdd += '<span class="mod-del">';
            				strAdd += '<small class="mod"><span id="update" class=' + replyList[i].crNum + '>수정</span></small>&nbsp;&nbsp;<small class="delete-btn"><a class="del" href="'+ replyList[i].crNum + '">삭제</a></small> </span><br><br>';
            				
            				strAdd += '<div class="reply-content-plus-modify"><div class="modify-input"><input class="reply-modify-input" value="'+ replyList[i].crContent + '"><div class="lnr"><span class="lnr lnr-cross-circle"></span><span id="'+ replyList[i].crNum +'" class="lnr lnr-checkmark-circle"></span></div></div>';
            				
            				strAdd += '</div><span class="reply-content">'+ replyList[i].crContent +'</span>';
            				
            				strAdd += '</div>';
            			
            				console.log(replyList[i].crRegDate); //진짜 밀리초를 출력하네...
            			}
            			
            			$('#reply-list').html(strAdd);
            				
            				
            		} // end function(data)
            		
            	);//end getJSON
            	
            }; // end function getList()
            
            
            
            // 좋아요 개수 출력
            function countLike() {
            	
				const cbNum = "${article.cbNum}";
            	
            	$.getJSON(
            			
            		"/wefit/courseBoard/" + cbNum,
            			
            		function(data) {           			
            			let count = data.count;
           			
            			//좋아요 개수 출력
            			$('#countLike').html(count);
            		
            		
            		} // end function(data)         			
            	
            	)//end getJSON
            
            } //countLike 함수 끝
            
            
            
            
         // 댓글 삭제 처리
            $('#reply-list').on('click', 'a', function(e) {
            	
            	// a 태그의 기능 중지
            	e.preventDefault();
            	
            	 
            	const crNum = $(this).attr('href');
            	console.log(crNum); //댓글 번호를 뜯어옴.
            	
            	$.ajax({
            		type : "post",
            		url : "<c:url value='/courseReply/delete' />",
            		data : crNum,
            		headers : {
            			"Content-Type" : "application/json"	
            		},
            		success: function(data) {
            			if(data === 'deleteSuccess') {
            				alert('댓글이 삭제되었습니다.');
            				getList(true);
            			} else {
            				alert('삭제에 실패하였습니다.');
            			}
            		},
            		error : function() {
            			alert('삭제에 실패하였습니다. 관리자에게 문의하세요.');
            		}
            		
            	}); //end ajax
            
            }); //삭제 처리 끝
            
            
            
            // 댓글 수정 버튼 누르면 수정창 뜨게 하기.
            $('#reply-list').on('click', '.mod > span', function() {
            	
            	const modify_input = $(this).parents('.reply-box').children('.reply-content-plus-modify').children(".modify-input");
            	modify_input.css('display', 'block');
  	
            	const reply_content = $(this).parents('.reply-box').children('.reply-content');
            	reply_content.css('display', 'none');
        
            	
            	// 수정창에서 x버튼 누르면 수정창 사라지게 하기.
            	$('.lnr-cross-circle').click(function() {
            		
            		modify_input.css('display', 'none'); 
            		getList(true); //이걸 작성안하면 댓글 수정할때 수정하다가 x 누른 후 다시 수정버튼누르면...원래내용을 출력을 못함...(수정하다가 만 내용을 출력함)

            		reply_content.css('display', 'block');           	
            	}); // 수정창에서 x버튼 누르면 수정창 사라지게 하는 처리 끝 
                      
            }); //수정창 뜨게하는 처리 끝
            

            
            
         // 댓글 수정 처리
        	$('#reply-list').on('click', '.lnr-checkmark-circle', function() {
        		
        		const crNum = $(this).attr('id');
        		const crContent = $(this).parents('.reply-box').children('.reply-content-plus-modify').children(".modify-input").children('.reply-modify-input').val();
        		
        		$.ajax({
            		type : "post",
            		url : "<c:url value='/courseReply/modify' />",
            		data : JSON.stringify({
            			"crNum" : crNum,
            			"crContent" : crContent
            		}),
            		headers : {
            			"Content-Type" : "application/json"	
            		},
            		success: function(data) {
            			if(data === 'modifySuccess') {
            				alert('댓글이 수정되었습니다.');
            				getList(true);
            			} else {
            				alert('수정에 실패하였습니다.');
            			}
            		},
            		error : function() {
            			alert('수정에 실패하였습니다. 관리자에게 문의하세요.');
            		}
            		
            	}); //end ajax
        		
        	}); //수정 처리 끝
            
      
            
            // 날짜 처리 함수
            
            function timeStamp(millis) { //millis가 등록일 밀리초를 뜻하는데 얘가(등록일이) 어떻게 밀리초로 들어오는거지..?
            	
            	let date = new Date(); 
            	//console.log(date);
            	let gap = date.getTime() - millis;            	
            	//console.log(gap);
            	
            	let time;
            	
            	if(gap < 60 * 60 * 24 * 1000) { // 하루 미만
            		if(gap < 60 * 60 * 1000) { // 1시간 미만
            			time = '방금 전';
            		} else { // 1시간 이상일 경우
            			time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
            		}
            	} else {  // 1일 이상인 경우
            		const today = new Date(millis);
            		const year = today.getFullYear();
            		const month = today.getMonth() + 1;
            		const day = today.getDate();
            		const hour = today.getHours();
            		const minute = today.getMinutes();
            		
            		time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 ' + minute + '분';
            	};
            	
            	return time;
            } // 날짜 처리 함수 끝
            
            
            
            
            // 좋아요 처리
            $('#likeBtn').click(function() {
            	
            	const cbNum = "${article.cbNum}";
            	const memberNum = 365; //이거 나중에 로그인 구현한 후 고치기
            	
            	$.ajax({
                    type: "POST",
                    url: "<c:url value='/courseBoard/like' />",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    dataType: "text", //서버로부터 어떤 형식으로 받을지(생략가능)
                    data: JSON.stringify({
            			"cbNum" : cbNum,
            			"memberNum" : memberNum
            		}),
                    success: function (data) {
                      	if(data === "likeSuccess"){    		
                      		//alert('좋아요');
                      		countLike();
                      	} else {  		
                      		//alert('좋아요 취소');
                      		countLike();
                      	}
                    },
                    error: function() {
                        alert('통신에 실패했습니다. 관리자에게 문의하세요');
                    }
                }); // end ajax
            	
            	
            }); // 좋아요 처리 끝
            
            
            
            
            
            // 신고 처리
            $('#reportBtn').click(function() {
            	const arr = {
            			"cbNum" : ${article.cbNum},
            			"memberNum" : 363 //이거 나중에 로그인 구현한 후 고치기
            		};
            	
            		$.ajax({
                        type: "POST",
                        url: "<c:url value='/courseBoard/report' />",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        dataType: "text", //서버로부터 어떤 형식으로 받을지(생략가능)
                        data: JSON.stringify(arr),
                        success: function (data) {
                            console.log('통신성공!' + data);
                          	if(data === "reportSuccess"){    		
                          		alert('신고가 접수되었습니다.');  	    
                          		$('#modal-report').modal('hide'); //모달창 닫기
                          	} else {  		
                          		alert('이미 신고하신 게시글입니다.');                         		
                          		$('#modal-report').modal('hide'); //모달창 닫기
                          	}
                        },
                        error: function() {
                            alert('통신에 실패했습니다. 관리자에게 문의하세요');
                        }
                    }); // end ajax   	
            	
            }); //신고 처리 끝
            
            
        	
        }); // end jQuery
        
        

    </script>
</body>

</html>