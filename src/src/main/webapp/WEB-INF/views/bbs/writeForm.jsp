<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<style>
	.errmsg {
		color : #f00;
		font-weight: bold;
		font-size : 0.8em;
	}

</style>

<script src="${pageContext.request.contextPath }/resources/js/ckeditor.js">
	$(function() {
	
		//CKEDITOR
		/*     ClassicEditor
		        .create( document.querySelector( '#bcontent' ) )
				    .then( editor => {
				        console.log( 'Editor was initialized', editor );
				    } )      
		        .catch( error => {
		            console.error( error );
		        } ); */
				
				//게시글 등록
				$("#writeBtn").on("click", function(e){
					e.preventDefault();
					///console.log("등록");
					/* if(valChk()) { */
						$("form").submit();
					/* } */
				});
				
				//게시글 취소
				$("#cancelBtn").on("click", function(e){
					e.preventDefault();
					//console.log("취소");
					$("form").each(function(){
						this.reset();
					});
				});
				
				//목록으로 이동
				$("#listBtn").on("click", function(e){
					e.preventDefault();
					//console.log("목록");
					location.href="${pageContext.request.contextPath }/bbs/list";
				});
				

				function valChk() {
					//제목 입력값이 없을경우
					if($("#btitle").val().length == 0) {
						$("#err_1").text("제목을 입력하세요!");
						$("#btitle").focus();
						return false;
					}
					
					//내용 입력값이 없을경우
					if($("#bcontent").val().length == 0) {
						$("#err_2").text("내용을 입력하세요!");
						$("#bcontent").focus();
						return false;
					}	
					
					return true;
				}
			});
			
	
	
</script>

<div class="container">
<div class="row justify-content-center">
	<div class="col col-sm-12 col-md-8">
	<form:form modelAttribute="bbsDTO" action="${pageContext.request.contextPath }/bbs/write">
	<form:hidden path="bid" value="${sessionScope.user.id }"/>
	<form:hidden path="bnickname" value="${sessionScope.user.nickname }"/>
	<div class="form-group row justify-content-center my-3">
		<p class="h4"> WRITE </p>
	</div>	
	<div class="form-group row">
		<form:label class="col-form-label col-sm-12 col-md-2 px-0" path="btitle">제 목</form:label>
		<form:input class="form-control col-md-10" path="btitle"  placeholder="제목을 입력하세요"/>
		<div class="col-md-2"></div>
		<span id="err_1" class="errmsg"></span>
		<form:errors class="errmsg" path="btitle" ></form:errors>		
	</div>
	<div class="form-group row">
		<label class="col-form-label col-sm-12 col-md-2 px-0" >작성자</label>
		<label class="form-control col-md-10 form-control-plaintext">
		${sessionScope.user.nickname }(${sessionScope.user.id })</label>
	</div>
	<div class="form-group row">
		<form:label class="col-form-label col-sm-12 col-md-2 px-0" path="bcontent">내 용</form:label>
		<form:textarea class="form-control col-md-10" path="bcontent" rows="10" placeholder="내용을 입력하세요"/>
		<div class="col-md-2"></div>
		<span id="err_2" class="errmsg"></span>
		<form:errors class="errmsg" path="bcontent" ></form:errors>	
	</div>
	<div class="form-group row justify-content-end">
		<div class="col-sm-1 px-0 m-1">
		<button class="btn btn-sm btn-outline-secondary btn-block" id="writeBtn">등록</button>
		</div>
		<div class="col-sm-1 px-0 m-1">
		<button class="btn btn-sm btn-outline-secondary btn-block" id="cancelBtn">취소</button>
		</div>
		<div class="col-sm-1 px-0 m-1">
		<button class="btn btn-sm btn-outline-secondary btn-block" id="listBtn">목록</button>
		</div>
	</div>	
	</form:form>
	</div>
</div>
</div>
<jsp:include page="../footer.jsp"/>