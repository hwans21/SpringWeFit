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
                        <h2>식단 수정</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="<c:url value='/dietBoard/dietModify' />" id="boardModify" name="modifyForm" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="dbNum" value="${dietList.dbNum }">
                <table>
                    <tr>
                        <td>작성자</td>
                        <td><input type=text id="memberNick" name=memberNick size=20 value="${dietList.memberNick}"> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text id="dbTitle" name=dbTitle size="60" value="${dietList.dbTitle}"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea name="dbContent" id="dbContent" cols="75" rows="15">${dietList.dbContent}</textarea></td>
                    </tr>

                    
                    <tr>
                        <td>사진올리기 </td>
                        
	                        <td>
	                        	<input multiple="multiple"  type="file" id="uploadFiles" name="fileName" size="10" maxlength="10" >
	                        </td>
                        
                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button type="button" class="btn btn-primary" id="modifyBtn">수정하기</button>
                            <button type="button" class="btn btn-primary" id="delBtn">삭제하기</button>
                            <button type="button" class="btn btn-default" onclick="location.href='<c:url value="/dietBoard/dietList" />'">취소하기</button>
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
	
	let bool = true;
	
		$(function() {
			

	    	$('#modifyBtn').click(function() {
				if($('#dbTitle').val() === '') {
					alert('제목은 필수 항목 입니다.');
					$('#dbTitle').focus();
	  				return;
				}else if($('#dbTitle').val().length > 200) {
					 alert('제목은 최대 200byte를 초과할 수 없습니다.');   
					 $('#dbTitle').focus();
		               return;
				}else if($('#dbContent').val().length > 2000) {
	                alert('내용은 최대 2000byte를 초과할 수 없습니다.');   
	                $('dbContent').focus();
	                return;
				}else if(!bool){
					alert('글쓰기 입력 정보를 다시 확인해주세요.'); 
					return;
				}else {
					$('#boardModify').submit();  
					
				}
	
			});
			
			
			$('#delBtn').click(function() {
				if(confirm('정말 삭제하시겠습니까?')) {
					$('form[name=modifyForm]').attr('action', '<c:url value="/dietBoard/dietDelete" />');
					$('form[name=modifyForm]').submit();
				} else {
					return;
				}
			});
			
				
	  		//각 파일당, 전체 용량 확인 함수
	  		$("input[name=fileName]").off().on("change", function(){
			
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
			
			
				/*
				$("input[name=fileName]").off().on("change", function(){
		
		  			if (this.files || this.files[0] || this.files[1] || this.files[2] || this.files[3] || this.files[4]) {
						
		  				var maxSize = 10 * 1024 * 1024;
		  				
		  				if($('#uploadFiles')[0].files.length > 5) {
		  					alert('최대 사진 수는 5장입니다.');
		  					return;
		  				}
		  				
		  				if(this.files[0].size != null) {
		  					var fileSize1 = this.files[0].size;
		  					if(fileSize1 > maxSize) {
		  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  					return;
		  					}
		  				}
		  				if(this.files[0].size && this.files[1].size != null) {
		  					var fileSize1 = this.files[0].size;
		  					var fileSize2 = this.files[1].size;
		  					if(fileSize1 + fileSize2 > maxSize) {
		  	  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  	  					return;
		  					}
		  				}
		  				if(this.files[0].size && this.files[1].size && this.files[3].size != null) {
		  					var fileSize1 = this.files[0].size;
		  					var fileSize2 = this.files[1].size;
		  					var fileSize3 = this.files[2].size;
		  					if(fileSize1 + fileSize2 + fileSize3 > maxSize) {
		  	  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  	  					return;
		  					}
		  				}
		  				if(this.files[0].size && this.files[1].size && this.files[3].size && this.files[4].size != null) {
		  					var fileSize1 = this.files[0].size;
		  					var fileSize2 = this.files[1].size;
		  					var fileSize3 = this.files[2].size;
		  					var fileSize4 = this.files[3].size;
		  					if(fileSize1 + fileSize2 + fileSize3 + fileSize4 > maxSize) {
		  	  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  	  					return;
		  					}
		  				}
		  				if(this.files[0].size && this.files[1].size && this.files[3].size && this.files[4].size && this.files[4].size != null) {
		  					var fileSize1 = this.files[0].size;
		  					var fileSize2 = this.files[1].size;
		  					var fileSize3 = this.files[2].size;
		  					var fileSize4 = this.files[3].size;
		  					var fileSize5 = this.files[4].size;
		  					if(fileSize1 + fileSize2 + fileSize3 + fileSize4 + fileSize5 > maxSize) {
		  	  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  	  					return;
		  					}
		  				}
		  				
		  				if(fileSize1 > maxSize) {
		  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  					return;
		  				}
		  				if(fileSize1 + fileSize2 > maxSize) {
		  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  					return;
		  				}
		  				if(fileSize1 + fileSize2 + fileSize3 > maxSize) {
		  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  					return;
		  				}
		  				if(fileSize1 + fileSize2 + fileSize3 + fileSize4 > maxSize) {
		  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  					return;
		  				}
		  				if(fileSize1 + fileSize2 + fileSize3 + fileSize4 + fileSize5 > maxSize) {
		  					alert('파일 용량은 10MB를 초과할 수 없습니다.');
		  					return;
		  				}
		  		
		  			}
		  		});
				*/
		});
	</script>
</body>

</html>




