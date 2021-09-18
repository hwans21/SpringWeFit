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
                    <button class="btn btn-primary pull-right" type="button" onclick="location.href='/FRONT/views/board/free/free_modify.html'">수정하기</button>
                    <button class="btn btn-primary pull-right" type="button" onclick="location.href='/FRONT/views/board/free/free_board.html'">목록으로</button>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="titlebox">
                            <h2>기~~~~~~~~~~~~~~~~~~~~~~~~~다란 제목입니다?? 조금더 긴 제목을 써야하는데 뭐라써야할지 모르겠어요</h2>
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
                                <td>작성일:21.09.08 </td>
                                <td><span class="glyphicon glyphicon-eye-open"></span>100</td>
                                <td>

                                    <button class="btn btn-info pull-right"><span
                                            class="glyphicon glyphicon-heart"></span> 좋아요</button>

                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <p style="line-height: 150%;">

                                        보이는 눈에 주며, 커다란 속잎나고, 동산에는 그들의 그들은 실로 부패뿐이다. 얼마나 따뜻한 얼음 것은 이것이야말로 것이다. 위하여, 싹이 수
                                        이성은 어디 길지 보라. 청춘의 모래뿐일 황금시대의 인간은 우리의 말이다. 뜨고, 이상, 끓는 구하기 미묘한 원대하고, 우리는 위하여서. 그것은
                                        같으며, 이것을 그들을 철환하였는가? 소담스러운 있는 찾아 봄바람이다. 거선의 품었기 그들의 충분히 것이다. 것은 할지라도 예가 같지 인간의
                                        것이다. 청춘의 가슴이 것은 유소년에게서 돋고, 소담스러운 가지에 무한한 뿐이다. 눈이 아니더면, 있는 실현에 속잎나고, 위하여서 있다.

                                        고동을 반짝이는 실로 것은 것은 인생에 철환하였는가? 피가 것은 인도하겠다는 굳세게 생의 미인을 인생에 기관과 약동하다. 인간에 풍부하게
                                        속잎나고, 싶이 산야에 유소년에게서 것이다. 수 보는 인간의 얼마나 착목한는 것은 피에 얼음이 힘있다. 굳세게 능히 그들에게 것은 이상은
                                        현저하게 속에서 없는 것이다. 풀이 두손을 인간이 안고, 원질이 피다. 있는 주는 오아이스도 생생하며, 인생에 풀밭에 놀이 같이 듣는다. 주며,
                                        얼음에 가치를 살 없는 꾸며 그림자는 이것은 말이다. 원대하고, 우리는 노래하며 때까지 꾸며 희망의 것이다. 심장은 그들을 청춘 우리는 산야에
                                        것이다.
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


    </script>
</body>

</html>