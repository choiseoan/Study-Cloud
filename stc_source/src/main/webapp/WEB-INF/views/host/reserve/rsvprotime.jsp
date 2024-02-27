<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 시간 설정</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header2.jsp" %>
<!-- Start page header -->
	<section>
		<div class="count-area">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title" style="padding: 60px;">
						<h3>운영시간,가격을 설정합니다.<br> 
						<small>각 시간마다 가격을 설정해 주세요.</small>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- End page header -->

		<!-- Body content -->
		<div class="content-area user-profiel">
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">
							<div class="col-sm-6 col-sm-offset-3" style="padding-top: 80px; padding-bottom: 40px;">
								<input type="text" class="form-control" id="proDate" name="proDate" placeholder="날짜선택" onfocus="(this.type='date')" onfocusout="(this.type='text')"/>
							</div>
						
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">							
								<table>
									<thead>
										<tr>
											<th>시간</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" begin="0" end="23">
											<tr>
												<td>
												<input type="checkbox" data-protime="${i}" name="proTime" value="${i}" id="proTime_${i }" /> 
												&nbsp;&nbsp;&nbsp;${i < 10 ? '0' : ''}${i}:00 ~ ${(i+1) < 10 ? '0' : ''}${i+1}:00
												</td>
												<td>
												<select data-proprice="${i}" name="proPrice" id="proPrice_${i }">
														<option value="" disabled selected>가격선택</option>
														<option value="1000">1000원</option>
														<option value="1500">1500원</option>
														<option value="2000">2000원</option>
														<option value="2500">2500원</option>
														<option value="3000">3000원</option>
												</select>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class= "form-group" style="padding: 80px;">
								<input type="submit" class="btn btn-primary rsvProTime-btn" id="rsvProTime-btn" value="저장" style="">
								</div>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
	
	// 날짜 선택
	const dateInput = document.getElementById("proDate");
	let selectedDate;
	
	dateInput.addEventListener("change", function() {
	    selectedDate = this.value;
	    console.log("날짜:", selectedDate);
	    getTimePrice(selectedDate);
	});
	
	// 선택된 날짜 시간설정된 값 알아오기
	function getTimePrice(selectedDate){  // selectedDate yyyy-mm-dd
		var proNum =  '${proNum }';
		console.log(proNum)
	 	 $.ajax({
			  url: '${pageContext.request.contextPath}/product/timepricersv',
			  type: 'get',
			  data: {proDate: selectedDate, proNum: proNum},
			  dataType:"json",
			  success: function(result) {
				  console.log(result);
				  disaplyTimePriceRsv(result);
			  },
			  error: function(error){
				  alert(error.errorMsg);
			  },
			  beforeSend : function(xhr){
				  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  }
		});
	}
	
	function disaplyTimePriceRsv(data){
		for(var i=0; i<data.length; i++){
			var time = data[i].time;
			var price = data[i].price;
			var rsvNum = data[i].rsvNum;
			time = (time<10) ? time.substr(1): time;
			var selectorName = "#proTime_"+time;
			var selectorPriceName = "#proPrice_"+time;
			$(selectorName).iCheck('check');
			$(selectorPriceName).val(price).prop("selected");
			if(rsvNum){
				$(selectorName).iCheck('disable');
			}
			///
		}                       
	}
	
	// 저장 버튼 클릭		
	$("#rsvProTime-btn").click(updateValues);
	 
	 function updateValues() {
		 // checkbox, select 선택된 값 배열에 담기
		 var selectedValues = [];
		 $("[name=proTime]:checked").not(':disabled').each(function(){
			 var i = $(this).data("protime");
			 var time = $(this).val();
			 var price = 0;
			 $("[name=proPrice]").each(function(){
				 var j = $(this).data("proprice");
				 if(i==j){
					 price = $(this).val();
				 }
			 });
			 selectedValues.push({ time: time, price: price });
		 });
	    
	    console.log("시간,가격:", selectedValues);
		
	    // selectedData 객체 생성
		const selectedData = {
				proNum: '${proNum}',
				proDate: selectedDate,
				values: selectedValues				
		};
		
		console.log("객체담긴 배열:", selectedData);
		
	
	 	// selectedData 직렬화, 서버 전송
	 	var jsonData = JSON.stringify(selectedData);
	 	
	 	console.log(jsonData);
	 	
	   	$.ajax({
	   		url: '${pageContext.request.contextPath}/host/reserve/rsvprotime',
	   		type: 'post',
	   		//traditional: true,
	   		contentType: "application/json; charset=utf-8",
	   		data: jsonData,  	   		
	   		success: function(result) {
	   			console.log(result);
	   			alert("공간 설정이 저장되었습니다.")
	   			location.href="${pageContext.request.contextPath}/host/product";
	   			
	   		},
	   		error: function(error) {
	   			alert("다시 설정해 주세요.");
	   		}
	   	 	, beforeSend : function(xhr){
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
			}
	   	 	});
	   	}
		 
	 </script>




<%@ include file="/WEB-INF/views/module/footer.jsp" %>

<style>
	
	

	td {
	    padding-right: 20px;
	    padding-bottom: 10px;
	  }
	  table {
	    margin: 0 auto;
	  }
</style>
</body>
</html>