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

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
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
                        <h2>물품 등록하기</h2>
                    </div>
                </div>
            </div>

            <!--main left-->

            <form action="<c:url value='/marketBoard/regist' />" id="boardWrite" method="POST" enctype="multipart/form-data">

                <table>
                    <tr>
                        <td>카테고리</td>
                        <td>

                            <select id="mbType" name="mbType">
                                <option value="sell">사요</option>
                                <option value="buy">팔아요</option>
                                <option value="share">나눠요</option>

                                
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>작성자</td>
                        <td>
                        	<input type="text" name="memberNick" size=20 value="${loginuser.memberNick }">
                        	<input type="hidden" name="memberNum" value="${loginuser.memberNum }">
                         </td>

                    </tr>

                    <tr>
                        <td>제목</td>

                        <td><input type="text" name="mbTitle" size="60"></td>

                    </tr>

                    <tr>
                        <td>내용</td>

                        <td><textarea name="mbContent" cols="75" rows="15"></textarea></td>

                    </tr>

                    <tr>
                        <!--
                            다음 주소 api : 주소를 선택하면 지도도 함께 보여주기
                            https://postcode.map.daum.net/guide#sample
                        -->
                        <td>동네</td>
                        <td>
                        	<input type="hidden" id="sample6_postcode" placeholder="우편번호">
							<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
							<input type="text" id="sample6_address" name="mbAddrBasic" placeholder="주소" size="50"><br>
							<input type="hidden" id="sample6_detailAddress" placeholder="상세주소">
							<input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><br>
							
							
							
							
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							    <div class="hAddr">
							        <span class="title">지도중심기준 행정동 주소정보</span>
							        <span id="centerAddr"></span>
							    </div>
							</div>
							
							
							

                        	경도: <input type="text" name="mbLongitude" value="${loginuser.memberLongitude }"><br>
                        	위도: <input type="text" name="mbLatitude" value="${loginuser.memberLatitude }"><br>
                        	<input type="hidden" name="mbImageCount" value="0">
                        	<input type="hidden" name="mbLookCount" value="0">
                        </td>
                    </tr>

                
                    <tr>
                        <td>사진올리기 </td>
                        <td><input multiple="multiple" type="file" name="fileName" size="10"></td>

                    </tr>
                    <tr>
                        <td>가격 </td>
                        <td><input type=text name=mbPrice size="60"></td>

                    </tr>
                    <tr class="text-right">
                        <td colspan="2">
                            <br>
                            <button class="btn btn-primary" type="submit">등록하기</button>
                            <button class="btn btn-default" type="button" onclick="history.back()">취소하기</button>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}

var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log(result);
    }
};

geocoder.addressSearch('', callback);
    
    
</script>

   
</body>

</html>