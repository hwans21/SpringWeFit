<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                        <h2>게시글 수정</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="<c:url value='/freeBoard/freeModify'/>" id="freeModify-form" method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="fbNum" value="${content.fbNum }">
                <table>
                    <tr>
                        <td>게시판</td>
                        <td>
                            <select id="category" class="form-control">
								  <option value="[자유글]" ${fn:contains(content.fbTitle,'[자유글]')? 'selected':'' }>자유글</option>
								  <option value="[소식/정보]" ${fn:contains(content.fbTitle,'[소식/정보]')? 'selected':'' }>소식/정보</option>
								  <option value="[홍보]" ${fn:contains(content.fbTitle,'[홍보]')? 'selected':'' }>홍보</option>
								  <option value="[꿀팁]" ${fn:contains(content.fbTitle,'[꿀팁]')? 'selected':'' }>꿀팁</option>
								  <option value="[기타]" ${fn:contains(content.fbTitle,'[기타]')? 'selected':'' }>기타</option>
							</select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td><input type="text" name="memberNick" size="20" value="${content.memberNick }" readonly> </td>
                    </tr>

                    <tr>
                        <td>제목<sup> ( <span id="titleByte"> </span> / 200bytes )</sup></td>
                        <td><input id="input-title" type="text" name="fbTitle" size="60" value="${content.fbTitle }"></td>
                    </tr>

                    <tr>
                        <td>내용<sup> ( <span id="contentByte"> </span> / 2000bytes )</sup></td>
                        <td><textarea id="input-content" name="fbContent" cols="75" rows="15">${content.fbContent }</textarea></td>
                    </tr>

                    

                    
                    <tr>
                        <td>사진올리기 </td>
                        <td><input id="uploadFiles" multiple type="file" name="fileName" size="10" maxlength="10" ></td>
                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button id="modifyBtn" class="btn btn-primary" type="button" >수정하기</button>
                            <button id="deleteBtn" class="btn btn-primary" type="button" >삭제하기</button>
                            <button class="btn btn-default" type="button" onclick="location.href='/FRONT/views/board/free/free_detail.html'">취소하기</button>
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
    	$('#category').change(function(){
    		let category = title.substring(title.indexOf("["),title.indexOf("]")+1);
    		if(category !== $('#category').val()){
    			$('#input-title').val(title.replace(category,$('#category').val()));
    		}
    	});
    	let bool = true;
    	//////////////////////
    	function getTextLength(str) {
		       var rbyte = 0;
		       for (var i = 0; i < str.length; i++) {
		    	   if(str.charCodeAt(i) > 127) { // 한글 3Byte
		  	        	rbyte += 3;
		  	        } else if(str.charCodeAt(i) < 12) { // 엔터 2Byte //이부분이 의문이다. 왜 sqlDeveloper에서 엔터를 2바이트로 인식할까... (엔터가 \r\n으로 저장되어서 4바이트일줄알았는데.. + 그리고 str.charCodeAt(i) == 13으로 작성했는데 왜 안먹힐까..13이 엔터아닌가?)
		  	        	rbyte += 2;
		  	        } else { //영문 등 나머지 1Byte
		  	        	rbyte++;
		  	        }
		      }
		      return rbyte;
		 }
		$(document).ready(function () {
			$('#titleByte').text(getTextLength($(this).val()));
			$('#contentByte').text(getTextLength($(this).val()));
		});
		
		$('#title-input').keyup(function(){
			$('#titleByte').text(getTextLength($(this).val()));
		});
		$('#content-input').keyup(function(){
			$('#contentByte').text(getTextLength($(this).val()));
		});
		
		
		//각 파일당, 전체 용량 확인 함수
        $("#uploadFiles").change(function(){
      
           if(this.files || this.files[0] || this.files[1] || this.files[2] || this.files[3] || this.files[4] != null) {
              var maxSize = 50 * 1024 * 1024;
              var totalSize = 0;
              
              if($('#uploadFiles')[0].files.length > 5) {
                 alert('최대 사진 수는 5장입니다.');
                 bool = false;
                 return;
              }
              
              console.log(this.files.length);
              console.log('---------------');
              
              for(i=0; i<this.files.length; i++) {
                 totalSize += this.files[i].size;
              }
                 for(i=0; i<5; i++) {
                    if(this.files[0].size > 10 * 1024 * 1024){
                       alert('한 이미지의 허용 크기는 10MB입니다.');
                       bool = false;
                       return;
                    }
                 }
              if(totalSize > maxSize) {
                 alert('사진의 총 용량은 50MB입니다.');
                 bool = false;
                 return;
              }
           }
           bool = true;
        }); //각 파일당, 전체 용량 확인 함수 종료
	
		$('#regBtn').click(function(){
			if($('#title-input').val().trim() === ''){
				alert('제목을 입력해주세요.');
				return;
			} else if(+($('#titleByte').text()) > 200){
				alert('제목은 최대 200byte를 초과할 수 없습니다.');   
	            return;
			} else if($('#content-input').val().trim() === ''){
				alert('내용을 입력해주세요.');
				return;
			} else if(+($('#contentByte').text()) > 2000){
				alert('제목은 최대 2000byte를 초과할 수 없습니다.');   
	            return;
			}
			if($('#title-input').val().indexOf($('#category').val()) === -1){ // 해당 태그 있는지 확인
				
				$('#title-input').val($('#category').val()+$('#titleInput').val()); // 제목에 태그 넣기
			}
			
			$('#boardWrite').submit();
		});
    	//////////////////////
    	
    	
    	$('#modifyBtn').click(function(){
    		$('#freeModify-form').submit();
    	});
    	$('#deleteBtn').click(function(){
    		if(confirm("정말로 삭제하시겠습니까?")){
	    		$('#freeModify-form').attr("action","<c:url value='/freeBoard/freeDelete'/>")
	    		$('#freeModify-form').submit();
    		}
    	});
    	
    	
    </script>

    
</body>

</html>