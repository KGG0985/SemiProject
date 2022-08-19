<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>봉사등록Form</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
  <!-- DatePicker -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.css">
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  
  
  
  
</head>
<body class="hold-transition sidebar-mini">



<div>
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>봉사등록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="#">
				        	<i class="fa fa-dashboard">봉사관리</i>
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	등록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
  	</section>
  	
	<!-- Main content -->
	<section class="content register-page">
		<div class="register-box">
			<div class="login-logo">
    			<a href=""><b>봉사 등록</b></a>
  			</div>
			<!-- form start -->
			<div class="card">				
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="volRegist" method="post">						
						  <div class="form-group row">
							<label for="volTitle" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>봉사명</label>
							<div class="col-sm-9 input-group input-group-sm" >								
								<input class="form-control" name="volTitle" type="text" class="form-control" id="volTitle"
										placeholder="등록할 봉사명을 입력"
										onkeyup="this.value=this.value.trim();" />
								<span class="input-group-append-sm">	
									<button type="button" onclick="titleCheck_go();"  class="btn btn-info btn-sm btn-append">중복확인</button>
								</span>
							</div>
							
						</div>	
						<div class="form-group row">
							<label for="volDate" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>봉사일시</label>
								
								<div class="form-group row">
									<label class="col-sm-3" style="font-size:0.9em;">
										<span style="color:red;font-weight:bold;"></span>날짜입력:</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
											</div>
									<input type="text" class="form-control" data-inputmask-alias="datetime" data-inputmask-inputformat="yyyy/mm/dd" data-mask="" inputmode="none"
										placeholder="yyyy/mm/dd" name="volDate" id="volDate">
										</div>
								
								 </div>
							</div>

						<div class="form-group row">
							<label for="volType" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>봉사유형</label>
							<div class="col-sm-9">	
								<div class="input-group-sm">
									<select style="width:75px;" name="volType" id="volType" class="form-control float-left">
										<option value="">-선택-</option>
										<option value="산책">산책</option>
										<option value="목욕">목욕</option>
										<option value="청소">청소</option>
										<option value="놀이">놀이</option>
										<option value="기타">기타</option>
									</select>							
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="volContent" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>봉사내용</label>
							<textarea class="form-control" rows="3" placeholder="내용을 입력하세요(100자 이내)" style="height: 159px;" name="volContent" id="volContent"></textarea>
						</div>
						
						
						
						<div class="card-footer">
							<div class="row">								
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="regist_go();" class="btn btn-info">등&nbsp;&nbsp;록</button>
							 	</div>
							 	
							 	<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="CloseWindow();"
											class="btn btn-default float-right">&nbsp;&nbsp;닫&nbsp;기&nbsp;&nbsp;</button>
								</div>
							
							</div>
						</div>
					</form>					
				</div><!-- register-card-body -->
			</div>
		</div>
	</section>		<!-- /.content -->
</div>
<!-- /.content-wrapper -->	


<script>
	var checkedTitle ="";
	function titleCheck_go(){
		//alert("idcheck btn click");
		var input_title=$('input[name="volTitle"]');
		if(!input_title.val()){
	       alert("봉사명을 입력하시오");
	       input_title.focus();
	       return;
		}
		$.ajax({
			url : "titleCheck.do?title="+input_title.val().trim(),
			method : "get",	
			success : function(result){
				if(result.toUpperCase() == "DUPLICATED"){
			      alert("중복된 봉사명 입니다.");
			      $('input[name="volTitle"]').focus();
				}else{
	              alert("사용가능한 봉사명 입니다.");
	              checkedTitle=input_title.val().trim();
	              $('input[name="volTitle"]').val(input_title.val().trim());	             
	           } 
			},
			error:function(error){
		       alert("시스템장애로 가입이 불가합니다.");
		    }
		});
		
	}
	
	function regist_go(){
		//alert("regist btn click");
		if(!$('input[name="volTitle"]').val()){
		  alert("봉사명은 필수입니다.");
		  return;
		}
	    if($('input[name="volTitle"]').val()!=checkedTitle){
	      alert("봉사명은 중복 확인이 필요합니다.");
	      return;
	    }
	    if(!$('input[name="volDate"]').val()){
		  alert("날짜입력은 필수입니다.");
		  return;
	    }
	    if(!$('select[name="volType"]').val()){
		  alert("봉사유형 선택은 필수입니다.");
		  return;
		}
	    if(!$('textarea[name="volContent"]').val()){
		  alert("봉사내용 입력은 필수입니다.");
		  return;
		}
	    
	    var form = $('form[role="form"]');
		form.attr({"method":"post",
		     	   "action":"volRegist.do"
		   		  });	   
		form.submit();
		   
		
	}
	
</script>

<!--**************************  -->
<!--**************************  -->
<!--**************************  -->

  
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js" ></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- Date Inputmask -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- common.js -->
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script type="text/javascript">
$(function() {
	//Datemask dd/mm/yyyy
	$('#datemask').inputmask('yyyy/mm/dd', { 'placeholder': 'yyyy/mm/dd' })
	$('[data-mask]').inputmask()
});
</script>
</body>
</html>
    





