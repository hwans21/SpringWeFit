<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<body>
	<style>
	
		
		.col-md-6 h2 {
			color: rgb(0, 173, 181);
		}
		
		.col-md-12 h2 {
			color: rgb(0, 173, 181);
		}
        
        
        .section{
            height: 1200px;
        }
        .sidebar{
            background-color: yellow;
            position: fixed;
            right: 15px ;
            top: 250px;
        }
        .section .main_img {
            width: 100%;
           /*  height: 400px; */
        }
        .carousel-inner .item {
            vertical-align: middle;
            width: 100%;
            height: 360px;
        }

        .carousel-inner .item img {
            max-width:100%; 
            max-height:100%;
            display:inline-block;
            vertical-align:middle;
        }

        .item h3{
            color: black;
            font-weight: bold;
            font-size: 24px;
            line-height: 30px;
        }

        .container {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 800px;
        }
        
        .glyphicon-bullhorn {        
        	margin-right: 2px;
        	color: #a8a89e;
        }

		.reply {
			font-size: 8px;		
		}
		
		
		


        .vid .video {
            /* border: 1px solid #fff; */
            background: #fff;
            
            cursor: pointer;
        }


        .subject {
        	height: 20px;
            margin-top: 10px;
        }

        .auth {
            text-align: left;
            font-size: 10px;
            padding: 0 13px;
            overflow: hidden;
            margin: 5px 0 0 0;
        }

        .auth span {
            float: right;
            font-size: 10px;
            padding-left: 22px;
            
            position: relative;
            top: 4px;
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
        
		.inactvie {		
			display : none;
		}
		
		h2 > .btn-light  {			
			float: right;
			background-color: rgb(0, 173, 181);
			color: #fff;
			opacity: 50%;
		}
		
		#diet > h2 {
			overflow: hidden;
		}
		
		#market > h2 {
			overflow: hidden;
		}
		
		#diet {
			border-right: 1px solid #ccc;			
		}
		
		.container > .secondary {
			margin-top: 130px;
			padding : 10px;
		}
		
		.container > .third {
			margin-top: 10px;
		}
		
		.title {
			font-weight: bold;
			margin: 0 3px 15px 3px;
		}
		
		.category {
			overflow: hidden;
			margin: 3px;
		}
		
		.icon {
			float: right;
		}
		
		.notice > .well {
			padding-bottom: 140px;
		}
		
		.sentence {
			margin-bottom: 17px;
		}



    </style>
    
    <div class="container-fluid h-100">

        <div class="row">
            <%@ include file="include/header.jsp" %>
        </div>

        <div class="row"> 
            <div class="section">

                <div class="container">
                
	                <div class="col-md-12">
	                    <img src="${pageContext.request.contextPath }/resources/img/main/main.png" alt="main" width="100%" class="main_img">
	                </div>
                    
                    
                    <div class="row secondary">
	                    <div id="diet" class="col-md-6">
		                   <h2>오늘먹은식단<button type="button" id="dietBtn" class="btn btn-light">></button></h2>
		                   
		                   <table class="table">
					           <tbody>
					           		
			            		<c:forEach var="arr" varStatus="i" items="${dietlist }">
			            			<c:if test="${i.count % 4 == 3 }">
						            	<tr class="diet hidden inactive">
			            			</c:if>
			            			<c:if test="${i.count % 4 == 1 }">
						            	<tr class="diet">
			            			</c:if>
						            		<td scope="col" class="text-center">				            			
				                                  <div class="vid">                               
				                                      <div class="video" onclick="location.href='<c:url value="/dietBoard/dietDetail?dbNum=${arr.dbNum }" />'">
				                                      		<c:if test="${arr.dbRealImage1 != null }">
																<img
																	src="/upload/board/diet/${arr.memberNick}/${arr.dbRealImage1}"
																	width="200px" height="150px" alt="vid01">
															</c:if>
															<c:if test="${arr.dbRealImage1 == null }">
																<img
																	src="${pageContext.request.contextPath }/resources/img/logo/logo.png"
																	width="200px" height="150px" alt="vid01">
															</c:if>
				                                      
				                                          <p class="subject"><a href="<c:url value="/dietBoard/dietDetail?dbNum=${arr.dbNum }" />">${arr.dbTitle }</a></p>
				                                          <p class="auth">${arr.memberNick } &nbsp;&nbsp;
				                                          	  <small class="writeday"><fmt:formatDate value="${arr.dbRegDate }" pattern="MM.dd" /></small>  
				                                              <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>${arr.drCount }</b></span>
				                                              <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>${arr.dbLookCount }</b></span>
				                                          	  
				                                          </p>
				                                      </div>
				                                  </div>
						            		</td>
						            		<c:if test="${i.count%2==0 }">
								            	</tr>
						            		
						            		</c:if>
					            		 </c:forEach>
					           </tbody>         
	            			</table>
		                </div>
		                
		                
	                    
	                    <div id="market" class="col-md-6">
		                   <h2>장터<button type="button" id="marketBtn" class="btn btn-light">></button></h2>
		                   
		                   <table class="table">
					           <tbody>
				           		<c:forEach var="arr" varStatus="i" items="${marketlist }">
			            			<c:if test="${i.count % 4 == 3 }">
						            	<tr class="market hidden inactive">
			            			</c:if>
			            			<c:if test="${i.count % 4 == 1 }">
						            	<tr class="market">
			            			</c:if>
				            		<td scope="col" class="text-center">				            			
		                                  <div class="vid">                               
		                                      <div class="video" onclick="location.href='<c:url value="/marketBoard/market_detail?mbNum=${arr.mbNum }&pageNum=1&keyword=&condition=" />'">
		                                      		<c:if test="${arr.mbRealImage1 != null }">
														<img
															src="/upload/board/market/${arr.memberNum}/${arr.mbRealImage1}"
															width="200px" height="150px" alt="vid01">
													</c:if>
													<c:if test="${arr.mbRealImage1 == null }">
														<img
															src="${pageContext.request.contextPath }/resources/img/logo/logo.png"
															width="200px" height="150px" alt="vid01">
													</c:if>
		                                      
		                                          <p class="subject"><a href="<c:url value="/dietBoard/dietDetail?dbNum=${arr.mbNum }" />">${arr.mbTitle }</a></p>
		                                          <p class="auth">${arr.memberNick } &nbsp;&nbsp;
		                                          	  <small class="writeday"><fmt:formatDate value="${arr.mbRegDate }" pattern="MM.dd" /></small>  
		                                              <span class="glyphicon glyphicon-comment" aria-hidden="true"><b>${arr.mbReplyCount }</b></span>
		                                              <span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>${arr.mbLookCount }</b></span>
		                                          	  
		                                          </p>
		                                      </div>
		                                  </div>
				            		</td>
				            		<c:if test="${i.count%2==0 }">
						            	</tr>
				            		</c:if>
		            		 	</c:forEach>
					            	
					           </tbody>         
	            			</table>
		                </div>      
	               </div> <!-- end secondary -->
	             
	             <div class="row third">   
				    
				    <div class="col-md-9">
				    	<div class="col-md-12">
		                   <h2>운동강의</h2>
		                   
		                   <table class="table">
					           <tbody>
					           		<c:forEach items="${courselist }" var="arr" varStatus="i">
					           			<c:if test="${i.count % 2 == 1 }">
					           				<tr>
					           			</c:if>
					           			<td>
					            			<div class="row">				            			
						            			<div class="col-md-5"><a href="<c:url value="/courseBoard/detail?cbNum=${arr.cbNum}&pageNum=1&category=&condition=&keyword=" />">
						            			<img src="https://img.youtube.com/vi/${arr.cbYouCode}/mqdefault.jpg" width="170px" alt="" /></a></div>
						            			<div class="col-md-7">
						            				<p class="title"><a href="<c:url value="/courseBoard/detail?cbNum=${arr.cbNum}&pageNum=1&category=&condition=&keyword=" />">${arr.cbTitle }</a></p>	
						            				<div class="category">${arr.cbCategory }
						            					<span class="icon">
						            						<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>${arr.cbLookCount }</b></span>&nbsp;&nbsp;&nbsp;&nbsp;
			                                            	<span class="glyphicon glyphicon-comment" aria-hidden="true"><b>${arr.crCount }</b></span>                                                                                       	  
			                                       		</span>
			                                        </div>
							            		</div>
					            			</div>
					            		</td>
					           			
					           			<c:if test="${i.count % 2 == 0 }">
					           				</tr>
					           			</c:if>
					           		</c:forEach>
					            	
					           </tbody>         
	            			</table>
		                </div>
				    	
				    	<div class="row">    
				    	    <div class="col-md-6">								
								<div class="col-md-12">
				                   <h2>자유게시판</h2>
				                   
				                   <table class="table">
							           <tbody>
							            	<tr>
												<td class="col-md-3">[소식/정보]</td>
												<td class="col-md-7"><a href="#">운동 잘 하고 계시나요? <span class="reply">[1]</span></a></td>
												<td class="col-md-2">10.01</td>
							            	</tr>
							            	<tr>
							            		<td>[자유글]</td>
							            		<td><a href="#">요요가 왔어요...ㅜ</a></td>
							            		<td>09.30</td>
							            	</tr> 
							                <tr>
							            		<td>[홍보]</td>
							            		<td><a href="#">크로스핏트루 오픈!</a></td>
							            		<td>09.30</td>
							            	</tr>
							      		    <tr>
							            		<td>[꿀팁]</td>
							            		<td><a href="#">운동, 오늘 갈지 말지 고민된다면? <span class="reply">[5]</span></a></td>
							            		<td>09.27</td>
							            	</tr>  
							            	<tr>
							            		<td>[소식/정보]</td>
							            		<td><a href="#">여기로 모여주세요 <span class="reply">[13]</span></a></td>
							            		<td>09.26</td>
							            	</tr>  
							           </tbody>         
			            			</table>
				                </div>
				            
				            </div>
				            
				            <div class="col-md-6">
								<!-- <h2>광고</h2> -->
								<img src="${pageContext.request.contextPath }/resources/img/main/main4.jpg" alt="" style="width:100%;">
			                    
				            </div>
				   		
				   		</div>
				    </div>
				        

			           
				    <div class="col-md-3 notice">
				        <div class="well">
				        	<h4>공지사항</h4>
				        	
				        	<br />
					        
					        <p class="sentence">
				            	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
				            	<span class="notice"><a href="#">지헬스 체지방 측정기 체험단 모집(09.27~10.08)</a></span>
				            </p>
					        
					        <p class="sentence">
					        	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
					        	<span class="notice"><a href="#">10월 배송일정 및 고객센터 업무 안내</a></span>				           
				            </p>	            
				            
				            <p class="sentence">
				            	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
				            	<span class="notice"><a href="#">9월 추석연휴 배송일정 및 고객센터 업무 안내</a></span>				            
				            </p>
				            
				            <p class="sentence">
				            	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
				            	<span class="notice"><a href="#">개인정보처리방침 6차 개정 안내</a></span>
				            </p>				         
				            
				            <p class="sentence">	
				            	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>		            
				            	<span class="notice"><a href="#">택배 노조 파업으로 인한 일부 지역 출고 지연 안내</a></span>
				            </p>
				            
				            <p class="sentence">
				            	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>		            
				            	<span class="notice"><a href="#">오늘은현미밥 이벤트 발표</a></span>
				            </p> 
				            
				            <p class="sentence">
				            	<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>		            
				            	<span class="notice"><a href="#">오늘은현미밥 체험단 모집(08.09~08.16)</a></span>
  							</p>


				        </div>
				    </div>
	              </div> 
                    
                  </div> <!-- end container -->

            </div> <!--  end section -->
            
            
            
        </div> <!-- end row -->



        <div class="row">
            <%@ include file="include/footer.jsp" %>
        </div>
		
        
    </div>
    
</body>

<script>
	$(function() { //start jQuery
		
		$('#dietBtn').click(function (){
			$(".diet").toggleClass("hidden inactive");			
		}); //dietBtn 클릭 이벤트 끝
		
		$('#marketBtn').click(function (){
			$(".market").toggleClass("hidden inactive");			
		}); //marketBtn 클릭 이벤트 끝
		
	}); //end jQuery
</script>
</html>