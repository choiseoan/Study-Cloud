<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/module/link.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header2.jsp" %> 
	<section>
		<div class="count-area">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
						<h2 style="color: white;">호스트 정보</h2>
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
								
								<div style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<h5>아이디</h5>
									<input readonly="readonly" type="text" id="memId" name="memId" style="border-bottom: solid; border-color: #f6f6f6;" value="${mv.memId}">
								</div>
								
								<div class="form-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<label for="memPasswd">비밀번호</label> 
										<input type="password" class="form-control" id="memPasswd" name="memPasswd" value="${mv.memPasswd}" style="border:none ; border-bottom: solid; border-color: #f6f6f6;">
											<span class="point successPw"></span> 
											<input type="hidden" id="pwChk" value="true" />
								</div>
								
								<div style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<h5>이름</h5>
									<input readonly="readonly" type="text" id="memName" name="memName" style="border-bottom: solid; border-color: #f6f6f6;" value="${mv.memName}">
								</div>
								
								<div style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<h5>이메일</h5>
									<input type="text" id="memEmail" name="memEmail" style="border-bottom: solid; border-color: #f6f6f6;" value="${mv.memEmail}">
									<span class="point successEmail"></span>
									<input type="hidden" id="emailChk" value="true"/>
								</div>

								<div class="form-group"
									style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<label for="phone">휴대전화(- 제외)</label> 
									<input type="tel" class="form-control" id="memPhone" name="memPhone" maxlength="13" value="${mv.memPhone}" style="border:none ; border-bottom: solid; border-color: #f6f6f6;"> 
									<span class="point successPhone"></span>
									<input type="hidden" id="phoneChk" value="true" />
								</div>

								<div style="margin-left: 8%; margin-right: 8%; margin-top: 30px ;  display: inline-block; width: 30%;">
									<button type="button"  id="updateProfile" class="btn btn-default" style="width: 100%; border-top: 20px;   background-color: #ffd014;">개인정보 재설정</button>
								</div>

								<div style="display:inline-block;  margin-left: 14%; margin-right: 8%;  width: 30%; margin-top: 30px ;">
									<button type="button"  id="hostQuit" class="btn btn-default" style="width: 100%; border-top: 20px;   background-color: #ffd014;" onclick="">탈퇴</button>
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
	
	const memPasswd = document.querySelector('#memPasswd');
	const memPhone = document.querySelector('#memPhone');
	const loginButton = document.querySelector('#btn_login');
	
/* 	memPasswd.addEventListener('blur', activeEvent);
	memPhone.addEventListener('blur', activeEvent);
 */	
	/* function activeEvent() {
		if($("#emailChk").val() == 'true' && $("#phoneChk").val() == 'true' && $("#pwChk").val()  == 'true'){
			$("#btn_login").attr("disabled", false);
		}else{
			$("#btn_login").attr("disabled", true);
		}
		
	} */
	
	$( document ).ready( function() {
	    
		$( '#updateProfile' ).click( function() {
	    	
	    	var formValues = $("form[name=sampleForm]").serialize() ;
	    	var memEmail= $("#memEmail").val();
	    	var memId= $("#memId").val();
	    	
	    	if(!($("#phoneChk").val()== 'true')){
	    		alert('올바른 전화 번호를 입력해 주세요');
	    		
	    	}
	    	
	    	if(!($("#emailChk").val()== 'true')){
	    		alert('올바른 이메일을 입력해 주세요');
	    		
	    	}
	    	
	    	if(!($("#pwChk").val()== 'true')){
	    		alert('올바른 비밀 번호를 입력해 주세요');
	    		
	    	}
	    	
	    	if($("#emailChk").val() == 'true' && $("#phoneChk").val() == 'true' && $("#pwChk").val()  == 'true'){
	    		
				$.ajax({
		    		url: 'info', 
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
		            		alert('회원의 정보가 수정되었습니다.');	
		            		location.href="<%=request.getContextPath()%>/host";
		            	}else{
		            		alert('서버에 오류가 생겼습니다. 다음에 시도해 주세요.');
		            	}
		                
		            }
		        });
		    	
	    		
	    	}else{
	    		
	    	}
	    	
	    	
	    } );
	  } );
	
	
	let checkPasswd = RegExp(/^(?=.*[a-z\d~!@#$%^&*()+])[a-z\d~!@#$%^&*()+]{4,}$/); //영어소문자, 숫자, 특수문자(~!@#$%^&*()_+)로 이루어진 4자리 이상 문자열 검사
	
	$("#memPasswd").blur(
			function() {
				if ($("#memPasswd").val() == "") {
					$(".successPw").text("필수 정보입니다.");
					$(".successPw").css("color", "#DB0000");
					$("#pwChk").val("false");
				} else {
					if (!checkPasswd.test($("#memPasswd").val())) {
						$(".successPw").text(
								"4자 이상의 영문 소문자, 숫자, 특수문자를 사용하세요.");
						$(".successPw").css("color", "#DB0000");
						$("#pwChk").val("false");
					} else {
						$(".successPw").text("사용가능한 비밀번호입니다.")
						$(".successPw").css("color", "#88B04B");
						$("#pwChk").val("true");
					}
				}
			}); // $("#memPasswd").blur - end
	
	let checkPhone = RegExp(/^[0-9]{11}$/);
	
	$("#memPhone").focus(
			function() {
				var str = $("#memPhone").val();
				var retstr = str.replace(/\-/g,''); 
				$("#memPhone").val(retstr);
			});
	
	$("#memPhone").blur(
			function() {
				if ($("#memPhone").val() == "") {
					$(".successPhone").text("필수 정보입니다.");
					$(".successPhone").css("color", "#DB0000");
					$("#phoneChk").val("false");
				} else {
					if (!checkPhone.test($("#memPhone").val())) {
						$(".successPhone").text(
								"휴대전화는 하이픈(-)을 제외한 11자리 숫자를 입력하세요.");
						$(".successPhone").css("color", "#DB0000");
						$("#phoneChk").val("false");
					} else {
						$(".successPhone").text("");
						$("#phoneChk").val("true");
						var test = $("#memPhone").val();
						var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
						  
						$("#memPhone").val(testDate);
					}
				}

			});
			
	let checkEmail = RegExp(/^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,})$/);

	$("#memEmail").blur(function() {
					if ($("#memEmail").val() == "") {
						$(".successEmail").text("필수 정보입니다.");
						$(".successEmail").css("color", "#DB0000");
						$("#emailChk").val("false");
					} else {
						if (!checkEmail.test($("#memEmail").val())) {
							$(".successEmail").text("이메일 형식에 맞춰 입력하세요.");
							$(".successEmail").css("color", "#DB0000");
							$("#emailChk").val("false");
						} else {
							$(".successEmail").text("올바른 메일 형식입니다..")
							$(".successEmail").css("color", "#88B04B");
							$("#emailChk").val("true");
						}
					}

				});
	
	$("#hostQuit").on("click", hostQuit)
	
	function hostQuit() {
		location.href="<%=request.getContextPath()%>/member/delete";
	}
	
	</script>
	
</body>
</html>