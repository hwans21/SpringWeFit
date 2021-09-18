<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <style>

        .row h2 {
            text-align: center;
            color: rgb(0, 173, 181);
            font-size: 35px;
            font-weight: bold;
        }
        .empty-space{
            height:100px;
        }

        .passwordForm{
            margin-top: 100px;
            margin-bottom: 100px;
        }
  
    </style>
</head>

<body>
    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../include/header.jsp" %>
        </div>
        
        <div class="container passwordForm">
        
            <div class="row">
                <h2>비밀번호 변경</h2>
            </div>
            <div class="empty-space"></div>
            
            <form class="form-horizontal">
        
                <div class="form-group">
                  <label for="input-password" class="col-sm-2 control-label">비밀번호</label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="input-password" placeholder="비밀번호">
                  </div>
                </div>
                <div class="form-group">
                  <label for="input-password-check" class="col-sm-2 control-label">비밀번호확인</label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="input-password-check" placeholder="비밀번호확인">
                  </div>
                </div>
                <div class="empty-space"></div>
                <div class="row">
                    <div class="col-sm-offset-6 col-sm-2">
                        <button type="submit" class="btn btn-primary">변경하기</button>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="btn btn-defalut">취소하기</button>
                    </div>       
                </div>
            </form>
        
        </div>
        
        <div class="row">
            <%@ include file="../include/footer.jsp" %>
        </div>
        <!-- <div class="sidebar"></div>   -->
    </div>
    


    
</body>
</html>