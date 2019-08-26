<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = (String)session.getAttribute("email");
	if(email != null) {
%>
<script>
	alert('로그아웃을먼저해야합니다');
    window.location.replace('../');
</script>
<%
	}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script language="JavaScript" src="./register.js"></script>
	</head>
	<body class="subpage">

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="../../">plare.cf <span>host by BSM</span></a></div>
				<a href="#menu">메뉴</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="../../">홈</a></li>
					<li><a href="../../guide">게임소개/가이드</a></li>
					<li><a href="../../rank">랭크</a></li>
					<li><a href="../../shop">상점</a></li>
					<li><a href="../../list">게시판</a></li>
					<li><a href="http://bigstar131.myds.me/sb">소스밴 <span class="glyphicon glyphicon-new-window"></span></a></li>
				</ul>
			</nav>
			
		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>더 많은 기능이용</p>
						<h2>회원가입</h2>
					</header>
				</div>
			</section>
			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>더 많은 기능이용</p>
								<h2>회원가입</h2>
							</header>
<p>*은 필수항목입니다</p>
<form method="post" action="db_register.jsp" name="register">
	<div class="row uniform">
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="email" id="email" value="" placeholder="* 이메일" />
		</div>
		<div>
			<a href="#" class="button alt">중복확인</a>
		</div>
		
		<div class="12u 12u$(xsmall)">
			<input type="password" name="password" id="password" value="" placeholder="* 비밀번호  4~20자, 영어와 숫자 반드시 포함" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="password" name="passwordc" id="passwordc" value="" placeholder="* 비밀번호 확인" />
		</div>
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="nickname" id="nickname" value="" placeholder="* 닉네임  20자 이하, 특수문자 가능" />
		</div>
		<div>
			<a href="#" class="button alt">중복확인</a>
		</div>
		
		<div class="4u 12u$(small)"><center>
			<select name="birthday_year">
				<option value="2019">2019년</option>
				<option value="2018">2018년</option>
				<option value="2017">2017년</option>
				<option value="2016">2016년</option>
				<option value="2015">2015년</option>
				<option value="2014">2014년</option>
				<option value="2013">2013년</option>
				<option value="2012">2012년</option>
				<option value="2011">2011년</option>
				<option value="2010">2010년</option>
				<option value="2009">2009년</option>
				<option value="2008">2008년</option>
				<option value="2007">2007년</option>
				<option value="2006">2006년</option>
				<option value="2005">2005년</option>
				<option value="2004">2004년</option>
				<option value="2003">2003년</option>
				<option value="2002">2002년</option>
				<option value="2001">2001년</option>
				<option value="2000">2000년</option>
				<option value="1999">1999년</option>
				<option value="1998">1998년</option>
				<option value="1997">1997년</option>
				<option value="1996">1996년</option>
				<option value="1995">1995년</option>
				<option value="1994">1994년</option>
				<option value="1993">1993년</option>
				<option value="1992">1992년</option>
				<option value="1991">1991년</option>
				<option value="1990">1990년</option>
				<option value="1989">1989년</option>
				<option value="1988">1988년</option>
				<option value="1987">1987년</option>
				<option value="1986">1986년</option>
				<option value="1985">1985년</option>
				<option value="1984">1984년</option>
				<option value="1983">1983년</option>
				<option value="1982">1982년</option>
				<option value="1981">1981년</option>
				<option value="1980">1980년</option>
				<option value="1979">1979년</option>
				<option value="1978">1978년</option>
				<option value="1977">1977년</option>
			</select></center></div>
			<div class="4u 12u$(small)">
			<select name="birthday_month">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select></div>
			<div class="4u 12u$(small)">
			<select name="birthday_day">
				<option value="1">1일</option>
				<option value="2">2일</option>
				<option value="3">3일</option>
				<option value="4">4일</option>
				<option value="5">5일</option>
				<option value="6">6일</option>
				<option value="7">7일</option>
				<option value="8">8일</option>
				<option value="9">9일</option>
				<option value="10">10일</option>
				<option value="11">11일</option>
				<option value="12">12일</option>
				<option value="13">13일</option>
				<option value="14">14일</option>
				<option value="15">15일</option>
				<option value="16">16일</option>
				<option value="17">17일</option>
				<option value="18">18일</option>
				<option value="19">19일</option>
				<option value="20">20일</option>
				<option value="21">21일</option>
				<option value="22">22일</option>
				<option value="23">23일</option>
				<option value="24">24일</option>
				<option value="25">25일</option>
				<option value="26">26일</option>
				<option value="27">27일</option>
				<option value="28">28일</option>
				<option value="29">29일</option>
				<option value="30">30일</option>
				<option value="31">31일</option>
			</select>
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="text" name="phone" id="phone" value="" placeholder="휴대전화번호" />
		</div>
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="address" id="address" value="" placeholder="주소" disabled />
		</div>
		<div class="2u 12u$(xsmall)">
			<a href="address_search.jsp" class="button alt" target="_blank">주소찾기</a>
		</div>
		<div class="12u$ 12u$(xsmall)">
			<input type="text" name="address_detail" id="address_detail" value="" placeholder="상세주소" />
		</div>
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="referrer" id="referrer" value="" placeholder="추천인 닉네임" />
		</div>
		<div>
			<a href="#" class="button alt">확인</a>
		</div>
		
	</div>
</form>
<ul class="actions">
	<li><a class="button special" onclick="inputCheck()">회원가입</a></li>
	<li><a href="../login" class="button alt">로그인하기</a></li>
</ul>
			</div>
			</div>
			</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				<a href="https://templated.co/hielo">TEMPLATED by Hielo</a>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>

		<!-- Scripts -->
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../../assets/js/jquery.scrollex.min.js"></script>
			<script src="../../assets/js/skel.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>

	</body>
</html>