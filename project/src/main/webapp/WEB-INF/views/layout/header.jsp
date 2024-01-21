<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글 깨짐 처리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-left: 0px;">

<ul class="navbar-nav">
<li class="nav-item d-none d-sm-inline-block">
<div class="user-panel mt pb mb d-flex">
<div class="info">
<a href="#" class="d-block"><sec:authentication property="principal.username"/>님 반갑습니다.</a>
</div>
</div>
</li>
</ul>

<ul class="navbar-nav ml-auto">



<li class="nav-item">
<a class="btn btn-danger btn-sm" href="/member/write" style="float: right;">
로그아웃
</a>
</li>

</ul>
</nav>