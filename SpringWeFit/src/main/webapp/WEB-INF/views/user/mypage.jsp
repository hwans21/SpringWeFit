<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
        
        .subtitle{
            text-align: center;
            background-color: rgba(0, 173, 181, 1);
        }
        table{
            box-shadow: 5px 5px 5px 5px gray;
            border-radius: 15px;
        }
        .table tbody tr th{
            text-align: center;
            border-top: 0px;
        }
        .section{
            height: 900px;
            overflow: auto;
        }
        .sidebar{
            height: 900px;
        }
    </style>
</head>
<body>
    <!-- 마이페이지 - 회원정보 변경에서 비밀번호 변경가능하게끔 -->
    <!-- 
        들어가야할 게시물 친구x 
        평가를 했던 장소게시물 목록
        댓글을 쓴 운동강의 게시물 목록
        본인이 썼던 식단 게시물 목록
        공지사항
        본인이 쓴 자유게시물 목록
        본인이 쓴 질문 검색창 목록
        회원정보 변경 페이지 - 모달창
    -->

    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../include/header.jsp" %>
        </div>
        <div class="row">
            
            <div class="section col-xs-10">
                <div class="row">
                    <div class="col-sm-10">
                        <b>닉네임</b>님 환영합니다 
            
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal-infochange">회원정보변경</button>
            
                    </div>
            
                </div>
                <br>
                
                
                <!--  -->
                <div class="row">
                    <div class="col-sm-6">
                        <div>
                            
                            <table class="table">
                                <th class="title-primary" colspan="2">
                                    공지사항
                                </th>
                                <tr>
                                    <td class="col-sm-9" onclick="location.href='/FRONT/views/board/notice/notice_detail.html'">3번째 공지사항입니다.</td>
                                    <td class="col-sm-3">21.08.31</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">2번째 공지사항입니다.</td>
                                    <td class="col-sm-3">21.08.20</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">1번째 공지사항입니다.</td>
                                    <td class="col-sm-3">21.07.10</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">안녕하세요 반갑습니다.</td>
                                    <td class="col-sm-3">21.06.20</td>
                                </tr>
                            </table>
                        </div>
            
                    </div>
                    <div class="col-sm-6">
                        <div>
                            
                            <table class="table">
                                <th class="title-primary" colspan="3">
                                    다녀갔던 장소
                                </th>
                                <tr onclick="location.href='/FRONT/views/board/location/loc_detail.html'">
                                    <td class="col-sm-1">★4.5</td>
                                    <td class="col-sm-9">3개월 안에 20kg감량!!</td>
                                    <td class="col-sm-2">21.08.31</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-1">★3.0</td>
                                    <td class="col-sm-8">어서오세요 ★휘트니스</td>
                                    <td class="col-sm-3">21.08.20</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-1">★5.0</td>
                                    <td class="col-sm-8">장소2입니다.</td>
                                    <td class="col-sm-3">21.07.10</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-1">★4.5</td>
                                    <td class="col-sm-8">장소1</td>
                                    <td class="col-sm-3">21.06.20</td>
                                </tr>
                    
                            </table>
                        </div>
            
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div>
                            
                            <table class="table">
                                <th class="title-primary">
                                    내가 본 강의
                                </th>
                                <tr>
                                    <td class="col-sm-9" onclick="location.href='/FRONT/views/board/course/course_detail.html'">3개월 안에 20kg감량!!</td>
                                    <td class="col-sm-3">21.08.31</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">어서오세요 ★휘트니스</td>
                                    <td class="col-sm-3">21.08.20</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소2입니다.</td>
                                    <td class="col-sm-3">21.07.10</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소1</td>
                                    <td class="col-sm-3">21.06.20</td>
                                </tr>
                            </table>
                        </div>
            
                    </div>
                    <div class="col-sm-6">
                        <div>
                          
                            <table class="table">
                                <th class="title-primary">
                                    내가 먹었던 식단
                                </th>
                                <tr>
                                    <td class="col-sm-9" onclick="location.href='/FRONT/views/board/diet/diet_detail.html'">3개월 안에 20kg감량!!</td>
                                    <td class="col-sm-3">21.08.31</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">어서오세요 ★휘트니스</td>
                                    <td class="col-sm-3">21.08.20</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소2입니다.</td>
                                    <td class="col-sm-3">21.07.10</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소1</td>
                                    <td class="col-sm-3">21.06.20</td>
                                </tr>
                    
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
            
                        <div>
                            
                            <table class="table">
                                <th class="title-primary">
                                    자유 게시판
                                </th>
                                <tr>
                                    <td class="col-sm-9" onclick="location.href='/FRONT/views/board/free/free_detail.html'">길가다가 고양이 봄</td>
                                    <td class="col-sm-3">21.08.31</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">여러분도 할 수 있다!</td>
                                    <td class="col-sm-3">21.08.20</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소2입니다.</td>
                                    <td class="col-sm-3">21.07.10</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소1</td>
                                    <td class="col-sm-3">21.06.20</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div>
                            
                            <table class="table">
                                <th class="title-primary">
                                    내가 한 질문들
                                </th>
                                <tr>
                                    <td class="col-sm-9" onclick="location.href='/FRONT/views/board/qna/qna_detail.html'">3개월 안에 20kg감량!???</td>
                                    <td class="col-sm-3">21.08.31</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">왜 살이 안빠질까요?</td>
                                    <td class="col-sm-3">21.08.20</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">사이트 이용방법이....</td>
                                    <td class="col-sm-3">21.07.10</td>
                                </tr>
                                <tr>
                                    <td class="col-sm-9">장소1</td>
                                    <td class="col-sm-3">21.06.20</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="sidebar col-xs-2"></div>
            
        </div>
        <div class="row">
            <%@ include file="../include/footer.jsp" %>
        </div>
    </div>
    
    


    
    
    
   
    <!-- Modal 회원정보변경 모달창 -->
    <div id="modal-infochange" class="modal fade">
        <div class="modal-dialog">

            <!-- Modal Content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">회원정보변경</h4>
                </div>
                <div class="modal-body">
                    <form action="" method="post" id="form-join" class="form-horizontal">
                        <!-- <table>
                            <tr>
                                <td>이메일</td>
                                <td>
                                    <input type="text" name="" id="" size="15"> @
                                    <input type="text" name="" id="" size="15">
                                    <select name="" id="">
                                        <option value="naver.com" selected>naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="google.com">google.com</option>
                                        <option value="">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>닉네임</td>
                                <td>
                                    <input type="text" name="" id="" size="15">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td>
                                    <input type="password" name="" id="">
                                </td>
                            </tr>
                            <tr>
                                <td>비밀번호확인</td>
                                <td>
                                    <input type="password" name="" id="">
                                </td>
                            </tr>
                            <tr>
                                <td>핸드폰(-제외)</td>
                                <td>
                                    <input type="text" name="" id="">
                                </td>
                            </tr>
                        </table> -->
                        <div class="form-group">
                            <label for="input-email" class="col-sm-3 control-label">이메일</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="input-email" readonly value="test@test.com">
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <label for="input-nick" class="col-sm-3 control-label">닉네임</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="input-nick" placeholder="닉네임을 입력해주세요">
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <label for="input-password" class="col-sm-3 control-label">비밀번호</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="input-password" placeholder="비밀번호를 입력해주세요">
                            </div>
                            
                        </div>
                        <div class="form-group">
                            <label for="input-passwordchk" class="col-sm-3 control-label">비밀번호확인</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="input-passwordchk" placeholder="비밀번호를 확인해주세요">
                            </div>
                            
                        </div>

                        <div class="form-group">
                            <label for="input-phone" class="col-sm-3 control-label">핸드폰 번호</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="input-passwordchk" placeholder="'-'빼고 입력해주세요">
                            </div>
                            
                        </div>

                        
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn-infochange">정보변경</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="btn-infochange">탈퇴하기</button>
                </div>


            </div>
        </div>
    </div>
   

    
    <script>
        $('#btn-infochange').click(function(){
            if(confirm('회원정보를 정말로 수정하시겠습니까?') === true){
                alert('회원정보를 수정했습니다.')
            }

        });
        
    </script>
</body>
</html>