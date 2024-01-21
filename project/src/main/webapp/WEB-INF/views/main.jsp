<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글 깨짐 처리 -->
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MAIN</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="/resources/adminLTE/adminLTE/dist/css/adminlte.min.css?v=3.2.0">
<script nonce="ca2047c6-a305-4d7a-bc58-959b6163727e">(function(w,d){!function(dp,dq,dr,ds){dp[dr]=dp[dr]||{};dp[dr].executed=[];dp.zaraz={deferred:[],listeners:[]};dp.zaraz.q=[];dp.zaraz._f=function(dt){return async function(){var du=Array.prototype.slice.call(arguments);dp.zaraz.q.push({m:dt,a:du})}};for(const dv of["track","set","debug"])dp.zaraz[dv]=dp.zaraz._f(dv);dp.zaraz.init=()=>{var dw=dq.getElementsByTagName(ds)[0],dx=dq.createElement(ds),dy=dq.getElementsByTagName("title")[0];dy&&(dp[dr].t=dq.getElementsByTagName("title")[0].text);dp[dr].x=Math.random();dp[dr].w=dp.screen.width;dp[dr].h=dp.screen.height;dp[dr].j=dp.innerHeight;dp[dr].e=dp.innerWidth;dp[dr].l=dp.location.href;dp[dr].r=dq.referrer;dp[dr].k=dp.screen.colorDepth;dp[dr].n=dq.characterSet;dp[dr].o=(new Date).getTimezoneOffset();if(dp.dataLayer)for(const dC of Object.entries(Object.entries(dataLayer).reduce(((dD,dE)=>({...dD[1],...dE[1]})),{})))zaraz.set(dC[0],dC[1],{scope:"page"});dp[dr].q=[];for(;dp.zaraz.q.length;){const dF=dp.zaraz.q.shift();dp[dr].q.push(dF)}dx.defer=!0;for(const dG of[localStorage,sessionStorage])Object.keys(dG||{}).filter((dI=>dI.startsWith("_zaraz_"))).forEach((dH=>{try{dp[dr]["z_"+dH.slice(7)]=JSON.parse(dG.getItem(dH))}catch{dp[dr]["z_"+dH.slice(7)]=dG.getItem(dH)}}));dx.referrerPolicy="origin";dx.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(dp[dr])));dw.parentNode.insertBefore(dx,dw)};["complete","interactive"].includes(dq.readyState)?zaraz.init():dp.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script></head>
<body class="hold-transition lockscreen">

<div class="lockscreen-wrapper">
<div class="lockscreen-logo">
<a href="/main"><b>Main</b></a>
</div>

<div class="lockscreen-name"></div>

<div class="lockscreen-item">

</div>

<div class="help-block text-center">
</div>
<div class="text-center">

<br>

<button type="button" onclick="location.href='/login'" class="btn btn-block btn-outline-dark btn-lg">로그인</button>
<button type="button" onclick="location.href='/userform'" class="btn btn-block btn-outline-dark btn-lg">회원가입</button>
</div>

<br>
<br>
<br>

<div class="lockscreen-footer text-center">
Copyright &copy; <br>
All rights reserved
</div>
</div>


<script src="/resources/adminLTE/adminLTE/plugins/jquery/jquery.min.js"></script>

<script src="/resources/adminLTE/adminLTE/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
