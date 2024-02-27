<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header>
        <nav class="navbar navbar-default ">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="index.html"><img src="<%=request.getContextPath() %>/resources/sneat/assets/img/logo.png" alt=""></a> --%>
                	<a class="navbar-brand" href="<%=request.getContextPath() %>/">Study Cloud</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
                    <div class="button navbar-right">
                    	<sec:authorize access="isAnonymous()">
	                    	<form:form action="${pageContext.request.contextPath}/login" method="GET">
					    		<button class="navbar-btn nav-button login" onclick=" submit(); ">로그인</button>
							</form:form>
							<form:form action="${pageContext.request.contextPath}/join/jointerms" method="GET">
					    		<button class="navbar-btn nav-button" onclick=" submit(); ">회원가입</button>
							</form:form>		                        
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ADMIN')">
						    	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
									<button class="navbar-btn nav-button login" onclick=" submit(); ">로그아웃</button>
								</form:form>
								<form:form action="${pageContext.request.contextPath}/admin" method="GET">
				    				<button class="navbar-btn nav-button" onclick=" submit(); ">관리자관리</button>
								</form:form>
							</sec:authorize>  
						    <sec:authorize access="hasRole('HOST')">
						    	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
					    			<button class="navbar-btn nav-button login" onclick=" submit(); ">로그아웃</button>
				    			</form:form>
								<form:form action="${pageContext.request.contextPath}/host" method="GET">
				    				<button class="navbar-btn nav-button" onclick=" submit(); ">마이페이지</button>
								</form:form>
							</sec:authorize>  
						    <sec:authorize access="hasRole('USER')">
						    	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
					    			<button class="navbar-btn nav-button login" onclick=" submit(); ">로그아웃</button>
				    			</form:form>
								<form:form action="${pageContext.request.contextPath}/user" method="GET">
				    				<button class="navbar-btn nav-button" onclick=" submit(); ">마이페이지</button>
								</form:form>
							</sec:authorize>	
						</sec:authorize>						                     
                    </div>
                    <!-- navbar 시작 -->
                    <sec:authorize access="isAnonymous()">					
	                    <ul class="main-nav nav navbar-nav navbar-right">
	                        <li><a class="" href="<%=request.getContextPath() %>/notice">notice</a></li>
							<li><a class="" href="<%=request.getContextPath() %>/contact">contact</a></li>
							<%-- <li><a class="chat" href="${pageContext.request.contextPath}/chatting?room_id=${pageContext.request.userPrincipal.name}">chat</a></li> --%>
	                    </ul>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
	                    <sec:authorize access="hasRole('ADMIN')">
		                    <ul class="main-nav nav navbar-nav navbar-right">
		                        <li><a class="" href="<%=request.getContextPath() %>/notice">notice</a></li>
								<li><a class="" href="<%=request.getContextPath() %>/contact">contact</a></li>
		                   </ul>
	                    </sec:authorize>
	                    <sec:authorize access="hasRole('HOST')">
		                    <ul class="main-nav nav navbar-nav navbar-right">
		                        <li><a class="" href="<%=request.getContextPath() %>/notice">notice</a></li>
								<li><a class="" href="<%=request.getContextPath() %>/contact">contact</a></li>
		                    </ul>
	                    </sec:authorize>
						<sec:authorize access="hasRole('USER')">
		                    <ul class="main-nav nav navbar-nav navbar-right">
		                        <li><a class="" href="<%=request.getContextPath() %>/notice">notice</a></li>
								<li><a class="" href="<%=request.getContextPath() %>/contact">contact</a></li>
		                    </ul>
	                    </sec:authorize> 
					</sec:authorize>					                   
                </div>
                <!-- navbar 끝 --> 
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->
</header>