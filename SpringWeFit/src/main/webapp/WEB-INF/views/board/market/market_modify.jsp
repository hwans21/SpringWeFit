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
                        <h2>물품 수정</h2>
                    </div>
                </div>
            </div>

            <!--main left-->
            <form action="<c:url value='/marketBoard/update'/>" id="boardModify" method="POST" enctype="multipart/form-data">
                <table>
                    <tr>
                    	
                        <td>카테고리</td>
                        <td>
                            <select id="mbType" name="mbType">
                                <option value="buy"${detail.mbType == 'buy' ? 'selected' : '' }>사요</option>
                                <option value="sell"${detail.mbType == 'sell' ? 'selected' : '' }>팔아요</option>
                                <option value="share"${detail.mbType == 'share' ? 'selected' : '' }>나눠요</option>
                                
                            </select>
                        </td>
                    </tr>
					<tr>
                    <td><input type="hidden" name="mbNum" value="${detail.mbNum }"></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><input type=text name="memberNum" size=20 value="${detail.memberNum }" readonly> </td>
                    </tr>

                    <tr>
                        <td>제목</td>
                        <td><input type=text name="mbTitle" size="60" value="${detail.mbTitle }"></td>
                    </tr>

                    <tr>
                        <td>내용</td>
                        <td><textarea name="mbContent" cols="75" rows="15">${detail.mbContent }</textarea></td>
                    </tr>

                    <tr>
                        <!--
                            다음 주소 api : 주소를 선택하면 지도도 함께 보여주기
                            https://postcode.map.daum.net/guide#sample
                        -->
                        <td>동네</td>
						<td>
							주소 기본 <input type="text" name="mbAddrBasic" value="${detail.mbAddrBasic }"> <br>
							주소 상세 <input type="text" name="mbAddrDetail" value="${detail.mbAddrDetail }"> <br>
							경도 <input type="text" name="mbLongitude" value="${detail.mbLongitude }"> <br>
							위도 <input type="text" name="mbLatitude" value="${detail.mbLatitude }"><br>
							이미지 수<input type="text" name="mbImageCount" value="${detail.mbImageCount }"> <br>
							조회 수<input type="text" name="mbLookCount" value="${detail.mbLookCount }"><br>
						</td>
                    </tr>

                
                    <tr>
                        <td>사진올리기 </td>
                        <td><input type="file" name="fileName" size="10" maxlength="10"></td>
                    </tr>
                    <tr>
                        <td>가격 </td>
                        <td><input type=text name="mbPrice" size="60" value="${detail.mbPrice }"></td>
                    </tr>
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <input type="submit" class="btn btn-primary" value="수정하기">
                            <button type="button" class="btn btn-primary" onclick="location.href='<c:url value="/marketBoard/delete?mbNum=${detail.mbNum }" />'">삭제하기</button>
                            <button type="button" class="btn btn-default" onclick="history.back()">취소하기</button>
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


    
</body>

</html>