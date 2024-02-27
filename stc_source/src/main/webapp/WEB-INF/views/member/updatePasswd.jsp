<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header.jsp" %> 
	<section>
		<div class="count-area">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
						<h2 style="color: white;">비밀번호 찾기</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- register-area -->
		<div class="register-area">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<div class="box-for overflow">
						<div class="col-md-12 col-xs-12 login-blocks" name="sampleForm" id="sampleForm">
							<form action="updateajax" name="sampleForm" method="post">
								
								<div style="padding-left: 60px; padding-right: 60px; padding-top: 30px; padding-bottom: 30px;">
									<h2>Study Cloud 비밀번호 찾기</h2><br>
									비밀번호를 이메일로 보내드립니다.
								</div>
								
								<div style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<h5>아이디</h5>
									<input type="text" id="memId" name="memId" style="border-bottom: solid; border-color: #f6f6f6;">
								</div>
								
								<div style="padding-left: 60px; padding-right: 60px; padding-top: 30px; padding-bottom: 30px;">
									<h5 style="padding-top: 10%;">이메일</h5>
									<input type="text" id="memEmail" name="memEmail" style="border-bottom: solid; border-color: #f6f6f6;">
								</div>

								<div class="text-center" style="padding-left: 60px; padding-right: 60px;  padding-top: 30px; ">
									<div style="padding-top: 20px;">
										<button type="button" class="btn btn-default" style="width: 100%; border-top: 20px;   background-color: #ffd014;">비밀번호 재설정</button>
									</div>
								</div>
								
								<div  style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<p>
										가입된 아이디와 이메일 주소를 입력해주시면 
										재설정 된 비밀번호를 전송합니다.
									</p>
									<p style="padding: 0px;">
										SNS로 가입하신 경우 비밀번호 찾기가 불가합니다.
									</p>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/module/footer.jsp"%>
	<script>
	$( document ).ready( function() {
	    $( 'button[type=button]' ).click( function() {
	    	
	    	var formValues = $("form[name=sampleForm]").serialize() ;
	    	var memEmail= $("#memEmail").val();
	    	var memId= $("#memId").val();
	    	
	    	$.ajax({
	    		url: 'updateajax', 
	    		type: 'POST',
	            data: formValues,
	            beforeSend : function(xhr)
	               {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	               },
	    		//data : {memId:memId, memEmail:memEmail},
	            datatype : 'json',
	            error: function(xhr, status, error){
	                alert('ajax error');
	            },
	            success : function(data){
	            	if(data == 'success'){
	            		alert('기입한 메일로 초기화 된 비밀번호가 전송되었습니다.');	
	            		location.href="<%=request.getContextPath()%>/sendmail/password?memEmail="+memEmail+"&memId="+ memId;
	            	}else{
	            		alert('존재하지 않는 회원 정보 입니다.');
	            	}
	                
	            }
	        });
	    	
	    } );
	  } );
	
	</script>
	
</body>
</html>