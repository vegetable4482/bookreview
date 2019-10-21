<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<script>
    window.onload = function () {
        var modifyBtn = document.getElementById("modify");
        // console.log(joinBtn);
        modifyBtn.addEventListener("click", memberModify, false);
 
      }
   function memberModify() { 
       //alert('클릭!!');
   	    var okCnt = 0; 
       	var email = document.getElementById("id").value;
        var pwd = document.getElementById("pwd").value;
        var phone = document.getElementById("phone").value;
        var regionTag = document.getElementById("region");
        var regionText = regionTag.options[regionTag.selectedIndex].text;
        var regionValue = regionTag.options[regionTag.selectedIndex].value;
        var gender = null;
        var nickname = document.getElementById("nickname").value;

        try {
          gender = document.querySelector("input[name='gender']:checked").value;
        } catch { }

        //1) 이메일 주소 체크
        var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        // console.log(emailReg.test(email));
        if (!emailReg.test(email)) {
        
					  	document.getElementById("id").className="form-control is-invalid";
				    	document.getElementById("errId").innerHTML = '아이디의 형식이 올바르지 않습니다.';
				    	document.getElementById("id").focus();
          if(email == ""){
        		document.getElementById("id").className="form-control is-invalid"
 	          document.getElementById("errId").innerHTML = '아이디를 입력하세요';
 	          document.getElementById("id").focus();
						  }
        } else {
        	document.getElementById("id").className="form-control is-valid";
          document.getElementById("errId").innerHTML = "";
          okCnt++;
        }
        //2) 비밀번호 체크 : 8~16이하, 소문자,숫자,대문자,특수문자
        //비밀번호가 정규표현식에 맞는지 체크
        var pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
        // console.log(pwdReg.test(pwd));
        if (!pwdReg.test(pwd)) {
		  		document.getElementById("pwd").className="form-control is-invalid";
		    	document.getElementById("errPwd").innerHTML = '비밀번호 형식이 올바르지 않습니다.';
		    	document.getElementById("pwd").focus();
          if(pwd == ""){
      		document.getElementById("pwd").className="form-control is-invalid"
          document.getElementById("errPwd").innerHTML = '비밀번호를 입력하세요';
          document.getElementById("pwd").focus();
		 		  }
        } else {
         	document.getElementById("pwd").className="form-control is-valid"
          document.getElementById("errPwd").innerHTML = "";
          okCnt++;
        }

        //3) 전화번호 체크
        var phoneReg = /^\d{3}?\d{3,4}?\d{4}$/;;
        if (!phoneReg.test(phone)) {
        	 document.getElementById("phone").className ="form-control is-invalid";
          document.getElementById("errPhone").innerHTML = '전화번호가 잘못 입력되었습니다';
          document.getElementById("phone").focus();
          if(phone == ""){
      		document.getElementById("phone").className="form-control is-invalid"
          document.getElementById("errPhone").innerHTML = '전화번호를 입력하세요';
          document.getElementById("phone").focus();
		 		  }
        } else {
        	document.getElementById("phone").className="form-control is-valid";
          document.getElementById("errPhone").innerHTML = "";
          okCnt++;
        }

        //4) 지역 체크
        if (!(regionValue != null && regionValue != "" )) {
        	document.getElementById("region").className ="form-control is-invalid";
          document.getElementById("errRegion").innerHTML = '지역을 선택하세요';
          document.getElementById("region").focus();
  
        } else {
        	document.getElementById("region").className="form-control is-valid";
          document.getElementById("errRegion").innerHTML = "";
          okCnt++;
        }
        //5) 성별 체크
        if (gender == "" || gender == null) {
        	document.getElementById("gender").className ="form-control is-invalid";
          document.getElementById("errGender").innerHTML = '성별을 선택하세요';
        } else {
        	document.getElementById("gender").className ="form-control is-valid";
          document.getElementById("errGender").innerHTML = "";
          okCnt++;
        }
        //6) 닉네임입력
         if (nickname == "" || nickname == null) {
        	 document.getElementById("nickname").className ="form-control is-invalid";
          document.getElementById("errNickname").innerHTML = '별칭을 입력하세요';        
        } else {
        	document.getElementById("nickname").className ="form-control is-valid";
          document.getElementById("errNickname").innerHTML = "";
          okCnt++;
        }
        //유효성체크 이상 없을시 메인 화면으로 이동
        if (okCnt == 6) {
          alert('수정이 완료되었습니다');
          document.getElementById('modifyForm').submit();
         

        }
        }
   
        </script>
<style>
/* div{
          outline : 1px solid gray;
        } */
form {
	margin: 50px 5%;
}

#modify {
	margin-top: 50px;
}

.errMsg {
	color: red;
}

@media screen and (min-width:992px) {
	form {
		margin: 50px 35%;
	}
	#join {
		width: 280px;
	}
}
</style>
<jsp:include page="../header.jsp" />
<form id="modifyForm"
	action="${pageContext.request.contextPath }/member/memberModify"
	method="post"  enctype="multipart/form-data">
	<p class="h3 text-center">회원수정</p>
	<div class="form-row">
		<label for="validationServer01">아이디</label> <input type="email"
			class="form-control" name="id" id="id" required
			value="${memberDTO.id }" readOnly>
		<div class="errMsg w-100 small" id="errId"></div>
	</div>
	<div class="form-row">
		<label for="validationServer02">비밀번호</label> <input type="password"
			class="form-control" name="pw" id="pwd" placeholder="기존 비밀번호를 입력해주세요"
			required>
		<div class="errMsg w-100 small" id="errPwd"></div>
	</div>
	<div class="form-row">
		<label for="validationServer03">전화번호</label> <input type="tel"
			class="form-control" name="tel" id="phone"
			required value="${memberDTO.tel}" >
		<div class="errMsg w-100 small" id="errPhone"></div>
	</div>
	<div class="form-row">
		<label for="region">지역</label> <select
			class="custom-select form-control" name="region" id="region">
			<option value="0">==지역선택==</option>
			<option value="서울"
				<c:if test="${memberDTO.region eq '서울'}">selected</c:if>>서
				울</option>
			<option value="경기"
				<c:if test="${memberDTO.region eq '경기'}">selected</c:if>>경
				기</option>
			<option value="인천"
				<c:if test="${memberDTO.region eq '인천'}">selected</c:if>>인
				천</option>
			<option value="대전"
				<c:if test="${memberDTO.region eq '대전'}">selected</c:if>>대
				전</option>
			<option value="충북"
				<c:if test="${memberDTO.region eq '충북'}">selected</c:if>>충
				북</option>
			<option value="충남"
				<c:if test="${memberDTO.region eq '충남'}">selected</c:if>>충
				남</option>
			<option value="대구"
				<c:if test="${memberDTO.region eq '대구'}">selected</c:if>>대
				구</option>
			<option value="부산"
				<c:if test="${memberDTO.region eq '부산'}">selected</c:if>>부
				산</option>
			<option value="울산"
				<c:if test="${memberDTO.region eq '울산'}">selected</c:if>>울
				산</option>
			<option value="제주"
				<c:if test="${memberDTO.region eq '제주'}">selected</c:if>>제
				주</option>
		</select>
		<div class="errMsg w-100 small" id="errRegion"></div>
	</div>
	<div class="form-row">
		<label for="validationServer05">성별</label>
		<div class="form-control" id="gender">
			<span class="b12">여성</span><input type="radio" name="gender" id="여"
				value="여" checked> <span class="b12">남성</span><input
				type="radio" name="gender" id="남" value="남">

		</div>
	</div>
	<div class="errMsg w-100 small" id="errGender"></div>

	<div class="form-row">
		<label for="validationServerUsername">별칭</label>
		<div class="input-group ">
			<div class="input-group-prepend ">
				<span class="input-group-text " id="inputGroupPrepend3">@</span>
			</div>
			<input type="text" class="form-control" name="nickname" id="nickname"
				placeholder="Username" aria-describedby="inputGroupPrepend3"
				required value="${memberDTO.nickname }">
			<div class="errMsg w-100 small" id="errNickname"></div>
		</div>
	</div>
		<div class="form-row">
		<label for="validationServer01" >프로필사진 변경</label>
		<img alt="이미지 " src="${pageContext.request.contextPath }/resources/img/upload/${memberDTO.randomFn}" width="100%" height="300px;">
		<div class=""></div>
		</div>
		<div class="form-row">
		<label for="validationServer01" >파일첨부</label>
		<input type="file" class="form-control" name="file" id="file" >
		<div class=""></div>
	</div>

	<input class="btn btn-danger btn-block" id="modify" type="button" value="수정">
</form>


</body>
<jsp:include page="../footer.jsp" />
</html>