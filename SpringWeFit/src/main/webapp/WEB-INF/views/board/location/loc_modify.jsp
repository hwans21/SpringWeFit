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
                        <h2>장소 수정</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="<c:url value='/placeBoard/placeModify'/>" id="placeModify-form" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="pbNum" value="${placeList.pbNum}">
                
                <table>
                    <tr>
                        <td>종목</td>
                        <td>
                            <select id="sports" name="pbCatecory">
                                <option value="category">종목선택</option>
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
                        <td><input type=text id="pbNum" name="pbNum" size=20 value="${placeList.pbNum}"> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text id="pbTitle" name="pbTitle" size="60" value="${placeList.pbTitle}"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea id="pbContent" name="pbContent" cols="75" rows="15">${placeList.pbContent}</textarea></td>
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
                        <td><input type="file" name="fileName" size="10" maxlength="10"></td>
                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>


                            <button id="modifyBtn" type="button" class="btn btn-primary">수정하기</button> 
                            <button id="deleteBtn" type="button" class="btn btn-primary">삭제하기</button>
                            <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/placeBoard/placeList" />'">취소하기</button>



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
 
   	

    	let title = $('#input-title').val();
    	<!-- 
    	$('#category').change(function(){
    		let category = title.substring(title.indexOf("["),title.indexOf("]")+1);
    		if(category !== $('#category').val()){
    			$('#input-title').val(title.replace(category,$('#category').val()));
    		}
    	});
    	-->
    	
    	// 글 수정 검증
    	$(function() {   
    	$('#modifyBtn').click(function(){
    		if($('#sports').val() === 'category') {
                alert('종목을 선택해주세요.');
                return;            
             } else if($('#pbNum').val().trim() === '') {
                 alert('작성자를 입력해주세요.');   
                 return;
             } else if($('#pbTitle').val().trim() === '') {
                 alert('제목을 입력해주세요.');   
                 return;
             /*
             } else if($('#addrBasic').val().trim() === '') {
                 alert('주소를 입력해주세요.');   
                 return;
             } else if($('#addrDetail').val().trim() === '') {
                 alert('상세주소를 입력해주세요.');   
                 return;
             */
             } else {
    			$('#placeModify-form').submit();
			}
    	});
    	
    	//글 삭제 확인
    	$('#deleteBtn').click(function(){
    		if(confirm("정말로 삭제하시겠습니까?")){
	    		$('#placeModify-form').attr("action", '<c:url value="/placeBoard/placeDelete" />')
	    		$('#placeModify-form').submit();
    		}
    	});
    	
    	}); // end jQuery
    	
    	
    </script>

   
</body>

</html>