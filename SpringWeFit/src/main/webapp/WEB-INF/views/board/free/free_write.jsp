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
                        <h2>게시글 작성</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="#" id="boardWrite" method="POST" enctype="multipart/form-data">
            	<input type="hidden" name="memberNum" value="${loginuser.memberNum}">
                <table>
                    <tr>
                        <td>게시판</td>
                        <td>
                            <select id="category" class="form-control">
								  <option value="[자유글]" selected>자유글</option>
								  <option value="[소식/정보]">소식/정보</option>
								  <option value="[홍보]">홍보</option>
								  <option value="[꿀팁]">꿀팁</option>
								  <option value="[기타]">기타</option>
							</select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td><input type="text" name="memberNick" size="20" value="${loginuser.memberNick }" readonly> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text name="fbTitle" size="60" id="titleInput"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea name="fbContent" cols="75" rows="15"></textarea></td>
                    </tr>

             

                    
                    <tr>
                        <td>사진올리기 </td>
                        <td><input multiple type="file" name="fileName" size="10" maxlength="10" ></td>
                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button class="btn btn-primary" type="button" id="regBtn">등록하기</button>
                            <button class="btn btn-default" type="button" onclick="location.href='<c:url value="/freeBoard/" />'">취소하기</button>
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
		
		$('#regBtn').click(function(){
			if($('#titleInput').val().indexOf($('#category').val()) === -1){ // 해당 태그 있는지 확인
				
				$('#titleInput').val($('#category').val()+$('#titleInput').val()); // 제목에 태그 넣기
			}
			
			$('#boardWrite').submit();
		});
	</script>

   
</body>

</html>