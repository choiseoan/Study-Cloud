<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta name="description" content="GARO is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/normalize.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/fontello.css">
<link href="<%=request.getContextPath() %>/resources/sneat/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/sneat/assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/sneat/assets/css/animate.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/bootstrap-select.min.css"> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/price-range.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/owl.carousel.css">  
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/owl.theme.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/owl.transitions.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/sneat/assets/css/responsive.css">
<spring:eval var="appkey" expression="@appkey.getProperty('appkey')"/>