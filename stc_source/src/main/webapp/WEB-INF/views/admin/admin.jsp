<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자관리 페이지</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header2.jsp" %> 
<section>
	<div class="count-area"> 
	    <div class="container">
		    <div class="row">
	    	    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2>${pageContext.request.userPrincipal.name}님, 반갑습니다.</h2>	        	    	
	            </div>
	        </div>
	    </div>
	</div>
	<div class="count-area">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                	<h2></h2> 
                </div>
            </div>
            <div class="row">
            	<div class="col-md-12 col-xs-12 percent-blocks m-main" data-waypoint-scroll="true">
                	<div class="row">
                    	<div class="col-sm-2 col-xs-6">
                        	<a href="${pageContext.request.contextPath}/admin/user">
                            	<div class="count-item">
                                	<div class="count-item-circle">
                                    	<span class="pe-7s-id"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2></h2>
                                        <h5>일반회원 관리</h5>
                                    </div>
                            	</div>
                        	</a>
                    	</div>
	                	<div class="col-sm-2 col-xs-6">
	                    	<a href="${pageContext.request.contextPath}/admin/host">
	                        	<div class="count-item">
	                            	<div class="count-item-circle">
	                                	<span class="pe-7s-users"></span>
	                                </div>
	                                <div class="chart" data-percent="120">
	                                	<h2></h2>
	                                    <h5>호스트 관리</h5>
	                                </div>
	                        	</div> 
	                    	</a>
	                	</div>
                        <div class="col-sm-2 col-xs-6">
                        	<a href="${pageContext.request.contextPath}/admin/product">
                                <div class="count-item">
                            	    <div class="count-item-circle">
                                        <span class="pe-7s-home"></span>
                                    </div>
                                    <div class="chart" data-percent="12000">
                                        <h2></h2>
                                        <h5>공간관리</h5>
                                    </div>
                                </div>
                            </a> 
                        </div>
                        <div class="col-sm-2 col-xs-6">
                        	<a href="${pageContext.request.contextPath}/admin/chatting/list">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-chat"></span>
                                    </div>
                                    <div class="chart" data-percent="120">
                                        <h2></h2>
                                        <h5>채팅관리</h5>
                                    </div>
                                </div> 
                            </a>
                        </div>                       
                        <div class="col-sm-2 col-xs-6">
                            <a href="${pageContext.request.contextPath}/notice">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-pin"></span>
                                    </div>
                                    <div class="chart" data-percent="120">
                                        <h2></h2>
                                        <h5>공지사항 관리</h5>
                                    </div>
                                </div> 
                            </a>
                        </div> 
                        <div class="col-sm-2 col-xs-6">
                            <a href="${pageContext.request.contextPath}/contact">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-help1"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2></h2>
                                        <h5>도움말 관리</h5>
                                    </div>
                                </div> 
							</a>
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