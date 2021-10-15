<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <style>
        
        .footer{
            background-color: red;
            height: 50px;
        }
        .section{
            background-color: yellowgreen;
            height: 500px;

        }
        .sidebar{
            background-color: yellow;
            position: fixed;
            right: 15px ;
            top: 250px;
        }
      
       
        .container {
          font-family: "NanumGothic";
        }

        h2 {
          color: rgb(0, 173, 181);
          font-size: 35px;
          font-weight: bold;
        }

        input {
          padding: 5px;
          border: 1px solid lightgray;
          border-radius: 10px;
          width: 200px;
        }

        .page-link {
          color:rgb(0, 173, 181);
        }
        
        #btn-list {
          margin-top: 15px;
          margin-bottom: 25px;
        }

        .bigq {
          font-size: 100px;
          font-weight: bold;
          color:rgb(0, 173, 181);
        }

        .biga {
          font-size: 100px;
          font-weight: bold;
          color:rgb(0, 173, 181);
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
          <button type="button" class="btn btn-default">목록으로</button><br>
        </div>

          <div class="row jumbotron">
              <div class="row">
                <div class="col-md-2 bigq">Q</div>

                <div class="col-md-10">
                    <div class="row">
                    다이어트 하려고 식단 ~~~~~ 이렇게 하고 운동~~~~ 이렇게 할 건데 괜찮은가요?
                    운동루틴 적당한지도 같이 봐주세요~~~~~~~질문글 궁금해요궁금해
                    운동루틴 적당한지도 같이 봐주세요~~~~~~~질문글 궁금해요궁금해
                    운동루틴 적당한지도 같이 봐주세요~~~~~~~질문글 궁금해요궁금해
                    운동루틴 적당한지도 같이 봐주세요~~~~~~~질문글 궁금해요궁금해 
                    </div><br>

                
              
              
                    <div class="row">
                      <div class="col-md-6" align="left">
                      <span>닉넴</span>
                      <span>게시글게시시간</span>
                    </div>
                    

                    <div class="col-md-6" align="right">
                      <button type="button" class="btn btn-default">수정</button>
                      <button type="button" class="btn btn-default">삭제</button>
                    </div>
                    </div>
               </div>

             </div>
          </div>



          <div class="row">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="답변내용을 입력하세요...">
              <span class="input-group-btn">
                <button class="btn btn-info" type="button">답변하기</button>
              </span>
            </div><br>




          </div>


          <div class="row jumbotron">
            <div class="row">
              <div class="col-md-2 biga">A</div>

              <div class="col-md-10">
                <div class="row">운동루틴은 괜찮은데 식단이 너무 타이트 하네요. 단기로 하다가 식단 중단하시면 바로 요요옵니다. 식단계획을 지속가능하게 다시 짜보세요.
                </div><br>
                <div class="row">
                  <div class="col-md-6" align="left">
                    <span>닉넴</span>
                    <span>게시글게시시간</span>
                  </div>
              

                  <div class="col-md-6" align="right">
                    <button type="button" class="btn btn-default">수정</button>
                    <button type="button" class="btn btn-default">삭제</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row jumbotron">
            <div class="row">
              <div class="col-md-2 biga">A</div>

              <div class="col-md-10">
                <div class="row"> 식단이 단탄지가 조화롭지 못한 거 같아요. 탄수화물만 너무 제한하는 식단이에요. 운동도 근력운동 좀 늘리면 좋을 것 같아요.
                </div><br>
                <div class="row">
                  <div class="col-md-6" align="left">
                    <span>닉넴</span>
                    <span>게시글게시시간</span>
                  </div>
              

                  <div class="col-md-6" align="right">
                    <button type="button" class="btn btn-default">수정</button>
                    <button type="button" class="btn btn-default">삭제</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row jumbotron">
            <div class="row">
              <div class="col-md-2 biga">A</div>

              <div class="col-md-10">
                <div class="row">운동루틴은 괜찮은데 식단이 너무 타이트 하네요. 단기로 하다가 식단 중단하시면 바로 요요옵니다. 식단계획을 지속가능하게 다시 짜보세요.
                </div><br>
                <div class="row">
                  <div class="col-md-6" align="left">
                    <span>닉넴</span>
                    <span>게시글게시시간</span>
                  </div>
              

                  <div class="col-md-6" align="right">
                    <button type="button" class="btn btn-default">수정</button>
                    <button type="button" class="btn btn-default">삭제</button>
                  </div>
                </div>
              </div>
            </div>
          </div>






        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
       
    </div>
    
    
</body>
</html>