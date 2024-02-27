<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 공간 목록</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
</head>
<body>

<%@ include file="/WEB-INF/views/module/header2.jsp" %>
<section>


	<div class="count-area"> 
	    <div class="container">
		    <div class="row">
	    	    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
	        	    <h2>호스트 공간 목록</h2>             
	            </div>
	        </div>
	    </div>
	</div>


  <!-- Body content -->
		<div class="slider-area" style="height:250px;">
			<div class="slider-content">
					
					<!-- <div class="search-form wow pulse" data-wow-delay="0.8s"> -->
						<form action="" class=" form-inline">
							<div class="form-group">
								<select id="lunchBegins" class="form-control"
									data-live-search="true" data-live-search-style="begins"
									title="Select your city">
									<option>host1</option>
									<option>host2</option>
									<option>host3</option>
									<option>host4</option>
									<option>host5</option>
									<option>host6</option>
								</select>
							</div>
							<button class="btn search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
							<div style="display: none;" class="search-toggle">
								<button class="btn search-btn prop-btm-sheaerch" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</form>
					</div>
			</div>
		</div>
				<!-- property area -->
				<!-- property area -->
		<div class="content-area recent-property"
			style="background-color: #FFF; top-margin:1px ">
			<div class="container">
				<div class="row">

					<div class="col-md-12 pr-25 padding-top-40 properties-page user-properties">

						<div class="section">
								<div id="list-type" class="proerty-th-list">

<!-- 									<div class="col-md-4 p0"> -->

							 <!-- 테이블구역 -->
				<div class="container" style="color: black; margin-top: 40px;" >
					<table class="table ttable-striped">
						<thead>
				    		<tr>
						        <th class="text-center">공간이름</th>
						        <th class="text-center">호스트이름</th>
						        <th class="text-center">주소</th>
						        <th class="text-center">관리</th>
				    		</tr>
						</thead>
							<c:forEach items="${hostlist}" var="list">
						<tbody >
								<td class="text-center">
								<a href="${pageContext.request.contextPath}/product/detail?proNum=${list.proNum }"/>${list.proName }</td>
						        <td class="text-center">${list.memId }</td>
						        <td class="text-center">${list.proAddress }</td>
						        <td class="text-center"><button>삭제하기</button></td>
						        

						</tbody>
							</c:forEach>
					</table>
				</div>


								</div>
						</div>
					</div>

	
			<!-- 			페이징 -->
		
					<div class="col-md-12 clear"> 
                        <div class="pull-right">
                            <div class="pagination">
                                <ul>
                                    <c:choose>
	                               	<c:when test="${pageInfo.currentPage eq 1 }">
	                               		<li><a class="disabled pe-7s-angle-left"></a></li>
	                               	</c:when>
	                               	<c:otherwise>
	                                    <li><a class="pe-7s-angle-left" href="${pageContext.request.contextPath}/admin/product?&page=${pageInfo.currentPage - 1 }"></a></li>
	                               	</c:otherwise>
                                	</c:choose>
	                                <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="page">
										<li><a href="${pageContext.request.contextPath}/admin/product?&page=${page }">${page }</a></li>
									</c:forEach>  
									<c:choose>
									<c:when test="${pageInfo.currentPage eq pageInfo.endPage}">
	                               		<li><a class="disabled pe-7s-angle-right"></a></li>
	                               	</c:when>
	                               	<c:otherwise>
	                                    <li><a class="pe-7s-angle-right" href="${pageContext.request.contextPath}/admin/product?&page=${pageInfo.currentPage +1 }"></a></li>
	                               	</c:otherwise> 
	                               	</c:choose>
                                </ul>
                            </div>
                        </div>                
                    </div>

					</div>
				</div>
			</div>
		</div>
			
			
			
		


		<script src="<%=request.getContextPath() %>/resources/sneat/assets/js/modernizr-2.6.2.min.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/jquery-1.10.2.min.js"></script> 
        <script src="<%=request.getContextPath() %>/resources/sneat/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/bootstrap-select.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/easypiechart.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/jquery.easypiechart.min.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath()%>/resources/sneat/assets/js/wow.js"></script>

        <script src="<%=request.getContextPath()%>/resources/sneat/assets/js/icheck.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/price-range.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/main.js"></script>
	
		

</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>


</body>
</html>