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
               
    			<div class="distance-area">
    				<select id="dis-select">
	    				<option value="">거리별</option>
	    				<option value="2km" ${param.category == '2km' ? 'selected' : '' }>2km 이내</option>
			            <option value="5km" ${param.category == '5km' ? 'selected' : '' }>5km 이내</option>
			            <option value="10km" ${param.category == '10km' ? 'selected' : '' }>10km 이내</option>
    				</select>
    			</div>
    			
				<!-- 지역 select
                <div id="btn-list" class="row" align="left">
                    
                    <form name="loc-select">
                        <select class="selectpicker" data-style="btn-info" onChange="cat1_change(this.value,h_area2)" >
                            <option>시/도(select)</option>
                            <option value='1'>서울특별시</option>
                            <option value='2'>부산광역시</option>
                            <option value='3'>대구광역시</option>
                            <option value='4'>인천광역시</option>
                            <option value='5'>광주광역시</option>
                            <option value='6'>대전광역시</option>
                            <option value='7'>울산광역시</option>
                            <option value='8'>세종특별자치시</option>
                            <option value='9'>경기도</option>
                            <option value='10'>강원도</option>
                            <option value='11'>충청북도</option>
                            <option value='12'>충청남도</option>
                            <option value='13'>전라북도</option>
                            <option value='14'>전라남도</option>
                            <option value='15'>경상북도</option>
                            <option value='16'>경상남도</option>
                            <option value='17'>제주도</option>
                        </select>
                
                        <select name="h_area2">
                            <option>시/구/군(select)</option>
                            <option value='18'>강남구</option>
                            <option value='19'>강동구</option>
                            <option value='20'>강북구</option>
                            <option value='21'>강서구</option>
                            <option value='22'>관악구</option>
                            <option value='23'>광진구</option>
                            <option value='24'>구로구</option>
                            <option value='25'>금천구</option>
                            <option value='26'>노원구</option>
                            <option value='27'>도봉구</option>
                            <option value='28'>동대문구</option>
                            <option value='29'>동작구</option>
                            <option value='30'>마포구</option>
                            <option value='31'>서대문구</option>
                            <option value='32'>서초구</option>
                            <option value='33'>성동구</option>
                            <option value='34'>성북구</option>
                            <option value='35'>송파구</option>
                            <option value='36'>양천구</option>
                            <option value='37'>영등포구</option>
                            <option value='38'>용산구</option>
                            <option value='39'>은평구</option>
                            <option value='40'>종로구</option>
                            <option value='41'>중구</option>
                            <option value='42'>중랑구</option>
                        </select>
                
                        <script language=javascript>
                        
                            var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17);
                            var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
                            
                            var cat2_num = new Array();
                            var cat2_name = new Array();
                            
                            cat2_num[1] = new Array(18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42);
                            cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
                            
                            cat2_num[2] = new Array(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58);
                            cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
                            
                            cat2_num[3] = new Array(59,60,61,62,63,64,65,66);
                            cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
                        
                            cat2_num[4] = new Array(67,68,69,70,71,72,73,74,75,76);
                            cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
                            
                            cat2_num[5] = new Array(77,78,79,80,81);
                            cat2_name[5] = new Array('광산구','남구','동구','북구','서구');
                            
                            cat2_num[6] = new Array(82,83,84,85,86);
                            cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');
                            
                            cat2_num[7] = new Array(87,88,89,90,91);
                            cat2_name[7] = new Array('남구','동구','북구','중구','울주군');
                            
                            cat2_num[8] = new Array(92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109);
                            cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
                            
                            cat2_num[9] = new Array(110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149);
                            cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
                            
                            cat2_num[10] = new Array(150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169);
                            cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
                            
                            cat2_num[11] = new Array(170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193);
                            cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
                            
                            cat2_num[12] = new Array(194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215);
                            cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
                            
                            cat2_num[13] = new Array(216,217,218,219,220,221,222,223,224,225,226,227,228,229,230);
                            cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
                            
                            cat2_num[14] = new Array(231,232,233,234);
                            cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');
                            
                            cat2_num[15] = new Array(235,236,237,238,239,240,241,242,243,244,245,246,247,248,249);
                            cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
                            
                            cat2_num[16] = new Array(250,251,252,253,254,255,256,257,258,259,260,261);
                            cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
                    
                    
                        function cat1_change(key,sel){
                        if(key == '') return;
                        var name = cat2_name[key];
                        var val = cat2_num[key];
                        
                        for(i=sel.length-1; i>=0; i--)
                        sel.options[i] = null;
                        sel.options[0] = new Option('-선택-','', '', 'true');
                        for(i=0; i<name.length; i++){
                            sel.options[i+1] = new Option(name[i],val[i]);
                            }
                        }
                
                        </script>
                    </form>
                </div>
				-->
				
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
					
					
						<select id="dis-select">
		    				<option value="">거리별</option>
		    				<option value="2km" ${param.category == '2km' ? 'selected' : '' }>2km 이내</option>
				            <option value="5km" ${param.category == '5km' ? 'selected' : '' }>5km 이내</option>
				            <option value="10km" ${param.category == '10km' ? 'selected' : '' }>10km 이내</option>
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
	
     // 카테고리 클릭 시 
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
   	 
   	// 검색버튼 
   	 $('#searchBtn').click(function(){
	   	 location.href=`<c:url value="/placeBoard/placeList?condition=${pc.paging.condition}&keyword="/>`+$('#search-input').val()
	 });
	 $('#search-input').keyup(function(e){
		 if(e.keyCode == 13) {
    	 	location.href=`<c:url value="/placeBoard/placeList?condition=${pc.paging.condition}&keyword="/>`+$('#search-input').val()
		 }
	 });
	 
	 
     //
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


    </script>
    


    
</body>
</html>