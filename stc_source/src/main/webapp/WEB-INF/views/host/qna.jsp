<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 - Q&A 관리</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header2.jsp" %>

<section>
	
        <!-- selectedProNum -->

        <div class="slider-area" >
            <div class="slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <div class="">
                            <form action="" class="form-inline">
                                <div class="form-group">                                   
                                    <select name="selectedProNum" id="selectedProNum" class="form-control" style="width: 220px;">
										<c:forEach items="${hostQna.productList }" var="product"> 	
				                        	<option value="${product.proNum }" >${product.proName }</option>
										</c:forEach>
                                    </select>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>


                <!-- 테이블구역 -->
				<div class="container" style="color: black; margin-top: 40px;" >
					<table class="table table-striped">
						<thead>
				    		<tr>
						        <th colspan="1" class="text-center">아이디</th>
						        <th colspan="4" class="text-center">Q&A 내용</th>
						        <th colspan="1" class="text-center">답변관리</th>
				    		</tr>
						</thead>
						<tbody id="qList">

						</tbody>
					</table>
				</div>
				
				<!-- qna 페이징 -->
	            <div class="col-md-12 clear" style="padding-top: 100px;"> 
					<div class="text-center">
	    				<div class="pagination">
	        				<ul>
								
	            			</ul>
	        			</div>
	    			</div>                
				</div>					                    
        	</div> 
        </div>
        
		

<script>
	var selectedProNum = '${hostQna.selectedProNum}';
	$("#selectedProNum").val(selectedProNum).prop("selected", true);
	
	getQnaListHandler();
	
	$("#selectedProNum").change(getQnaListHandler);

	
	function getQnaListHandler(){
		console.log($("[name=selectedProNum]").val());
		
		var page = $(this).data("page");
		if(!page){
			page=1;
		}

		$.ajax({
			 url: "${pageContext.request.contextPath}/host/qna"
		   , type: "POST"
		   , data: {selectedProNum: $("[name=selectedProNum]").val()
					,page: page
		   			}
			 
		   , dataType: "json"  
      	   , success: function (result) { 
      			displayQnaList(result);
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
	function displayQnaList(result){
		var htmlVal = '';
		for(var i = 0; i < result.qnaList.length; i++){
			var qna = result.qnaList[i];
			htmlVal += '<tr data-qnanum="'+qna.qnaNum+'">';
			htmlVal += '<td colspan="1">'+qna.memId+'</td>';
			htmlVal += '<td colspan="4">'+qna.memQuestion+'<button class="pull-right btndeleteQna" type="button" data-qnanum="'+qna.qnaNum+'">삭제</button></td>';
			htmlVal += '<td colspan="1">';
			htmlVal += '<button data-toggle="modal" data-target="#replyQna'+qna.qnaNum+'" type="button">';
			if(qna.hostAnswer != null){
			htmlVal += '수정';
			} else {
			htmlVal += '답변';
			}
			htmlVal += '</button>&nbsp&nbsp';
			htmlVal += '<button class="btnreplyDeleteQna" type="button" data-qnanum="'+qna.qnaNum+'">삭제</button>';			
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
			htmlVal += '</div></div>';
			htmlVal += '<div class="modal-footer">';
			htmlVal += '<div class="button notice-btn">';
			htmlVal += '<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
			htmlVal += '<button form="frmreplyQna'+qna.qnaNum+'" type="button" class="reply btnreplyQna" data-dismiss="modal" data-pronum="'+qna.proNum+'" data-qnanum="'+qna.qnaNum+'">등록</button>';												
			htmlVal += '</div></div></form>';
			htmlVal += '</div></div></div>';
			htmlVal += '</td>';
			htmlVal += '</tr>';
		}
		$("tbody[id=qList]").html(htmlVal);
		var selectedProNum = result.selectedProNum;
		$("#selectedProNum").val(selectedProNum).prop("selected", true);
		
		displayPaging(result);
		$(".btndeleteQna").on("click", deleteQna);
  		$(".btnreplyQna").on("click", replyQna);
  		$(".btnreplyDeleteQna").on("click", replyDeleteQna);
	}
	
	function displayPaging(result){
		var htmlVal = '';
		htmlVal += '<ul>';
    				if(result.pageInfo.currentPage == 1){
		htmlVal +='				<li><a class="disabled pe-7s-angle-left"></a></li>';
    				} else {
		htmlVal +='				<li><a class="pe-7s-angle-left" data-pronum="'+result.selectedProNum+'" data-page="'+(result.pageInfo.currentPage - 1)+'"></a></li>';
    				}
    				for(var i = result.pageInfo.startPage; i <= result.pageInfo.endPage; i++){
    					
		htmlVal +='				<li><a data-pronum="'+result.selectedProNum+'" data-page="'+i+'">'+i+'</a></li>';
    				}
					if(result.pageInfo.currentPage == result.pageInfo.endPage){
		htmlVal +='				<li><a class="disabled pe-7s-angle-right"></a></li>';
    				} else {
		htmlVal +='				<li><a class="pe-7s-angle-right" data-pronum="'+result.selectedProNum+'" data-page="'+(result.pageInfo.currentPage + 1)+'"></a></li>';
    				}
		htmlVal += '</ul>';
		$(".pagination").html(htmlVal);
		$(".pagination a:not(.disabled)").click(getQnaListHandler);
	}
	
	/* deleteQna ajax Qna 삭제 */
   	$(".btndeleteQna").on("click", deleteQna);
  	function deleteQna() {
  		 
  		var qnanum = $(this).data("qnanum"); 
  		var page = $(this).data("page");
		if(!page){
			page = 1;
		}
  		if(confirm("QNA를 삭제하시겠습니까?")){
      		$.ajax({   
      			  url: "${pageContext.request.contextPath}/host/qna/delete"
       		    , type: "POST"
      			, data: {qnaNum:qnanum, selectedProNum: $("[name=selectedProNum]").val(), page: page}
      			, dataType: "json"  
      			, success: function (result) { 
      				console.log(result);

       				if(result.qnaList.length >= 0) { 
       					alert("삭제되었습니다.")
       					displayQnaList(result);
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
  	/* replyUpdateQna ajax */
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
  		var page = $(this).data("page");
		if(!page){
			page = 1;
		}
  		$.ajax({   
  			  url: "${pageContext.request.contextPath}/host/qna/reply/update"
   		    , type: "POST"
  			, data: {qnaNum:qnanum, selectedProNum: $("[name=selectedProNum]").val(), hostAnswer: $(this.form.hostAnswer).val(), page: page}
  			, dataType: "json"  
  			, success: function (result) { 
  				console.log(result);

   				if(result.qnaList.length > 0) { 
   					alert("답변이 등록 되었습니다.")
   					displayQnaList(result);
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
  	/* replyDeleteQna ajax */
  	$(".btnreplyDeleteQna").on("click", replyDeleteQna);
	function replyDeleteQna() {
  		 
  		var qnanum = $(this).data("qnanum"); 
  		var page = $(this).data("page");
		if(!page){
			page = 1;
		}
  		if(confirm("답변을 삭제하시겠습니까?")){
      		$.ajax({   
      			  url: "${pageContext.request.contextPath}/host/qna/reply/delete"
       		    , type: "POST"
      			, data: {qnaNum:qnanum, selectedProNum: $("[name=selectedProNum]").val(), page: page}
      			, dataType: "json"  
      			, success: function (result) { 
      				console.log(result);

       				if(result.qnaList.length >= 0) { 
       					alert("답변이 삭제되었습니다.")
       					displayQnaList(result);
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
</script>

</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
<style>
.table.table-striped {
	table-layout:fixed;
}
</style>
</body>
</html>