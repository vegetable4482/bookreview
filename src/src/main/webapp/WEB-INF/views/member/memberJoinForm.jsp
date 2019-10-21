<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<jsp:include page="../header.jsp" flush="false" />
<style>
	#mdto {
		width:340px; 
	}
</style>
<script>
(function(){
	window.addEventListener("load", init, false);
	function init() {
		let idTag 			= document.getElementById("id");
		let pwTag 			= document.getElementById("pw");
		let pwchkTag 		= document.getElementById("pwchk");
		let telTag 			= document.getElementById("tel");
		let regionTag 	= document.getElementById("region");
		let genderTag 	= document.getElementsByName("gender");
		let nicknameTag = document.getElementById("nickname");
		let joinBtn     = document.getElementById("joinBtn");

		idTag.addEventListener("blur"				,checkId,false);		
		idTag.addEventListener("change"			,checkId,false);
		idTag.addEventListener("keydown"		,checkId,false);
		
		pwTag.addEventListener("blur"				,checkPw,false);		
		pwTag.addEventListener("change"			,checkPw,false);
		pwTag.addEventListener("keydown"		,checkPw,false);
				
		pwchkTag.addEventListener("blur"		,checkPwchk,false);
 		pwchkTag.addEventListener("change"	,checkPwchk,false);
		pwchkTag.addEventListener("keydown"	,checkPwchk,false);
		
		telTag.addEventListener("blur"			,checkTel,false);
		telTag.addEventListener("change"		,checkTel,false);
		telTag.addEventListener("keydown"		,checkTel,false);
		
		regionTag.addEventListener("blur"		,checkRegion,false);
		regionTag.addEventListener("change"	,checkRegion,false);
		regionTag.addEventListener("keydown",checkRegion,false);
		
		Array.from(genderTag).forEach(function(item) {
			item.addEventListener("blur"	,checkGender,false);
			item.addEventListener("change",checkGender,false);
		});
		
		nicknameTag.addEventListener("blur"		,checkNickname,false);
		nicknameTag.addEventListener("change"	,checkNickname,false);
		nicknameTag.addEventListener("keydown",checkNickname,false);
		
		joinBtn.addEventListener("click",joinBtnf,false);
				
		function validFeedback(obj, result, msg) {
			//console.log(obj.id);
			if(result){
				if(!obj.classList.contains("is-valid")) {
					obj.classList.add("is-valid");
					obj.classList.remove("is-invalid")
					obj.nextElementSibling.innerHTML = msg;
					if(!obj.classList.contains("valid-feedback")) {
						obj.nextElementSibling.classList.add("valid-feedback");
						obj.nextElementSibling.classList.remove("invalid-feedback");
					}
				}				

			}else{
				if(!obj.classList.contains("is-invalid")) {
					obj.classList.add("is-invalid");
					obj.classList.remove("is-valid")
					obj.nextElementSibling.innerHTML = msg;
					if(!obj.classList.contains("invalid-feedback")) {
						obj.nextElementSibling.classList.add("invalid-feedback");
						obj.nextElementSibling.classList.remove("valid-feedback");
					}
				}
				if(obj.id != "pwchk") {
					obj.focus();
				}
			}
		}
		
		//이메일 주소 체크   
		function checkId() {
			let emailReg = /^((?!\.)[\w-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$/;
			let status = emailReg.test(idTag.value);
			let msg = "";
			if(status) {
				validFeedback(idTag,status,"유효성 통과");
			}else{
				validFeedback(idTag,status,"이메일 정보가 잘못되었습니다");
			}
			return status;
		}

    // 비밀번호 체크 : 6~16이하, 소문자/대문자+숫자+특수문자가 들어가는 비밀번호		
		function checkPw() {
		  let pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
			let status = pwdReg.test(pwTag.value);
			let msg = "";
			if(status) {
				validFeedback(pwTag,status,"유효성 통과");
			}else{
				validFeedback(pwTag,status,"비밀번호가 잘못되었습니다");
			}
			return status;
		}
		// 비밀번호 확인체크  : 6~16이하, 소문자,숫자,대문자,특수문자
		function checkPwchk() {
		  let pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
			let status = pwdReg.test(pwchkTag.value) && pwTag.value == pwchkTag.value;
			let msg = "";
			//console.log(pwTag.value, pwchkTag.value);
			if(status) {
				validFeedback(pwchkTag,status,"유효성 통과");
			}else{
				validFeedback(pwchkTag,status,"비밀번호가 잘못되었습니다");
			}
			return status;
		}
		
		//전화번호 체크
		function checkTel() {
			let phoneReg =/^\d{3}?\d{3,4}?\d{4}$/;;
			let status = phoneReg.test(telTag.value);
			let msg = "";
			if(phoneReg.test(telTag.value)) {
				validFeedback(telTag,status,"유효성 통과");
			}else {
				validFeedback(telTag,status,"전화번호가 잘못되었습니다");
			}
			return status;
		}
		
		//지역 체크
		function checkRegion() {
		  let regionText = regionTag.options[regionTag.selectedIndex].text;
		  let regionValue = regionTag.options[regionTag.selectedIndex].value;
		  
      let status = regionValue != 0 ? true : false;
      if(status) {
    	  validFeedback(regionTag,status,"유효성 통과");
      }else{
    	  validFeedback(regionTag,status,"지역을 선택하세요");
      }	
      return status;
		}
		
		//성별 체크
		function checkGender() {
			let status = false;
			Array.from(genderTag).forEach(function(item){
				if(item.checked) {
					status = true;
				}
			});
      if(status) {
    	  validFeedback(genderTag[0].parentElement.parentElement.parentElement,status,"유효성 통과");
      }else{
    	  validFeedback(genderTag[0].parentElement.parentElement.parentElement,status,"성별을 선택하세요");
      }		

      return status;
		}
		
		//별칭 체크
		function checkNickname() {
      let status = nicknameTag.value.trim().length != 0 &&
    						   nicknameTag.value.trim().length < 10	&&
    						   nicknameTag.value.trim().length > 2	;
    						  

      //console.log(nicknameTag.value, status);
      if(status) {
    	  validFeedback(nicknameTag,status,"유효성 통과");
      }else{
    	  validFeedback(nicknameTag,status,"별칭이 잘못되었습니다");
      }			
      return status;
		}
				
		//가입하기 버튼 클릭시
		function joinBtnf(e) {
			e.preventDefault();
			
			let result = checkId() && checkPw() && 
									 checkPwchk() && checkTel() && 
									 checkRegion() && checkGender() && checkNickname();
			if(result) {
      	alert('회원 가입이 정상적으로 처리되었습니다');
      	document.getElementById("mdto").submit();
			}
		}				
	}	
})();
</script>    
    <div class="container my-5" > 
    	<div class="row justify-content-center">
      <form:form  modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberJoin">
        <p class="h3 text-center">JOIN US</p>     
        <div class="form-row">
          <div class="col-sm-12 ">
            <form:label path="id" cssClass="col-form-label-sm my-0 py-1">아이디</form:label>
            <form:input  type="email" cssClass="form-control form-control-sm" path="id" placeholder="ex)test@test.com" required="required"/>
            <form:errors path="id" cssClass="errMsg"></form:errors>
            <div class=""></div>
          </div>
        </div> 
        <div class="form-row">
          <div class="col-sm-12 mb-1">
            <form:label path="pw" cssClass="col-form-label-sm my-0 py-1" >비밀번호</form:label>
            <form:password cssClass="form-control form-control-sm " path="pw" placeholder="비밀번호 10자리이상" required="required"/>
            <form:errors path="pw" cssClass="errMsg"></form:errors>              
            <div class=""></div>
          </div>
        </div> 
        <div class="form-row">
          <div class="col-sm-12 mb-1">
            <label for="pwchk" class="col-form-label-sm my-0 py-1">비밀번호확인</label>
            <input type="password" class="form-control form-control-sm " id="pwchk" name="pwchk" placeholder="비밀번호를 다시 입력하세요" required="required"/>
            <div class=""></div>
          </div>
        </div> 
        <div class="form-row">
          <div class="col-sm-12 mb-1">
            <form:label path="tel" cssClass="col-form-label-sm my-0 py-1">전화번호</form:label>
            <form:input type="text" cssClass="form-control form-control-sm " path="tel" placeholder="'-'를 빼고 입력하세요" required="required"/>
            <form:errors path="tel" cssClass="errMsg"></form:errors>
            <div class=""></div>
          </div>
        </div> 
        <div class="form-row">
          <div class="col-sm-12 mb-1">
            <form:label path="region" cssClass="col-form-label-sm my-0 py-1">지역</form:label>
            <form:select path="region" cssClass="form-control form-control-sm ">
              <option value=0>== 선 택 ==</option>
              <form:options path="region" items="${region }" itemValue="code" itemLabel="label"/>
            </form:select>
            <form:errors path="region" cssClass="errMsg"></form:errors>          
            <div class=""></div>
          </div>
        </div> 
        <div class="form-row">
          <div class="col-sm-12 mb-1">
            <form:label path="gender" cssClass="col-form-label-sm my-0 py-1 mr-3">성별</form:label>
            <div class="form-control form-control-sm ">
              <div class="form-check form-check-inline">
                <form:radiobuttons cssClass="form-check-input ml-2" path="gender" items="${gender }" itemValue="code" itemLabel="label"/>
              </div> 
            </div> 
            <form:errors path="gender" cssClass="errMsg"></form:errors>      
            <div class=""></div>
          </div>
        </div> 
        <div class="form-row">
          <div class="col-sm-12 mb-1">
            <form:label path="nickname" cssClass="col-form-label-sm my-0 py-1">별칭</form:label>
            <form:input type="text" cssClass="form-control form-control-sm " path="nickname" placeholder="10자리이하" required="required"/>
            <form:errors path="nickname" cssClass="errMsg"></form:errors>
            <div class=""></div>
          </div>
        </div> 
        <div style="color:#f00;font-weight:bold;font-size:0.8rem">${svr_msg }</div>
        <div class="form-row">
          <button class="btn btn-danger btn-block" type="submit" id="joinBtn">가입하기</button>
        </div>        
      </form:form>    
    	</div>
    </div>
<jsp:include page="../footer.jsp" />