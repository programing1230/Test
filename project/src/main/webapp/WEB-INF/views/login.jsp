<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글 깨짐 처리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Service LOGIN</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/dist/css/adminlte.min.css?v=3.2.0">
</head>
<body class="hold-transition register-page">
<form id="click" action="/login?${_csrf.parameterName}=${_csrf.token}" method="post">
<div class="register-box">
<div class="register-logo">
<a href="/main"><b>Service LOGIN</b></a>
</div>
<div class="card">
<div class="card-body register-card-body">


<div class="input-group mb-3">
<input type="email" class="form-control" id="id" name="id" placeholder="아이디">
<div class="input-group-append">
<div class="input-group-text">
</div>
</div>
</div>

<div class="input-group mb-3">
<input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호">
<div class="input-group-append">
<div class="input-group-text">
<span class="fas fa-lock"></span>
</div>
</div>
</div>

<div class="row">
<div class="col-12" >
<button type="button" onclick="login()" class="btn btn-success btn-block">로그인</button>
</div>
</div>
</div>
</div>
</div>
</form>

<script src="/resources/adminLTE/adminLTE/plugins/jquery/jquery.min.js"></script>

<script src="/resources/adminLTE/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/adminLTE/adminLTE/dist/js/adminlte.min.js?v=3.2.0"></script>

<script type="text/javascript">
	function login() {
		let id=document.getElementById('id').value;
		let pass=document.getElementById('pass').value;
		
		if (id=="" || pass=="") {
			alert("아이디 또는 비밀번호를 모두 입력해주십시오.");
			return false;
		} else {
		    document.getElementById('click').submit();
		}
		
	}
	
</script>

</body>
</html>
