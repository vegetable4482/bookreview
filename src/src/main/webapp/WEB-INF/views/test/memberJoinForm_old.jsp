<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script>

window.addEventListener("load",init,false);

function init(){
	let joinBtn =document.getElementById("joinBtn");
	joinBtn.addEventListener("click",joinf,false);

function joinf(){
	alert('클릭');
		if(validationChk){
		document.getElementById("joinFrm").submit();
		}
	}
function validationChk(){
	if(document.getElementById("id").value.trim().length ==0){
		return false;
	}
	if(document.getElementById("nickname").value.trim().length ==0){
		return false;
	}
	if(document.getElementById("age").value.trim().length ==0){
		return false;
	}
		return true;
	}
}
</script>
</head>
<body>
<form id="joinFrm" action="${pageContext.request.contextPath }/test/memberJoin" method="post">
	<img src="https://pbs.twimg.com/profile_images/1152375730535165952/KT994bXf_400x400.jpg" alt="" /> <br>
	아이디 : <input type="text" name="id" id="id" value="${memberDTO.id }"/> <br>
	별   칭 : <input type="text" name="nickname" id="nickname" value="${memberDTO.nickname }" /> <br>
	나   이 : <input type="text" name="age" id="age" value="${memberDTO.age }"/> <br>
	<input type="button" id="joinBtn" value="가입하기">
</form>
</body>
</html>