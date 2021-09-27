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
                        <h2>강의영상 수정</h2>
                    </div>
                </div>
            </div>

            <!—main left—>
            <form action="<c:url value='/courseBoard/modify' />" id="modifyForm" method="POST">
                <input type="hidden" name="cbNum" value="${article2.cbNum}">
                <input type="hidden" name="pageNum" value="${param.pageNum}">
                <input type="hidden" name="category" value="${param.category}">
                <input type="hidden" name="condition" value="${param.condition}">
                <input type="hidden" name="keyword" value="${param.keyword}">
                <table>
                    <tr>
                        <td>종목</td>
                        <td>
                            <select id="sports" name="cbCategory">
                                <option value="category">종목선택</option>
                                <option ${article2.cbCategory == '수영' ? 'selected' : ''}>수영</option>
                                <option ${article2.cbCategory == '배드민턴' ? 'selected' : ''}>배드민턴</option>
                                <option ${article2.cbCategory == '스쿼시' ? 'selected' : ''}>스쿼시</option>
                                <option ${article2.cbCategory == '자전거' ? 'selected' : ''}>자전거</option>
                                <option ${article2.cbCategory == '달리기' ? 'selected' : ''}>달리기</option>
                                <option ${article2.cbCategory == '등산' ? 'selected' : ''}>등산</option>
                                <option ${article2.cbCategory == '홈트짐트' ? 'selected' : ''}>홈트짐트</option>
                                <option ${article2.cbCategory == '필라테스' ? 'selected' : ''}>필라테스</option>
                                <option ${article2.cbCategory == '골프' ? 'selected' : ''}>골프</option>
                                <option ${article2.cbCategory == '스케이트' ? 'selected' : ''}>스케이트</option>
                                <option ${article2.cbCategory == '기타' ? 'selected' : ''}>기타</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td><input type=text size=20 value="관리자" readonly> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text id="cbTitle" name="cbTitle" size="60" value="${article2.cbTitle}"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea id="cbContent" name="cbContent" cols="75" rows="15">${article2.cbContent}</textarea></td>
                    </tr>


                    <tr>
                        <td>youtube 주소</td>
                        <td><input type=text id="cbYouCode" name="cbYouCode" size="60" value="${article2.cbYouCode}"></td>
                    </tr>
                    
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button type="button" class="btn btn-primary" id="modifyBtn">수정하기</button>
                            <button type="button" class="btn btn-warning" id="deleteBtn">삭제하기</button>
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
         
         // 글 수정
         $('#modifyBtn').click(function() {
            if($('#sports').val() === 'category') {
               alert('종목을 선택해주세요.');
               return;            
            } else if($('#cbTitle').val().trim() === '') {
               alert('제목을 입력해주세요.');   
               return;
            } else if($('#cbYouCode').val().trim() === '') {
               alert('youtube 주소를 입력해주세요.');   
               return;
            } else {
               $('#modifyForm').submit();            
            }         
         }); // 글 수정 검증 끝
         
         
         
         // 글 삭제
         $('#deleteBtn').click(function() {
            if(confirm('정말 삭제하시겠습니까?')) {
               $('#modifyForm').attr('action', '<c:url value="/courseBoard/delete" />');
               $('#modifyForm').submit();
            } else {
               return;
            }
            
         }); // 글 삭제 처리 끝
         
         

      
      }); // end jQuery
      
         
   </script>

    
</body>

</html>