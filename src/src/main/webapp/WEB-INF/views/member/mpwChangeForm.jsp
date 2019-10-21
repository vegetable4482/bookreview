
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>
<style>
/* div{
          outline : 1px solid gray;
        } */
/* form {
	margin: 50px 5%;
} */

#join {
	margin-top: 50px;
}

.errMsg {
	color: red;
	font-weight:bold;
	font-size:0.8em;
}

/* @media screen and (min-width:992px) {
	form {
		margin: 50px 35%;
	}
} */
</style>
<script>
  $(function(){
 	  $("#okBtn").on("click",function(e){
		  //해당 요소의 기본 이벤트 막기
		  e.preventDefault();
		 if( $("#fromPW").val().length == 0 ){
		  $("#error_1").text('비밀번호를 입력하세요!');
		  $("fromPW").focus();
		  return false;
	  };
		 if( $("#toPW").val().length == 0 ){
		  $("error_2").text('새 비밀번호를 입력하세요!');
		  $("toPW").focus();
		  return false;
	  };
		 if( $("#toPWChk").val().length == 0 ){
		  $("error_3").text('새 비밀번호 확인을 입력하세요!');
		  $("toPWChk").focus();
		  return false;
	  };
		 if( $("#toPW").val() != $("toPWChk").val() ){
		  $("error_3").text('새 비밀번호와 비밀번호 확인이 일치하지 않습니다');
		  $("toPWChk").focus();
		  return false;
	  }
		 if( $("#fromPW").val() == $("toPW").val() ){
		  $("error_3").text('현재 비밀번호와 새비밀번호가 동일합니다.');
		  $("toPWChk").focus();
		  return false;
	  }
	  $("#passwdDTO").submit();
	  });
	  
/* 	  //취소버튼 클릭시
	  $("#cancelBtn").on("click",function(e){
		  alert('**');
		  //해당요소의 기본 이벤트 막기
		  e.preventDefault();
		  $("passwdDTO").each(function(){
			  this.reset();
		  })
	  }); */
	  
  });
</script>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container">
	<div class="row col-sm-12 justify-content-center">
	<div class="col-sm-4 col-md-6 col-lg-5 col-xl-5">
	<form:form  modelAttribute="passwdDTO" action="${pageContext.request.contextPath }/member/changePw" method="post">
	<form:hidden path="id" value="${sessionScope.user.id}" />
	<div class="form-group"><h3 class="text-center">비밀번호 변경</h3></div>
	<div class="form-group"><form:password cssClass="form-control " path="fromPW" placeholder="현재 비밀번호"></form:password></div>
	<div class="form-group">
	 <form:errors cssClass="errMsg" path="fromPW"></form:errors>
	 <span  id="error_1" class="errMsg" ></span>
	 </div>
	<div class="form-group"><form:password cssClass="form-control "  path="toPW" placeholder="새 비밀번호"></form:password></div>
	<div class="form-group">
	<form:errors  cssClass="errMsg" path="toPW"></form:errors>
	 <span  id="error_1" class="errMsg"></span>	
	</div>
	<div class="form-group"><input class="form-control"  type="password"  id="toPWChk" placeholder="새 비밀번호 확인"></div>
	<div class="form-group">
	<span  class="errMsg" class="errMsg"></span>
	</div>
	<div class="form-group"><button id="okBtn" class="btn btn-md btn-danger btn-block">확인</button></div>
<!-- 	<div class="form-group"><button id="cancelBtn" class="btn btn-md btn-light btn-block">취소</button></div> -->
		</form:form>
		</div>
		</div>
	</div>	
	
</body>
<jsp:include page="../footer.jsp" />
</html>