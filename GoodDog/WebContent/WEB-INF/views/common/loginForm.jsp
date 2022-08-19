<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html>
<title>로그인</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Font Awesome Icons -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
	
<!-- include summernote css/js -->
<link href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css" rel="stylesheet">

<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">


<body class="hold-transition login-page">
<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
		 <div class="card-body login-card-body">
			<p class="login-box-msg">Sign in to start your session</p>

			<form action="<%=request.getContextPath() %>/login.do"	method="post" name="log_frm">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요." value="${memId}">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="pwd" placeholder="패스워드를 입력하세요."  value="">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<div class="checkbox icheck">
						<a href="findIdForm.do" style="font-weight:bold;">아이디찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="font-weight:bold" onclick="OpenWindow('member/registForm.do','회원가입',600,700);" href="#">회원가입</a><br> 
						</div>
					</div>
					<!-- /.col -->
					<div class="col-sm-4">
						<input type="button" onclick="infoConfirm()" class="btn btn-primary btn-block btn-flat" value="로그인"></button>
					</div>
					<!-- /.col -->
				</div>
			</form>

					  <span id="pw_check_msg" style =color:red;></span> 
			

			
					
		<br>
		<div class="row">
		<div class="col-sm-8">
		<div class="checkbox icheck">
		 
		 </div> 
		 </div>
		 </div>
		 
		</div> 
		
		<!-- /.login-box-body -->
	  </div>	
	  </div>
	  


		 
	<!-- /.login-box -->
	
<script>
const input = document.querySelector('#myInput');
input.addEventListener('keypress',function(e){
    if (e.keyCode === 13) {
       if(document.log_frm.id.value.length == 0){
          document.getElementById('pw_check_msg').innerHTML = "아이디를 입력해주세요!";
    /*       alert("아이디를 입력해주세요!") */
          log_frm.id.focus();
          return;
       }
       if(document.log_frm.pwd.value.length == 0){
    /*       alert("비밀번호를 입력해주세요!") */
          document.getElementById('pw_check_msg').innerHTML = "비밀번호를 입력해주세요!";
          log_frm.pwd.focus();
          return;
       }
       document.log_frm.submit();
  }  
});   
	
function infoConfirm() {
		
	if(document.log_frm.id.value.length == 0){
		document.getElementById('pw_check_msg').innerHTML = "아이디를 입력해주세요!";
/* 		alert("아이디를 입력해주세요!") */
		log_frm.id.focus();
		return;
	}
	if(document.log_frm.pwd.value.length == 0){
/* 		alert("비밀번호를 입력해주세요!") */
		document.getElementById('pw_check_msg').innerHTML = "비밀번호를 입력해주세요!";
		log_frm.pwd.focus();
		return;
	}
	document.log_frm.submit();
	if (document.getElementById('pw_check_msg')==null) {
		window.close();	
	}
	
}
	document.getElementById('pw_check_msg').innerHTML = "${message}";
</script>


<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<!-- summernote Editor -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.js"></script>

<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

</body>
</html>

