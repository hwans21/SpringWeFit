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
                                <div class="search-sec">
    
                                    <!--검색 조건-->
                                    <select name="" id="" class="select-sec">
                                        <option value="">삽니다</option>
                                        <option value="">팝니다</option>
                                        <option value="">나눔해요</option>
                                    </select>
                                    <select class="search-condition">
                                        <option>상품이름</option>
                                        <option>작성자</option>
                                    </select>
                    
                                    <!--검색창, 버튼-->
                                    <input type="text" id="search" placeholder="Search">
                                    <button type="button" class="btn" aria-label="Left Align">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    </button>
                    
                                </div>
   


                            </td>

                        </tr>
                    </thead>
                     
                    <tr>

                    
                    	<c:forEach var="product" items="${product }">
                        <td>
                            <img src="${pageContext.request.contextPath }/resource/img/${product.mbImage1 }" alt="" class="">
                            <h2><a href="<c:url value='/marketBoard/market_detail?mbNum=${product.mbNum }'/>">[${product.mbType}]${product.mbTitle }</a></h2>
                           
                            <h3>${product.mbPrice }</h3>
                            <br>
                            <h3>아이디<br>${product.mbAddrBasic }</h3>
                        </td>
                        </c:forEach>
                        

                    </tr>
                     

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
            <div class="paging">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                      </ul>
                </nav>



        </div>

        <div class="footer-sec">
            <%@ include file="../../include/footer.jsp" %>
        </div>
    </div>






</body>

</html>


