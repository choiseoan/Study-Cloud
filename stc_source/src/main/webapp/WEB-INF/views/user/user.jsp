<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 마이페이지</title>
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
            	<div class="col-md-12 col-md-offset-1 col-xs-12 percent-blocks m-main" data-waypoint-scroll="true">
                	<div class="row">
                    	<div class="col-sm-2 col-xs-6">
                        	<a href="${pageContext.request.contextPath}/user/info">
                            	<div class="count-item">
                                	<div class="count-item-circle">
                                    	<span class="pe-7s-id"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2></h2>
                                        <h5>내 정보</h5>
                                    </div>
                            	</div>
                        	</a>
                    	</div>
	                	<div class="col-sm-2 col-xs-6">
	                    	<a href="${pageContext.request.contextPath}/user/reserve">
	                        	<div class="count-item">
	                            	<div class="count-item-circle">
	                                	<span class="pe-7s-ticket"></span>
	                                </div>
	                                <div class="chart" data-percent="120">
	                                	<h2></h2>
	                                    <h5>내 예약</h5>
	                                </div>
	                        	</div> 
	                    	</a>
	                	</div>
                        <div class="col-sm-2 col-xs-6">
                        	<a href="${pageContext.request.contextPath}/user/review">
                                <div class="count-item">
                            	    <div class="count-item-circle">
                                        <span class="pe-7s-note2"></span>
                                    </div>
                                    <div class="chart" data-percent="12000">
                                        <h2></h2>
                                        <h5>내 리뷰</h5>
                                    </div>
                                </div>
                            </a> 
                        </div>
                        <div class="col-sm-2 col-xs-6">
                        	<a href="${pageContext.request.contextPath}/user/qna">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-comment"></span>
                                    </div>
                                    <div class="chart" data-percent="120">
                                        <h2></h2>
                                        <h5>내 Q&A</h5>
                                    </div>
                                </div> 
                            </a>
                        </div>                       
                        <div class="col-sm-2 col-xs-6">
                            <a href="${pageContext.request.contextPath}/chatting?room_id=${pageContext.request.userPrincipal.name}">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-chat"></span>
                                    </div>
                                    <div class="chart" data-percent="120">
                                        <h2></h2>
                                        <h5>내 채팅</h5>
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