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
            <form action="<c:url value='/dietBoard/dietModify' />" name="modifyForm" method="POST" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>작성자</td>
                        <td><input type=text name=memberNum size=20 value="${dietList.memberNum}"> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text name=dbTitle size="60" value="${dietList.dbTitle}"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea name="dbContent" cols="75" rows="15">${dietList.dbContent}</textarea></td>
                    </tr>

                    
                    <tr>
                        <td>사진올리기 </td>
                        <td><input multiple="multiple"  type="file" name="fileName" size="10" maxlength="10"></td>
                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button type="submit" class="btn btn-primary" id="modifyBtn">수정하기</button>
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
	
	const modifyBtn = document.getElementById('modifyBtn');
	console.log(modifyBtn);
	modifyBtn.onclick = function() {
		if(document.modifyForm.memberNum.value === '') {
				alert('작성자는 필수 항목 입니다.');
				document.modifyForm.memberNum.focus();
				return; //이벤트 함수 강제 종료
			} else if(document.modifyForm.dbTitle.value === '') {
				alert('제목은 필수 항목 입니다.');
				document.modifyForm.dbTitle.focus();
				return;
			} else {
				document.modifyForm.submit();
			}
	};
	
	
	$('#delBtn').click(function() {
		if(confirm('정말 삭제하시겠습니까?')) {
			$('form[name=modifyForm]').attr('action', '<c:url value="/dietBoard/dietDelete" />');
			$('form[name=modifyForm]').submit();
		} else {
			return;
		}
	});
	
	
	</script>
</body>

</html>




