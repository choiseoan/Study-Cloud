<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 - 내 Q&A</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.3.js" ></script>
</head>
<body>
<%@ include file="/WEB-INF/views/module/header2.jsp" %>
<section>
<input type="hidden" class="form-control" name="memId" value="${pageContext.request.userPrincipal.name}">
        <!-- selectedProNum -->

        <div class="slider-area" >
            <div class="slider-content">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-12">
                        <div class="">
                            <form action="" class="form-inline">
                                <div class="form-group">                                   
                                    <select name="selectedProNum" id="selectedProNum" class="form-control" style="width: 220px;">
                                    	<c:forEach items="${userQna.productList }" var="product"> 	
				                        	<option value="${product.proNum }">${product.proName }</option>
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
						        <th colspan="1" class="text-center">날짜</th>
						        <th colspan="4" class="text-center">Q&A 내용</th>
						        <th colspan="1" class="text-center">관리</th>
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
	var selectedProNum = '${userQna.selectedProNum}';
	$("#selectedProNum").val(selectedProNum).prop("selected", true);
	
	getQnaListHandler();
	
	$("#selectedProNum").change(getQnaListHandler);
	
	function getQnaListHandler(){
		var selectedProNum = $("#selectedProNum").val();
		var memId = '${pageContext.request.userPrincipal.name}';
		var page = $(this).data("page");
		if(!selectedProNum){
			selectedProNum = 0;
		}
		if(!page){
			page=1;
		}

		$.ajax({
			 url: "${pageContext.request.contextPath}/user/qna"
		   , type: "POST"
		   , data: {selectedProNum: selectedProNum
			   		, memId: memId
					, page: page
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
			htmlVal += '<td colspan="1">'+qna.qnaDate+'</td>';
			htmlVal += '<td colspan="4">'+qna.memQuestion
			htmlVal += '<td colspan="1">';
			htmlVal += '<button data-toggle="modal" data-target="#update'+qna.qnaNum+'" type="button">수정</button>&nbsp&nbsp';
			htmlVal += '<button class="btndeleteQna" type="button" data-qnanum="'+qna.qnaNum+'">삭제</button>';			
			htmlVal += '<div class="modal" id="update'+qna.qnaNum+'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">';
			htmlVal += '<div class="modal-dialog">';
			htmlVal += '<div class="modal-content">';									
			htmlVal += '<div class="modal-header">';
			htmlVal += '<h4 class="modal-title text-center" id="exampleModalLabel">Q&A 수정';
			htmlVal += '<button type="button" class="btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="pe-7s-close"></span></button></h4>';										    
			htmlVal += '</div>';							
			htmlVal += '<form>';
			htmlVal += '<div class="modal-body">';											
			htmlVal += '<div class="mb-3"><br>';
			htmlVal += '<textarea class="form-control memQuestion" name="memQuestion" placeholder="내용" style="height: 300px;">'+qna.memQuestion+'</textarea>';
			htmlVal += '</div></div>';
			htmlVal += '<div class="modal-footer">';
			htmlVal += '<div class="button notice-btn">';
			htmlVal += '<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
			htmlVal += '<button type="button" class="reply btnupdateQna" data-dismiss="modal" data-pronum="'+qna.proNum+'" data-qnanum="'+qna.qnaNum+'">등록</button>';												
			htmlVal += '</div></div></form>';
			htmlVal += '</div></div></div>';
			htmlVal += '</td>';
			htmlVal += '</tr>';
		}
		$("tbody[id=qList]").html(htmlVal);
		var selectedProNum = result.selectedProNum;
		$("#selectedProNum").val(selectedProNum).prop("selected", true);
		
		displayPaging(result);
		$(".btnupdateQna").on("click", updateQna);
  		$(".btndeleteQna").on("click", deleteQna);
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
	
	
  	$(".btnupdateQna").on("click", updateQna);
  	function updateQna() {

  		var qnanum = $(this).data("qnanum"); 
  		var page = $(this).data("page");
		if(!page){
			page = 1;
		}
  		$.ajax({   
  			  url: "${pageContext.request.contextPath}/user/qna/update"
   		    , type: "POST"
  			, data: {qnaNum:qnanum, proNum:$("[name=proNum]").val()
  				, selectedProNum: $("[name=selectedProNum]").val()
  				, memQuestion: $(this.form.memQuestion).val(), page: page}
  			, dataType: "json"  
  			, success: function (result) { 

   				if(result.qnaList.length > 0) { 
   					alert("수정되었습니다.")
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
      			  url: "${pageContext.request.contextPath}/user/qna/delete"
       		    , type: "POST"
      			, data: {qnaNum:qnanum, selectedProNum: $("[name=selectedProNum]").val(), page: page}
      			, dataType: "json"  
      			, success: function (result) { 
      				
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