
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    

    <style>
        .footer {
            background-color: red;
            height: 50px;
        }

        .section {
            background-color: yellowgreen;
            height: 500px;

        }

        .sidebar {
            background-color: yellow;
            height: 500px;
        }

        .container {
            font-family: "NanumGothic";
        }

        /* h2 {
          color: rgb(0, 173, 181);
          font-size: 35px;
          font-weight: bold;
        } */

        .titlebox h2 {
            /* border-bottom: 1px solid rgb(0, 173, 181); */
            margin-top: 20px;
            margin-bottom: 20px;
            font-size: 25px;
            font-weight: bold;
            color: rgb(0, 173, 181);
            text-align: left;
        }

        input {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 10px;
            width: 200px;
        }

        .page-link {
            color: rgb(0, 173, 181);
        }

        #btn-list {
            margin-top: 15px;
            margin-bottom: 25px;
        }






        .vid {
            margin: 15px 5px;
            padding: 10px;
            border: 1px solid #ccc;
        }

        .vid:hover {
            border: 1px solid rgb(0, 173, 181);
            box-sizing: border-box;
        }


        /* .course {      
            box-sizing: border-box;        
        } */

        .subject {
            height: 70px;
            margin: 10px;
        }

        .auth {
            text-align: left;
            font-size: 15px;
            padding: 0 13px;
            overflow: hidden;
        }

        .auth span {
            float: right;
            font-size: 14px;
            padding-left: 15px;
        }
        .auth span:nth-child(1),span:nth-child(2){
            float: left;
            padding-left: 0px;
        }
        .auth span:nth-child(2){
            padding-left: 15px;
        }

        .glyphicon-comment {
            color: skyblue;
        }

        .glyphicon-eye-open {
            color: purple;
        }

        .glyphicon b {
            color: #000;
            padding-left: 8px;
        }
    </style>
</head>

<body>

    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>

        <div class="container text-center">

            <!-- <div class="row">
                <h2 class="font-weight-bold text-center">운동 강의</h2>
            </div> -->

            <div class="row">
                <div class="col-sm-8">
                    <div class="titlebox">
                        <h2>오늘먹은 식단</h2>
                    </div>
                </div>
              	
              	<form action="<c:url value='/dietBoard/dietList' />">
					<div id="btn-list" class="row" align="right">
	
						<!--검색 조건-->
						<select class="search-condition" name="condition">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
							<option value="content">내용</option>
						</select> <input type="text" placeholder="Search" name="keyword" value="${dpc.paging.keyword}">
						<button type="submit" class="btn" aria-label="Left Align">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</div>
				</form>
              	
            </div>


            <div class="row margin-top-5">
               
                <table class="table">
                 
                   <tbody>

						<c:forEach var="vo" varStatus="i" items="${dietList}">
							<c:if test="${i.count % 3 == 1}">
								<tr class="course">
							</c:if>
							
							<th ${(loginuser.memberManagerYN=="YES" && vo.dbReportCount > 0)? "style='background-color:red'":"" } scope="col" class="text-center" id="dietviewCnt"
								onclick="location.href='<c:url value='/dietBoard/dietDetail?dbNum=${vo.dbNum}' />'">
								<div class="vid">
								<c:if test="${vo.dbRealImage1 != null }">
									<a href="#"><img
										src="http://localhost/upload/board/diet/${vo.memberNick}/${vo.dbRealImage1}"
										width="280px" height="160px" alt="vid01"></a>
								</c:if>
								<c:if test="${vo.dbRealImage1 == null }">
									<a href="#"><img
										src="http://localhost/upload/text-image.png"
										width="280px" height="160px" alt="vid01"></a>
								</c:if>
								
									<p class="subject">
										<a href="#">${vo.dbTitle}</a>
									</p>
									<p class="auth">
										<span class="writeday"><fmt:formatDate value="${vo.dbRegDate}" pattern="yy.MM.dd HH:mm" /></span> 
										<span class="nickname">${vo.memberNick }</span> 
										<span class="glyphicon glyphicon-comment" aria-hidden="true"><b>${vo.drCount }</b></span>
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>${vo.dbLookCount}</b></span>
									</p>

								</div>
							</th>
							<c:if test="${i.count % 3 == 0}">
								</tr>
							</c:if>
						</c:forEach>
						
					</tbody>

                </table>
            </div>
			<c:if test="${loginuser != null}">
	            <div class="row" align="right">
	                <button type="button" id="write" class="btn btn-outline-primary float-right"  onclick="location.href='<c:url value='/dietBoard/dietWrite' />'"><b>글쓰기</b></button>
	
	            </div> <!-- 관리자만 보이게 하기 -->
	        </c:if>

			<form action="<c:url value='/dietBoard/dietList' />" name="pageForm">
				<div class="row text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="pagination">
						
							<c:if test="${dpc.prev}">
								<li>
									<a href="#" data-pageNum="${dpc.beginPage-1}">Prev</a>
								</li>
							</c:if>
	
							<c:forEach var="diet" begin="${dpc.beginPage}" end="${dpc.endPage}">
								<li class="${dpc.paging.pageNum == diet ? 'active' : ''}">
									<a href="#" data-pageNum="${diet}">${diet}</a>
								</li>
							</c:forEach>
	
							<c:if test="${dpc.next}">
								<li>
									<a href="#" data-pageNum="${dpc.endPage+1}">Next</a>
								</li>
							</c:if>
							
						</ul>
					</nav>
				</div>
				
				    <input type="hidden" name="pageNum" value="${dpc.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${dpc.paging.countPerPage}">
                    <input type="hidden" name="keyword" value="${dpc.paging.keyword}">
                    <input type="hidden" name="condition" value="${dpc.paging.condition}">
			</form>

            
        </div>
        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
    </div>

    
</body>
<script>
	const pagination = document.getElementById('pagination');	
	pagination.onclick = function(e) {
	e.preventDefault();
	
	const value = e.target.dataset.pagenum;
	
	
	document.pageForm.pageNum.value = value;
	document.pageForm.submit();
}




	
    
</script>

</html>




