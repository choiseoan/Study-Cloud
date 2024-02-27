<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js" integrity="sha512-ygaYzcKBzf1YptDaS/7b9P2pY2LW0YCXp22l+IZYHwOjB2opJDrniEMarJ1HsckAdKirYqE9JMpKfSm6NHUcdg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/locales/bootstrap-datepicker.kr.min.js" integrity="sha512-4UPr4O3wb78N3c62jRE7Lv8LNJMSriVUvBa4fSGWAb25diqje3Yp4Uq1cK2pOwZ0F2s8R4RmWJYZhI75HJqOxQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" integrity="sha512-yfvyUfCYfBN4Y16Nj3yxfTlgfOR07CpU7S4iOyIAniXmXrpxIppjaCHRZdZnVH+gn6bzyZTj5vVvMO/hqtbfxA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <!-- selectpicker -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
<!-- stop link  -->

<!-- start contents -->
<body>
	<div class="col-md-4 p0">
		<aside class="sidebar sidebar-property blog-asside-right" 
		style="border-top:1px solid #d3d3d3; border-left:1px solid #d3d3d3; border-right:1px solid #d3d3d3;">
			<div class="panel panel-default sidebar-menu" style="padding-top: 20px;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<b>예약하기</b>
					</h3>
				</div>
				<div class="panel-body recent-property-widget">
					<img src="https://images.unsplash.com/photo-1616400619175-5beda3a17896?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80">
					<p class="side-info" style="padding-top: 20px; padding-bottom: 20px;">${product.detail.proName }</p>
					<div class="clear">
						<ul class="dealer-contacts">
							<li><i class="pe-7s-map-marker strong"> </i> ${product.detail.proAddress }</li>											
							<li><i class="pe-7s-call strong"> </i> ${product.detail.proPhone }</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="panel panel-default sidebar-menu">
				<div class="panel-heading">
					<h3 class="panel-title">
						<b>날짜선택</b>
					</h3>
				</div>
				<div class="panel-body recent-property-widget">
					<div class="input-group">
					<div class="datepicker" id="rsvDate">
					</div>
					
					</div>
			</div>
			<div class="panel panel-default sidebar-menu">
				<div class="panel-heading" style="padding-bottom: 15px;">
					<h3 class="panel-title">
						<b>시간선택</b>
					</h3>
				</div>
				<div class="panel panel-default sidebar-menu">
					<select class="selectpicker form-control" multiple data-size="10" data-html="true" title="시간선택" id="rsvTime" name="rsvTime">
						<%-- <optgroup label="오전">
							<c:forEach items="${product.detail.timePriceList }" var="timeprice" varStatus="s">                            
                                <option value="${timeprice.time } ${timeprice.price }">${timeprice.time }&nbsp;&nbsp;<fmt:formatNumber value="${timeprice.price }" /></option>                              
                                </c:forEach>							
						</optgroup>
						<optgroup label="오후">
							<c:forEach var="i" begin="0" end="10">
								<option value="${i + 12}">${i + 12}:00~${i + 13}:00</option>
							</c:forEach>
							<option value="23">23:00~24:00</option>
						</optgroup> --%>
					</select>
				</div>
			</div>
			<div class="panel panel-default sidebar-menu">
				<div class="panel-heading">
					<h3 class="panel-title">
						<b>인원선택</b>
					</h3>
				</div>
				<div class="panel-body recent-property-widget">
					<div class="input-group">
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-number" data-type="minus" data-field="rsvPerson">
								<span class="glyphicon glyphicon-minus"></span>
							</button>
								</span> 
								<input type="text" id="rsvPerson" name="rsvPerson" class="form-control input-number text-center" value="1" min="1" max="10"> 
								<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-number" data-type="plus" data-field="rsvPerson">
								<span class="glyphicon glyphicon-plus"></span>
							</button>
						</span>
					</div>
				</div>
			</div>	
			
				<div class="panel panel-default sidebar-menu">
				<div class="panel-heading">
					<h3 class="panel-title">
						<b>총가격</b>
					</h3>
				</div>
				<div class="panel-body recent-property-widget">
					<div class="input-group" style="display: flex;">
							<div class="calculator" id="rsvAmount" name="rsvAmount">
							<h3><span class="price"></span></h3>
						</div>
					</div>
				</div>			
		</aside>
		<aside class="sidebar sidebar-property blog-asside-right"
			style="padding-bottom: 0px; padding-right: 0px; padding-left: 0px; ">
			<button id=rsv-Btn class="btn btn-primary rsv-Btn" style="width: 100%; height: 55px;">예약하기</button>
		</aside>
	
	</div>
<!-- stop contents -->				


<!-- start script -->
	<script>
		//datepicker
		var selectedDate;
		var selectedTime = []; 
		var rsvPrice;
		$("input[name='rsvPerson']").val(1);
	
		$('#rsvDate').datepicker({
		  format: "yyyy-mm-dd",
		  // 초기날짜
		  language: "kr",
		  calendarWeeks: false,
		  todayHighlight: true,
		  startDate: new Date(),
		  endDate: new Date(new Date().setMonth(new Date().getMonth() + 3))
		}).on('changeDate', function(e) {
		  selectedDate = e.format();
		  console.log(e.format());
		  // 선택된 날짜의 time과 price, 그리고 예약상태를 알아오기
		  getTimePrice(selectedDate);
		});
	
		// 시간선택,인원수카운트하여 총금액 구하기
		$('.selectpicker').on('changed.bs.select', function(e, clickedIndex, isSelected, previousValue) {
		  selectedTime = $(this).val();
		  totalAmount();
		});
	
		$("select[name=rsvTime]").change(function() {
		  rsvPrice = 0;
		  selectedTime = [];
		  $("select[name=rsvTime] option:selected").each(function() {
			  rsvPrice += parseInt($(this).attr('value2'));
				console.log("this:" + $(this).attr('value2'));
		    selectedTime.push($(this).val());
		  });
		  console.log(selectedTime);
		  rsvAmount()
		});
		
		function rsvAmount(){
			var rsvPerson = parseInt($("input[name='rsvPerson']").val());
			var rsvAmount = (rsvPerson * rsvPrice);
			$("#rsvAmount .price").text(rsvAmount.toLocaleString());
		}
	
		$('.btn-number').click(function(e) {
		  e.preventDefault();
	
		  var fieldName = $(this).attr('data-field');
		  var type = $(this).attr('data-type');
		  var input = $("input[name='" + fieldName + "']");
		  var selectedPerson = parseInt(input.val());
	
		  if (!isNaN(selectedPerson)) {
		    if (type == 'minus') {
		      if (selectedPerson > input.attr('min')) {
		        input.val(selectedPerson - 1).change();
		      }
		    } else if (type == 'plus') {
		      if (selectedPerson < input.attr('max')) {
		        input.val(selectedPerson + 1).change();
		      }
		    }
		    selectedPerson = parseInt(input.val());
		    console.log(input.val());
		    rsvAmount();
		  } else {
		    input.val(0);
		  }
		});
		
		
		$("#rsv-Btn").click(function() {    
			  // 시간 선택 배열 생성
			  var selectedTime = [];
			  $("select[name='rsvTime'] option:selected").each(function() {
			    selectedTime.push($(this).val());
			  });
			  
			  const urlParams = new URL(location.href).searchParams;
			  const proNum = urlParams.get('proNum');
			  console.log(proNum);
			  
			  // 날짜, 시간, 인원, 총가격 객체 생성
			  const rsvData = {
			    rsvDate: selectedDate,
			    rsvTime: selectedTime,
			    rsvPerson: parseInt($("input[name='rsvPerson']").val()),
			    rsvAmount: parseInt($("#proPrice").val()) * selectedTime.length * parseInt($("input[name='rsvPerson']").val()),
			    proNum : proNum,
			    memId : '${pageContext.request.userPrincipal.name}'
			  };
	
		  		console.log("객체생성:", rsvData);
		  
		  
		  // rsvData 직렬화, 서버 전송
		  var jsonData = JSON.stringify(rsvData);
		  
		  $.ajax({
			  url: '${pageContext.request.contextPath}/reserve/reserve',
			  type: 'post',
			  contentType: "application/json; charset=utf-8",
			  data: jsonData,
			  
			  success: function(insertedRegDate) {
				  console.log(insertedRegDate);
				  location.href='${pageContext.request.contextPath}/reserve/reserveinfo?';
				  location.href='${pageContext.request.contextPath}/reserve/reserveinfo?regDate='+insertedRegDate+'&proNum='+proNum+'&state='+0;
				  },
			  error: function(error){
				  alert(error.errorMsg);
				  },
			  beforeSend : function(xhr){
				  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				  }
			});
		});
		
		
	// 선택된 날짜의 time과 price, 그리고 예약상태를 알아오기  
	function getTimePrice(selectedDate){  // selectedDate yyyy-mm-dd
		  var proNum =  '${product.detail.proNum }';
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
		var htmlval = '';
		for(var i=0; i<24; i++){
			var timeprice = data[i];
			if(i==0){
			 	htmlval += '<optgroup label="오전">';
			} else if(i==12){
	         	htmlval += '<optgroup label="오후">';
			}
						
			if(!timeprice){
				
			}else {
				if(timeprice.rsvNum){
					// 이미 예약된 상태
					// disabled 
					var num = Number(timeprice.time) + 1;
					var time = (num < 10) ? "0" + num : num.toString();
					var formatedTime = timeprice.time+':00 ~ '+ time +':00'
					htmlval += '         <option value="'+timeprice.time+'" value2="'+timeprice.price+'" disabled>'+formatedTime+'&nbsp;&nbsp; '+timeprice.price+'</option>';
				} else {
					console.log(timeprice.time);
					var num = Number(timeprice.time) + 1;
					var time = (num < 10) ? "0" + num : num.toString();
					var formatedTime = timeprice.time+':00 ~ '+ time +':00'
					htmlval += '         <option value="'+timeprice.time+'" value2="'+timeprice.price+'">'+formatedTime+'&nbsp;&nbsp; '+timeprice.price+'</option>';
				}
			}
			if(i==11){
				htmlval += '</optgroup>';
			} else if(i==23){
				htmlval += '</optgroup>';
			}
		}                       

		console.log(htmlval);

	   	$('#rsvTime').html(htmlval);
	   	$('#rsvTime').selectpicker('refresh');
	}
	</script>
	<!-- stop script -->
	
	
	<style>
	.panel.sidebar-menu {    
    margin: 0 0 60px;
    }
	</style>
</body>
