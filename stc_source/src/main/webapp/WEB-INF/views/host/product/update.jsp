<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 수정 페이지</title>
<%@ include file="/WEB-INF/views/module/link.jsp" %>
</head>
<body>
<section>
  <%@ include file="/WEB-INF/views/module/header2.jsp" %>

        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->
        

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title"><span class="orange strong">공간수정 page</span></h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header --> 

        <!-- property area -->
        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">
                        <form action="update" method="post" enctype="multipart/form-data">
                            <div class="profiel-header">
                                <h3>
                                    <b>수정</b><br>
                                </h3>
                                <hr>
                            </div>
                            <div class="clear">
                                <div class="col-sm-10 col-sm-offset-1">
                                    <div class="form-group">
                                        <label>공간이름</label>
                                        <input name="proName" type="text" class="form-control" value="${productDetail.proName }">
                                    </div>
                                    <div class="form-group">
                                        <label>상품소개 :</label>
                                        <input name="proPost" type="text" class="form-control" value="${productDetail.proPost }">
                                    </div> 
                                    <div class="form-group">
                                        <label>시설안내 :</label>
                                        <input name="proInfo" type="text" class="form-control" value="${productDetail.proInfo }">
                                    </div> 
                                    <div class="form-group">
                                        <label>유의사항 :</label>
                                        <input name="proNotice"type="text" class="form-control" value="${productDetail.proNotice }">
                                    </div> 
                                    <div class="form-group">
                                        <label>환불정책 :</label>
                                        <input name="proRefund" type="text" class="form-control" value="${productDetail.proRefund }">
                                    </div> 
                                    <div class="form-group">
                                        <label>주소 : </label>
                                        <input name="proAddress" type="text" class="form-control" value="${productDetail.proAddress }">
                                    </div> 
                                    <div class="form-group">
                                        <label>전화번호 :</label>
                                        <input name="proPhone" type="text" class="form-control" value="${productDetail.proPhone }">
                                    </div> 
                                    <div class="form-group">
                                        <label>이미지 :</label>
                                        <input name="uploadfile" type="file" class="form-control" >
                                        <input type="hidden" name="proPicOriginalOld" value="${productDetail.proPicOriginal }">
                                        <input type="hidden" name="proPicRenameOld" value="${productDetail.proPicRename }">
<!--                                     	<img alt="" src="../{productDetail.proPicRename }"> -->
                                    </div>
                                    
                                    
                                    <input type="button" onclick="findPostCode()" value="주소 검색"><br>
									<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                                    
                                    <div class="form-group">
                                        <label>우편번호 :</label>
                                    <input type="text" name="proZipcode" id="postcode" placeholder="우편번호" readonly>
									<input type="hidden" name="proAddress" id="proAddress" value="">
									<input type="text" name="pre_proAddress" id="roadAddress" placeholder="도로명주소" readonly>
									<span id="guide" style="color:#999;display:none"></span>
									<input type="text" id="detailAddress" name="pre_proAddress"  placeholder="상세주소를 입력해주세요">
									<input type="text" id="extraAddress" placeholder="참고항목" readonly>
                                    </div>
                               
                                <div class="col-sm-10 col-sm-offset-1">
                                   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                   <input type="hidden" name="proNum" value="${productDetail.proNum }">
                                   <button type="submit">수정</button>
                                   
                                   <button type="submit" name="delete">삭제하기</button>
                                </div>
                                    
                                </div>
                               
                               
                               
                            </div>
                         </form>
                    </div>
                </div><!-- end row -->
             </div>
        </div>

  
        

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/modernizr-2.6.2.min.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/jquery-1.10.2.min.js"></script> 
        <script src="<%=request.getContextPath() %>/resources/sneat/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/bootstrap-select.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/easypiechart.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/jquery.easypiechart.min.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/owl.carousel.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/wow.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/icheck.min.js"></script>
        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/price-range.js"></script>

        <script src="<%=request.getContextPath() %>/resources/sneat/assets/js/main.js"></script>
        
        <script>
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
</script>
        
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          <script> 	 
          
          $("#btnSubmit").click(function(){
        	// ctrl로 전달된 데이터는 roadAddr + ' ' + extraRoadAddr 형태
  			document.getElementById("proAddress").value = document.getElementById("roadAddress").value + ' ' + document.getElementById("detailAddress").value;
        	 console.log($("#frmInsert").serialize()); 
        	 $("#frmInsert").submit();
          });
          function findPostCode(){
          new daum.Postcode({
        	  oncomplete: function(data) {
        	   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }
			
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

//             } else if(data.autoJibunAddress) {
//                 var expJibunAddr = data.autoJibunAddress;
//                 guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//                 guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
          }
</script>
        
        
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>
</html>