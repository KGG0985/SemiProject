<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="dogList" value="${dataMap.dogList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세상에 나쁜개는 없다</title>
   <style> 
.money {
  animation: mymove 5s infinite;
}
@keyframes mymove {
  from {
      transform: rotateY(0deg);
    }
    to {
      transform: rotateY(359deg);
    }
}
</style>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/index.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/sub.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ihn31g34j4"></script>
</head>
<body>
<!-- 헤더영역 -->
   <header>
      <hr/>
      <div id="top">
         <a href="<%=request.getContextPath()%>/index.do"><img alt="메인로고" src="<%=request.getContextPath()%>/resources/images/mainlogo.JPG"></a>
      </div>
   </header>

   <div id="header" class="index">

      <h2 class="hide">대메뉴(Hide)</h2>
      <div id="lnb">
         <nav>
            <ul>
            <li><a>ABOUT US</a>
               <ul>
               <li><a href="<%=request.getContextPath()%>/aboutus/map.do">기관 및 구성원소개</a></li>
               </ul>
            </li>
            <li><a>유기견 등록 / 제보</a>
               <ul>
               <li><a href="<%=request.getContextPath()%>/report/reportList.do">유기동물 제보</a></li>
               </ul>
            </li>
            <li><a>입양신청</a>
               <ul>
               <li><a href="<%=request.getContextPath()%>">입양신청서 등록</a></li>
               <li><a href="<%=request.getContextPath()%>/dog/doglist.do">등록 유기동물현황</a></li>
               </ul>
            </li>
            <li><a>자원봉사 모집/신청</a>
               <ul>
               <li><a href="<%=request.getContextPath()%>/volunteer/volunteerList.do">봉사 신청자</a></li>
               <li><a href="<%=request.getContextPath()%>/vol/calendarList.do">봉사 일정알림</a></li>
               </ul>
            </li>
            <li><a>세나개 소식지</a>
               <ul>
               <li><a>입양 후기</a></li>
               <li><a>입양 전후 갤러리</a></li>
               <li><a>정보 공유</a></li>
               <li><a>유의 사항</a></li>
               </ul>
            </li>
            <li><a>고객센터</a>
               <ul>
               <li><a href="<%=request.getContextPath()%>/qnaBoard/list.do">문의사항</a></li>
               </ul>
            </li>
            <li><a href="<%=request.getContextPath()%>">LOGIN / JOIN US</a>
            <c:if test="${empty loginUser && empty loginAdmin }">
                  <ul>
                  <li><a href="<%=request.getContextPath()%>/loginForm.do">LOGIN</a></li>      
                  <li><a href="<%=request.getContextPath()%>/member/registForm.do">JOIN</a></li>
                  </ul>
                </c:if>
                <c:if test="${!empty loginUser || !empty loginAdmin }">
                  <ul>
                  <li><a href="#a">${ loginUser.memName }</a></li>
                  <li><a href="#a">${ loginAdmin.adminName }</a></li>
                  <li><a href="#" onclick="location.href='<%=request.getContextPath() %>/logout.do';">로그아웃</a></li>
                </c:if>
            </li>
            </ul>
         </nav>
         <div></div>
      </div>
      <div class="visual">
         <img
            src="<%=request.getContextPath()%>/resources/images/subBackGround3.jpg"
            alt="">
      </div>
   </div>
       <div class="bread_crumbs">
         <div>
            <a href="<%=request.getContextPath()%>/index.do">홈</a>
            <div>
               <a href="#a">ABOUT US</a>
               <ul>
               <li><a href="#a">연혁 및 비전</a></li>
               <li><a href="map.do">기관 및 구성원소개</a></li>
               <li><a href="#a">제공 서비스 및 혜택</a></li>
               </ul>
            </div>
         </div>
      </div>
   <main>
   <section class="info_box">
         <h2><span>세나개 구성원들</span></h2>
        	<ul class="clear">
        		<li style="width: 280px; height: 450px; cursor: pointer;" >
							<a>
								<em>
									<img class="money" src="<%=request.getContextPath()%>/resources/images/hjw.png">
			            		</em>
								<div>
									<h3>한재웅</h3>
									<p>세나개 원장</p>
									<div></div>
								</div>
							</a>
						</li>
				  		<li style="width: 280px; height: 450px; cursor: pointer;" >
							<a>
								<em>
									<img class="money" src="<%=request.getContextPath()%>/resources/images/kkk.png">
			            		</em>
								<div>
									<h3>곽금규</h3>
									<p>협력병원 원장</p>
									<div></div>
								</div>
							</a>
						</li>
 						<li style="width: 280px; height: 450px; cursor: pointer;" >
							<a>
								<em>
									<img class="money" src="<%=request.getContextPath()%>/resources/images/pjy.png">
			            		</em>
								<div>
									<h3>박지영</h3>
									<p>보호센터 실장</p>
									<div></div>
								</div>
							</a>
						</li>
						<li style="width: 280px; height: 450px; cursor: pointer;" >
							<a>
								<em>
									<img class="money" src="<%=request.getContextPath()%>/resources/images/psb.png">
			            		</em>
								<div>
									<h3>박수빈</h3>
									<p>애견샵 실장</p>
									<div></div>
								</div>
							</a>
						</li>
						<li style="width: 280px; height: 450px; cursor: pointer;" >
							<a>
								<em>
									<img class="money" src="<%=request.getContextPath()%>/resources/images/chj.png">
			            		</em>
								<div>
									<h3>채희진</h3>
									<p>CS 실장</p>
									<div></div>
								</div>
							</a>
						</li>
						<li style="width: 280px; height: 450px; cursor: pointer;" >
							<a>
								<em>
									<img class="money" src="<%=request.getContextPath()%>/resources/images/psw.png">
			            		</em>
								<div>
									<h3>박성우</h3>
									<p>영업실장</p>
									<div></div>
								</div>
							</a>
						</li>
        	</ul>
      </section>
      <section class="info_box">
         <h2><span>찾아오시는길</span></h2>
            <div id="map" style="width:100%;height:600px;border: solid 1px;"></div>
             <script>
                 const locations = [
                     { place:"세상에 나쁜개는 없다", lat: 36.32546921, lng: 127.40903169 },
                 ];
         
                 var map = new naver.maps.Map('map', {
                     center: new naver.maps.LatLng(36.32546921, 127.40903169),
                     zoom: 18
                 });
         
                 for (var i = 0; i < locations.length; i++) {
                         var marker = new naver.maps.Marker({
                             map: map,
                             title: locations[i].place,
                             position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
                         });
                     }
             </script>
<!--          <div class="btns center">
            <a href="#a" class="btn_more">Map Info</a>
         </div> -->
         <div style="width:100%;height:400px; background-repeat: no-repeat;
                     background-image: url('<%=request.getContextPath()%>/resources/images/load.JPG");"></div>
                     
         
                  <img class="money" src="<%=request.getContextPath()%>/resources/images/dogf.png">    
            <div url('<%=request.getContextPath()%>/resources/images/load.JPG");" ></div>
         </div>            
      </section>
   </main>
   <footer>
      <div class="clear">
         <a href="#header">TOP</a>
         <div class="left">
            <div>
               <a href="#a">개인정보처리방침</a> <a href="#a">이용약관</a> <a href="#a">이메일무단수집거부</a>
               <a href="#a">사이트맵</a>
            </div>
            <p>
               세나개(주)<span></span>사업자번호 : 201-81-45685<span></span>공동 대표자 : 채희진,
               박수빈, 박지영, 한재웅, 곽금규, 박성우<br> 대전시 서구 대덕대로 372 세상에 나쁜개는 없다 <span></span>042-3381-7414<span></span>Copyright
               © 2022 senagae Corporation., All rights reserved.
            </p>
         </div>
         <div class="right">
            <select>
               <option><a href="#a">FAMILY SITE</a></option>
               <option><a href="#a">FAMILY SITE</a></option>
               <option><a href="#a">FAMILY SITE</a></option>
               <option><a href="#a">FAMILY SITE</a></option>
               <option><a href="#a">FAMILY SITE</a></option>
               <option><a href="#a">FAMILY SITE</a></option>
            </select>
         </div>
      </div>
   </footer>
   
   
   <form id="jobForm">
      <input type='hidden' name="page" value="" /> <input type='hidden'
         name="perPageNum" value="" /> <input type='hidden' name="searchType"
         value="" /> <input type='hidden' name="keyword" value="" />
   </form>

   <script>

   
   function list_go(page,url){
      //alert(page);
      if(!url) url="doglist.do";
      
      var jobForm=$('#jobForm');
      jobForm.find("[name='page']").val(page);
      jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
      jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
      jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
      jobForm.attr({
         action:url,
         method:'get'
      }).submit(); 
   }

</script>

   <script>   
   
//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
   winleft = (screen.width - WinWidth) / 2;
   wintop = (screen.height - WinHeight) / 2;
   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
                     +"height="+ WinHeight +", top="+ wintop +", left=" 
                     + winleft +", resizable=yes, status=yes"  );
   win.focus() ; 
}

</script>

   <script>
window.onload=function() {
   DogPictureThumb('<%=request.getContextPath()%>
      ');
      }
   </script>

   <!-- jQuery -->
   <script
      src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script
      src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- AdminLTE App -->
   <script
      src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>
   <!-- common.js -->
   <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>


   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous">
      
   </script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous">
      
   </script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous">
      
   </script>



</body>
</html>


