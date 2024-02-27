<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study Cloud</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js" integrity="sha512-ygaYzcKBzf1YptDaS/7b9P2pY2LW0YCXp22l+IZYHwOjB2opJDrniEMarJ1HsckAdKirYqE9JMpKfSm6NHUcdg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/locales/bootstrap-datepicker.kr.min.js" integrity="sha512-4UPr4O3wb78N3c62jRE7Lv8LNJMSriVUvBa4fSGWAb25diqje3Yp4Uq1cK2pOwZ0F2s8R4RmWJYZhI75HJqOxQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" integrity="sha512-yfvyUfCYfBN4Y16Nj3yxfTlgfOR07CpU7S4iOyIAniXmXrpxIppjaCHRZdZnVH+gn6bzyZTj5vVvMO/hqtbfxA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<c:set var="add">
	종로구,중구,용산구,성동구,광진구,동대문구,중랑구,성북구,강북구,도봉구,노원구,은평구,서대문구,마포구,양천구,강서구,구로구,금천구,영등포구,동작구,관악구,서초구,강남구,송파구,강동구
</c:set>
<section>
        <div class="slider-area">
            <div class="slider">
                <div id="bg-slider" class="owl-carousel owl-theme">

                    <div class="item"><img src="<%=request.getContextPath() %>/resources/sneat/assets/img/slide1/slider-image-5.jpg" alt="GTA V"></div>
                    <div class="item"><img src="<%=request.getContextPath() %>/resources/sneat/assets/img/slide1/slider-image-6.jpg" alt="The Last of us"></div>
                    <div class="item"><img src="<%=request.getContextPath() %>/resources/sneat/assets/img/slide1/slider-image-7.jpg" alt="GTA V"></div>

                </div>
            </div>
            <div class="slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <h2><!-- Study Cloud --></h2>
                        <p><!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi deserunt deleniti, ullam commodi sit ipsam laboriosam velit adipisci quibusdam aliquam teneturo! --></p>
                        <div class="search-form pulse">
                            <form class="form-inline">                                
                                <div class="form-group">                                     
                                    <select id="basic" name="proAddress" class="selectpicker show-tick form-control" data-live-search="true" data-live-search-style="begins" data-size="10">
                                        	<option value="">지역</option>
                                        <c:forEach var="v" items="${add }">
											<option value="${v }">${v }</option>
										</c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">                                   
                                    <select class="selectpicker" name="proPrice" title="가격">
										<c:forEach var="price" begin="1000" end="3000" step="500">
									   		<option value="${price }"><fmt:formatNumber value="${price }" />원</option>
										</c:forEach>                                        
                                    </select>
                                </div>
                                <div class="form-group">
                                	<input type="text" class="form-control" width="270" name="proDate" placeholder="  날짜" onfocus="(this.type='date')" onfocusout="(this.type='text')"/>
                                </div>
                                <button class="btn search-btn" type="submit" formaction="${pageContext.request.contextPath}/product">검색</button>
                                <button class="btn search-btn" type="submit" formaction="${pageContext.request.contextPath}/product/map">지도</button>
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>