<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<style type="text/css">
.customoverlay {bottom:50px;}
.customoverlay a {color: #777;}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<c:set var="add">
	종로구,중구,용산구,성동구,광진구,동대문구,중랑구,성북구,강북구,도봉구,노원구,은평구,서대문구,마포구,양천구,강서구,구로구,금천구,영등포구,동작구,관악구,서초구,강남구,송파구,강동구
</c:set>
<section>
	<!-- property area -->
        <div class="properties-area recent-property" style="background-color: #FFF;">
            <div class="container"> 
                <div class="row  pr0 padding-top-40 properties-page">
                    <div class="col-md-12 padding-bottom-40 large-search"> 
                        <div class="search-form pulse">
                            <form action="${pageContext.request.contextPath}/product/map" class=" form-inline">
                                <div class="col-md-12">
                                	<div class="col-md-4">                                     
	                                    <select id="basic" name="proAddress" class="selectpicker show-tick form-control" data-live-search="true" data-live-search-style="begins" data-size="10" onchange="submit();">
	                                        <option value="" ${param.proAddress eq v ? 'selected' : '' }>
                                        		<c:if test="${!empty param.proAddress}">${param.proAddress}</c:if>
                                        		<c:if test="${empty param.proAddress}">지역</c:if>
                                        	</option>                                      	
	                                        <option value="">---------------------</option>
	                                        <c:forEach var="v" items="${add }">	                                        
											<option value="${v }">${v }</option>
											</c:forEach>
                                    	</select>                                    	
                                	</div>
                                    <div class="col-md-4">                   
	                                    <select class="form-control selectpicker" name="proPrice" onchange="submit();">
	                                    	<option value="" ${param.proPrice eq price ? 'selected' : '' }>
                                        		<c:if test="${!empty param.proPrice}"><fmt:formatNumber value="${param.proPrice }" />원</c:if>
                                        		<c:if test="${empty param.proPrice}">가격</c:if>
                                        	</option>
                                        	<option value="">---------------------</option>
											<c:forEach var="price" begin="1000" end="3000" step="500">
										   		<option value="${price }"><fmt:formatNumber value="${price }" />원</option>
											</c:forEach>                                        
	                                    </select>
                                    </div>
                                    <div class="col-md-4">                                     
                                       <input type="text" class="form-control" width="270" name="proDate" placeholder="${!empty param.proDate ? param.proDate : '  날짜'}" 
                                           onchange="submit();" onfocus="(this.type='date')" onfocusout="(this.type='text')"/>
                                    </div>
                                </div>
                                <div class="col-md-12 ">
									
                                </div>                     
                            </form>
                        </div>
                    </div>
                    <div>
                    <c:forEach var="product" items="${pdList }">
				   		<div class="pdList" data-proname="${product.proName }" data-proaddress="${product.proAddress }" data-pronum="${product.proNum }"></div>
					</c:forEach>
					</div>
                    <div class="map_wrap" style="padding: 25px 25px 40px">
				    <div class="col-md-12" id="map" style="width:100%;height:563px; margin-bottom:60px;"></div>
					</div>
				</div>
			</div>
		</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${appkey }&libraries=services"></script>
<script>
console.log($("select[name=proAddress]").val());
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.564214, 127.001699), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 주소의 좌표를 구하는 함수
var geocoder = new kakao.maps.services.Geocoder();
var bounds = new kakao.maps.LatLngBounds();  
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
    	posObjList.forEach(function(element){
    		if(element.address.indexOf(result[0].address_name)  >= 0 ){
		    	positions.push({title: element.title, latlng: new kakao.maps.LatLng(result[0].y, result[0].x), num: element.num});
		    	displayMarker({title: element.title, latlng: new kakao.maps.LatLng(result[0].y, result[0].x), num: element.num});
		    	bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
		    	map.setBounds(bounds);
		    	result;
    		}
    	});
    }
};


//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];
 
let posObjList = [];

$(".pdList").each(function(){
	var posObj = {title: $(this).data("proname"), latlng: null, address: $(this).data("proaddress"), num: $(this).data("pronum")};
	posObjList.push(posObj);
	
    var latlng = geocoder.addressSearch(posObj.address,  callback);
});
console.log(positions);
//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
  
function displayMarker(positionObj){
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 	
	var imageSize = new kakao.maps.Size(24, 35); 
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positionObj.latlng, // 마커를 표시할 위치
	    title : positionObj.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	    image : markerImage // 마커 이미지 
	});
	
	// 마커 위 말풍선
	var content= '<div class="customoverlay"><a href="${pageContext.request.contextPath}/product/detail?proNum='+positionObj.num+'">'+positionObj.title+'</a></div>';
       
	var customOverlay = new kakao.maps.CustomOverlay({
		map: map,
		position: positionObj.latlng,
		content: content,
		yAnchor: 1 
	});

}

map.setZoomable(false);
kakao.maps.event.addListener(map, 'click', (mouseEvent) => {
	map.setZoomable(true);
});
</script>
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>