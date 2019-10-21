<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="ko">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>

   /*footer style*/
 		 * {
      margin: 0;
      padding: 0;
      
    }

    #footer {
      text-align: center;
    }

    input.imgbutton {
      border: none;
      width: 38px;
      height: 38px;
      margin: 10px 0px;
    }

    .footerMenu {
      margin-top: 60px;
    }

    .footerMenu,
    .info,
    div #bot_form {
      border-top: 1px solid #ccc;
      
    }
			
    .info {
      padding-top: 20px;
    }

    .info>ul>li {
      font-size: 9pt;
      margin-bottom: 3px;
       list-style: none;

    }

    .footerMenu>ul>li>a {
      color: black;
      font-size: 12px;

    }

    .info>ul>li>.footertext {
      color: rgb(153, 153, 153);
    }

    .footerMenu>ul>li {
      display: inline-block;
      padding: 5px;
      font-size: 17px;
      padding: 5px 3px 10px 3px;
    }
    ul {
    margin:0;
    important:  !important;
    }
    
    
    
</style>
</head>
<body>
<!--푸터-->
    <div id='footer'>
      <div class="footerMenu">
      	
        <ul>
          <li><a href="">이용약관</a></li>
          <li><a href="">개인정보취급방침</a></li>
          <li><a href="">고객센터</a></li>
        </ul>
        <form id="bot_form">
          <input type="button" class="imgbutton" onclick="location.href='https://www.facebook.com/'"
            style="background: url('http://52-52.co.kr/web/innoy_img/images/sns_facebook.jpg')">&emsp;
          <input type="button" class="imgbutton" onclick="location.href='https://www.instagram.com/'"
            style="background: url('http://52-52.co.kr/web/innoy_img/images/sns_instagram2.jpg')">
        </form>
        <div class="info">
          <ul>
            <li><span class="footertext">ADDRESS</span> &nbsp;&nbsp;Samsan-dong, Ulsan, KOREA</li>
            <li><span class="footertext">TEL</span> &nbsp;&nbsp;010-4482-0000</li>
            <li><span class="footertext">EMAIL</span>&nbsp;&nbsp;itbook@gmail.com</li>
            <li><span class="footertext">CEO</span>&nbsp;&nbsp;SOJEONG CHOI</li>
            <li><span class="footertext">COMPANY</span>&nbsp;&nbsp;I-BOOK Co.</li>
            <li><span class="footertext">BUSINESS LICENSE</span>&nbsp;&nbsp;1234-12-12345</li>
        
          </ul>
        </div>
      </div>
    </div>
</body>
</html>