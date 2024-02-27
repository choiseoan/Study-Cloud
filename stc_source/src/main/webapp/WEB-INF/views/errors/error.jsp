<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study Cloud</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<section>  
	<div class="count-area"> 
		    <div class="container">
			    <div class="row">
		    	    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
		        	    <h2></h2>               
		            </div>
		        </div>
		    </div>
		</div>    
        <div class="content-area error-page" style="background-color: #FFFFFF; padding-bottom: 55px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                        <h2 class="error-title">500</h2>
                        <p>${msg }</p><br>
                        <a href="<%=request.getContextPath()%>/" class="btn btn-default">Home</a>                        
                    </div>
                </div> 
            </div>
        </div> 
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>