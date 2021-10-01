<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% pageContext.setAttribute("replaceChar", "\n"); %>
<% pageContext.setAttribute("replaceChar1", "<"); %>
<% pageContext.setAttribute("replaceChar2", ">"); %>


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
            font-size: 40px;
            font-weight: bold;
            color: rgb(0, 173, 181);
            text-align: left;
        }
        
        #search-parts {
        margin-top: 40px;
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
            border: 4px solid rgb(0, 173, 181);
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
            padding-left: 22px;
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

        /* 서브 메뉴 */
        .sub_menu {
            width: 100%;
            height: 50px;
            background-color: rgb(0, 173, 181);
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.8);
        }
        .sub2 {
            display: inline-block;
            margin:0 auto;
        }

        .sub2 > a:link, .sub2 > a:visited, .sub2 > a:active {
            margin: 5px 35px;
            font-size: 15px;
            line-height: 50px;
            text-decoration: none;
            color: #fff;
        }

        .sub2 a:hover { 
            color: #fff;
            font-weight: 600;
        }
        #sub_menu3 {
            text-align: center;
            box-sizing: border-box; /*중요*/
        }
    </style>
</head>

<body>

    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>
        <div class="row">
            <ul id="sub_menu3" class="sub_menu">

                <li class="sub2"><a href="<c:url value="/noticeBoard/" />">공지사항</a></li>
                <li class="sub2"><a href="<c:url value="/freeBoard/" />">자유게시판</a></li>

            </ul>
        </div>
        <div class="container text-center">


            <div class="row">
                <div class="col-sm-8">
                    <div class="titlebox">
                        <h2>공지사항</h2>
                    </div>
                </div>
            
            
            	<div class="col-sm-4" id="search-parts">
            		<form id='searchForm' action="<c:url value='/noticeBoard/noticeList' />" method='get'>
		    			<div class="col-sm-4">
		    			<select class="form-control search-select" name="condition" id="condition">
                            <option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>전체</option>
                            <option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
                            <option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
                     	</select>
                     	</div>
                     
                     	<div class="col-sm-7">
                     		<input type="text" id="search-input" class="form-control search-input" name="keyword" placeholder="Search" value="${pc.paging.keyword }">
                     	</div>
                     	<div class="col-sm-1">
                        	<button type="button" class="btn" aria-label="Left Align" id="searchBtn">
                      			<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    		</button>
	               		</div>
                    
		    		</form>
		    	</div>
		    </div>
		    	   
            <div class="row margin-top-5">
                <table class="table table-hover table-responsive">
                    <thead class="bg-info">
                        <tr>
                            <th scope="col" class="text-center">번호</th>
                            <th scope="col" class="text-center">제목</th>
                            <th scope="col" class="text-center">글쓴이</th>
                            <th scope="col" class="text-center">날짜</th>
                            <th scope="col" class="text-center">조회</th>
                        </tr>
                    </thead>
                    <tbody>

					<c:forEach var="arr" items="${noticeList }">
                    
                      <tr ${(loginuser.memberManagerYN=="YES" && arr.nbReportCount > 0)? "style='background-color:red'":"" } onclick="location.href='<c:url value="/noticeBoard/noticeDetail?nbNum=${arr.nbNum }" />'">
                        <th scope="col" class="text-center">${arr.nbNum }</th>
                        <th scope="col">${fn:replace(fn:replace(fn:replace(arr.nbTitle, replaceChar,"<br/>"),replaceChar1,"&lt;"),replaceChar2,"&gt;") }&nbsp;&nbsp;&nbsp;[${arr.nbReplyCount}]</th>
                        <th scope="col" class="text-center">관리자</th>
                        <th scope="col" class="text-center"><fmt:formatDate value="${arr.nbRegDate }" pattern="yyyy-MM-dd"/></th>
                        <th scope="col" class="text-center">${arr.nbLookCount }</th>
                      </tr>
                    </c:forEach>
                    	
  						


                    </tbody>
                </table>

                
            </div>
			
           <div class="row" align="right">
                <button type="button" id="write" class="btn btn-outline-primary" onclick="location.href='<c:url value="/noticeBoard/noticeWrite" />'"><b>글쓰기</b></button>
             </div>
			</div>
            <div class="row text-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <c:if test="${pc.prev }">
	                    <li class="page-item"><a class="page-link" href="<c:url value='/noticeBoard/?pageNum=${pc.beginPage-1 }&condition=${pc.paging.condition }&keyword=${pc.paging.keyword }' />">Prev</a></li>
                      </c:if>
                      
                      <c:forEach var="page" begin="${pc.beginPage }" end="${pc.endPage }">
                      	<li class="page-item ${page == param.pageNum? 'active':''}"><a class="page-link" href="<c:url value='/noticeBoard/?pageNum=${page }&condition=${pc.paging.condition }&keyword=${pc.paging.keyword }' />">${page }</a></li>
                      </c:forEach>
               
                      
                      <c:if test="${pc.next }">
	                    <li class="page-item"><a class="page-link" href="<c:url value='/noticeBoard/?pageNum=${pc.endPage+1 }&condition=${pc.paging.condition }&keyword=${pc.paging.keyword }' />">Next</a></li>
                      </c:if>
                    </ul>
                  </nav>
            </div> 
            
        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
		
        
    </div>
   <script>
   	$('#searchBtn').click(function(){
   		
	
   		if($('#search-input').val()==='') {
   			alert("검색어를 입력하세요.");
   		
   		}
   		
   		searchForm.submit();
   		
   		const condition = $('#condition').val();
		const keyword = $('#search-input').val();
		  
			
   		
		  location.href = '/wefit/noticeBoard/?condition=' + condition + '&keyword=' + keyword;
	});
   	
   	$('#search-input').keydown(function(key){ 
		if(key.keyCode === 13) {
			key.preventDefault();
			$('#searchBtn').click(); 
		}				
  });

  </script>
    
</body>
</html>