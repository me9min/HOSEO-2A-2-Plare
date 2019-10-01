<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/assets/include/logout_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>로그인</title>
		<script language="JavaScript" src="login.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>

		<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>더 많은 기능이용</p>
						<h2>로그인</h2>
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
								<h2>로그인</h2>
							</header>
<form method="post" action="db_login.jsp" name="login" onsubmit="return loginCheck()">
  <div class="row">
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
    <div class="col-md-6">
     <input type="text" name="email" id="email" value="" placeholder="아이디/이메일" />
    </div>
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
   </div><br>
   <div class="row">
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
    <div class="col-md-6">
     <input type="password" name="password" id="password" value="" placeholder="비밀번호" />
    </div>
    <div class="col-md-3"  style="visibility:hidden;">빈공간</div>
  </div>
	<!-- <div class="row uniform">
	<br>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		<div class="6u 12u$(xsmall)">
			<input type="text" name="email" id="email" value="" placeholder="아이디/이메일" />
		</div>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div><br>
		
		
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		<div class="6u$ 12u$(xsmall)">
			<input type="password" name="password" id="password" value="" placeholder="비밀번호" />
		</div>
		<div class="3u 12u$(xsmall)" style="visibility:hidden;">
			빈공간
		</div>
		
	</div> -->

<div class="row uniform">
	<div class="3u 12u$(xsmall)  style="visibility:hidden;"></div>
    <ul class="actions">
		<li><input type="submit" value="로그인" class="button special"></li>
		<li><a href="../find" class="button alt">아이디/비밀번호 찾기</a></li>
		<li><a href="../register" class="button alt">회원가입</a></li>
	</ul>
</div>
<div class="row uniform">
	<div class="4u 12u$(xsmall)  style="visibility:hidden;"></div>
	<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img alt="카카오로그인" src="/assets/images/kakao_account_login_btn_medium_narrow.png"/>
	</a>
</div>
</form>
						</div>
					</div>
				</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>

<!-- 카카오  로그인 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('772d3b056b1e4184132da022b5921c51');
	// 카카오 로그인 버튼을 생성합니다.
	function loginWithKakao() {
		Kakao.Auth.login({
			success: function(authObj) {
				alert(JSON.stringify(authObj));
			},
			fail: function(err) {
				alert(JSON.stringify(err));
			}
		});
	};
</script>