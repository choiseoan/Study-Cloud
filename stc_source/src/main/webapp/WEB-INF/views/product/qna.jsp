<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
							<div class="section property-share">
                          		<input type="hidden" class="form-control" name="proNum" value="${product.detail.proNum }">                                
                          		<h4 class="s-property-title">Q&A
                                <sec:authorize var="isauth" access="isAuthenticated()">
								<sec:authorize var="" access="hasRole('USER')">
									<!-- Q&A 등록 버튼 시작 -->
									<button type="button" class="btn qna-btn pull-right" data-toggle="modal" data-target="#insertQna" style="display: inline;">
										등록
									</button>									
									<!-- Q&A 등록 Modal -->
									<div class="modal fade" id="insertQna" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">									
											  	<div class="modal-header">
												    <h4 class="modal-title text-center" id="exampleModalLabel">
												    Q&A 등록
												    <button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button>
												    </h4>										    
												</div>							
												<form:form id="frminsertQna">
												<div class="modal-body">													
													<div class="mb-3">
														<br>
														<textarea class="form-control" name="memQuestion" placeholder="내용" style="height: 300px;"></textarea>
														<input type="hidden" class="form-control" name="proNum" value="${product.detail.proNum }">
														<input type="hidden" class="form-control" name="memId" value="${pageContext.request.userPrincipal.name}"><br>														
													</div>
												</div>
												</form:form>
											    <div class="modal-footer">
													<div class="button notice-btn">
												        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
														<button form="frminsertQna" type="button" class="btn search-btn btninsertQna" data-dismiss="modal">등록</button>												
													</div> 
												</div>										
											</div>
										</div>
									</div>
									<!-- 공지사항 등록 버튼 끝 -->
								</sec:authorize>			
								</sec:authorize>
								</h4>
								<!-- qnaList 시작 -->
                                <section id="comments" class="comments"> 
                                           
                                    <div class="row comment" id="qList">
                                                            
                                        <!-- updateQna modal -->
										 
										<!-- replyQna modal -->
										 
                                        <!-- qna 페이징 -->
                                        <div class="col-md-12 clear"> 
					                        <div class="text-center">
					                            <div class="pagination">
					                                <ul class="pagination-sm">
					                                	                              
					                                </ul>
					                            </div>
					                        </div>                
					                    </div>
                                    </div>
                                </section>
                            </div>
                            
         <script>
 	        /* productDetail ajax */
	        getQnaListHandler();
	        
	        function getQnaListHandler(){
	    		console.log($("[name=proNum]").val());
	    		
	    		var qnapage = $(this).data("qnapage");
	    		if(!qnapage){
	    			qnapage = 1;
	    		}

	    		$.ajax({
	    			 url: "${pageContext.request.contextPath}/product/detail"
	    		   , type: "POST"
	    		   , data: {proNum:$("[name=proNum]").val()
	    					, qnapage: qnapage
	    		   			}
	    			 
	    		   , dataType: "json"  
	          	   , success: function (result) { 
	          		 displayQna(result);
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
	        
	       /* insertProductQna ajax */
           $(".btninsertQna").on("click", insertQna);
          	function insertQna() {
          		var memQuestionLength = $("[name=memQuestion]").val().trim().length;
          		if(memQuestionLength < 10) {
          			alert("내용을 입력하세요(최소 10글자 이상).")
          			$("[name=memQuestion]").focus()
          			$("[name=memQuestion]").val("")
          			return false;
          		}
          		var qnapage = $(this).data("qnapage");
	    		if(!qnapage){
	    			qnapage = 1;
	    		}
          		$.ajax({   
          			  url: "${pageContext.request.contextPath}/product/detail/qnainsert"
           		    , type: "POST"
          			, data: {memQuestion: $("[name=memQuestion]").val(), proNum:$("[name=proNum]").val(), memId:$("[name=memId]").val(), qnapage: qnapage}
          			, dataType: "json"  
          			, success: function (result) { 
          				console.log(result);
          				frminsertQna.reset();
           				if(result.qnaList.length > 0) { 
           					alert("QNA가 작성되었습니다.")
           				} else {
           					alert("QNA가 작성되지 않았습니다. 다시 작성해주세요.")
           				}           				 
           				displayQna(result);
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
           	
          	/* displayQna 화면 함수 */
           	function displayQna(result) {
           		
           		var htmlVal = '';
           		for(var i = 0; i < result.qnaList.length; i++){
        			var qna = result.qnaList[i];
           			htmlVal += '<div class="col-sm col-md-12" id="'+qna.qnaNum+'">';
           			htmlVal += '<h5 class="text-uppercase">'+qna.memId
           			htmlVal += '<p class="posted pull-right">';
          			if(qna.memId == '${pageContext.request.userPrincipal.name}'){
          			htmlVal += '<button data-toggle="modal" data-target="#updateQna'+qna.qnaNum+'" type="button">수정</button>&nbsp';
          			htmlVal += '<button class="delete btndeleteQna" type="button" data-qnanum="'+qna.qnaNum+'">삭제</button>';
          			}
          			htmlVal += '</p></h5>';
           			htmlVal += '<p class="posted">'+qna.qnaDate+'</p>';
          			htmlVal += '<p class="posted">'+qna.memQuestion
          			if('${product.detail.memId}' == '${pageContext.request.userPrincipal.name}'){
          			htmlVal += '<button class="pull-right" data-toggle="modal" data-target="#replyQna'+qna.qnaNum+'" type="button">';
          			if(qna.hostAnswer != null){
          			htmlVal += '수정';
          			} else {
          			htmlVal += '답변';
          			}
          			htmlVal += '</button></p>';
          			}
          			htmlVal += '</div>';
          			htmlVal += '<div class="col-sm col-md-8">';
          			if(qna.hostAnswer != null){
       				htmlVal += '<i class="fa fa-user">&nbsp${product.detail.memId}</i><br>'+qna.hostAnswer
       				}
          			htmlVal += '</div><div class="col-sm col-md-8">&nbsp</div>';
          			htmlVal += '<div class="modal" id="updateQna'+qna.qnaNum+'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
          			htmlVal += '<div class="modal-dialog">';
          			htmlVal += '<div class="modal-content">';									
          			htmlVal += '<div class="modal-header">';
          			htmlVal += '<h4 class="modal-title text-center" id="exampleModalLabel">Q&A 수정<button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button></h4>';			
          			htmlVal += '</div>';
          			htmlVal += '<form id="frmupdateQna'+qna.qnaNum+'">';
          			htmlVal += '<div class="modal-body">';
          			htmlVal += '<div class="mb-3"><br>';
              		htmlVal += '<textarea class="form-control memQuestion" name="memQuestion" placeholder="내용" style="height: 300px;">'+qna.memQuestion+'</textarea>';
              		htmlVal += '</div>';
              		htmlVal += '</div>';              		
           			htmlVal += '<div class="modal-footer">';
       				htmlVal += '<div class="button notice-btn">';
   					htmlVal += '<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
   					htmlVal += '<button form="frmupdateQna'+qna.qnaNum+'" type="button" class="update btnupdateQna" data-dismiss="modal" data-qnanum="'+qna.qnaNum+'">등록</button>';												
   					htmlVal += '</div>';
   					htmlVal += '</div>';
              		htmlVal += '</form>';
   					htmlVal += '</div>';
   					htmlVal += '</div>';
   					htmlVal += '</div>';
   					htmlVal += '<div class="modal" id="replyQna'+qna.qnaNum+'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
   					htmlVal += '<div class="modal-dialog">';
   					htmlVal += '<div class="modal-content">';								
   					htmlVal += '<div class="modal-header">';
   					htmlVal += '<h4 class="modal-title text-center" id="exampleModalLabel">Q&A 답변';
   					htmlVal += '<button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button></h4>';										    
   					htmlVal += '</div>';							
					htmlVal += '<form id="frmreplyQna'+qna.qnaNum+'">';
   					htmlVal += '<div class="modal-body">';													
   					htmlVal += '<div class="mb-3"><br>';
   					htmlVal += '<textarea class="form-control hostAnswer" name="hostAnswer" placeholder="내용" style="height: 300px;">';
   					if(qna.hostAnswer != null){
   					htmlVal += qna.hostAnswer
   					}
   					htmlVal += '</textarea>';
   					htmlVal += '</div>';
   					htmlVal += '</div>';
   					htmlVal += '<div class="modal-footer">';
   					htmlVal += '<div class="button notice-btn">';
   					htmlVal += '<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
   					htmlVal += '<button form="frmreplyQna'+qna.qnaNum+'" type="button" class="reply btnreplyQna" data-dismiss="modal" data-pronum="'+qna.proNum+'" data-qnanum="'+qna.qnaNum+'">등록</button>';												
					htmlVal += '</div>'; 
					htmlVal += '</div>';										
					htmlVal += '</form>';
					htmlVal += '</div>';
					htmlVal += '</div>';
   					htmlVal += '</div>';    
          		}
          		$("div[id=qList]").html(htmlVal);
          		displayQnaPaging(result);
          		// 화면 element가 다시 생겨났으므로 event 다시 등록
          		$(".btnupdateQna").on("click", updateQna);
          		$(".btndeleteQna").on("click", deleteQna);
          		$(".btnreplyQna").on("click", replyQna);
          	}
          	
          	/* qna 페이징 ajax */
           	function displayQnaPaging(result){
           		
        		var htmlVal = '';
        		htmlVal += `
        		<div class="col-md-12 clear"> 
                <div class="text-center">
                    <div class="pagination">
                        <ul class="pagination-sm">
                        `;
            				if(result.pageInfo.currentPage == 1){
        		htmlVal +='				<li><a class="disabled pe-7s-angle-left"></a></li>';
            				} else {
        		htmlVal +='				<li><a class="pe-7s-angle-left" data-pronum="'+result.proNum+'" data-qnapage="'+(result.pageInfo.currentPage - 1)+'"></a></li>';
            				}
            				for(var i = result.pageInfo.startPage; i <= result.pageInfo.endPage; i++){
            					
        		htmlVal +='				<li><a data-pronum="'+result.proNum+'" data-qnapage="'+i+'">'+i+'</a></li>';
            				}
        					if(result.pageInfo.currentPage == result.pageInfo.endPage){
        		htmlVal +='				<li><a class="disabled pe-7s-angle-right"></a></li>';
            				} else {
        		htmlVal +='				<li><a class="pe-7s-angle-right" data-pronum="'+result.proNum+'" data-qnapage="'+(result.pageInfo.currentPage + 1)+'"></a></li>';
            				}
        		htmlVal += `
                    </ul>
            		</div> 
        			</div>
        			</div>
                            `;

        		$("div[id=qList]").append(htmlVal);
        		$(".pagination a:not(.disabled)").click(getQnaListHandler);
        	}
          	
          	// 로딩되면 event 등록
          	/* updateProductQna ajax */
          	$(".btnupdateQna").on("click", updateQna);
          	function updateQna() {

          		var qnanum = $(this).data("qnanum"); 
          		var qnapage = $(this).data("qnapage");
	    		if(!qnapage){
	    			qnapage = 1;
	    		}
          		$.ajax({   
          			  url: "${pageContext.request.contextPath}/product/detail/qnaupdate"
           		    , type: "POST"
          			, data: {qnaNum:qnanum, proNum:$("[name=proNum]").val(), memQuestion: $(this.form.memQuestion).val(), qnapage: qnapage}
          			, dataType: "json"  
          			, success: function (result) { 
          				console.log(result);

           				if(result.qnaList.length > 0) { 
           					alert("수정되었습니다.")
           					displayQna(result);
           				}  
           				
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
          	
          	/* deleteProductQna ajax */
           	$(".btndeleteQna").on("click", deleteQna);
          	function deleteQna() {
          		 
          		var qnanum = $(this).data("qnanum"); 
          		var qnapage = $(this).data("qnapage");
	    		if(!qnapage){
	    			qnapage = 1;
	    		}
          		if(confirm("QNA를 삭제하시겠습니까?")){
	          		$.ajax({   
	          			  url: "${pageContext.request.contextPath}/product/detail/qnadelete"
	           		    , type: "POST"
	          			, data: {qnaNum:qnanum, proNum:$("[name=proNum]").val(), qnapage: qnapage}
	          			, dataType: "json"  
	          			, success: function (result) { 
	          				console.log(result);
	
	           				if(result.qnaList.length >= 0) { 
	           					alert("삭제되었습니다.")
		           				displayQna(result);
	           				}            				 
	           			}
	         		    , error : function(request,status,error) {
	        			   alert("code:" + request.status + "\n" + "message:" +
	        					 request.responseText + "\n" + "error:" + error); 
	        			}
	        		    , beforeSend : function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	        			}
	           		});
          		} else {
          			return false;
          		}
           	}
          	/* replyProductQna ajax */
          	$(".btnreplyQna").on("click", replyQna);
          	function replyQna() {
          		var hostAnswerLength = $(this.form.hostAnswer).val().trim().length;
          		if(hostAnswerLength < 1) {
          			alert("글자 수가 적으면 등록되지 않습니다. 글을 입력해주세요.")
          			$(this.form.hostAnswer).focus()
          			$(this.form.hostAnswer).val("")
          			return false;
          		}
          		var qnanum = $(this).data("qnanum");
          		var pronum = $(this).data("pronum");
          		var qnapage = $(this).data("qnapage");
	    		if(!qnapage){
	    			qnapage = 1;
	    		}
          		$.ajax({   
          			  url: "${pageContext.request.contextPath}/product/detail/qnareply"
           		    , type: "POST"
          			, data: {qnaNum:qnanum, proNum:pronum, hostAnswer: $(this.form.hostAnswer).val(), qnapage: qnapage}
          			, dataType: "json"  
          			, success: function (result) { 
          				console.log(result);

           				if(result.qnaList.length > 0) { 
           					alert("답변이 등록 되었습니다.")
           					displayQna(result);
           				}            				 
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

          	
 			</script>