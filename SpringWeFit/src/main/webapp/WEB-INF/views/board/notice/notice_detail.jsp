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


                    <button class="btn btn-primary pull-right" type="button" onclick="location.href='<c:url value="/noticeBoard/noticeModify?nbNum=${noticeList.nbNum}" />'">수정하기</button>
                    <button class="btn btn-primary pull-right" type="button" onclick="location.href='<c:url value="/noticeBoard/noticeDelete?nbNum=${noticeList.nbNum}" />'">삭제하기</button>
                    <button class="btn btn-primary pull-right" type="button" onclick="location.href='<c:url value="/noticeBoard/noticeList" />'">목록으로</button>


                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="titlebox">

                            <h2>${noticeList.nbTitle}</h2>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="container-fluid">
                        

                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="container-fluid">    
                        <table>

                            <tr>


                                <td>작성일 : ${noticeList.nbRegDate}</td>
                                <td><span class="glyphicon glyphicon-eye-open"></span>${noticeList.nbLookCount}</td>

                                <td>

                                    <button class="btn btn-info pull-right"><span
                                            class="glyphicon glyphicon-heart"></span> 좋아요</button>


                                </td>

                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p style="line-height: 150%;">

                                        ${noticeList.nbContent}

                                    </p>
                                    
                                  
                                </td>
                            </tr>
                            
                    <div class="row">
                    	<div class="container-fluid">
                    	<img src="${pageContext.request.contextPath }/resource/img/${noticeList.nbImage1}" alt="" class="">
                    	</div>
                    </div>
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

            <div class="col-md-4 col-sm-12 test">
                
                <div class="row">
                    <span class="reply reply-count">댓글 : ???개</span>
                </div>
                <div class="row">
                    <form id="reply-form">
                        <div class="input-group input-group-lg">

                            <input type="text" class="form-control" placeholder="댓글을 작성해주세요"
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


            
            <!-- 댓글 --
            // 댓글 조회
List<ReplyVO> reply = null;
reply = replyService.list(bno);
model.addAttribute("reply", reply);-->

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


    </script>
</body>

</html>