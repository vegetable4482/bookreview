<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<style>
.errMsg {
		color : #f00;
		font-size: 0.8rem;
	}
	.custom-f{
		font-size: 0.8rem;
		font-weight: bold;
	}
	.tag1{
		font-size:0.8rem;
	}

@media screen and (min-width:768px) {
.form-signin{
	margin:0px 35%;
}
#logo{
 text-align:left;
}
}
</style>
<script>
	window.addEventListener("load",init,false);
	function init(){
		let loginBtn = document.getElementById("loginBtn");
		loginBtn.addEventListener("click",loginf,false);
	
		function loginf(){
			//유효성 체크
			//1)아이디
			let idTag = document.getElementById("id");
			if(idTag.value.length == 0 ){
				idTag.nextElementSibling.innerText = "아이디를 입력하세요!";
				return false;
			}
			
			//2)비밀번호
			let pwTag = document.getElementById("pw");
			if(pwTag.value.length == 0 ){
				pwTag.nextElementSibling.innerText = "비밀번호를 입력하세요!";
				return false;
			}
			//양식을 서버에 전송
			document.getElementById("frm").submit();
		}
	}
</script>
<body>
	<jsp:include page="../header.jsp" />
	<img class="mt-5"
		src="https://data.ac-illust.com/data/thumbnails/78/7877e8c81ac0a942265a9b65a049b784_t.jpeg" width="300px" >

	<body class="text-center">
	<form class="form-signin" id="frm" action="${pageContext.request.contextPath}/login/loginOk" method="post">
	<br>
  <label for="inputEmail" class="sr-only">ID</label>
  <input type="email" id="id" name="id" class="form-control"
			placeholder="ID" required autofocus>


	<b class="errMsg"></b>
	
	<br>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="pw" name="pw" class="form-control"
			placeholder="Password" required>
			
			
	<b class="errMsg"></b>
  <div class=" mb-3">
  </div>
  <button class="btn btn-lg btn-primary btn-block" id="loginBtn" type="submit">Sign in</button>
  <hr>
 	<div class="d-flex justufy-content-center my-3">
 		<div class="col-sm-4">
 			<a href="#"  class="tag1 text-decoration-none text-muted">아이디찾기</a>
 		</div>
 	
 		<div class="col-sm-4">
 			<a href="#" class="tag1 text-decoration-none text-muted">비밀번호 찾기</a>
 		</div>
 		
 		<div class="tag1 col-sm-4 text-center">
						<a href="${pageContext.request.contextPath }/member/memberJoinForm" class="text-decoration-none text-muted">회원가입</a>
					</div>
 	</div>
 	<hr>
  <p class="mt-5 mb-5 text-muted" style="font-size:4px;">&copy; 2017-2019</p>
</form><jsp:include page="../footer.jsp" />
</body>


</html>