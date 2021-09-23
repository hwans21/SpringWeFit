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
                
                <div class="row">
                    <span class="reply reply-count">댓글 : ???개</span>
                </div>
                <div class="row">
                    <form id="reply-form">
                        <div class="input-group input-group-lg">

                            <input type="text" class="form-control" placeholder="댓글을 작성해주세요"
                                aria-describedby="basic-input" name="prContent">
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

	<script>
		const msg = '${msg}';
		if(msg === 'updateSuccess') {
			alert('게시글 수정이 정상 처리되었습니다.');
		}
	
	

	$(document).ready(function() {
		
		$('#replyRegist').click(function() {
			
			/*
			댓글을 등록하려면 게시글 번호도 보내 주셔야 합니다.
			댓글 내용, 작성자, 댓글 비밀번호, 게시글 번호를 
			json 표기 방법으로 하나로 모아서 전달해 주시면 됩니다.
			비동기 통신으로 댓글 삽입을 처리해 주시고,
			console.log를 통해 '댓글 등록 완료!'를 확인하시고
			실제 DB에 댓글이 추가되는지도 확인해 주세요.
			*/
			const pbNum = '${article.pbNum}'; //컨트롤러에서 넘어온 게시글번호
			const reply = $('#reply').val(); //댓글 내용
			const replyId = $('#replyId').val(); //작성자
			const replyPw = $('#replyPw').val(); //비밀번호
			
			if(reply === '' || replyId === '' || replyPw === '') {
				alert('이름, 비밀번호, 내용을 입력하세요!');
				return;
			}
			
			$.ajax({
				type: "post",
				url: "<c:url value='/reply/replyRegist' />",
				data: JSON.stringify(
					{
						"pbNum": pbNum,
						"reply": reply,
						"replyId": replyId,
						"replyPw": replyPw
					}		
				),
				dataType: "text", //서버로부터 어떤 형식으로 받을지 (생략 가능)
				headers: {
					"Content-Type" : "application/json"
				},
				success: function(data) {
					console.log('통신 성공! ' + data);
					$('#reply').val('');
					$('#replyId').val('');
					$('#replyPw').val('');
					getList(1, true); //등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
				},
				error: function() {
					alert('등록에 실패했습니다. 관리자에게 문의하세요.');
				}
			}); //댓글 등록 비동기 통신 끝.

		}); //댓글 등록 이벤트 끝
		
		
		
	</script>
	
	
</body>

</html>