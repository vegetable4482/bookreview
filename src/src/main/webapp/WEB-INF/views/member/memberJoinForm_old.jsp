<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script>
    window.onload = function () {
        var joinBtn = document.getElementById("join");
        // console.log(joinBtn);
        joinBtn.addEventListener("click", memberJoin, false);
      }
   function memberJoin() { 
       //alert('클릭!!');
       var okCnt = 0;
  	 
  	 
       var email = document.getElementById("id").value;
        var pwd = document.getElementById("pwd").value;
        var pwdChk = document.getElementById("pwdChk").value;
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

        //비밀번호 재확인이 정규표현식에 맞는지 체크

        if (!pwdReg.test(pwdChk)) {
        	document.getElementById("pwdChk").className="form-control is-invalid";
          document.getElementById("errpwdChk").innerHTML = '비밀번호가 일치하지 않습니다';
          document.getElementById("pwdChk").focus();
          if(pwdChk == ""){
        		document.getElementById("pwdChk").className="form-control is-invalid"
            document.getElementById("errPwd").innerHTML = '비밀번호를 입력하세요';
            document.getElementById("pwdChk").focus();
  		 		  }
          
        } else {
          // document.getElementById("errpwdChk").innerHTML ="";
          // okCnt ++;
          //비밀번호 & 비밀번호 재확인이 동일한지 체크
          if (pwd != pwdChk) {
        	  document.getElementById("pwdChk").className="form-control is-invalid";
            document.getElementById("errpwdChk").innerHTML = '비밀번호가 일치하지 않습니다';
            document.getElementById("pwdChk").focus();
            
          } else {
        		document.getElementById("pwdChk").className="form-control is-valid";
            document.getElementById("errpwdChk").innerHTML = "";
            okCnt++;
          }

        }
        //3) 전화번호 체크
        var phoneReg = /^(\d{3})-(\d{3,4})-(\d{4})$/;
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
        if (okCnt == 7) {
          alert('회원가입완료');
          document.getElementById('joinForm').submit();
         

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

#join {
	margin-top: 50px;
}

.errMsg {
	color: red;
}

@media screen and (min-width:992px) {
	form {
		margin: 50px 35%;
	}
}
</style>
<title>Hello, world!</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<form id="joinForm" action="${pageContext.request.contextPath }/member/memberJoin" method="post">
		<div class="form-row">
			<label for="validationServer01">아이디</label> <input type="email"
				class="form-control" name="id" id="id" placeholder="ex)aaa@bbb.com"
				required>
			<div class="errMsg w-100 small" id="errId"></div>
		</div>
		<div class="form-row">
			<label for="validationServer02">비밀번호</label> <input type="password"
				class="form-control" name="pw" id="pwd" placeholder="비밀번호는 8자리이상"
				required>
			<div class="errMsg w-100 small" id="errPwd"></div>
		</div>
		<div class="form-row">
			<label for="validationServer04">비밀번호 확인</label> <input
				type="password" class="form-control" name="pwdChk" id="pwdChk"
				placeholder="비밀번호 확인" required>
			<div class="errMsg w-100 small" id="errpwdChk"></div>
		</div>

		<div class="form-row">
			<label for="validationServer03">전화번호</label> <input type="tel"
				class="form-control" name="tel" id="phone"
				placeholder="'-를 빼고 입력하세요'" required>
			<div class="errMsg w-100 small" id="errPhone"></div>
		</div>
		<div class="form-row">
			<label for="region">지역</label> <select
				class="custom-select form-control" name="region" id="region">
				<option value="0">==지역선택==</option>
				<option value="서울">서 울</option>
				<option value="경기">경 기</option>
				<option value="대구">대 구</option>
				<option value="울산">울 산</option>
				<option value="기타">기 타</option>
			</select>
			<div class="errMsg w-100 small" id="errRegion"></div>
		</div>
		<div class="form-row">
			<label for="validationServer05">성별</label>
			<div class="form-control" id="gender">
				<span class="b12">여성</span><input type="radio" name="gender" id="여"
					value="여"> <span class="b12">남성</span><input type="radio"
					name="gender" id="남" value="남">

			</div>
		</div>
		<div class="errMsg w-100 small" id="errGender"></div>

		<div class="form-row">
			<label for="validationServerUsername">별칭</label>
			<div class="input-group ">
				<div class="input-group-prepend ">
					<span class="input-group-text " id="inputGroupPrepend3">@</span>
				</div>
				<input type="text" class="form-control" name="nickname"
					id="nickname" placeholder="Username"
					aria-describedby="inputGroupPrepend3" required>
				<div class="errMsg w-100 small" id="errNickname"></div>
			</div>
		</div>

		<input class="btn btn-danger btn-block" id="join" type="button" value="가입">
	</form>


</body>
<jsp:include page="../footer.jsp" />
</html>