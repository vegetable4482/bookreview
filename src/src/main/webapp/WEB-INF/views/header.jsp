 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title> IT BOOK REVIEW </title>

    <!-- Bootstrap core CSS -->
    
<link href="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">

<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/cover/">
<!-- fontawesome -->

<link href="${pageContext.request.contextPath }/webjars/font-awesome/5.9.0/css/all.css"  rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      #h_title{
      font-size: 1.2em;
      }
      #h_login, #h_join{
      width:46px;
      font-size:0.7em;
      }
      
      
   
      @media (min-width: 768px) {
        #h_title{
      font-size: 2em;
      }
      .fas{
      width:400px;
      }
      .fas{
      width:400px;
      }
      #h_login, #h_join{
      width:60px;
      font-size:0.7em;
      }
      #logo{
      margin-left:50px;
      }
      #h_logout, #h_join{
      margin-right: 90px;
      }
      }
    </style>
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/resources/css/blog.css" rel="stylesheet">
    
    
    <script src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/dist/jquery.js" ></script>
    <script src="${pageContext.request.contextPath }/webjars/popper.js/1.14.7/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
  </head>
  <body>
    <div class="container-12">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
   	
      <div class="col-4 pt-1" id="logo">
        <a class="text-muted" href="${pageContext.request.contextPath }"><span style="font-size: 18px; color: gray;"><i class="fas fa-globe-asia fa-3x"></i></span></a>
      
      </div>
      
      <div class="col-4 text-center">
        <a class="blog-header-logo " id="h_title" style="color:gray;"  href="${pageContext.request.contextPath }">IT BOOK REVIEW</a>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <%-- <a class="text-muted" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        </a> --%>
        
       <!-- 로그인 전후 -->
 				 <c:choose>
        <c:when test="${empty sessionScope.user }">
        
        <a class="btn btn-sm btn-outline-secondary mr-2 " id="h_login" href="${pageContext.request.contextPath }/login/login">LOGIN</a>
        <a class="btn btn-sm btn-outline-secondary" id="h_join" href="${pageContext.request.contextPath }/member/memberJoinForm">JOIN US</a>
      </c:when>
      <c:otherwise>
      
      <div class="btn-group">
      <button class="btn btn-sm btn-outline-secondary dropdown-toggle mr-2"
      							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      ${sessionScope.user.nickname  }님      
      </button>
     <div class="dropdown-menu">
     	<a href="${pageContext.request.contextPath}/member/memberModifyForm/${sessionScope.user.id }" class="dropdown-item">내정보수정</a>     	
     	<a href="${pageContext.request.contextPath}/member/mpwChangeForm" class="dropdown-item">비밀번호 변경</a>
     	<a href="${pageContext.request.contextPath}/member/memberOutForm" class="dropdown-item">회원탈퇴</a>
     
     
     
     </div>
      <a href="${pageContext.request.contextPath }/login/logout" id="h_logout" class="btn btn-sm btn-outline-secondary">LOGOUT</a>
      </div>
      </c:otherwise>
      </c:choose>
      </div>
    </div>
  </header>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
	  <a class="navbar-brand" href="#">&nbsp;&nbsp;</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
		
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item">
	        <a class="nav-link" href="javascript:alert('공사중')">NOTICE <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="javascript:alert('공사중')">REVIEW</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          COMMUNITY
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="${pageContext.request.contextPath }/bbs/list">JAVA SCRIPT</a>
	          <a class="dropdown-item" href="javascript:alert('공사중')">DATA BASE</a>
	          <a class="dropdown-item" href="javascript:alert('공사중')">JQUERY</a>
	          <a class="dropdown-item" href="javascript:alert('공사중')">HTML</a>
	          <a class="dropdown-item" href="javascript:alert('공사중')">JSP</a>
	        </div>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="javascript:alert('공사중')">EVENT</a>
	      </li>
	      <!-- <li class="nav-item">
	        <a class="nav-link disabled" href="javascript:alert('공사중')" tabindex="-1" aria-disabled="true" >관리자</a>
	      </li> -->
	    </ul>
	    <!-- <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form> -->
	  </div>
	</nav>
   