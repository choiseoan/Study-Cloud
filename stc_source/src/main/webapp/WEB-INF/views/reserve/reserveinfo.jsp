<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script>
	
		//가격 = ${dto.rsvAmount }
		//상품이름 = ${mapVo.proName }
		//예약 번호 = merchant_uid
		//결제 완료 번호
		
	var IMP = window.IMP;
	IMP.init("imp43677748"); // imp키 property에 넣어야함
	
	var principalId = $("#principalId").val();
	var amount = $("#amount").val();
	var name = $("${mapVo.proName }").val();
// 	var amount =	$(${dto.rsvAmount }).val();
	
	
			
    function requestPay() {
      IMP.request_pay({ // param
		          pg: "kcp",
		          pay_method: "card",
		          merchant_uid: "${dto.rsvNum }"+new Date().getTime(),
		          name: "${mapVo.proName }",
		          amount: "${dto.rsvAmount }",
// 		          amount: 100,
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
    
    function moveBack(){
    	history.back();
    }
    
    $(document).ready(function(){
    	const urlParams = new URLSearchParams(location.search);
    	var state = urlParams.get('state');
    	
    	var btnPay = document.getElementById('btn-pay');
    	var btnBack = document.getElementById('btn-back');
    	
    	console.log(state);
    	
    	if(state == 1){
    		btnPay.style.visibility = 'hidden';
    		btnBack.style.visibility = 'visible';
    	}else{
    		btnPay.style.visibility = 'visible';
    		btnBack.style.visibility = 'hidden';
    	}
    });
  </script>


</head>
<body>
<!-- Header area-->
<%@ include file="/WEB-INF/views/module/header2.jsp" %> 

<!-- Start page header --> 
<section>
    <div class="count-area"> 
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title" style="padding: 60px;">
				<h3>예약을 확인합니다.<br> 
					<small>예약 상세 정보를 확인하세요.</small>
				</h3>
			</div>
        </div>
    </div>
</div>
<!-- End page header -->



 <!-- start contents-area -->
        <div class="content-area user-profiel">
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">
						<div class="profiel-header" >
						    <h3> ${mapVo.proName } <br>
						    </h3>						    
						</div>
						<div class="container">
						    <div class="reservation-info">
						        <div class="group-left">
						            <div class="info-item">
						                <div class="label">예약 번호</div>
						                <div class="value"><span>${dto.rsvNum }</span></div>
						            </div>
						            <div class="info-item">
						                <div class="label">예약 날짜</div>
						                <div class="value"><span>${dto.rsvDate }</span></div>
						            </div>
						            <div class="info-item">
						                <div class="label">이용 시간</div>
						                <c:forEach  var="rsvTime" items="${dto.rsvTime }">
						                	<div class="value">${rsvTime }</div>
						                </c:forEach>
						            </div>
						        </div>
						        <div class="group-right">
						            <div class="info-item">
						                <div class="label">예약 인원</div>
						                <div class="value"><span>${dto.rsvPerson }명</span></div>
						            </div>
						            <div class="info-item">
						                <div class="label">공간 전화번호</div>
						                <div class="value"><span>${mapVo.proPhone }</span></div>
						            </div>
						            <div class="info-item">
						                <div class="label">가격</div>
						                <div class="value"><span>${dto.rsvAmount }</span>원</div>
						            </div>
						        </div>
						    </div>
						</div>
							<span>
							<button class="btn btn-primary" onclick="requestPay()" id="btn-pay" name="btn-pay" >결제하기</button>	

							<button class="btn btn-primary" onclick="history.back()" id="btn-back" name="btn-back">뒤로가기</button>						                                                         
                            </span>    
                                       
 	               </div>
            </div>

        </div>
    </div>
<!-- End contents-area -->




<script>



</script>


<style>
	.profiel-container .profiel-header h3 {
    font-weight: 200;
    text-align: center;
    padding-top: 50px;
}

	 .group-left {
        float: left;
        width: 50%;
        padding-top: 100px;
        padding-left: 220px;
        padding-bottom: 10px;
    }
    
    .group-right {
        float: right;
        width: 50%;
        padding-top:100px;
        padding-bottom: 10px;
    }
    
    .info-item{
    	margin: 30px;
    }
    
    button.btn-primary {
    display: block;
    margin: 100px auto;
    width: 50%;
    height: 55px;
}

    
</style>


          
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>