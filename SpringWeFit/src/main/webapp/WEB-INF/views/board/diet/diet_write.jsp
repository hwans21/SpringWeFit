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
                        <h2>식단 등록</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="<c:url value='/dietBoard/dietWrite' />" id="boardWrite" name="writeForm" method="POST" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>작성자</td>
                        <td><input type=text name="memberNick" size=20 value="${loginuser.memberNick}" readonly></td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text name="dbTitle" size="60"></td>
                    </tr>
               
                    <tr>
                        <td>내용</td>
                        <td><textarea name="dbContent" cols="75" rows="15"></textarea></td>
                    </tr>

                    
                    <tr>
                        <td>사진올리기 </td>
                        <td>
                           <input multiple="multiple" type="file" id="uploadFiles" name="fileName" size="10" maxlength="10">
                           <span></span>
                        </td>
                    </tr>
                    
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button class="btn btn-primary" id="writeBtn" type="button">등록하기</button>
                            <button class="btn btn-default" id="listBtn" type="button" onclick="location.href='<c:url value='/dietBoard/dietList' />'">취소하기</button>
                            <br><br><br>
                        </td>
                        
                    </tr>
                </table>
         <input type="hidden" name="memberNum" value="${loginuser.memberNum}">
            </form>
        </div>

    </div>


    <div class="row">
        <%@ include file="../../include/footer.jsp" %>
    </div>

    <script>
       const writeBtn = document.getElementById('writeBtn');
       console.log(writeBtn);
       writeBtn.onclick = function() {
           var fileSize = document.getElementById("uploadFiles").files[0].size;
           var maxSize = 10 * 1024 * 1024; // 10MB
         if(document.writeForm.memberNick.value === '') {
            alert('작성자는 필수 항목 입니다.');
            document.writeForm.memberNick.focus();
            return;
         }else if(document.writeForm.dbTitle.value === '') {
            alert('제목은 필수 항목 입니다.');
              document.writeForm.dbTitle.focus();
              return;
         }else {
            $('#boardWrite').submit();
         }
      }
       
        $('#listBtn').click(function() {
         if(confirm('목록으로 돌아가시겠습니까?')) {
            location.href='<c:url value="/dietBoard/dietList" />';
         } else {
            return;
         }
      });
        
        $("input[name=fileName]").off().on("change", function(){

           if (this.files || this.files[0] || this.files[1] || this.files[2] || this.files[3] || this.files[4]) {
            
              var maxSize = 10 * 1024 * 1024;
              
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
        


        
        
        
    </script>
    
    
    
    
    

    
</body>

</html>

