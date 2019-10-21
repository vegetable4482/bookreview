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
			document.getElementById("memberDTO").submit();
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
<style>
.errMsg{
	color:red;
	font-size:0.8em;
	font-weight:bold;
}


</style>
</head>
<body>
<!-- 디폴트가 post이기떄문에  (post방식일경우)메소드 써주지않아도됨 -->
<form:form modelAttribute="memberDTO" action="${pageContext.request.contextPath }/test/memberJoin">
	<img src="http://danonline.kr/snoopym/images/snoopy_spoon.png?crc=3980034464" alt="" width="200px"/><br>
	아이디 : <form:input type="text" path="id" /><br>
	<form:errors path="id" cssClass="errMsg"/><br>
	별칭 : <form:input type="text" path="nickname" /><br>
	<form:errors path="nickname"  cssClass="errMsg"/><br>
	나이 : <form:input type="text" path="age" /><br>
	<form:errors path="age"  cssClass="errMsg"/><br>
	
	<form:select path="region" >
		<option value=""> 지 역 선 택</option>
		<form:options items="${region }" itemValue="code" itemLabel="label"/>
	
	</form:select>
	<button type="button" id="joinBtn">가입하기</button>
</form:form>
</body>
</html>