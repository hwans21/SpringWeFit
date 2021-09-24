<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    


    <style>

        body {
            width: 100%;
        }

        .container {
            height: 1600px;
            position: relative;
        }

        .row>h2 {
            width: 100%;
            margin-top: 90px;
            margin-bottom: 20px;
            padding: 20px 0px 20px 10px;
            font-size: 40px;
            font-weight: bold;
            color: rgb(0, 173, 181);
            border-bottom: 1px solid rgb(0, 173, 181);
        }

        .table {
            border-collapse: collapse;
            margin-top: 50px;
        }

        .table > thead > tr > td {
            background: rgb(220, 221, 221);
            text-align: center;
        }


        .table a img {
            width: 240px;
            height: 220px;
            padding: 5px;
        }

        .table tbody tr td {
            text-align: center;
            border-top-width: 0px;
            border: 1px solid #d9edf7;
        }


        .search-sec {
            float: right;
        }



        .table tr td a {
            text-decoration: none;
            color: darkgrey;

        }

        .table tr td a h2 {
            font-size: 25px;
            color: black;
        }

        .table tr td a h3 {
            font-size: 18px;

        }

        .tools {
            text-align: center;
            
        }

        .header-sec {
            height: 140px;
            
        }
        .footer-sec {
            margin-top: 20px;
        }

        #write {
            position: absolute;
            top: 1455px;
            left: 850px;
        }
        .side_bar {
            position: fixed;
            top: 500px;
            left: 1550px;
        }
    </style>

</head>

<body>

    <!--헤더-->
    
    <div class="header-sec">
        <%@ include file="../../include/header.jsp" %>
    </div>
    
    
    <!-- 메인 -->
    <div class="container">
        

        <div class="row">
            <h2>중고장터 게시판</h2>



            <div class="col-sm-12">
                <table class="table">
                    <thead>
                        <tr>
                            <td colspan="3">
                            
                            	<form action="<c:url value='/marketBoard/market_board' />">
                                <div class="search-sec">
    
                                    <!--검색 조건-->
                              
                                    <select class="search-condition" name="condition">
                                        <option value="title">상품이름</option>
                                    </select>
                    
                                    <!--검색창, 버튼-->
                                    <input type="text" name="keyword" placeholder="Search">
                                    <button type="submit" class="btn" aria-label="Left Align">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    </button>
                    
                                </div>
   								</form>


                            </td>

                        </tr>
                    </thead>
                     
                    
                    
                    <tbody>

						<c:forEach var="product" varStatus="i" items="${product}">
							<c:if test="${i.count % 3 == 1}">
								<tr class="course">
							</c:if>
							<th scope="col" class="text-center"
								onclick="location.href='<c:url value='/marketBoard/market_detail?mbNum=${product.mbNum }' />'">
								<div class=vid>
									<a href="#"><img
										src="/upload/board/market/${product.memberNum }/${product.mbRealImage1}"
										width="280px" height="160px" alt="${product.mbImage1 }"></a>

									<p class="subject">
										<a href="#">${product.mbType}</a><br>
										<a href="#">${product.mbTitle}</a><br>
										<a href="#">가격: ${product.mbPrice }원</a>
									</p>
									<p class="auth">
										<span class="writeday">${product.mbRegDate}</span> <span
											class="nickname">${product.memberNum}</span> <span
											class="glyphicon glyphicon-picture" aria-hidden="true"><b>${product.mbImageCount}</b></span>
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"><b>${product.mbLookCount}</b></span>
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
            <div class="col-sm-2">
                <div class="side_bar"></div>
            </div>


        </div>

        </div>
        <div class="tools">

            <!--글쓰기 버튼-->
            <a href="<c:url value='/marketBoard/market_write' />">
                <button type="button" class="btn btn-outline-primary">
                    	글쓰기

                </button>

            </a>

            <!-- 페이징 버튼-->
			<form action="<c:url value='/marketBoard/market_board' />" name="pageForm">
				<div class="row text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="pagination">
							
							<c:if test="${pc.prev }">
								<li class="page-item">
									<a class="page-link" href="<c:url value='/marketBoard/market_board/?pageNum=${pc.beginPage-1 }&condition=${pc.paging.condition }&keyword=${pc.paging.keyword }' />">이전</a>
								</li>
							</c:if>
	
							<c:forEach var="i" begin="${pc.beginPage}" end="${pc.endPage}">
								<li class="page-item">
									<a href="<c:url value='/marketBoard/market_board?pageNum=${i }&condition=${pc.paging.condition }&keyword=${pc.paging.keyword }' />" >${i }</a>
								</li>
							</c:forEach>
								<c:if test="${pc.next }">
								<li class="page-item">
									<a class="page-link" href="<c:url value='/marketBoard/market_board/?pageNum=${pc.endPage+1 }&condition=${pc.paging.condition }&keyword=${pc.paging.keyword }' />" >다음</a>
								</li>
								</c:if>
						</ul>
					</nav>
				</div>
				    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                    <input type="hidden" name="condition" value="${pc.paging.condition}">
			</form>

        <div class="footer-sec">
            <%@ include file="../../include/footer.jsp" %>
        </div>
    </div>






</body>

</html>


