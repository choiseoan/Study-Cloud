<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
	
	<title>결제테스트</title>
<!-- 	<!-- jQuery --> -->
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!-- 	<!-- iamport.payment.js --> -->
<!-- 	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	
	<script>
	
	var principalId = $("#principalId").val();
	var amount = $("#amount").val();
	var name = $("#name").val();
	
	
	var IMP = window.IMP;
	IMP.init("imp43677748"); // 예: imp00000000
	
			
    function requestPay() {
      IMP.request_pay({ // param
		          pg: "kcp",
		          pay_method: "card",
		          merchant_uid: "12654-564581",
		          name: "이룸스터디룸회의실 잠실점",
		          amount: 100,
		      }
		      , function (rsp) { // callback
		    	  if (rsp.success) {
		              alert('결제성공');
		//               location.href = "성공시url"
		           // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		              // jQuery로 HTTP 요청
		              jQuery.ajax({
		                url: "${pageContext.request.contextPath}/payinfo", 
		                method: "POST",
		                headers: { "Content-Type": "application/json" },
		                data: {
		                  imp_uid: rsp.imp_uid,            // 결제 고유번호
		                  merchant_uid: rsp.merchant_uid,  //주문번호
		                  name : rsp.name
		                }
		              }).done(function (data) {
		                // 가맹점 서버 결제 API 성공시 로직
		              })
		            } else {
		              alert("결제에 실패하였습니다");
		            }
	          }
	      ); // IMP.request_pay(
    } //requestPay()
  </script>
	
	
	

</head>
<body>
<hr>
<button onclick="requestPay()">결제하기</button>
<hr>
 




  
</body>
</html>
