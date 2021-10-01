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
                <input type="hidden" name="category" value="${param.category}">
                
                <table>
                    <tr>
                        <td>종목 *</td>
                        <td>
                            <select id="sports" name="pbCatecory">
                                <option value="category">종목선택</option>
                                <option ${placeList.pbCategory == '수영' ? 'selected' : ''}>수영</option>
                                <option ${placeList.pbCategory == '배드민턴' ? 'selected' : ''}>배드민턴</option>
                                <option ${placeList.pbCategory == '스쿼시' ? 'selected' : ''}>스쿼시</option>
                                <option ${placeList.pbCategory == '자전거' ? 'selected' : ''}>자전거</option>
                                <option ${placeList.pbCategory == '달리기' ? 'selected' : ''}>달리기</option>
                                <option ${placeList.pbCategory == '등산' ? 'selected' : ''}>등산</option>
                                <option ${placeList.pbCategory == '홈트짐트' ? 'selected' : ''}>홈트짐트</option>
                                <option ${placeList.pbCategory == '필라테스' ? 'selected' : ''}>필라테스</option>
                                <option ${placeList.pbCategory == '골프' ? 'selected' : ''}>골프</option>
                                <option ${placeList.pbCategory == '스케이트' ? 'selected' : ''}>스케이트</option>
                                <option ${placeList.pbCategory == '기타' ? 'selected' : ''}>기타</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자 * </td>
                        <td><input type=text id="memberNick" name="memberNick" size=20 value="${loginuser.memberNick}" readonly> </td>
                    </tr>

                    <tr>
                        <td>제목 * <sup> ( <span id="nowByte">최대 </span> / 200bytes )</sup></td>
                        <td><input type=text id="pbTitle" name="pbTitle" size="60" value="${placeList.pbTitle}"></td>
                    </tr>

                    <tr>
                        <td>내용<sup> ( <span id="nowByte2">최대 </span> / 2000bytes )</sup></td>
                        <td><textarea id="pbContent" name="pbContent" cols="75" rows="15">${placeList.pbContent}</textarea></td>
                    </tr>

                    <tr>
                        <td>위치 * </td>
                        <td>
                            <input type="hidden" id="sample6_postcode" placeholder="우편번호">
                     		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
                     		기본 주소 * : <input type="text" id="sample6_address" name="pbAddrBasic" placeholder="주소" size="50" value="${placeList.pbAddrBasic}"><br>
                    		상세 주소     : <input type="text" id="sample6_detailAddress" name="pbAddrDetail" placeholder="상세주소" size="50" value="${placeList.pbAddrDetail}"><br>
                     		<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><br>
                            <input type="hidden" name="pbLatitude" id="latitude" ><br>
                            <input type="hidden" name="pbLongitude" id="longitude"><br>
                            <input type="hidden" name="pbImageCount" value="0" value="${placeList.pbImageCount}">
                            <input type="hidden" name="pbLookCount" value="0" value="${placeList.pbLookCount}">
                        </td>
                    </tr>

                    
                    <tr>
                        <td>사진올리기 </td>
                        <td><input multiple type="file" id="uploadFiles" name="fileName" size="10" maxlength="10" onchange="checkFile(this)"></td>
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
    			alert('종목은 필수 항목 입니다.');
    			document.placeModify-form.sports.focus();
                return;
    		} else if($('#pbTitle').val().trim() === '') {
    			alert('제목은 필수 항목 입니다.');
                return;
    		} else if($('#pbTitle').val().length > 200) {
                alert('제목은 최대 200byte를 초과할 수 없습니다.');   
                $('#pbTitle').focus();
                return;
    		} else if($('#pbContent').val().length > 2000) {
                alert('내용은 최대 2000byte를 초과할 수 없습니다.');   
                $('pbContent').focus();
                return;
    		} else if(document.writeForm.sample6_address.value === '' ) {
				alert('주소는 필수 항목 입니다.');
  				document.writeForm.sample6_address.focus();
  				return;
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