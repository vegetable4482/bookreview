<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <style>
  .jumbotron {
 
    margin-bottom: 0px;
    background-color:purple;
    background-size: cover;
    background-repeat: no-repeat;
    color: white;
	}
		.aaa{
		display:none;
		}
	
		.slide{
		height : 300px;
		}
	
	 @media (min-width: 1120px) {
	 		#reviewEvent, #date ,.icon_1{
		/* font-size:30px; */
		margin-left:340px;
		}
		.slide{
		height: 850px;
		   background-size: cover;
    background-repeat: no-repeat;
		}
		.aaa{
		display:block;
		}
		#reviewEvent{
		font-size:40px;
		}
		#bestseller{
		margin: 0 370px;
		}
	 }
	 

  
  </style>
 

<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="${pageContext.request.contextPath }/resources/img/image.jpg"  class="slide d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
     <!--      <h5>First slide label</h5>
          <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p> -->
        </div>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath }/resources/img/slide2.jpg"  class="slide d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
   <!--        <h5>Second slide label</h5>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p> -->
        </div>
      </div>
      <div class="carousel-item">
        <img src="${pageContext.request.contextPath }/resources/img/slide.jpg" class="slide d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
  <!--         <h5>Third slide label</h5>
          <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p> -->
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

  

<!-- 점보트론 -->
<%--   background-image:url(${pageContext.request.contextPath }/resources/img/seminar.jpg);  --%>
 <div class="jumbotron p-5 p-md-5 text-white rounded " style="height:270px;">
    <div class="col-md-6 py-0">
 			<div class="col-8"></div>
      <h1 class="display-5" id="reviewEvent">NOTICE</h1>
      <p class=" lead my-2" id="date">Call Time : AM 09:00~PM 06:00</p>
<!--       <p class=" lead mb-0">CONTENT : String FrameWork, MyBatis, Bootstrap, Ajax</p> -->
<!-- 			<br class="aaa">
			<br class="aaa">
			<br class="aaa">
			<br class="aaa">
			<br> -->
      <p class="icon_1"> <a href="https://cafe.naver.com/ulsankhjava"><img alt="" src="http://mblogthumb1.phinf.naver.net/20141202_184/blackkino_14175142194676krtQ_PNG/1.png?type=w420" style="width:30px; height:30px;"></a>
      <a href="https://cafe.naver.com/ulsankhjava" class=" font-weight-bold " style="font-size:20px; color:white;" id="cafe">    NAVER CAFE</a></p>
      <p class="icon_1"> <a href="https://cafe.naver.com/ulsankhjava"><img alt="" src="${pageContext.request.contextPath }/resources/img/instagram.png" style="width:30px; height:30px;"></a>
      <a href="https://www.instagram.com" class=" font-weight-bold " style="font-size:20px; color:white;" id="cafe">    INSTAGRAM</a></p>
    
    </div>
  </div>
  <div class="row mb-2" id="bestseller">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">Best-seller </strong>
          <h3 class="mb-0 font-weight-bold" style="font-size:20px; "> 데이터베이스 첫걸음</h3>
          <div class="mb-1 text-muted">Nov 12</div>
          <p class="card-text mb-auto">“데이터베이스, 무엇부터 시작하지? 입문서는 읽었지만 도무지 모르겠다.” 이런 당신을 위한 데이터베이스 진짜 입문서...</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="${pageContext.request.contextPath }/resources/img/j_thubmnail.JPG"    width="200" height="250"  class="bd-placeholder-img"/> 
          <!-- <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
          <title>Placeholder</title></text></svg>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">Best-seller </strong>
          <h3 class="mb-0 font-weight-bold" style="font-size:20px;">오라클로 배우는 데이터 베이스 개론과 실습</h3>
          <div class="mb-1 text-muted">Nov 12</div>
          <p class="card-text mb-auto">우리 주변에서 쉽게 볼 수 있는 ‘서점’을 예로 들어 데이터베이스를 ...</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img src="${pageContext.request.contextPath }/resources/img/j_thubmnail2.JPG"    width="200" height="250"  class="bd-placeholder-img"/> 
          <!-- <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
          <title>Placeholder</title></text></svg>
        </div>
      </div>
    </div>
    
  </div>
