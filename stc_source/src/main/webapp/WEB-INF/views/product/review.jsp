<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

							<div class="section property-share">
                          		<input type="hidden" class="form-control" name="proNum" value="${product.detail.proNum }">                                
                          		<h4 class="s-property-title">review
                          		<sec:authorize var="isauth" access="isAuthenticated()">
								<sec:authorize var="" access="hasRole('USER')">
                          		<!-- review 등록 버튼 시작 -->                          			
									<button type="button" class="btn qna-btn pull-right btninsert" data-toggle="modal" data-target="#insertReview" style="display: inline;">
										등록
									</button>							
									<!-- review 등록 Modal -->
									<div class="modal fade" id="insertReview" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">									
											  	<div class="modal-header">
												    <h4 class="modal-title text-center" id="exampleModalLabel">
												    리뷰 등록
												    <button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button>
												    </h4>										    
												</div>							
												<form id="frminsertReview">
												<div class="modal-body">
													<div class="row">
														<div class="col-sm-12">
														<select name="rsvNum" class="form-control">
															<option value="${select.rsvNumber }"${param.rsvNumber eq rsvNumber ? 'selected' : ''  }>${select.rsvNumber }</option>
															<option value=""> -전체- </option>
															<c:forEach items="${userRsvNum }" var="select">
							                            		<option value="${select.rsvNumber }"${param.rsvNumber eq select.rsvNumber ? 'selected' : '' }>
							                            		(주문번호: ${select.rsvNumber })&nbsp&nbsp${select.regDate }
							                            		</option>
															</c:forEach>
														</select>
														</div>
													</div>													
													<div class="mb-3">
														<br>
														<textarea class="form-control" name="revContents" placeholder="내용" style="height: 250px;"></textarea>
														<input type="hidden" class="form-control" name="proNum" value="${product.detail.proNum }">
														<input type="hidden" class="form-control" name="memId" value="${pageContext.request.userPrincipal.name}"><br>														
													</div>
												</div>
												</form>
											    <div class="modal-footer">
													<div class="button notice-btn">
												        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
														<button form="frminsertReview" type="button" class="btn search-btn btninsertReview" data-dismiss="modal">등록</button>												
													</div> 
												</div>										
											</div>
										</div>
									</div>
									<!-- 공지사항 등록 버튼 끝 -->
								</sec:authorize>			
								</sec:authorize>
                          		</h4>
                          		</div>
								<!-- review 시작 -->
								<c:forEach items="${reviewList }" var="review">
								<div class="client-text" data-revnum="${review.revNum }">                                
                                    <p>${review.revDate }</p>
                                    <p>${review.revContents }</p>
                                    <h4><strong>${review.memId }</strong>
                                    <span class="posted pull-right">
                                    <sec:authorize var="isauth" access="isAuthenticated()">
									<sec:authorize var="" access="hasRole('USER')">
                                    <button data-toggle="modal" data-target="#updateReivew${review.revNum }" type="button">수정</button>
									<button class="delete btndeleteReivew" type="button" data-qnanum="${review.revNum }">삭제</button></span>
									</sec:authorize>			
									</sec:authorize></h4>
                                </div>
                                <div class="modal fade" id="updateReivew${review.revNum }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">									
										  	<div class="modal-header">
											    <h4 class="modal-title text-center" id="exampleModalLabel">
											    리뷰 수정
											    <button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button>
											    </h4>										    
											</div>							
											<form id="frmupdateReivew">
											<div class="modal-body">																									
												<div class="mb-3">
													<br>
													<textarea class="form-control revContents" name="revContents" placeholder="내용" style="height: 250px;">${review.revContents }</textarea>
													<input type="hidden" class="form-control" name="proNum" value="${product.detail.proNum }">
													<input type="hidden" class="form-control" name="memId" value="${pageContext.request.userPrincipal.name}"><br>														
												</div>
											</div>
											</form>
										    <div class="modal-footer">
												<div class="button notice-btn">
											        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
													<button form="frmupdateReivew" type="button" class="btn search-btn btninsertReview" data-dismiss="modal">등록</button>												
												</div> 
											</div>										
										</div>
									</div>
								</div>
                                </c:forEach>
                            
                            
	<script>
		function showBtn(){
			var user = ${pageContext.request.userPrincipal.name}
			
			if(!user){
				$(".btninsert").hide();
			}else{
				$(".btninsert").show();				
			}
		}
		$(".btninsertReview").click(ckinsertForm);
		function ckinsertForm(form) {
			var revContentsLength = $("[name=revContents]").val().trim().length;
			
			if(revContentsLength < 1){
				alert("내용을 입력하세요.")
      			$(this.form.revContents).focus()
      			$(this.form.revContents).val("")
      			return false;
			}
		}
		
		$(".btndeleteReivew").click(ckdeleteReivew);
		function ckdeleteReivew() {
			if(confirm("리뷰를 삭제하시겠습니까?")){
				
			}
		}
		getReviewListHandler();
        
        function getReviewListHandler(){
    		console.log($("[name=proNum]").val());
    		
    		var qnapage = $(this).data("qnapage");
    		/* if(!qnapage){
    			qnapage = 1;
    		} */

    		$.ajax({
    			 url: "${pageContext.request.contextPath}/product/detail"
    		   , type: "POST"
    		   , data: {proNum:$("[name=proNum]").val()
    					/* , qnapage: qnapage */
    		   			}
    			 
    		   , dataType: "json"  
          	   , success: function (result) { 
          		 displayReview(result);
    			}
    		   , error : function(request,status,error) {
    			   alert("code:" + request.status + "\n" + "message:" +
    					 request.responseText + "\n" + "error:" + error); 
    			}
    		   , beforeSend : function(xhr){
    			   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
    			}
    		});
    		
    	}
        
        function displayReview(result) {
       		
       		var htmlVal = '';
       		for(var i = 0; i < result.reviewList.length; i++){
    			var review = result.reviewList[i];
    			htmlVal += '<div class="client-text" data-revnum="'+review.revNum+'">';                                
    			htmlVal += '<h4><strong>${review.memId }</strong></h4>';
    			htmlVal += '<p>${review.revContents }</p>';
    			htmlVal += '<p>${review.revDate }';
    			htmlVal += '<span class="posted pull-right">';
    			if(review.memId == '${pageContext.request.userPrincipal.name}'){
    			htmlVal += '<button data-toggle="modal" data-target="#updateReivew'+review.revNum+'" type="button">수정</button>';
    			htmlVal += '<button class="delete btndeleteQna" type="button" data-revnum="'+review.revNum+'">삭제</button>';
    			}
    			htmlVal += '</span></p></div>';
    			htmlVal += '<div class="modal fade" id="updateReivew'+review.revNum+'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
    			htmlVal += '<div class="modal-dialog"><div class="modal-content"><div class="modal-header">';
				htmlVal += '<h4 class="modal-title text-center" id="exampleModalLabel">리뷰 수정';
				htmlVal += '<button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button></h4></div>';	
				htmlVal += '<form id="frmupdateReivew'+review.revNum+'"><div class="modal-body"><div class="mb-3"><br>';
				htmlVal += '<textarea class="form-control" name="revContents" placeholder="내용" style="height: 250px;">'+review.revContents+'</textarea>';
				htmlVal += '<input type="hidden" class="form-control" name="proNum" value="'+product.detail.proNum+'">';
				htmlVal += '<input type="hidden" class="form-control" name="memId" value="'+pageContext.request.userPrincipal.name+'"><br></div></div></form>';														
				htmlVal += '<div class="modal-footer">';
				htmlVal += '<div class="button notice-btn">';
				htmlVal += '<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
				htmlVal += '<button form="frmupdateReivew'+review.revNum+'" type="button" class="btn search-btn btnupdateReivew" data-revnum="'+review.revNum+' data-dismiss="modal">등록</button>';												
				htmlVal += '</div></div></div></div></div>';			
      		}
      		
      		// 화면 element가 다시 생겨났으므로 event 다시 등록
      		
      	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>