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
                        <h2>강의영상 등록</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action='<c:url value="/courseBoard/regist" />' id="registForm" method="POST">
         <%-- <form action='<c:url value="/courseBoard/regist" />' id="registForm" method="POST" enctype="multipart/form-data"> --%>
                <table>
                    <tr>
                        <td>종목</td>
                        <td>
                            <select id="sports" name="cbCategory">
                                <option value="category">종목선택</option>
                                <option ${param.category == 'swimming' ? 'selected' : '' }>수영</option>
                                <option ${param.category == 'badminton' ? 'selected' : '' }>배드민턴</option>
                                <option ${param.category == 'squash' ? 'selected' : '' }>스쿼시</option>
                                <option ${param.category == 'bicycle' ? 'selected' : '' }>자전거</option>
                                <option ${param.category == 'running' ? 'selected' : '' }>달리기</option>
                                <option ${param.category == 'hiking' ? 'selected' : '' }>등산</option>
                                <option ${param.category == 'training' ? 'selected' : '' }>홈트짐트</option>
                                <option ${param.category == 'pilates' ? 'selected' : '' }>필라테스</option>
                                <option ${param.category == 'golf' ? 'selected' : '' }>골프</option>
                                <option ${param.category == 'skate' ? 'selected' : '' }>스케이트</option>
                                <option ${param.category == 'etc' ? 'selected' : '' }>기타</option>
                        <!--  
                        <option value="category">종목선택</option>                               
                                <option value="swimming">수영</option>
                                <option value="badminton">배드민턴</option>
                                <option value="squash">스쿼시</option>
                                <option value="bicycle">자전거</option>
                                <option value="running">달리기</option>
                                <option value="hiking">등산</option>
                                <option value="training">홈트짐트</option>
                                <option value="pilates">필라테스</option>
                                <option value="golf">골프</option>
                                <option value="skate">스케이트</option>
                                <option value="etc">기타</option> -->
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td><input type="text" size="20" value="관리자" readonly></td>
                        <!-- <td><input type="hidden" name="memberNum" size="20" value="1"></td> --> <!-- 관리자번호 넣어줌 -->
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type="text" id="cbTitle" name="cbTitle" size="60"></td>
                    </tr>

                    <tr>
                        <td>내용<sup> (<span id="nowByte">최대 </span>2000bytes)</sup></td>
                        <td>
                        <textarea id="cbContent" name="cbContent" cols="75" rows="15"></textarea></td>
                    </tr>


                    <tr>
                        <td>youtube 주소</td>
                        <td><input type="text" id="cbYouCode" name="cbYouCode" size="60"></td>
                    </tr>
                    
                   
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button type="button" id="registBtn" class="btn btn-primary">등록하기</button>
                            <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/courseBoard/" />'">취소하기</button>
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
    


 	
 	<script>
	   
      $(function() { // start jQuery
    	 
         
         $('#registBtn').click(function() {
            if($('#sports').val() === 'category') {
               alert('종목을 선택해주세요.');
               return;            
            } else if($('#cbTitle').val().trim() === '') {
               alert('제목을 입력해주세요.');   
               return;
            } /* else if(getByteB(cbContent) > 2000) {
               alert('내용은 짧게.');   
               return;
            } */ else if($('#cbYouCode').val().trim() === '') {
               alert('youtube 주소를 입력해주세요.');   
               return;
            } else {
               $('#registForm').submit();            
            }         
         }); // 글 등록 검증 끝
        
         
      }); // end jQuery
      
      
   </script>
   
</body>

</html>