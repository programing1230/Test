<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글 깨짐 처리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/dist/css/adminlte.min.css?v=3.2.0">

</head>
<body class="hold-transition register-page">
<div class="register-box">
<div class="register-logo">
<a href="/main"><b>회원가입</b></a>
</div>
<div class="card">
<div class="card-body register-card-body">
<div class="input-group mb-3">
<input type="text" class="form-control" id="name" placeholder="이름">
<div class="input-group-append">
<div class="input-group-text">
<span class="fas fa-user"></span>
</div>
</div>
</div>
<div class="input-group mb-3">
<input type="email" class="form-control" id="id" placeholder="아이디">
<div class="input-group-append">
<div>
<button type="button" onclick="DoubleCheck()" id="check" class="btn btn-default btn-block" value="nConfirm">중복 검사</button>
</div>
</div>
</div>
<div class="input-group mb-3">
<input type="text" class="form-control" id="tel" placeholder="전화번호">
<div class="input-group-append">
<div class="input-group-text">
<span class="fas fa-phone"></span>
</div>
</div>
</div>
<div class="input-group mb-3">
<input type="date" class="form-control" id="currentDate">
<div class="input-group-append">
<div class="input-group-text">
</div>
</div>
</div>
<div class="input-group mb-3">
<input type="password" class="form-control" id="pass" placeholder="비밀번호">
<div class="input-group-append">
<div class="input-group-text">
<span class="fas fa-lock"></span>
</div>
</div>
</div>
<div class="input-group mb-3">
<input type="password" class="form-control" id="passcheck" placeholder="비밀번호 확인">
<div class="input-group-append">
<div class="input-group-text">
<span class="fas fa-lock"></span>
</div>
</div>
</div>
<div class="row">
<div class="col-12" >
<button type="button" onclick="formSuccess()" class="btn btn-success btn-block">가입</button>
</div>
</div>
</div>

</div>
</div>

<script type="text/javascript">

function DoubleCheck() {
	let id= document.getElementById('id').value;
	
	if(!id.match(/^[a-zA-Z0-9]{5,33}$/)){
		alert('아이디는 영문자, 숫자를 사용해 5~33자리 이내로 입력해주세요.');
		return false;
	}
	
	let data = {"id":id};
	
	$.ajax({
	      url: '/post/id',
	      contentType:'application/json',
	      data:JSON.stringify(data),
	      type:'post',
	      dataType:'json',
	      beforeSend : function(xhr) { // 데이터 전송 전 헤더에 csrf값 설정
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	         },  //시큐리티 시 써야함
	      success: function(result){
	            
	         console.log("result"+result.id)
	         if( result.id==id ) {
	            alert("사용 불가능한 아이디입니다.");
	            return false;
	         }
	         
	      },
	      error:function(xhr) {
				if(xhr.status==200) {
					alert("사용 가능한 아이디입니다");
					$("#check").removeClass("btn btn-default btn-block");
					$("#check").addClass("btn btn-default disabled");
					$("#id").attr("disabled",true);
					$("#check").attr("value","confirm");
					return false;
				} else {
					alert("xhr:"+xhr.status);				
				}
				
			}
	})
}

function formSuccess() {
	let name = document.getElementById('name').value;
	let id = document.getElementById('id').value;
	let tel = document.getElementById('tel').value;
	let currentDate = document.getElementById('currentDate').value;
	let pass = document.getElementById('pass').value;
	let passcheck = document.getElementById('passcheck').value;
	
	if( name=="" || tel=="" || currentDate=="" ) {
		alert("빈칸을 입력해주세요.");
		return false;
	}
	
	if($("#check").val()=="nConfirm") {
		alert("아이디 중복검사를 완료해주세요.");
		return false;
	}
	
	if(!tel.match(/^\d{11}$/)) {
		alert("전화번호는 11자리 숫자로만 입력해주세요.");
		return false;
	}
	
	if(!pass.match(passcheck)){
		alert('비밀번호가 서로 일치하지 않습니다.');
		return false;
	}
	
	if(!pass.match(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*?]).{8,33}$/)){
		alert('비밀번호는 문자, 숫자, 특수문자를 조합해 8~33자 이내로 입력해주세요.');
		return false;
	}

	if(!pass.match(/^[A-Za-z\d!@#$%^&*?]+$/)){
		alert('비밀번호에 사용할 수 없는 문자가 포함되어 있습니다.');
		return false;
	}
	
	let data = {"name":name, "id":id, "tel":tel, "currentDate":currentDate,
				"pass":pass, "passcheck":passcheck, "auth":"ROLE_MEMBER"};
	
	 $.ajax({
		url: '/post/user',
		contentType:"application/json;charset:utf-8",
		data:JSON.stringify(data),
		type: 'post',
		dataType: 'json',
		beforeSend : function(xhr) { // 데이터 전송 전 헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},  //시큐리티 시 써야함
	    success:function(result){
	        alert(name+"님 회원가입이 완료되었습니다.");
	        location.href = "/login";
	        },
	 	error:function(xhr){
			alert("xhr:"+xhr.status);
			}
	    });

	
	
  }  
  


</script>

<script src="/resources/adminLTE/adminLTE/plugins/jquery/jquery.min.js"></script>

<script src="/resources/adminLTE/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/adminLTE/adminLTE/dist/js/adminlte.min.js?v=3.2.0"></script>
</body>
</html>
