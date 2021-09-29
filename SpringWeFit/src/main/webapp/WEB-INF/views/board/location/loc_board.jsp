<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

        #title {
          color: rgb(0, 173, 181);
          font-size: 45px;
          font-weight: bold;
        }

        #all {
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

      
       
    </style>
</head>

<body>
    
    <div class="container-fluid h-100">
        <div class="row">
            <%@ include file="../../include/header.jsp" %>
        </div>

        <div class="row">
            
            <div class="container text-center">
                
                <div class="col-sm-5">
                    <span id="title">장소 찾기</span>
                </div>
               
    	
    			
				
				
				<!-- 종목 -->
	                <div id="btn-list" class="row" align="right">
	                    <div id="sportsBtn" class="btn-group text-center " role="group" aria-label="Basic outlined example">
	                        <button type="button" class="btn btn-info btn-active" id="allBtn">전체</button>
	                        <button type="button" class="btn btn-info" id="swimmingBtn">수영</button>
	                        <button type="button" class="btn btn-info" id="badmintonBtn">배드민턴</button>
	                        <button type="button" class="btn btn-info" id="squashBtn">스쿼시</button>
	                        <button type="button" class="btn btn-info" id="bicycleBtn">자전거</button>
	                        <button type="button" class="btn btn-info" id="runningBtn">달리기</button>
	                        <button type="button" class="btn btn-info" id="hikingBtn">등산</button>
	                        <button type="button" class="btn btn-info" id="trainingBtn">홈트짐트</button>
	                        <button type="button" class="btn btn-info" id="pilatesBtn">필라테스</button>
	                        <button type="button" class="btn btn-info" id="golfBtn">골프</button>
	                        <button type="button" class="btn btn-info" id="skateBtn">스케이트</button>
	                        <button type="button" class="btn btn-info" id="etcBtn">기타</button>&nbsp;&nbsp;&nbsp;
	                    </div>
	
					<div class="search-area">
			            <select id="search-condition">
				            <option value="title" ${param.condition == 'title' ? 'selected' : '' }>제목</option>
				            <option value="content" ${param.condition == 'content' ? 'selected' : '' }>내용</option>
				            <option value="titleContent" ${param.condition == 'titleContent' ? 'selected' : '' }>제목+내용</option>
			             </select>
						<!--  
						<select id="search-distance">
		    				<option value="">거리별</option>
		    				<option value="2km" ${param.category == '2km' ? 'selected' : '' }>2km 이내</option>
				            <option value="5km" ${param.category == '5km' ? 'selected' : '' }>5km 이내</option>
				            <option value="10km" ${param.category == '10km' ? 'selected' : '' }>10km 이내</option>
    					</select>
						-->
    					
    					<select id="search-distance" onchange="changeDistance(this)">
    						<option value="" ${param.distance==15000? 'selected':'' }>거리선택</option>
    						<option value="2km" ${param.distance==2? 'selected':'' }>2km 이내</option>
    						<option value="5km" ${param.distance==5? 'selected':'' }>5km 이내</option>
    						<option value="10km" ${param.distance==10? 'selected':'' }>10km 이내</option>
    					</select>
    					

	                    <input id="search-input" type="text" placeholder="Search" value="${pc.paging.keyword }">
	                  
	                    <button type="button" class="btn" aria-label="Left Align" id="searchBtn">
	                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
	                    </button>
	                </div>

                <div class="row margin-top-5">
                    <table class="table table-hover table-responsive">
                    
                        <thead class="bg-info">
                            <tr>
                                <th scope="col" class="text-center">번호</th>
                                <th scope="col" class="text-center">장소명</th>
                                <th scope="col" class="text-center">주소</th>
                                <th scope="col" class="text-center">글쓴이</th>
                                <th scope="col" class="text-center">날짜</th>
                                <th scope="col" class="text-center">조회</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        	<c:forEach var="vo" items="${placeList}">
                        		<tr onclick="location.href='<c:url value="/placeBoard/placeDetail?pbNum=${vo.pbNum}" />'">
	                                <td>${vo.pbNum}</td>
	                                <td>
	                                	<a href="<c:url value='/placeBoard/placeDetail?pbNum=${vo.pbNum}&pageNum=${pc.paging.pageNum}&keyword=${pc.paging.keyword}&condition=${pc.paging.condition}' />">[${vo.pbCategory}] ${vo.pbTitle}</a>
	                                	&nbsp;&nbsp;&nbsp;
	                                </td>
	                                <td>${vo.pbAddrBasic}</td>
	                                <td>${vo.memberNum}</td>
	                                <td><fmt:formatDate value="${vo.pbRegDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                                <td>${vo.pbLookCount}</td> 
	                            </tr>
                        	</c:forEach>
                        </tbody>

                    </table>
                </div>
                    


                <div class="row" align="right">													
                    <button type="button" id="write" class="btn btn-outline-primary float-right"  onclick="location.href='<c:url value='/placeBoard/placeWrite' />' "><b>새 장소 등록</b></button>
                </div>
                
				<!-- 페이징 -->
				<div class="row text-center">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination">
	                      <c:if test="${pc.prev}">
		                    <li class="page-item"><a class="page-link" href="<c:url value='/placeBoard/placeList?pageNum=${pc.beginPage-1}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}' />">Prev</a></li>
	                      </c:if>
	                      
	                      <c:forEach var="page" begin="${pc.beginPage}" end="${pc.endPage}">
	                      	<li class="page-item"><a class="page-link" href="<c:url value='/placeBoard/placeList?pageNum=${page}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}' />">${page}</a></li>
	                      </c:forEach>
	               
	                      
	                      <c:if test="${pc.next}">
		                    <li class="page-item"><a class="page-link" href="<c:url value='/placeBoard/placeList?pageNum=${pc.endPage+1}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}' />">Next</a></li>
	                      </c:if>
	                    </ul>
	                </nav>
            	</div> 
            	
        </div>



        
        </div>



        <div class="row">
            <%@ include file="../../include/footer.jsp" %>
        </div>
        
    </div>
    


    <script>
	    const msg = '${msg}';
		if(msg === 'registSuccess') {
			alert('정상 등록 처리되었습니다.');
		}
	
     // 종목카테고리 클릭 시 
     $('#allBtn').click(function(){
 		location.href=`<c:url value="/placeBoard/placeList?condition=&keyword=${pc.paging.keyword} " />`
 		});
     $('#swimmingBtn').click(function(){
  		location.href=`<c:url value="/placeBoard/placeList?condition=수영&keyword=${pc.paging.keyword} " />`
  		});
     $('#badmintonBtn').click(function(){
   		location.href=`<c:url value="/placeBoard/placeList?condition=배드민턴&keyword=${pc.paging.keyword} " />`
   		});
     $('#squashBtn').click(function(){
   		location.href=`<c:url value="/placeBoard/placeList?condition=스쿼시&keyword=${pc.paging.keyword} " />`
   		});
     $('#bicycleBtn').click(function(){
   		location.href=`<c:url value="/placeBoard/placeList?condition=자전거&keyword=${pc.paging.keyword} " />`
   		});
     $('#runningBtn').click(function(){
   		location.href=`<c:url value="/placeBoard/placeList?condition=달리기&keyword=${pc.paging.keyword} " />`
   		}); hikingBtn
   	 $('#hikingBtn').click(function(){
   	   	location.href=`<c:url value="/placeBoard/placeList?condition=등산&keyword=${pc.paging.keyword} " />`
   	   	});
   	 $('#trainingBtn').click(function(){
    	location.href=`<c:url value="/placeBoard/placeList?condition=홈트짐트&keyword=${pc.paging.keyword} " />`
    	});
   	 $('#pilatesBtn').click(function(){
     	location.href=`<c:url value="/placeBoard/placeList?condition=필라테스&keyword=${pc.paging.keyword} " />`
     	});
   	 $('#golfBtn').click(function(){
     	location.href=`<c:url value="/placeBoard/placeList?condition=골프&keyword=${pc.paging.keyword} " />`
     	});
   	 $('#skateBtn').click(function(){
     	location.href=`<c:url value="/placeBoard/placeList?condition=스케이트&keyword=${pc.paging.keyword} " />`
     	});
   	 $('#etcBtn').click(function(){
      	location.href=`<c:url value="/placeBoard/placeList?condition=기타&keyword=${pc.paging.keyword} " />`
      	});
   	 
   	// 검색기능 구현 
   	$('#search-btn').click(function() {
			  const condition = $('#search-condition').val();
			  const distance = $('#search-distance').val();
			  const keyword = $('#search-keyword').val();
			  	  
			  location.href = '/wefit/placeBoard/placeList?condition=' + condition + + '&distance=' + distance + + '&keyword=' + keyword;
		  });  
      	  
	 $('#search-input').keyup(function(e){
		 if(e.keyCode == 13) {
    	 	location.href=`<c:url value="/placeBoard/placeList?condition=${pc.paging.condition}&keyword="/>`+$('#search-input').val()
		 }
	 });
	 
	 
	 
	 
     // 글쓰기버튼
     $(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/boardForm";
	 });

     
    //
	function fn_contentView(bid){
		var url = "${pageContext.request.contextPath}/board/getBoardContent";
		url = url + "?bid="+bid;
		location.href = url;
	}

	 // search-distance의 onchange에서 호출하는 함수. 
    function changeDistance(obj){
		 
        if($(obj).val() === ""){
        	location.href=`<c:url value="/placeBoard/placeList?latitude=${loginuser.memberLatitude}&longitude=${loginuser.memberLongitude}&distance=15000&keyword=${pc.paging.keyword} " />`
        } else if($(obj).val() === "2km"){
        	location.href=`<c:url value="/placeBoard/placeList?latitude=${loginuser.memberLatitude}&longitude=${loginuser.memberLongitude}&distance=2&keyword=${pc.paging.keyword} " />`
        } else if($(obj).val() === "5km"){
        	location.href=`<c:url value="/placeBoard/placeList?latitude=${loginuser.memberLatitude}&longitude=${loginuser.memberLongitude}&distance=5&keyword=${pc.paging.keyword} " />`
        } else if($(obj).val() === "10km"){
        	location.href=`<c:url value="/placeBoard/placeList?latitude=${loginuser.memberLatitude}&longitude=${loginuser.memberLongitude}&distance=10&keyword=${pc.paging.keyword} " />`
        }
        
    }

    </script>
    


    
</body>
</html>