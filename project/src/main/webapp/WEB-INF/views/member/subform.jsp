<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글 깨짐 처리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>서비스 구독 신청</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/dist/css/adminlte.min.css?v=3.2.0">

</head>
<body class="register-page">
<div class="register-box">
<div class="register-logo">
<br>
<a href="/member/subform"><b>서비스 구독 신청</b></a>
</div>
<div class="card">
<div class="card-body register-card-body">

<div class="input-group mb-3">
<h1>Basic</h1>
<input type="hidden" value="SER001" id="SER001">
</div>
<div class="input-group mb-3">
<h5>스토리지 용량: 2(TB)</h5>
</div>
<div class="input-group mb-3">
<h5>사용 가능 인원: ~5명</h5>
</div>
<div class="input-group mb-3">
<h5>구독기간: 3개월</h5>
<input type="hidden" value="90" id="period90">
</div>
<div class="input-group mb-3">
<h5>가격: 월 11900원</h5>
</div>
<div class="row">
<div class="col-12" >
<button type="button" onclick="basic()" id="basic" value="basic" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
신청하기
</button>
</div>
</div>
</div>
</div>

<br>

<div class="card">
<div class="card-body register-card-body">
<div class="input-group mb-3">
<h1>Standard</h1>
<input type="hidden" value="SER002" id="SER002">
</div>
<div class="input-group mb-3">
<h5>스토리지용량: 10(TB)</h5>
</div>
<div class="input-group mb-3">
<h5>사용 가능 인원: ~10명</h5>
</div>
<div class="input-group mb-3">
<h5>구독기간: 6개월</h5>
<input type="hidden" value="180" id="period180">
</div>
<div class="input-group mb-3">
<h5>가격: 월 10900원</h5>
</div>
<div class="row">
<div class="col-12" >
<button type="button" onclick="Standard()" id="Standard" value="Standard" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
신청하기
</button>
</div>
</div>
</div>
</div>

<br>

<div class="card">
<div class="card-body register-card-body">

<div class="input-group mb-3">
<h1>Premium</h1>
<input type="hidden" value="SER003" id="SER003">
</div>
<div class="input-group mb-3">
<h5>스토리지용량: 30(TB)</h5>
</div>
<div class="input-group mb-3">
<h5>사용 가능 인원: ~15명</h5>
</div>
<div class="input-group mb-3">
<h5>사용기간: 12개월</h5>
<input type="hidden" value="360" id="period360">
</div>
<div class="input-group mb-3">
<h5>가격: 월 9900원</h5>
</div>
<div class="row">
<div class="col-12" >
<button type="button" onclick="Premium()" id="Premium" value="Premium" class="btn btn-default" data-toggle="modal" data-target="#modal-default">
신청하기
</button>
</div>
</div>
</div>
</div>
<br>
</div>

<div class="modal fade" id="modal-default">
	<div class="modal-dialog modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">부가정보 입력</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">×</span>
				</button>
				</div>
			<div class="modal-body">
				<input type="text" class="form-control" id="data" style="margin-bottom: 20px;" disabled>
				<input type="hidden" id="dataNum">
				<input type="hidden" id="periodNum">
				<input type="text" class="form-control" id="comName" placeholder="회사명" style="margin-bottom: 20px;">
				<input type="text" class="form-control" id="email" placeholder="이메일" style="margin-bottom: 20px;">
				<input type="text" class="form-control" id="address" placeholder="주소" style="margin-bottom: 20px;">
			</div>
			<div class="modal-footer justify-content-between">
				<div  style="float: left;">
					<button type="button" class="btn btn-outline-light" data-dismiss="modal">닫기</button>
				</div>
				<div  style="float: right;">
					<button type="button" onclick="application()" class="btn btn-success btn-block">신청하기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	function basic() {
		
	   let data=$("#basic").val();
	   let basic=$("#SER001").val();
	   let period=$("#period90").val();
	   
	   $("#data").val(data);
	   $("#dataNum").val(basic);
	   $("#periodNum").val(period);
	}
	
	function Standard() {
		
		  let data=$("#Standard").val();
		  let Standard=$("#SER002").val();
    	  let period=$("#period180").val();
		  
    	  $("#data").val(data);
		  $("#dataNum").val(Standard);
		  $("#periodNum").val(period);
			   
		}
	
	function Premium() {
		
	   let data=$("#Premium").val();
	   let premium=$("#SER003").val();
	   let period=$("#period360").val();
		   
	   $("#data").val(data);
	   $("#dataNum").val(premium);
	   $("#periodNum").val(period);
		   
	}
	
	function application() {
		   
		let data=$("#data").val();
		let dataNum=$("#dataNum").val();
		let periodNum=$("#periodNum").val();
		let comName=$("#comName").val();
		let email=$("#email").val();
		let address=$("#address").val();
		
		let allData={"data":data, "periodNum":periodNum, "dataNum":dataNum,"comName":comName,"email":email,"address":address};
		
	 	$.ajax({
 		   url: '/post/serForm',
 		   contentType:"application/json;charset:utf-8",
 		   data:JSON.stringify(allData),
 		   type:'post',
 		   dataType:'json',
 		   beforeSend:function(xhr){
 			   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
 		   },
 		   success:function(result){
 			   console.log("result"+result);
 			   if(result==0) {
 				 alert("이미 구독 신청을 하셨습니다. 연장 신청은 구독현황에서 해주세요");
 				 return false;
 			   } else {
 		        alert("구독신청이 완료되었습니다.");
				return false;
 			   }
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
