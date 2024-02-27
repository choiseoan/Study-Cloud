<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/module/link.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>관리자와의 채팅</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" />
<script type="text/javascript">
	var webSocket = {
		init : function(param) {
			this._url = param.url;
			this._initSocket();
		},
		sendChat : function() {
			this._sendMessage('${param.room_id}', 'CMD_MSG_SEND', $('#message').val(), $('#division').val() );
			$('#message').val('');
		},
		sendEnter : function() {
			this._sendMessage('${param.room_id}', 'CMD_ENTER', $('#message').val(), $('#division').val());
			
			$('#message').val('');
		},
		receiveMessage : function(msgData) {

			// 정의된 CMD 코드에 따라서 분기 처리
			if (msgData.cmd == 'CMD_MSG_SEND') {
				if(msgData.division!= "${standname }" ){
					
					// 메세지 전송 시 참고해야하는 값 
					console.log('이건 변동 값: '+msgData.division);
					console.log('이건 고정 값: '+'${standname }');
					
					var chatLog = $('#chatLog');

					/* $( '.chatLog' ).scrollTop($('.chatLog')[0].scrollHeight); */
					$('#divChatData').append('<div align=\"left\" class=\"wrap\" >' + msgData.sender + '<div class=\"messageformleft\" style=\"max-width: 300px;\">' + msgData.msg + '</div>' + '<div class=\"chatTime\">'+ msgData.formatedNow+'</div>' +'</div>');

					//readCount 줄이기
					$.ajax({
					url: '${pageContext.request.contextPath}/chatting/reducecount',
					type: 'post',
					data: { "msg" :  msgData.msg },
					beforeSend : function(xhr){

		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
		                
		            },
		            success : function(data){
		            	
		            }
				});	
					
					chatLog.scrollTop(chatLog.prop('scrollHeight'));
				}
				else if(msgData.division== "${standname }" ){
					
					var chatLog = $('#chatLog');
					
					console.log('이건 변동 값: '+msgData.division);
					console.log('이건 고정 값: '+'${standname }');
					
					/* var divChatData = $('#divChatData');
					 */
					/* $( '.chatLog' ).scrollTop($('.chatLog')[0].scrollHeight); */
					$('#divChatData').append('<div align=\"right\" class=\"wrap\">'+ msgData.sender +'<div class=\"chatTime\">'+ msgData.formatedNow + '</div>' + '<div class=\"messageformright\" style=\"max-width: 300px;\">' + msgData.msg +'</div>' +'</div>');

					/* '이게readCount ' + msgData.readCount+ */
					
					chatLog.scrollTop(chatLog.prop('scrollHeight'));
					
				}
			}
			// 입장
			else if (msgData.cmd == 'CMD_ENTER') {
				$('#divEnterChatData').append('<div align="center ">' + msgData.msg + '</div>');
				
				
				// 들어왔을때 줄이기
				$.ajax({
					url: '${pageContext.request.contextPath}/chatting/entreducecount',
					type: 'post',
					data: { "enterId" :  msgData.enterId },
					beforeSend : function(xhr){

		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
		                
		            },
		            success : function(data){
		            	
		            }
				});	
				
				
				// 입장 시 참조 값
				console.log('입장 한 사람: '+msgData.enterId );
				
				$('.exit-'+msgData.enterId).remove();
				$('.entry-'+msgData.enterId).remove();
				
				if("${detailInfo.memAuthority}" == "ROLE_ADMIN"){
					
					console.log("관리자");
					
						$('.admin-enter').append(
		            		'<li class=\"list-group-item list-group-item-primary entry-'+msgData.enterId+'\">'+ msgData.enterId +'</li>'
		            	);
					
					
				}else{
					console.log("일반 유저");
					
						$('.user-enter').append(
								'<li class=\"list-group-item list-group-item-primary entry-'+msgData.enterId+'\">'+ msgData.enterId +'</li>'
		            			
		            	);
				}
				
				console.log('입장 한 사람 권한: '+ "${detailInfo.memAuthority}");
				
				/* $('.exiter-'+msgData.enterId).remove();
				$('.enter-'+msgData.enterId).remove(); */
				
				
				$.ajax({
					url: '${pageContext.request.contextPath}/chatting/onlinestatus',
					type: 'post',
					data: {"enterId" : msgData.enterId, "roomId" : msgData.room_id },
					beforeSend : function(xhr){

		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
		                
		            },
		            success : function(data){
		            	
		            	console.log('ENTER CONSOLE ');
		            	
		            	$('.exit-'+msgData.enterId).append(
		            		
		            		'<span class=\"glyphicon glyphicon-ok-circle enter-'+msgData.enterId+'\" style=\" float: right; color: green;\" aria-hidden=\"true\">ONLINE</span>'
		            			
		            	);
		            	
		            	$('.entry-'+msgData.enterId).append(
			            		
			            		'<span class=\"glyphicon glyphicon-ok-circle enter-'+msgData.enterId+'\" style=\" float: right; color: green;\" aria-hidden=\"true\">ONLINE</span>'
			            			
			            	);
		            	
		            }
				});				
				
			}
			// 퇴장
			else if (msgData.cmd == 'CMD_EXIT') {
				$('#divChatData').append('<div align="center ">' + msgData.msg + '</div>');
				
				// 퇴장 시 참조 값
				console.log('퇴장 한 사람: '+msgData.exitId );
				
				$('.enter-'+msgData.exitId).remove();
				$('.exiter-'+msgData.exitId).remove();
				
				$.ajax({
					url: '${pageContext.request.contextPath}/chatting/offlinestatus',
					type: 'post',
					data: {"exitId" : msgData.exitId, "roomId" : msgData.room_id },
					beforeSend : function(xhr){
	
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
		                
		            },
		            success : function(data){
		            	console.log(data);
		            	$('.entry-'+msgData.exitId).append(
		            			'<span class=\"glyphicon glyphicon-remove-circle exiter-' + msgData.exitId + '\" style=\" float: right; color: red;\" aria-hidden=\"true\">OFFLINE</span>'		            	
		            	);		
		            	$('.exit-'+msgData.exitId).append(
		            			'<span class=\"glyphicon glyphicon-remove-circle exiter-' + msgData.exitId + '\" style=\" float: right; color: red;\" aria-hidden=\"true\">OFFLINE</span>'		            	
		            	);	
		            }
					
				});
 			}
		},
		closeMessage : function(str) {
			$('#divChatData').append('<div align="center ">' + '연결 끊김 : ' + str + '</div>');
		},
		disconnect : function() {
			this._socket.close();
		},
		_initSocket : function() {
			this._socket = new SockJS(this._url);
			this._socket.onopen = function(evt) {
				webSocket.sendEnter();
			};
			this._socket.onmessage = function(evt) {
				webSocket.receiveMessage(JSON.parse(evt.data));
			};
			this._socket.onclose = function(evt) {
				webSocket.closeMessage(JSON.parse(evt.data));
			}
		},
		_sendMessage : function(room_id, cmd, msg, division, formatedNow, sender, enterId, exitId, readCount) {
			var msgData = {
				room_id : room_id,
				cmd : cmd,
				msg : msg,
				division : division,
				formatedNow : formatedNow,
				sender : sender,
				enterId : enterId,
				exitId : exitId,
				readCount : readCount
			};
			
			var jsonData = JSON.stringify(msgData);
			this._socket.send(jsonData);
		}
	};
	
	
	
</script>
<script type="text/javascript">
	$(window).on('load', function() {
		webSocket.init({
			url : '<c:url value="/chat" />'
		});
	});
</script>
</head>

<style>

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 700,
  'GRAD' 200,
  'opsz' 48
}

.none-scroll{
   -ms-overflow-style: none;
}
.none-scroll::-webkit-scrollbar{
  display:none;
}

.chatTime {
  display: inline-block;
  position: relative;
  top: 11px;
  color: #171717;
  font-size: 9px;
}

.messageformleft{
	position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    margin-right: 20px;
    border-radius: 10px;
    font-size: 13px;
    background-color: #ddd;
}

.messageformright{
	position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    margin-left: 20px;
    border-radius: 10px;
    font-size: 13px;
    background-color: #F9EB54;
}

.wrap {
    	word-break: break-all;
      	word-wrap: normal;

      }

/* #chatWrap {
    width: 600px;
    border: 1px solid #ddd;
} */

.page-head{
	background-color: rgb(227,229,232);
}


 #chatLog {
 	padding-right:2%;
 	padding-bottom:20px;
    height: 700px;
    overflow-y: scroll;
    
} 

#chatForm {
    display: block;
    width: 100%;
    height: 50px;
    border-top: 2px solid #f0f0f0;
}

#message{
 	width: 85%;
    border: none;
    padding-bottom: 0;
    height: calc(100% - 1px);
    
}

#message:focus {
    outline: none;
}

#chatForm > input[type=button] {
	float: right;
	height: 99%;
    outline: none;
    border: none;
    background: none;
    color: #0084FF;
    font-size: 17px;
  	border-top: 25px;    
}

/* 
#contentCover{
    width: 1280px;
    margin: 0 auto;
    padding-top: 20px;
    display: flex;
    justify-content: space-around;
} */

/* 
#chatHeader {
    height: 60px;
    text-align: center;
    line-height: 60px;
    font-size: 25px;
    font-weight: 900;
    border-bottom: 1px solid #ddd;
}
 */
#divChatData{
	border-top: 25px;    
	border-bottom: 20px;
}

</style>

<script>

	/* $( document ).ready( function() {
	    $( '.btnSend' ).click( function() {	    	
	    	$( '.chatLog' ).scrollTop($('.chatLog')[0].scrollHeight);
	    } );
	  } );
	 */
	$( document ).ready( function() {
		var chatLog = $('#chatLog');
		chatLog.scrollTop(chatLog.prop('scrollHeight'));
		/* $( '.chatLog' ).scrollTop($('.chatLog')[0].scrollHeight); */
	  } );
	/*
	$(document).height()  
	$('.chatLog')[0].scrollHeight
	*/
	
	var row = document.getElementById('btnSend');
	
	// 채팅방 리스트
	$( document).ready (function(){
		$('.searchRoom').click( function(){
			
			$.ajax({
	    		url: '${pageContext.request.contextPath}/chatting/searchroom',
	    		type: 'post',
	            data: {"searchKeyword" : $('.searchKeyword').val()},
	            beforeSend : function(xhr)
	               {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	               },
	    		//data : {memId:memId, memEmail:memEmail},
	            dataType : 'json',
	            success : function(result){
	            	
					$('.fix-li').remove();
					$('.instance-li').remove();
					
					updateCount($('.searchKeyword').val());
					
					$(result).each(function(index, item) {
	            		$('.fix-stand').append(
		            		'<li style=/"width: 100%;/" class=\"instance-li\" id=\"instance-li\">'+
		            			'<div class=\"list-group\" style=\"background-color: white; margin-bottom: 0px; word-break: break-all; word-wrap: normal;\">' +
		            				'<a href= \"<%=request.getContextPath()%>/chatting?room_id='+ item.chaRoomId+ '\" class=\"list-group-item active\" style=\"background-color: white;\">' +
		            					'<h4 class=\"list-group-item-heading\" style=\" color: black; margin-bottom: 15px;\">' + '채팅 건의자 : ' +  item.chaRoomId  +'</h4>'+
		            					'<p class=\"list-group-item-text\">채팅 미리보기:' + item.roomContents + '</p>'+
		            				'</a>'+
		            			'</div>'+
		            		'</li>'
		            	);
	            	});
	            }
	        });
            
		});
		
		 
	});
	
	function updateCount(chaRoomId) {
		$.ajax({
			url: '${pageContext.request.contextPath}/chatting/updatecount',
    		type: 'post',
			data: {"chaRoomId" : chaRoomId },
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
                
            },
            success : function(seacou){
            	
            	$('.fix-room').remove();
            	$('.instance-room').remove(); 
            	$('.instance-alert').remove();
            	
            	if(seacou == '0'){
	            	$('.roomCountdiv').append(
	            			'<h5 id=\"instance-room\" class=\"instance-room\" style=\" color: white; \" >검색된 채팅방</h3>'+
	            			'<p style=\"font-size: 50px; color: white; padding-left: 30%;\" id=\"fix-room\" class=\"fix-room\">' + seacou + '</p>'
	            	);
	            	
	            	$('.alertmsg').append(
	            			'<div style=\"width: 100%; height: 100%; \" class="instance-alert" id="instance-alert">'+ 
		            			'<p style=\"font-size:100%; padding-top: 25%;\" align=\"center\">검색어와 유사한 결과가 없습니다.<br> 다시 검색해 주세요.</p>'+	            			
	            			'</div>'
	            	);
	            }else{
            		$('.roomCountdiv').append(
	            			'<h5 id=\"instance-room\" class=\"instance-room\" style=\" color: white; \">검색된 채팅방</h3>'+
	            			'<p style=\"font-size: 50px; padding-left: 30%;  color: white; \" id=\"fix-room\" class=\"fix-room\">' + seacou + '</p>'
	            	);
            	}
            }
		});
	}
</script>

<body>
<%@ include file="/WEB-INF/views/module/header2.jsp"%> 
<section style="background-color: rgb(227,229,232);">
	<div class="count-area" style="background-color: rgb(227,229,232);">
		<div class="container" style="background-color: rgb(227,229,232);">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
					<h2 style="">관리자와의 채팅</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="register-area">
		<div class="container">
			<sec:authorize access="hasRole('ADMIN')">
				<div class="col-md-4" style="">
					<div class="col-xs-6" style="background-color:rgb(136,176,75); border-right-color: rgb(136,176,75); padding-top: 20px; height: 100px;">			
						<div style="text-align: center;">
							<button type="button" style="background-color:rgb(136,176,75);" onclick="QuitRoom()">
								<i class="fa fa-sign-out fa-5x" aria-hidden="true"></i>						
							</button>
						</div>			
					</div>
  					<div class="col-xs-6 roomCountdiv" style="background-color:rgb(136,176,75) ; border-color: rgb(58,152,240); height: 100px;" id="roomCountdiv">
	  						<h5 id="fix-room" class="fix-room" style="color: white; align-content: center;">개설된 채팅방</h3>
	  						<p style="font-size: 50px; color: white; padding-left: 30%;" id="fix-room" class="fix-room">${roomCount }</p>
  					</div>
  					<!-- <div class="col-xs-12" style="padding-left: 15px; padding-bottom: 5px ; padding-top: 5px; background-color: rgb(62,162,255); height: 60px;">
						<input style="background-color: rgb(81,171,255); height: 100%; " type="text">
					</div> -->
					<div class="input-group col-xs-12" style="padding-left: 15px; padding-right: 15px; padding-bottom: 5px ; padding-top: 20px; background-color: rgb(136,176,75); height: 60px; margin-bottom: 10px;">
				      <input type="text" class="form-control searchKeyword" id="searchKeyword" style="width: 100%; height: 100%; background-color: rgb(136,176,75); color: white; border-color:black ;" placeholder="Search for...">
				      <span class="input-group-btn">
				        <button class="btn btn-default searchRoom" id="searchRoom" style="width: 100%; height: 100%; background-color: rgb(136,176,75); color: rgb(138,208,255); border-color:black ;" type="button">
				        	<span class="glyphicon glyphicon-play" aria-hidden="true"></span>
				        </button>
				      </span>
				    </div>
					<div id="chtroomList alertmsg" class="chtroomList alertmsg" style="overflow-y: auto; height: 400px; display: block;">
						<ul style="list-style: none; padding-left: 0px;" class="fix-stand" id="fix-stand">
							<c:forEach items="${chrlist }" var="list">
								<li style="width: 100%;" class="fix-li" id="fix-li">
									<div class="list-group" style="background-color: white; margin-bottom: 0px; word-break: break-all; word-wrap: normal;">
										<a href="<%=request.getContextPath()%>/chatting?room_id=${list.chaRoomId}" class="list-group-item active" style="background-color: white;">
											<h4 class="list-group-item-heading"
												style="color: black; margin-bottom: 15px;">채팅 건의자 :
												${list.chaRoomId }</h4>
											<p class="list-group-item-text">채팅 미리보기:
												${list.roomContents }</p>
										</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="input-group col-xs-12" style="padding-left: 15px; padding-right: 15px; padding-bottom: 5px ; padding-top: 10px; padding-bottom: 10px; margin-top: 20px; background-color: rgb(240,242,245); height: 60px; margin-bottom: 10px; height: 208px; ">
						<ul style="height: 45%; padding-left: 0px; overflow: auto; list-style: none;" class="none-scroll admin-enter">
							<c:forEach items="${adminEntry }" var="aentry">
								<c:choose>
									<c:when test="${aentry.connectStatus == 'ONLINE' }">
										<li class="list-group-item list-group-item-primary entry-${aentry.memId }">${aentry.memId}<span class="glyphicon glyphicon-ok-circle enter-${aentry.memId}" style=" float: right; color: green;" aria-hidden="true">${aentry.connectStatus}</span> </li>
									</c:when>
									<c:otherwise>
										<li class="list-group-item list-group-item-primary exit-${aentry.memId }">${aentry.memId}<span class="glyphicon glyphicon-remove-circle exiter-${aentry.memId}" style=" float: right; color: red;" aria-hidden="true">${aentry.connectStatus}</span> </li>
									</c:otherwise>
								</c:choose> 	
							</c:forEach>															
						</ul>
						<ul style=" height: 45%; padding-left: 0px; overflow: auto; list-style: none;" class="none-scroll user-enter">
							<c:forEach items="${userEntry }" var="uentry"> 
								<c:choose>
									<c:when test="${uentry.connectStatus == 'ONLINE' }">
										<li class="list-group-item list-group-item-primary entry-${uentry.memId }">${uentry.memId } <span class="glyphicon glyphicon-ok-circle status enter-${uentry.memId}" style="float: right; color: green;" aria-hidden="true">${uentry.connectStatus }</span> </li>
									</c:when>
									<c:otherwise>
										<li class="list-group-item list-group-item-primary exit-${uentry.memId }">${uentry.memId } <span class="glyphicon glyphicon-remove-circle status exiter-${uentry.memId}" style="float: right; color: red;" aria-hidden="true">${uentry.connectStatus }</span> </li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
						
					</div>
				</div>
				<div class="col-md-8" style="background-color: rgb(227, 229, 232);">
				<div class="box-for overflow" style="background-color: rgb(240,242,245);">
					<div class="col-md-12 col-xs-12 login-blocks">
						 <hr>
						 <div id="chatLog" class="chatLog">
						 	<div id="divEnterChatData" ></div>
							<c:forEach items="${chatt }" var="chat">
								<c:if test="${chat.memId eq standname}">
									<div style="display: inline-block; width: 100%">									
										<div align="right" style=" 
										word-break: break-all;
      									word-wrap: normal;
										float: right;
										padding: 10px;
										width: max-content;
										max-width: 300px;
										margin-left: 53%; 
										margin-top: 7px; 
										border-radius: 10px; 
										font-size: 13px; 
										background-color: #F9EB54;">  ${chat.chaContents } </div>
									</div>
								</c:if>
								<c:if test="${chat.memId ne standname}">
									<div style="display: inline-block; width: 100%">
										<div align="left" style="
										padding: 10px;
										word-break: break-all;
      									width:max-content;
										max-width: 300px;
										margin-top: 7px; 
										border-radius: 10px;
										font-size: 13px;  background-color: #ddd;"> ${chat.chaContents } </div>
									</div>
								</c:if>	
							</c:forEach>
							<!-- 여기가 문장 저장 되는 곳 -->
							<div id="divChatData" ></div>
							
							
						</div>						
						<div id="chatForm" style="" class="container" onsubmit="return false">
								<div style="margin-top: 10px;">								
									<div style="display: inline-block; width: 90%;" > 
										<input style="width: 100%; background-color: rgb(240,242,245); " type="text" autocomplete="off" id="message" class="message " size="30" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />						
									</div>
									<div style="display: inline-block; width: 10%; float: right;">
									<!-- 	<input style="width: 100%; background-color: rgb(240,242,245); color: #0000ff;" type="button"  id="btnSend" class="btnSend" value="채팅전송" onclick="webSocket.sendChat()" /> -->	
										<button type="button" id="btnSend" class="btnSend"  onclick="webSocket.sendChat()"  style="width: 100%; background-color: rgb(240,242,245);"> <span class="glyphicon glyphicon-play" aria-hidden="true"></span> </button>						
									</div>
								</div>
								<input type="hidden" id="division" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" value="${standname }" />			
						</div>
					</div>
				</div>
				</div>
			</sec:authorize>
			
			
			<sec:authorize access="hasRole('USER')">
				<div class="col-md-8 col-md-offset-2" style="background-color: rgb(227, 229, 232);">
				<div class="box-for overflow" style="background-color: rgb(240,242,245);">
					<div class="col-md-12 col-xs-12 login-blocks container">
						 <hr>
						 <div id="chatLog" class="chatLog">
						 	<div id="divEnterChatData" ></div>
							<c:forEach items="${chatt }" var="chat">
								<c:if test="${chat.memId eq standname}">
									<div style="display: inline-block; width: 100%">									
										<div align="right" style=" 
										word-break: break-all;
      									word-wrap: normal;
										float: right;
										padding: 10px;
										width: max-content;
										max-width: 300px;
										margin-left: 53%; 
										margin-top: 7px; 
										border-radius: 10px; 
										font-size: 13px; 
										background-color: #F9EB54;">  ${chat.chaContents } </div>
									</div>
								</c:if>
								<c:if test="${chat.memId ne standname}">
									<div style="display: inline-block; width: 100%">
										<div align="left" style="
										padding: 10px;
										word-break: break-all;
      									width:max-content;
										max-width: 300px;
										margin-top: 7px; 
										border-radius: 10px;
										font-size: 13px;  background-color: #ddd;"> ${chat.chaContents } </div>
									</div>
								</c:if>	
							</c:forEach>
							<!-- 여기가 문장 저장 되는 곳 -->
							<div id="divChatData" ></div>
						</div>
						<div id="chatForm" style="" class="container" onsubmit="return false">
								<div style="margin-top: 10px;">								
									<div style="display: inline-block; width: 80%;" > 
										<input style="width: 100%; background-color: rgb(240,242,245); " type="text" autocomplete="off" id="message" class="message " size="30" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />						
									</div>
									<div style="display: inline-block; width: 20%; float: right;">
										<!-- <input style="width: 100%; background-color: white; color: #0000ff;" type="button"  id="btnSend" class="btnSend" value="채팅전송" onclick="webSocket.sendChat()" /> -->
										<button type="button" id="btnSend" class="btnSend"  onclick="webSocket.sendChat()"  style="width: 100%; background-color: rgb(240,242,245);"> <span class="glyphicon glyphicon-play" aria-hidden="true"></span> </button>							
									</div>
								</div>
								<input type="hidden" id="division" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" value="${standname }" />			
						</div>
					</div>
				</div>
				</div>
			</sec:authorize>
 			
		</div>
	</div> 
	<style>
	
	.goupbtnUp {
	  top: 80%;
	  left: 88%;
	  width: 50px;
	  height: 50px;
	  border-radius: 80%;
	  background-color: white;
	  border: rgb(200,200,200) 3px solid;
	  position: fixed;
	  z-index: 2;
	}
	
	.goupbtnDown {
	  top: 88%;
	  left: 88%;
	  width: 50px;
	  height: 50px;
	  border-radius: 80%;
	  background-color: white;
	  border: rgb(200,200,200) 3px solid;
	  position: fixed;
	  z-index: 2;
	}
	
	</style>
	
	<script>
		function clickmeUp() {
		  window.scrollTo({top:0, behavior:'smooth'});
		}
		
		function clickmeDown() {
			  window.scrollTo({top: document.body.scrollHeight, behavior:'smooth'});
			}
		
		function QuitRoom(){
			location.href="${pageContext.request.contextPath}/admin/chatting/list";
		}
	</script>
 	<%-- <div id="contentCover">
		<div id="chatWrap">
			<div id="chatLog" class="chatLog" style="overflow-y: scroll; ">
				<!-- 여기가 문장 저장 되는 곳 -->
				<div id="divChatData"  style="top: 10px;">
					<div id="divEnterChatData"  style="top: 10px;"></div>
					<c:forEach items="${chatt }" var="chat">
						<c:if test="${chat.memId eq standname}">
							<div align="right"> ${chat.chaContents } </div>
						</c:if>
						<c:if test="${chat.memId ne standname}">
							<div align="left"> ${chat.chaContents } </div>
						</c:if>	
					</c:forEach>
				</div>
			</div>
			<div id="chatForm" class="input-group mb-3" onsubmit="return false">
				<input type="hidden" id="division" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" value="${standname }" />
				<input type="text" autocomplete="off" id="message" class="message" size="30" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
				<input type="button" id="btnSend" class="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />			
			</div>
		</div>		
	</div> --%>
	<button class="goupbtnUp" type="button"  onclick="clickmeUp()">  <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span> </button>
	<button class="goupbtnDown" type="button"  onclick="clickmeDown()">  <span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span> </button>
</section>
<%@ include file="/WEB-INF/views/module/footer.jsp"%>
</body>
</html>