<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원가입</title>
<%@ include file="/WEB-INF/views/module/link.jsp"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body style="background: #f6f6f6;">
	<%@ include file="/WEB-INF/views/module/header.jsp"%>

	<!-- Start page header -->
	<section>
		<div class="count-area" style="background: #f6f6f6;">
			<div class="container">
				<div class="row">
					<div
						class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
						<h2 style="">회원가입</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- End page header -->

		<!-- register-area -->
		<div class="register-area">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<div class="box-for overflow">
						<div class="col-md-12 col-xs-12 register-blocks">
							<form:form action="insert" method="post">
								<div class="input-group" style="padding-left: 60px; padding-right: 60px; padding-top: 60px;">
									<div>
										<label for="id">가입 구분</label>
									</div>
								</div>
								<div class="input-group" style="padding-left: 60px; padding-right: 60px;">
									<input id="radio-1" type="radio" name="memAuthority" value="ROLE_USER" checked> 
									<label for="radio-1" style="padding-left: 10px; padding-right: 130px;">일반회원</label>
									<input id="radio-2" type="radio" name="memAuthority" value="ROLE_HOST"> 
									<label for="radio-2" style="padding-left: 10px;"> 호스트회원</label>
								</div>

								<div class="form-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
									<label for="memId">아이디</label> 
									<input type="text" class="form-control" id="memId" name="memId" maxlength="15"> 
									<span class="point successId"></span> 
									<input type="hidden" id="idChk" />
								</div>
								<div class="form-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
								    <label for="memPasswd">비밀번호</label> 
								    <input type="password" class="form-control" id="memPasswd" name="memPasswd">
								    <span class="point successPw"></span> 
								    <input type="hidden" id="pwChk" />
								</div>
								
								<div class="form-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
								    <label for="memPwChk">비밀번호 재확인</label>
								    <input type="password" class="form-control" id="memPwChk">
								    <span class="point successPwChk"></span>
								    <input type="hidden" id="pwDoubleChk" />
								</div>
								
								<div class="form-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
								    <label for="memName">이름</label> 
								    <input type="text" class="form-control" id="memName" name="memName"> 
								    <span class="point successName"></span> 
								    <input type="hidden" id="nameChk" />
								</div>
								
								<div class="form-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
								    <label for="memPhone">휴대전화(- 제외)</label>
								    <input type="tel" class="form-control" id="memPhone" name="memPhone" maxlength="11">
								    <span class="point successPhone"></span>
								    <input type="hidden" id="phoneChk" />
								</div>
								
								<div class="input-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
								    <div>
								        <label for="memEmail">이메일</label>
								    </div>
								</div>
								<div class="input-group" style="padding-left: 60px; padding-right: 60px;">
									<input type="email" class="form-control" id="memEmail" name="memEmail"> 
									<span class="input-group-btn">
										<button class="btn btn-default" type="button" id="email-send-Btn">메일발송</button>
									</span>
								</div>
								<div class="input-group" style="padding-left: 60px; padding-right: 60px;">
									<span class="point successEmail"></span> 
									<input type="hidden" id="emailChk" />
								</div>
								
								<div class="input-group" style="padding-left: 60px; padding-right: 60px; padding-top: 30px;">
								    <div>
								        <label for="emailAuthCode">이메일 인증코드</label>
								    </div>
								</div>
								<div class="input-group" style="padding-left: 60px; padding-right: 60px;">
									<input type="text" class="form-control" id="emailAuthCode" name="emailAuthCode" placeholder="인증코드를 입력하세요."> 
									<span class="input-group-btn">
										<button class="btn btn-default invalid-code" type="button" id="email-auth-Btn">인증하기</button>
									</span>
								</div>
								<div class="input-group" style="padding-left: 60px; padding-right: 60px;">
									<span class="point successEmailAuth"></span> 
									<input type="hidden" id="emailAuthChk" />
								</div>
								
								<div class="text-center" style="padding-top: 100px; padding-bottom: 60px; padding-left: 60px; padding-right: 60px;">
									<input class="btn btn-primary" type="submit" id="join-Btn" value="가입하기"/>
								</div>
							</form:form>
						</div>`
					</div>
				</div>
			</div>
		</div>
	</section>
		<!-- End register-area -->




	<!-- Footer area-->
	<%@ include file="/WEB-INF/views/module/footer.jsp"%>


	<script>
		$(function() {
			let checkId = RegExp(/^[a-z0-9]{5,15}$/); //5~15자의 영어 소문자와 숫자로 이루어진 문자열 검사
			let checkPasswd = RegExp(/^(?=.*[a-z\d~!@#$%^&*()+])[a-z\d~!@#$%^&*()+]{4,}$/); //영어소문자, 숫자, 특수문자(~!@#$%^&*()_+)로 이루어진 4자리 이상 문자열 검사
			let checkName = RegExp(/^[가-힣a-zA-Z]{2,}$/); //2자 이상의 한글 또는 영어 대/소문자로 이루어진 문자열 검사
			let checkPhone = RegExp(/^[0-9]{11}$/); //11자리 숫자로 이루어진 문자열 검사
			let checkEmail = RegExp(/^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,})$/); //이메일 주소 형식에 맞는 패턴으로 검사
	
			//아이디 유효성
			$("#memId").blur(function() {
				let idDupChk = -1; //중복 있음:1, 사용 가능:0
				let memId = $("#memId").val();
				let checkId = /^[a-z0-9]{5,15}$/;
				if (memId == "") {
					$(".successId").text("필수 정보입니다.");
					$(".successId").css("color", "#DB0000");
					$("#idChk").val("false");
				} else if (!checkId.test(memId)) {
					$(".successId").text("5~15자의 영문 소문자와 숫자를 사용하세요.");
					$(".successId").css("color", "#DB0000");
					$("#idChk").val("false");
				} else {					
					idCheck();
					}
				});
			
			//아이디 중복체크
			function idCheck() {
				let memId = $("#memId").val();
				$.ajax({
					url : '${pageContext.request.contextPath}/join/idcheck',
					type : 'post',
					data : {
						memId : memId
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(result) {
						if (result == '1') {
							$(".successId").text("이미 사용 중인 아이디입니다.");
							$(".successId").css("color", "#DB0000");
							$("#idChk").val("false");
						} else {
							$(".successId").text("사용 가능한 아이디입니다.");
							$(".successId").css("color", "#88B04B");
							$("#idChk").val("true");
						}
					},
					error : function() {
						alert("오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
						}
					});
				}
	
			//비밀번호 유효성
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
							$(".successPw").text("사용 가능한 비밀번호입니다.")
							$(".successPw").css("color", "#88B04B");
							$("#pwChk").val("true");
							}
						}
					}); 
					
			//비밀번호 재확인 유효성
			$("#memPwChk").blur(function() {
				if ($("#memPwChk").val() == "") {
					$(".successPwChk").text("필수 정보입니다.");
					$(".successPwChk").css("color", "#DB0000");
					$("#pwDoubleChk").val("false");
				} else if ($("#memPwChk").val() == $("#memPasswd").val()) {
					$(".successPwChk").text("비밀번호가 일치합니다.");
					$(".successPwChk").css("color", "#88B04B");
					$("#pwDoubleChk").val("true");
				} else {
					$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
					$(".successPwChk").css("color", "#DB0000");
					$("#pwDoubleChk").val("false");
					}
				});
			
			//이름 유효성
			$("#memName").blur(function() {
				if ($("#memName").val() == "") {
					$(".successName").text("필수 정보입니다.");
					$(".successName").css("color", "#DB0000");
					$("#nameChk").val("false");
				} else {
					if (!checkName.test($("#memName").val())) {
						$(".successName").text("2자 이상의 한글 조합 또는 영문으로 입력해 주세요.");
						$(".successName").css("color", "#DB0000");
						$("#nameChk").val("false");
					} else {
						$(".successName").text("사용가능한 이름입니다.")
						$(".successName").css("color", "#88B04B");
						$("#nameChk").val("true");
						}
					}
				});
				
			//휴대전화 유효성 
			$("#memPhone").blur(function() {
				if ($("#memPhone").val() == "") {
					$(".successPhone").text("필수 정보입니다.");
					$(".successPhone").css("color", "#DB0000");
					$("#phoneChk").val("false");
				} else {
					if (!checkPhone.test($("#memPhone").val())) {
						$(".successPhone").text("휴대전화는 하이픈(-)을 제외한 11자리 숫자를 입력하세요.");
						$(".successPhone").css("color", "#DB0000");
						$("#phoneChk").val("false");
					} else {
						$(".successPhone").text("");
						$("#phoneChk").val("true");
						
						var inputPhone = $("#memPhone").val();
						var formattedPhone = inputPhone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
						$("#memPhone").val(formattedPhone);
						
						}
					}
				});	
				
			//이메일 유효성
			$("#memEmail").on("input", function() {
				  if ($("#memEmail").val() == "") {
				    $(".successEmail").text("필수 정보입니다.");
				    $(".successEmail").css("color", "#DB0000");
				    $("#emailChk").val("false");
				  } else {
				    if (!checkEmail.test($("#memEmail").val())) {
				      $(".successEmail").text("이메일 형식에 맞춰서 작성하세요.");
				      $(".successEmail").css("color", "#DB0000");
				      $("#emailChk").val("false");
				    } else {
				      $(".successEmail").text("");
				      $("#emailChk").val("true");
				      }
				    }
				  });
			
			// 이메일 인증번호 발송		
			var change = "";
			var preemail = $("memEmail").val();
			
			$("#email-send-Btn").click(function() {
				var memEmail = $("#memEmail").val();
				$.ajax({
				url : '${pageContext.request.contextPath}/sendmail/joinemail?memEmail='+ memEmail,
				type : 'post',
				beforeSend : function(xhr) { 
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
				success:function(data){
					
					alert("이메일이 전송 되었습니다.");
					
					console.log(data);	
					
					$('.invalid-code').attr("value", data);
		        	}
					
			    });
			});
									
			// 이메일 인증코드 유효성 
			$("#emailAuthCode").on("input", function() { 
				if ($("#emailAuthCode").val() == "") {
			    $(".successEmailAuth").text("필수 정보입니다.");
			    $(".successEmailAuth").css("color", "#DB0000");
			    $("#emailAuthCodeChk").val("false");
			  } else {
			    $(".successEmailAuth").text("");
			  	}
			});
			
			// 이메일 인증코드 체크
			$("#email-auth-Btn").click(function(){
				var invalidCode = $('.invalid-code').val();
				console.log("인증하기 버튼 : "+invalidCode);
				
				if( $('#emailAuthCode').val() == invalidCode){
					alert("인증코드가 일치합니다");
					$('#emailAuthChk').attr('value', true);
					
				}else{
					alert("인증코드가 일치하지 않습니다.");
				}
				
				
				});
			});
		
		// 가입하기 버튼 클릭 조건
		$("#join-Btn").click(function() {
			if($("#idChk").val() == "true" && $("#pwDoubleChk").val() == "true" && $("#nameChk").val() == "true" 
					&& $("#phoneChk").val() == "true" && $("#emailAuthChk").val() == "true" ) {
				alert($('#memId').val()+"님 환영합니다.\n StudyCloud가입이 완료되었습니다.");
				$("#join-Btn").attr("action", "/join/join");
				$("#join-Btn").submit();
			} else {
				alert("빈칸없이 작성하세요.");
				return false;
			}
		});
			
	</script>

</body>
</html>