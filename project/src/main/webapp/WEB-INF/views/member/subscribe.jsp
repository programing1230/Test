<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글 깨짐 처리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>구독 현황</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/dist/css/adminlte.min.css?v=3.2.0">
<body>
<section class="content-header">
<div class="container-fluid">
<div class="row mb-2">
<div class="col-sm-12">
<h1>구독 현황</h1>


<div style="float: right;">
<a class="btn btn-default btn-sm" href="/member/subform" >
서비스 구독 신청
</a>
</div>

</div>
<div class="col-sm-6">
</div>
</div>
</div>
</section>

<section class="content">

<div class="card">
<div class="card-body p-0">
<table class="table table-striped projects">
<thead>
<tr>
<th style="width: 15%" class="text-center" >
구독 형태
</th>
<th style="width: 15%" class="text-center">
구독 시작 날짜
</th>
<th style="width: 15%" class="text-center">
구독 종료 날짜
</th>
<th style="width: 15%" class="text-center">
잔여 기간
</th>
<th style="width: 15%" class="text-center">
연장신청
</th>
</tr>
</thead>
<tbody>
<c:if test="${empty list}"> <!-- 값이 비어있으면 empty -->
	  <tr>
	     <td colspan="5">
	          <h5 style=" margin: 0 auto; text-align: center;">구독한 서비스 내역이 없습니다.</h5>
	      </td>
	   </tr>
</c:if>
<c:forEach var="list" items="${list}" varStatus="stat">
<tr>
<td style="width: 15%"  class="text-center" >
	${list.serName}
	<input type="hidden" value="${list.serName}" id="serName">
	<input type="hidden" value="${list.subId}" id="subId">
</td>

<td style="width: 15%"  class="text-center" >
	<fmt:formatDate value="${list.subStartDate}" pattern="yyyy-MM-dd" type="date"/>
</td>

<td style="width: 15%" class="text-center" >
	<fmt:formatDate value="${list.subEndDate}" pattern="yyyy-MM-dd" type="date"/>
</td>
<td style="width: 15%" class="text-center" >
	${list.period}
</td>
<td style="width: 15%" class="text-center" >
	<button type="button" onclick="application()" class="btn btn-info btn-sm">구독 연장하기</button>
</td>
</tr>
</c:forEach>

</tbody>
</table>
</div>

</div>

</section>
<script type="text/javascript">
function application() {
	var result = confirm("구독을 연장하시겠습니까? 결제는 자동적으로 이루어지며 되돌릴 수 없습니다");
	if(result){
		
		let serName=$("#serName").val();
		let subId=$("#subId").val();
		
		let data = {"serName":serName, "subId":subId};
		
		 $.ajax({
				url: '/post/subExtend',
				contentType:"application/json;charset:utf-8",
				data:JSON.stringify(data),
				type: 'post',
				dataType: 'json',
				beforeSend : function(xhr) { // 데이터 전송 전 헤더에 csrf값 설정
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},  //시큐리티 시 써야함
			    success:function(result){
			        alert("구독이 연장되었습니다.");
			        location.reload();
			        },
			 	error:function(xhr){
					alert("xhr:"+xhr.status);
					}
			    });
	}else{
		return false;
	}
}
</script>


<script src="/resources/adminLTE/adminLTE/plugins/jquery/jquery.min.js"></script>

<script src="/resources/adminLTE/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/adminLTE/adminLTE/dist/js/adminlte.min.js?v=3.2.0"></script>

</body>
</html>
