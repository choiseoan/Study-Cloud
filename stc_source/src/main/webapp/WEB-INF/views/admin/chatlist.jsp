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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>관리자 채팅 관리</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<%@ include file="/WEB-INF/views/module/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/views/module/header2.jsp"%>
	<style>
.none-scroll {
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

.none-scroll::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.styled-table {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 0.9em;
	font-family: sans-serif;
	min-width: 400px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
	background-color: #009879;
	color: #ffffff;
	text-align: left;
}

.styled-table th, .styled-table td {
	padding: 12px 15px;
}

.styled-table tbody tr {
	border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
	border-bottom: 2px solid #009879;
}

.styled-table tbody tr.active-row {
	font-weight: bold;
	color: #009879;
}
</style>

	<section>
		<!-- 테이블구역 -->
		<div class="count-area">
			<div class="container">
				<div class="row">
					<div
						class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
						<h2>답변자가 배치되지 않은 개설된 채팅방</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="content-area recent-property"
			style="padding-bottom: 55px;">
			<div class="container">
				<div class="notice-slider-area">
					<div class="notice-slider-content">
						<div class="row none-scroll"
							style="padding-top: 15px; height: 300px; overflow: auto;">
							<table class="table table-striped styled-table" border="1px">
								<thead>
									<tr>
										<th style="text-align: center;">건의자</th>
										<th style="text-align: center;">남긴 마지막 내용</th>
										<th style="text-align: center;">전송 시간</th>
										<th style="text-align: center;">행동</th>
									</tr>
								</thead>
								<tbody style="overflow: auto;" class=" none-scroll">
									<c:forEach items="${roomList }" var="list">
										<tr class="active-row">
											<td style="text-align: center;">${list.chaRoomId }</td>
											<td style="text-align: center;">${list.roomContents }</td>
											<td style="text-align: center;">${list.roomLastDate }</td>
											<td style="text-align: center; padding: 0px;">
												<button class="btn btn-info" type="button"
													style="width: 100%;"
													onclick="location.href='<%=request.getContextPath()%>/chatting?room_id=${list.chaRoomId }'">입장</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="count-area" style="margin-top: 200px;">
				<div class="container">
					<div class="row">
						<div
							class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
							<h2>입장한 채팅방</h2>
						</div>
					</div>
				</div>
			</div>

			<div class="content-area recent-property "
				style="padding-bottom: 55px;">
				<div class="container">
					<div class="notice-slider-area">
						<div class="notice-slider-content">
							<div class="row none-scroll"
								style="padding-top: 15px; height: 400px; overflow: auto;">
								<table class="table table-striped styled-table" border="1px">
									<thead>
										<tr>
											<th style="text-align: center;">건의자</th>
											<th style="text-align: center;">남긴 마지막 내용</th>
											<th style="text-align: center;">전송 시간</th>
											<th style="text-align: center;">행동</th>
										</tr>
									</thead>
									<tbody style="overflow: auto;" class=" none-scroll">
										<c:forEach items="${enterList }" var="list">
											<tr class="active-row">
												<td style="text-align: center;">${list.chaRoomId }</td>
												<td style="text-align: center;">${list.roomContents }</td>
												<td style="text-align: center;">${list.roomLastDate }</td>
												<td style="text-align: center; padding: 0px;">
													<button class="btn btn-info" type="button"
														style="width: 100%;"
														onclick="location.href='<%=request.getContextPath()%>/chatting?room_id=${list.chaRoomId }'">입장</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<%@ include file="/WEB-INF/views/module/footer.jsp"%>

</body>
</html>