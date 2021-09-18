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
            margin-top: 90px;
            margin-bottom: 80px;
            padding-bottom: 20px;
            font-size: 40px;
            font-weight: bold;
            color: rgb(0, 173, 181);
        }



        table tr:first-child {
            border-top: 1px solid rgb(180, 180, 180);
        }

        table tr td {
            padding: 15px;
            border-bottom: 1px solid #ccc;
        }

        .titlefoot {
            float: right;
            margin: 20px;
        }
    </style>
</head>

<body>

    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-5">
                    <div class="titlebox">
                        <h2>강의영상 수정</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="#" id="boardWrite" method="POST" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>종목</td>
                        <td>
                            <select id="sports" name="sports">
                                <option value="">종목선택</option>
                                <option value="">수영</option>
                                <option value="">자전거</option>
                                <option value="">달리기</option>
                                <option value="">등산</option>
                                <option value="">홈트</option>
                                <option value="">필라테스/요가</option>
                                <option value="">골프</option>
                                <option value="">스케이트(빙상)</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td><input type=text name=name size=20> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text name=title size="60"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea name="content" cols="75" rows="15"></textarea></td>
                    </tr>


                    <tr>
                        <td>youtube주소 </td>
                        <td><input type=text name=title size="60"></td>
                    </tr>
                    
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button type="button" class="btn btn-primary" onclick="location.href='#'">수정하기</button>
                            <button type="button" class="btn btn-warning" onclick="location.href='#'">삭제하기</button>
                            <button type="button" class="btn btn-default" onclick="location.href='/FRONT/views/board/course/course_detail.html'">취소하기</button>
                            <br><br><br>
                        </td>
                        
                    </tr>
                </table>

            </form>
        </div>

    </div>


    <div class="row">
        <%@ include file="../../include/footer.jsp" %>
    </div>

  </div>

    
</body>

</html>