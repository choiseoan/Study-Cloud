<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>로그인</title>
<!-- 네아로 SDK -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<%@ include file="/WEB-INF/views/module/link.jsp"%>
</head>
<style>
.kakaobtn {
	margin-top: 15px;
	height: 60px;
	border: solid 1px #FEE500;
	background: #FEE500;
	color: #3c1d1e;
}

a {
	text-decoration: none;
}

.sns-naver {
	margin-top: 15px;
	height: 60px;
	border: solid 1px #03C75A;
	background: #03C75A;
	color: #03C75A;
	font-size: 18px;
	box-sizing: border-box;
	border-radius: 5px;
	cursor: pointer;
	width: 500px;
	display: flex;
}

.naver_i {
	background: url(resources/icons/kakao.png) no-repeat;
	width: 40px;
	height: 100%;
	background-size: 90%;
	background-position: 50%;
	margin: 0 20px;
}

.naver_txt {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 16px;
	padding-right: 60px;
	color: white;
}

.leftId {
	text-align: left;
	display: inline;
}

.rightpw {
	float: right;
}

body {
	background: #f6f6f6;
}
</style>
<body>

	<%@ include file="/WEB-INF/views/module/header.jsp"%>

	<section>
		<div class="count-area" style="background: #f6f6f6;">
			<div class="container" style="background: #f6f6f6;">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
						<h2 style="">로그인</h2>
					</div>
				</div>
			</div>
		</div>



		<!-- register-area -->
		<div class="register-area">
			<div class="container">

				<div class="col-md-8 col-md-offset-2">
					<div class="box-for overflow">
						<div class="col-md-12 col-xs-12 login-blocks">
							<c:url value="/login" var="loginUrl" />
							<form:form name="f" action="${loginUrl}" method="POST">
								<div class="form-group"
									style="padding-left: 3%; padding-right: 3%; padding-top: 10px;">
									<c:if test="${param.logout != null}">
										<p>로그아웃 하였습니다.</p>
									</c:if>
									<label for="id">아이디</label> <input type="text"
										class="form-control" id="id" name="id">
									<c:if test="${param.error != null}">
										<p>로그인을 실패했습니다. 다시 시도하거나 회원가입을 해 주세요.</p>
									</c:if>
								</div>
								<div class="form-group"
									style="padding-left: 3%; padding-right: 3%;">
									<label for="password">비밀번호</label> <input type="password"
										class="form-control" id="password" name="password">
								</div>

								<div class="text-center"
									style="padding-left: 3%; padding-right: 3%;">
									<div style="padding-top: 20px;">
										<button type="submit" class="btn btn-default"
											style="color: white; width: 100%; border-top: 20px; border-radius: 10px;">로그인</button>
									</div>
								</div>

								<div class="text-center"
									style="padding-left: 3%; padding-right: 3%;">
									<div style="padding-top: 20px;">
										<a href="${pageContext.request.contextPath}/jointerms">
											<button type="button" class="btn btn-default"
												style="color: white; width: 100%; border-top: 20px; border-radius: 10px;">회원가입</button>
										</a>
									</div>
								</div>

								<br>

								<div class="leftId" id="leftId" style="padding-left: 3%;">
									<h2>
										<a href="${pageContext.request.contextPath}/member/viewaccount">아이디 찾기</a>
									</h2>
								</div>
								<div id="rightpw" class="rightpw" style="padding-right: 3%;">
									<h2>
										<a href="${pageContext.request.contextPath}/member/updatepw">비밀번호 찾기</a>
									</h2>
								</div>

								<br>

							</form:form>

							<div style="padding-left: 3%;">
								<h4 style="color: white;">Social login :</h4>
							</div>

							<div class="text-center"
								style="padding-left: 3%; padding-right: 3%; padding-bottom: 5%;">
								<a class="kakao"
									href="https://kauth.kakao.com/oauth/authorize?client_id=94e122bfd99bcf13ff8bfa4508d639b3&redirect_uri=http://localhost:8090/stc/kakaologin&response_type=code">
									<button type="button" class="kakaobtn"
										style="width: 100%; border-top: 20px; color: white;  border-radius: 10px;">카카오로그인</button>
								</a>
							</div>
							
							<!-- 
							<div id="naverIdLogin" style="display: none;"></div>
							<a href="#" id="naverLogin" class="btn sns-naver" title="새창">
								<div class="naver_i"></div>
								<div class="naver_txt">네이버로 로그인</div>
							</a> -->
					</div>

					</div>
				</div>

			</div>
		</div>
		<!-- 네이버아디디로로그인 초기화 Script -->
		<script type="text/javascript">
			var naverLogin = new naver.LoginWithNaverId({
				clientId : "BwdR32eAj73FDvlvVauD",
				callbackUrl : "http://localhost:8090/stc/naverlogin",
				isPopup : false, /* 팝업을 통한 연동처리 여부 */
				loginButton : {
					color : "white",
					type : 3,
					height : 50
				}
			});

			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();

			$(document).on(
					"click",
					"#naverLogin",
					function() {
						var btnNaverLogin = document
								.getElementById("naverIdLogin").firstChild;
						btnNaverLogin.click();
					});
		</script>
		<!-- // 네이버아이디로로그인 초기화 Script -->
	</section>
	<%@ include file="/WEB-INF/views/module/footer.jsp"%>
</body>
</html>