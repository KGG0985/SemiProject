<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Starter</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div>
		<section class="content-header">
			<div class="container-fluid">
				<div class="row md-2">
					<div class="col-sm-6">
						<h1>봉사신청</h1>
					</div>
				</div>
			</div>
		</section>
		<!-- Main content -->
		<section class="content register-page">
			<div class="register-box">
				<div class="login-logo">
					<a href=""><b>봉사 신청</b></a>
				</div>
				<!-- form start -->
				<div class="card">
					<div class="register-card-body">
						<form role="form" class="form-horizontal" method="post">
							<div class="form-group row">
								<label for="volTitle" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>봉사 이름
								</label>
								<div class="col-sm-9 input-group input-group-sm">
									<input name="volTitle" type="text" class="form-control"
										id="volTitle" value="${volunteer.volTitle }" readonly />
								</div>
							</div>
							<div class="form-group row">
								<label for="volDate" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>봉사 날짜
								</label>
								<div class="col-sm-9 input-group input-group-sm">
									<input class="form-control" name="volDate" type="text"
										class="form-control" id="volDate"
										value="${volunteer.volDate }" readonly />
								</div>

							</div>
							<div class="form-group row">
								<label for="volType" class="col-sm-3" style="font-size: 0.9em;">
									<span style="color: red; font-weight: bold;">*</span>봉사 타입
								</label>
								<div class="col-sm-9 input-group-sm">
									<input class="form-control" name="volType" type="text"
										class="form-control" id="volType"
										value="${volunteer.volType }" readonly />
								</div>

							</div>
							<div class="form-group row">
								<label for="volContent" class="col-sm-3"
									style="font-size: 0.9em;"> <span
									style="color: red; font-weight: bold;">*</span>봉사 내용
								</label>
								<div class="col-sm-9 input-group-sm">
								
								<textarea cols="30" rows="5" readonly>
									${volunteer.volContent }
								</textarea>
								
								
<!-- 									<input class="form-control" name="volContent" type="text" style="width:250px;height:200px;  -->
<!-- 										class="form-control" id="volContent" -->
<%-- 										value="${volunteer.volContent }" readonly /> --%>
								</div>

							</div>

							<div class="card-footer">
							
							<c:if test="${empty loginAdmin	}">
								<div class="row">
									<div class="col-sm-6">
										<button type="button" id="registBtn" onclick="registGo();"
											class="btn btn-info">신&nbsp;&nbsp;&nbsp;청</button>
									</div>
									<div class="col-sm-6">
										<button type="button" id="cancelBtn" onclick="CloseWindow();"
											class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;닫
											&nbsp;기&nbsp;&nbsp;&nbsp;</button>
									</div>
								</div>
								
							</c:if>
							
							<c:if test="${!empty loginAdmin }">
								<div class="row">
									<div class="col-sm-4">
										<button type="button" id="registBtn" onclick="updateGo();"
											class="btn btn-info">수&nbsp;&nbsp;정</button>
									</div>
									<div class="col-sm-4">
										<button type="button" id="registBtn" onclick="deleteGo();"
											class="btn btn-info">삭&nbsp;&nbsp;제</button>
									</div>
									<div class="col-sm-4">
										<button type="button" id="cancelBtn" onclick="CloseWindow();"
											class="btn btn-default float-right">&nbsp;&nbsp;닫
											&nbsp;기&nbsp;&nbsp;</button>
									</div>
								</div>
							</c:if>
							</div>
							
							
						</form>
					</div>
					<!-- register-card-body -->
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<script>
		function registGo() {
			var memId = '${loginUser.memId}';
			console.log(memId);
			location.href = 'wantRegist.do?volTitle=${volunteer.volTitle}';
		}

		// 아래 참고해서 이미 신청한 봉사인지 확인해야함.(아이디와 봉사제목 확인..)
		// function doubleCheck_go(){

		// 	var input_ID=$('input[name="id"]');

		// 	$.ajax({
		// 		url : "idCheck.do?id="+input_ID.val().trim(),
		// 		method : "get",	
		// 		success : function(result){
		// 			if(result.toUpperCase() == "DUPLICATED"){
		// 		      alert("이미 신청한 봉사입니다.");
		// 			}else{
		//               alert("사용가능한 아이디 입니다.");
		//               checkedID=input_ID.val().trim();
		//               $('input[name="id"]').val(input_ID.val().trim());	             
		//            } 
		// 		},
		// 		error:function(error){
		// 	       alert("시스템장애로 가입이 불가합니다.");
		// 	    }
		// 	});

		// }
	</script>	
	
	<script>
		function updateGo() {
			location.href = 'volUpdateForm.do?volTitle=${volunteer.volTitle}';
			
		}
	</script>
	
	
		<script>
		function deleteGo() {
			location.href = 'volDelete.do?volTitle=${volunteer.volTitle}';
// 			alert("삭제");
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
</body>
</html>


