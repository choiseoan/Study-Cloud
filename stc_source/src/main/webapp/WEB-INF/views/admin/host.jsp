<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/module/link.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header2.jsp" %>
<style>
	section{
		padding-bottom: 0px;
	
	}
</style> 
<section>
	<div class="count-area"> 
	    <div class="container">
		    <div class="row">
	    	    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
	        	    <h2>호스트 관리</h2>               
	            </div>
	        </div>
	    </div>
	</div>
	<div class="content-area recent-property" style=" padding-bottom: 55px;">
		<div class="container">                  
			<div class="notice-slider-area">
				<div class="notice-slider-content">
					<div class="row" style=" padding-top: 15px;">                
						<form action="${pageContext.request.contextPath}/admin/host" method="get" style=" padding-bottom: 30px;">
							<div class="form-group" style="display: inline-block;">   
								<select id="selectbox" name="selectbox"  class="form-control" style="width: 220px;"  onchange="chageLangSelect(this)">
									<option value="" selected disabled>설정을 고르세요</option>
									<option value="1">전체</option>
									<option value="2">활성화 유저</option>
									<option value="3">탈퇴 혹은 차단</option>
								</select>
							</div>
							<button type="submit"  class="btn notibtn">검색</button>
						</form>
						<table class="table table-hover table-striped">
							<thead>
								<tr style="text-align: center; border-top: none">
									<th scope="col" style="border-top: none; text-align:center;">&nbsp;&nbsp;이름&nbsp;&nbsp;</th>
									<th scope="col" style="border-top: none; text-align:center;">&nbsp;&nbsp;아이디&nbsp;&nbsp;</th>
									<th scope="col" style="border-top: none; text-align:center;">&nbsp;&nbsp;전화번호&nbsp;&nbsp;</th>
									<th scope="col" style="border-top: none; text-align:center;">&nbsp;&nbsp;이메일&nbsp;&nbsp;</th>
									<th scope="col" style="border-top: none; text-align:center;">&nbsp;&nbsp;탈퇴(0/1)&nbsp;&nbsp;</th>
									<th scope="col" style="border-top: none; text-align:center;">&nbsp;&nbsp;관리&nbsp;&nbsp;</th>
								</tr>
							</thead>
					
							<tbody class="table-group-divider">
								<c:forEach items="${usersList }" var="vo">
									<tr>
										<td>${vo.memName }</td>
										<td>${vo.memId }</td>
										<td>${vo.memPhone }</td>
										<td>${vo.memEmail }</td>
										<td>${vo.memQuit }</td>
										<td>
											<c:choose>
												<c:when test="${vo.memQuit != 0}">
													<form:form id="block${vo.memId}" action="${pageContext.request.contextPath}/admin/host/block?memId=${vo.memId }&selectbox=${nowoption }" method="POST">
														<button form="block${vo.memId}" type="button" class=" block" onclick="submit();">차단하기</button>
													</form:form>
												</c:when>
												<c:otherwise>
													<form:form id="block${vo.memId}" action="${pageContext.request.contextPath}/admin/host/unblock?memId=${vo.memId }&selectbox=${nowoption }" method="POST">
														<button form="block${vo.memId}" type="button" class=" block" onclick="submit();">차단해제</button>
													</form:form>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
					
						</table>
						<div class="col-md-12 clear" style="padding-top: 20px;"> 
								<div class="text-center">
									<div class="pagination">
										<ul>
											<c:choose>
												<c:when test="${pageInfo.currentPage eq 1 }">
													<li><a class="disabled pe-7s-angle-left"></a></li>
												</c:when>
												<c:otherwise>
													<li><a class="pe-7s-angle-left" href="${pageContext.request.contextPath}/admin/host?selectbox=${nowoption }&page=${pageInfo.currentPage - 1 }"></a></li>
											  	</c:otherwise>
											</c:choose>
											<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="page">
												<li><a href="<%=request.getContextPath() %>/admin/host?selectbox=${nowoption }&page=${page }">${page }</a></li>
												<%-- <c:if test="${pageInfo.endPage != page }">
												,
												</c:if> --%>
											</c:forEach>
											<c:choose>
												<c:when test="${pageInfo.currentPage eq pageInfo.endPage}">
												<li><a class="disabled pe-7s-angle-right"></a></li>
											</c:when>
											<c:otherwise>
												<li><a class="pe-7s-angle-right" href="${pageContext.request.contextPath}/admin/host?selectbox=${nowoption }&page=${pageInfo.currentPage +1 }"></a></li>
											</c:otherwise> 
										</c:choose>      
									</ul>
								</div>
							</div>
						</div>
						<%-- <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="page">
							<a href="<%=request.getContextPath() %>/admin/host?selectbox=${nowoption }&page=${page }">${page }</a>
						</c:forEach> --%>
					</div>
				</div>
			</div>
		</div>
	</div>	
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp"%>
</body>
</html>