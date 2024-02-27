<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
</head>
<style>
.proNum , .proAddress{
	line-height: 100%;
}
</style>
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
                            <form action="${pageContext.request.contextPath}/product" class=" form-inline">
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

                    <div class="col-md-12  clear"> 
                        <div class="col-xs-10 page-subheader sorting pl0">
                           
                        </div>
 
                    </div>
					
				<!-- pruductList 시작 -->
                    <div class="col-md-12 clear "> 
                        <div id="list-type" class="proerty-th">
                       		<c:forEach items="${pdList }" var="product"> 
                            <div class="col-sm-6 col-md-3 p0">
                                <div class="box-two proerty-item">
                                    <div class="item-thumb">
                                        <a href="${pageContext.request.contextPath}/product/detail?proNum=${product.proNum }" ><img src="<%=request.getContextPath() %>/resources/sneat/assets/img/demo/property-3.jpg"></a>
                                    </div>
                                    <div class="item-entry overflow">
                                        <h6 class="proNum"><a href="${pageContext.request.contextPath}/product/detail?proNum=${product.proNum }"> ${product.proName } </a></h6>
                                        <div class="dot-hr"></div>
                                        <span class="pull-left proAddress"><b>${product.proAddress }</b></span> <br>
                                        <span class="pull-left"> ${product.proPhone } </span>
                                        <span class="proerty-price pull-right"> <fmt:formatNumber value="${product.proPrice }" type="currency" /> </span>                                        
                                        <p style="display: none;">Suspendisse ultricies Suspendisse ultricies Nulla quis dapibus nisl. Suspendisse ultricies commodo arcu nec pretium ...</p>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
				<!-- pruductList 끝 -->

                    <div class="col-md-12 clear" style="padding-top: 100px;"> 
                        <div class="text-center">
                            <div class="pagination">
                                <ul>
                                    <c:choose>
	                               	<c:when test="${pageInfo.currentPage eq 1 }">
	                               		<li><a class="disabled pe-7s-angle-left"></a></li>
	                               	</c:when>
	                               	<c:otherwise>
	                                    <li><a class="pe-7s-angle-left" href="${pageContext.request.contextPath}/product?proAddress=${param.proAddress }&proDate=${param.proDate}&page=${pageInfo.currentPage - 1 }"></a></li>
	                               	</c:otherwise>
                                	</c:choose>
	                                <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="page">
										<li><a href="${pageContext.request.contextPath}/product?proAddress=${param.proAddress }&proDate=${param.proDate}&page=${page }">${page }</a></li>
									</c:forEach>  
									<c:choose>
									<c:when test="${pageInfo.currentPage eq pageInfo.endPage}">
	                               		<li><a class="disabled pe-7s-angle-right"></a></li>
	                               	</c:when>
	                               	<c:otherwise>
	                                    <li><a class="pe-7s-angle-right" href="${pageContext.request.contextPath}/product?proAddress=${param.proAddress }&proDate=${param.proDate}&page=${pageInfo.currentPage +1 }"></a></li>
	                               	</c:otherwise> 
	                               	</c:choose>
                                </ul>
                            </div>
                        </div>                
                    </div>
                </div>                
            </div>
        </div>
	</section>
	<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>