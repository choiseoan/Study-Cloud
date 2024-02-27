
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
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
						        <th colspan="1" class="text-center">날짜</th>
						        <th colspan="4" class="text-center">리뷰 내용</th>
						        <th colspan="1" class="text-center">관리</th>
				    		</tr>
						</thead>
						<tbody id="">
							<c:forEach items="${userQna.reviewList }" var="review">
							<tr data-revnum="${review.revNum }">
								<td colspan="1">${review.revDate }</td>
								<td colspan="4">${review.revContents }</td>
								<td colspan="1">
								<button class="btndeleteQna" type="button" data-qnanum="${review.revNum }">삭제</button></td>
							</tr>
							</c:forEach>
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

</script>

</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>