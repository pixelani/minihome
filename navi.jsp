<!--  최병훈 : 2024.01.29 PM 02:30 수정 -->


<%-- 이영준(1/23 12:00) --%>
<%-- 최병훈 Category Menupan  메뉴링크 수정 01.23. 17:38 --%> 
<%-- 최병훈 전체링크 수정 01.24. 05:20 --%> 
<%-- 최병훈 (01/25. 08:30 - file/link 재설정, class수정) --%> 
<%-- 최병훈 (01/25. 10:02 - category alt="숫자로 변경") --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#store_list tr{
	border-bottom: 1px solid #eee;
}


</style>
<!-- 백상희 수정 : 20240126 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69bce271416004cb8d851f7b18a22898&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 백상희 :20240126 수정 시작 -->
<script type="text/javascript">
	
var data;	
var map;
var lat = parseFloat("${lat}");
var lon = parseFloat("${lon}");

$(document).ready(function(){
	
	$("#map_container").hide();
	
		
	$("#menu_box img").click(function(){
						
		$("#map_container").show();
		$("#intro_banner").hide();
		
		//alert($(this).prop("src"));
		let food_category_name = $(this).prop("alt");
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };
		
		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	    var mapTypeControl = new kakao.maps.MapTypeControl();

	    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	    var zoomControl = new kakao.maps.ZoomControl();
	    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(lat, lon); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
	    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'
        });
        infowindow.open(map, marker);
		
		/* 가게 리스트 부분  */
		
		let indsMclsCode;
		
		if(food_category_name=="식료품") 
			indsMclsCode = "G205";
		else if(food_category_name=="한식")
			indsMclsCode = "I201";
		else if(food_category_name=="중식")
			indsMclsCode = "I202";
		else if(food_category_name=="일식")
			indsMclsCode = "I203";
		else if(food_category_name=="양식")
			indsMclsCode = "I204";
		else if(food_category_name=="아시안")
			indsMclsCode = "I205";
		else if(food_category_name=="야식")
			indsMclsCode = "I211";
		else if(food_category_name=="분식")
			indsMclsCode = "I210";
		else if(food_category_name=="디저트")
			indsMclsCode = "I212";
		
		 				
				$.ajax({
					url : "seller/search.do",
					data : {"cx" : lon, 
							"cy" : lat, 
							"indsMclsCode" : indsMclsCode
					},
					dataType : "json",
					 success: function(res_data) {
					
						//console.log(res_data);
						data = res_data;
					 
						show_markers();
	 
						let htmlString = '<div class="container" id="store_list"><table class="table table-bordered table-hover col-md-6"><thead class="thead-dark"><tr><th colspan="4"><label style="font-size: 1.2em; font-weight: bold;">가까운 가게리스트 10</label></th></tr><tr><th scope="col">번호</th><th scope="col">음식 카테고리명</th><th scope="col">가게 이름</th><th scope="col">도로명 주소</th></tr></thead><tbody>';

			        $.each(res_data, function(index, obj) {
				            htmlString += '<tr>';
				            htmlString += '<td>' + (index+1) + '</td>';
				            htmlString += '<td>' + obj.indsMclsNm + '</td>';
				            htmlString += '<td>' + obj.bizesNm + '</td>';
				            htmlString += '<td>' + obj.rdnmAdr + '</td>';
				            htmlString += '</tr>';
				        });

				        htmlString += '</table>';

				        $("#store_display").html(htmlString);

				    },
					error: function(err){
						alert(err.responseText);
					}
				});//ajax end
				
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				function show_markers(){
					
					 // for문 돌려서 좌표와 이름 구하기
				 	for (let i = 0; i < data.length; i++) {
						//좌표찍기
						
						// 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
											    
					    // 마커를 생성합니다
					    var marker1 = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: new kakao.maps.LatLng(data[i].lat, data[i].lon), // 마커를 표시할 위치
					        title : data[i].bizesNm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					    
					 	// 인포윈도우로 장소에 대한 설명을 표시합니다
			   	        var infowindow = new kakao.maps.InfoWindow({
			   	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + data[i].bizesNm + '</div>'
			   	        });
			   	        infowindow.open(map, marker1);

					}// for end				      
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				 		map.setCenter(new kakao.maps.LatLng(lat, lon));
				}// end: show_markers()
				
				var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
			    var centerPosition; // 원의 중심좌표 입니다
			    var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
			    var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
			    var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
			    var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

			    var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다
			
			 // 지도에 클릭 이벤트를 등록합니다
			    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			            
			        // 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
			        if (!drawingFlag) {    
			            
			            // 상태를 그리고있는 상태로 변경합니다
			            drawingFlag = true; 
			            
			            // 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
			            centerPosition = mouseEvent.latLng; 

			            // 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
			            if (!drawingLine) {
			                drawingLine = new kakao.maps.Polyline({
			                    strokeWeight: 3, // 선의 두께입니다
			                    strokeColor: '#00a0e9', // 선의 색깔입니다
			                    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			                    strokeStyle: 'solid' // 선의 스타일입니다
			                });    
			            }
			            
			            // 그려지고 있는 원을 표시할 원 객체를 생성합니다
			            if (!drawingCircle) {                    
			                drawingCircle = new kakao.maps.Circle({ 
			                    strokeWeight: 1, // 선의 두께입니다
			                    strokeColor: '#00a0e9', // 선의 색깔입니다
			                    strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			                    strokeStyle: 'solid', // 선의 스타일입니다
			                    fillColor: '#00a0e9', // 채우기 색깔입니다
			                    fillOpacity: 0.2 // 채우기 불투명도입니다 
			                });     
			            }
			            
			            // 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
			            if (!drawingOverlay) {
			                drawingOverlay = new kakao.maps.CustomOverlay({
			                    xAnchor: 0,
			                    yAnchor: 0,
			                    zIndex: 1
			                });              
			            }
			        }
			        });

			    // 지도에 마우스무브 이벤트를 등록합니다
			    // 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
			    kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {
			            
			        // 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
			        if (drawingFlag) {

			            // 마우스 커서의 현재 위치를 얻어옵니다 
			            var mousePosition = mouseEvent.latLng; 
			            
			            // 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
			            var linePath = [centerPosition, mousePosition];     
			            
			            // 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
			            drawingLine.setPath(linePath);
			            
			            // 원의 반지름을 선 객체를 이용해서 얻어옵니다 
			            var length = drawingLine.getLength();
			            
			            if(length > 0) {
			                
			                // 그려지고 있는 원의 중심좌표와 반지름입니다
			                var circleOptions = { 
			                    center : centerPosition, 
			                radius: length,                 
			                };
			                
			                // 그려지고 있는 원의 옵션을 설정합니다
			                drawingCircle.setOptions(circleOptions); 
			                    
			                // 반경 정보를 표시할 커스텀오버레이의 내용입니다
			                var radius = Math.round(drawingCircle.getRadius()),   
			                content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';
			                
			                // 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
			                drawingOverlay.setPosition(mousePosition);
			                
			                // 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
			                drawingOverlay.setContent(content);
			                
			                // 그려지고 있는 원을 지도에 표시합니다
			                drawingCircle.setMap(map); 
			                
			                // 그려지고 있는 선을 지도에 표시합니다
			                drawingLine.setMap(map);  
			                
			                // 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
			                drawingOverlay.setMap(map);
			                
			            } else { 
			                
			                drawingCircle.setMap(null);
			                drawingLine.setMap(null);    
			                drawingOverlay.setMap(null);
			                
			            }
			        }     
			    });     

			    // 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
			    // 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
			    // 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
			    kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

			        if (drawingFlag) {

			            // 마우스로 오른쪽 클릭한 위치입니다 
			            var rClickPosition = mouseEvent.latLng; 

			            // 원의 반경을 표시할 선 객체를 생성합니다
			            var polyline = new kakao.maps.Polyline({
			                path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
			                strokeWeight: 3, // 선의 두께 입니다
			                strokeColor: '#00a0e9', // 선의 색깔입니다
			                strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			                strokeStyle: 'solid' // 선의 스타일입니다
			            });
			            
			            // 원 객체를 생성합니다
			            var circle = new kakao.maps.Circle({ 
			                center : centerPosition, // 원의 중심좌표입니다
			                radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
			                strokeWeight: 1, // 선의 두께입니다
			                strokeColor: '#00a0e9', // 선의 색깔입니다
			                strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			                strokeStyle: 'solid', // 선의 스타일입니다
			                fillColor: '#00a0e9', // 채우기 색깔입니다
			                fillOpacity: 0.2  // 채우기 불투명도입니다 
			            });
			            
			            var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
			                content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다

			            
			            // 반경정보를 표시할 커스텀 오버레이를 생성합니다
			            var radiusOverlay = new kakao.maps.CustomOverlay({
			                content: content, // 표시할 내용입니다
			                position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
			                xAnchor: 0,
			                yAnchor: 0,
			                zIndex: 1 
			            });  

			            // 원을 지도에 표시합니다
			            circle.setMap(map); 
			            
			            // 선을 지도에 표시합니다
			            polyline.setMap(map);
			            
			            // 반경 정보 커스텀 오버레이를 지도에 표시합니다
			            radiusOverlay.setMap(map);
			            
			            // 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
			            var radiusObj = {
			                'polyline' : polyline,
			                'circle' : circle,
			                'overlay' : radiusOverlay
			            };
			            
			            // 배열에 추가합니다
			            // 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
			            circles.push(radiusObj);   
			        
			            // 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
			            drawingFlag = false;
			            
			            // 중심 좌표를 초기화 합니다  
			            centerPosition = null;
			            
			            // 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
			            drawingCircle.setMap(null);
			            drawingLine.setMap(null);   
			            drawingOverlay.setMap(null);
			        }
			    });    
			        
			    // 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
			    $("#remove_circles").click(function(){         
		        for (var i = 0; i < circles.length; i++) {
		            circles[i].circle.setMap(null);    
		            circles[i].polyline.setMap(null);
		            circles[i].overlay.setMap(null);
		        }         
		        circles = [];
		    }) 

			    // 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
			    // 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
			    // HTML Content를 만들어 리턴하는 함수입니다
			    function getTimeHTML(distance) {

			        // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			        var walkkTime = distance / 67 | 0;
			        var walkHour = '', walkMin = '';
	
			        // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			        if (walkkTime > 60) {
			            walkHour = '<span id="radius_number" class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			        }
			        walkMin = '<span id="radius_number" class="number">' + walkkTime % 60 + '</span>분'
	
			        // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			        var bycicleTime = distance / 227 | 0;
			        var bycicleHour = '', bycicleMin = '';
	
			        // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			        if (bycicleTime > 60) {
			            bycicleHour = '<span id="radius_number" class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
			        }
			        bycicleMin = '<span id="radius_number" class="number">' + bycicleTime % 60 + '</span>분'
	
			        // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			        var content = '<ul id="radius_info" class="info">';
			        content += '    <li>';
			        content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
			        content += '    </li>';
			        content += '    <li>';
			        content += '        <span class="label">도보</span>' + walkHour + walkMin;
			        content += '    </li>';
			        content += '    <li>';
			        content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
			        content += '    </li>';
			        content += '</ul>'
	
			        return content;
		    }// end : getTimeHTML(distance)
			    
			    
			    
			    

	
	})// mouse click event end
	
})
		
</script>
<!-- 백상희 :20240126 수정 끝 -->
</head>

<body>

    <%-- 이영준(2/23 12:00) 등록 클릭 시(onclick) 다음 API연결 --%>	
	<%@ include file='addr_reg.jsp' %> 


 	
    <nav class="navbar navbar-expand-md sticky-top navbar-shrink py-3 navbar-light bg_e" id="mainNav">
        <div class="container">
		

			<button disabled="disabled" id="btn_location" class="btn btn_e" type="button" onclick="find_addr();" style="opacity: 0">등록</button>
	        <input type="text" disabled="disabled" id="location" class="nav_loc" placeholder="현재 위치" value="${user.user_order_addr}" style="opacity: 0">
			<!-- /// End: 2024.01.29 최병훈 세션정보 없을때 disable -->

		
		
        
                       
        <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1">
        <span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto navbar-expand-sd">
                <!-- 최병훈 01.24 AM 05:21 링크수정 -->
                <!-- 백상희 : 20240124 경로 수정 -->
                <!-- 20240125 href/class 수정 css파일다시 받으세용~ -->
                    <li class="nav-item"><a class="c" href="${ pageContext.request.contextPath }/main.do"><img src="${ pageContext.request.contextPath }/assets/img/dongne_logo.png" alt="Home"></a></li>
                    
                    <!-- 최병훈 01.29 Menu hidden 
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/seller/menu.jsp"><img src="${ pageContext.request.contextPath }/assets/img/clipboard.svg" alt="Menu"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/review/review.jsp"><img src="${ pageContext.request.contextPath }/assets/img/pen-tool.svg" alt="review"></a></li>
                    <li class="nav-item"><a class="btn_m c" href="${ pageContext.request.contextPath }/contacts.jsp"><img src="${ pageContext.request.contextPath }/assets/img/message-circle.svg" alt="qna"></a></li>
                    -->
                </ul>
                
                <!-- 백상희 20240124 수정 시작-->
                <c:if test="${ empty sessionScope.user }">
                	<a id="login" role="button" href="${ pageContext.request.contextPath }/member/loginform.do" class="btn btn_e">로그인</a>
               		<a id="signup" role="button" href="${ pageContext.request.contextPath }/member/signupform.do" class="btn btn_e">회원가입</a> 
                </c:if>
                
                <c:if test="${ not empty sessionScope.user}">
                	<span>${ sessionScope.user.user_name } 님 환영합니다.</span>
                	                	
                	<c:if test="${ user.user_grade eq 'admin'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="admin_page" role="button" href="${ pageContext.request.contextPath }/admin/admin_page.do" class="btn btn_e">관리자 페이지</a>
                	</c:if>	
                	
                	<c:if test="${ user.user_grade eq 'seller'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="cart" role="button" class="btn btn_e" onclick="location.href='${ pageContext.request.contextPath }/member/mypage.do?user_idx='+${user.user_idx}">나의 정보</a>
                		<a id="seller_page" role="button" href="${ pageContext.request.contextPath }/seller/seller_page.do?user_idx=${user.user_idx}" class="btn btn_e">가게 페이지</a>	
                	</c:if>
                	
                	<c:if test="${ user.user_grade eq 'buyer'}">
                		<a id="login" role="button" href="${ pageContext.request.contextPath }/member/logout.do" class="btn btn_e">로그아웃</a>
                		<a id="cart" role="button" class="btn btn_e" onclick="location.href='${ pageContext.request.contextPath }/member/mypage.do?user_idx='+${user.user_idx}">나의 정보</a>
               		</c:if>
                </c:if>
  
                <!-- 백상희 20240124 수정 끝-->
            </div>
        </div>
    </nav>



    <div class="bg-primary-gradient">
        <!-- Top Banner -->
        <div class="container pt-1 pt-xl-5 c top_margin"><img class="tt_image" src="${ pageContext.request.contextPath }/assets/img/top_banner.png"></div>
	</div>
        <!-- Category Menupan  메뉴링크 수정 01.23. 17:38 최병훈--> 
        <!-- Category Menupan  메뉴링크 수정 01.24. 05:22 최병훈--> 
        <!-- 최병훈 : 20240125 href/class 수정 css파일다시 받으세용~ -->
       
        <div id="menu_box" class="container pt-4 pt-xl-1 c">
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_market.png" alt="식료품"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_kor.png" alt="한식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_china.png" alt="중식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_jpan.png" alt="일식"></a></div>
			<div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_others.png" alt="양식"></a></div> <!-- 그림을 바꿔야함 -->
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_asian.png" alt="아시안"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_night.png" alt="야식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_past.png" alt="분식"></a></div>
            <div><a class="" href="#"><img id="food_category_name" name="food_category_name" class="category" src="${ pageContext.request.contextPath }/assets/img/cate_disert.png" alt="디저트"></a></div>

        </div>
        

        <!-- line -->
        <div class="container pt-4 pt-xl-1 c"><hr></div>