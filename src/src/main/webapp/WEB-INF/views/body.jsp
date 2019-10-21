<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    
    #item, #item2, #item3, #item4{
    display:none;
    }
      .card  img {
        -webkit-transform:scale(1);
        -moz-transform:scale(1);
        -ms-transform:scale(1);	
        -o-transform:scale(1);	
        transform:scale(1);
        -webkit-transition:.3s;
        -moz-transition:.3s;
        -ms-transition:.3s;
        -o-transition:.3s;
        transition:.3s;
      }
      .card:hover img {
        -webkit-transform:scale(1.1);
        -moz-transform:scale(1.1);
        -ms-transform:scale(1.1);	
        -o-transform:scale(1.1);
        transform:scale(1.1);
      }
      .card { overflow: hidden; }
      .box{
        height: 50px;
      }
    @media screen and (min-width:768px) {
    
    #item, #item2, #item3, #item4{
    display:block;
    }
   
    }
    
    
    </style>
    <hr>
    <br>
    <div class="album py-5 bg-light">
			<div class="col-12 text-center h1 pb-3"><p>REVIEW</p></div>
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm" id="card1">
             <img id="img1" src="${pageContext.request.contextPath }/resources/img/thubmnail.JPG"   width="100%" height="225" class="bd-placeholder-img card-img-top"/>
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text">[DATA BASE]Oracle Exadata 리뷰</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Reply</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm" id="card2">
             <img src="${pageContext.request.contextPath }/resources/img/thubmnail2.JPG"   width="100%" height="225" class="bd-placeholder-img card-img-top"/>
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text">[JAVA SCRIPT]이것이 자바다 리뷰</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Reply</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4" id="item">
          <div class="card mb-4 shadow-sm" id="card3">
             <img src="${pageContext.request.contextPath }/resources/img/thubmnail3.JPG"   width="100%" height="225" class="bd-placeholder-img card-img-top"/>
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text">[JAVA SCRIPT]자바와 JUnit을 활용한 실용주의 단위 테스트 리뷰</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Reply</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4" id="item2">
          <div class="card mb-4 shadow-sm" id="card4">
             <img src="${pageContext.request.contextPath }/resources/img/thubmnail4.JPG"   width="100%" height="225" class="bd-placeholder-img card-img-top"/>
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text">[JAVA SCRIPT]자바 ORM 표준 JPA 프로그래밍 리뷰</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Reply</button>
                </div>
                <small class="text-muted">9 days</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4" id="item3">
          <div class="card mb-4 shadow-sm" id="card5">
             <img src="${pageContext.request.contextPath }/resources/img/thubmnail5.JPG"   width="100%" height="225" class="bd-placeholder-img card-img-top"/>
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text">[DATA BASE]PERPECT 오라클 실전 튜닝 Ⅲ 리뷰</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Reply</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4" id="item4">
          <div class="card mb-4 shadow-sm">
             <img src="${pageContext.request.contextPath }/resources/img/thubmnail6.JPG"   width="100%" height="225" class="bd-placeholder-img card-img-top"/>
            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text">[DATA BASE]오라클로 배우는 데이터베이스 개론과 실습 리뷰</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Reply</button>
                </div>
                <small class="text-muted">9 mins</small>
              </div>
            </div>
          </div>
        </div>
        <img src="${pageContext.request.contextPath }/resources/img/banner.jpg" width="1130px" id="banner" class="my-5 img-fluid" alt="Responsive image">
  </div>
