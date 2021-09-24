<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>>

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
                        <h2>장소 등록</h2>
                    </div>
                </div>
            </div>

            <!--main left-->



            <form action="<c:url value='/placeBoard/placeWrite' />" id="boardWrite" name="writeForm" method="post" enctype="multipart/form-data">


                <table>
                    <tr>
                        <td>종목</td>
                        <td>
                            <select id="sports" name="pbCategory">



                                <option value='category'>종목선택</option>
                                <option>수영</option>
                                <option>배드민턴</option>
                                <option>스쿼시</option>
                                <option>자전거</option>
                                <option>달리기</option>
                                <option>등산</option>
                                <option>홈트짐트</option>
                                <option>필라테스</option>
                                <option>골프</option>
                                <option>스케이트</option>
                                <option>기타</option>


                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>



                        <td><input type=text name=memberNum size=20> </td>


                    </tr>

                    <tr>
                        <td>제목</td>


                        <td><input type=text name=pbTitle size="60"></td>


                    </tr>

                    <tr>
                        <td>내용</td>



                        <td><textarea name="pbContent" cols="75" rows="15"></textarea></td>



                    </tr>

                    <tr>
                        <!--
                            다음 주소 api : 주소를 선택하면 지도도 함께 보여주기
                            https://postcode.map.daum.net/guide#sample
                        -->
                        <td>주소api</td>
                        <td></td>
                    </tr>

                    
                    <tr>
                        <td>사진올리기 </td>



                        <td><input type="file" multiple="multiple" name="fileName" size="10" maxlength="10"></td>



                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>



                            <button class="btn" id="writeBtn" type="button">등록하기</button>
                            <button class="btn" id="listBtn" type="button">취소하기</button>

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
    	const writeBtn = document.getElementById('writeBtn');
    	writeBtn.onclick = function() {
    			if(document.writeForm.sports.value === 'category'){
    				alert('종목은 필수 항목 입니다.');
    				document.writeForm.sports.focus();
    				return;
    			} else if(document.writeForm.name.value === '') {
					alert('작성자는 필수 항목 입니다.');
					document.writeForm.name.focus();
					return;
				} else if(document.writeForm.title.value === '') {
					alert('제목은 필수 항목 입니다.');
	  				document.writeForm.title.focus();
	  				return;
	  			/*
				} else if(document.writeForm.addrbasic.value === '') {
					alert('주소는 필수 항목 입니다.');
	  				document.writeForm.title.focus();
	  				return;
				} else if(document.writeForm.addrdetail.value === '') {
					alert('상세주소는 필수 항목 입니다.');
	  				document.writeForm.title.focus();
	  				return;
	  				*/
				} else {
					document.writeForm.submit();
				}
		};
    	
  		$('#listBtn').click(function() {
			if(confirm('목록으로 돌아가시겠습니까?')) {
				location.href='<c:url value="/placeBoard/placeList" />';
			} else {
				return;
			}
		});
    </script>
    

   
</body>

</html>