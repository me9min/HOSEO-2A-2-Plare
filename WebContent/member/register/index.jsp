<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Bean.*" %>
<%@ include file="/assets/include/logout_check.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>회원가입</title>
		<script language="JavaScript" src="register.js"></script>
<%@ include file="/assets/include/menu_member.jsp" %>


<%@ include file="/assets/include/member_top.jsp" %>			
		<!-- main -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
							</header>
<p>*은 필수항목입니다</p>
<form method="post" action="db_register.jsp" name="register">
	<div class="row uniform">
		<input type="hidden" name="email_check" id="email_check" value="false" />
		<input type="hidden" name="nickname_check" id="nickname_check" value="false" />
		<input type="hidden" name="referrer_check" id="referrer_check" value="false" />
		<div class="8u 12u$(xsmall)">
			<input type="text" name="email" id="email" maxlength="40" value="" placeholder="* 이메일" />
		</div>
		<div>
			<a class="button alt" onclick="emailCheck()">중복확인</a>
		</div>
		
		<div class="12u 12u$(xsmall)">
			<input type="password" name="password" id="password" maxlength="20" value="" placeholder="* 비밀번호  4~20자, 영어와 숫자 반드시 포함" />
		</div>
		
		<div class="12u$ 12u$(xsmall)">
			<input type="password" name="passwordc" id="passwordc" maxlength="20" value="" placeholder="* 비밀번호 확인" />
		</div>
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="nickname" id="nickname" maxlength="20" value="" placeholder="* 닉네임  20자 이하, 특수문자 가능" />
		</div>
		<div>
			<a class="button alt" onclick="nicknameCheck()">중복확인</a>
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
				<option value="1976">1976년</option>
				<option value="1975">1975년</option>
				<option value="1974">1974년</option>
				<option value="1973">1973년</option>
				<option value="1972">1972년</option>
				<option value="1971">1971년</option>
				<option value="1970">1970년</option>
			</select></center></div>
			<div class="4u 12u$(small)">
			<select name="birthday_month">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select></div>
			<div class="4u 12u$(small)">
			<select name="birthday_day">
				<option value="01">1일</option>
				<option value="02">2일</option>
				<option value="03">3일</option>
				<option value="04">4일</option>
				<option value="05">5일</option>
				<option value="06">6일</option>
				<option value="07">7일</option>
				<option value="08">8일</option>
				<option value="09">9일</option>
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
			<input type="text" name="phone" id="phone" maxlength="11" value="" placeholder="휴대전화번호" />
		</div>
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="address_road" id="address_road" value="" placeholder="주소" readonly />
		</div>
		<div class="2u 12u$(xsmall)">
			<a href="address_search.jsp" class="button alt" target="_blank">주소찾기</a>
		</div>
		<div class="1u 12u$(xsmall) hidden">
			<input type="hidden" name="address" id="address" value="" readonly />
		</div>
		<div class="6u 12u$(xsmall)">
			<input type="text" name="zipcode" id="zipcode" value="" placeholder="우편번호" readonly />
		</div>
		<div class="6u$ 12u$(xsmall)">
			<input type="text" name="address_detail" id="address_detail" maxlength="40" value="" placeholder="상세주소" />
		</div>
		
		<div class="8u 12u$(xsmall)">
			<input type="text" name="referrer" id="referrer" maxlength="20" value="" placeholder="추천인 닉네임" />
		</div>
		<div>
			<a class="button alt" onclick="referrerCheck()">확인</a>
		</div>
		
	</div><br>
<ul class="actions">
	<li><input type="button" value="회원가입" class="button special" onclick="inputCheck()"></li>
	<li><a href="../login" class="button alt">로그인하기</a></li>
</ul>
</form>
			</div>
			</div>
			</div>
			</section>

<%@ include file="/assets/include/foot.jsp" %>

</html>