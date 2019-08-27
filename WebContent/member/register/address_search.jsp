<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>주소 검색</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script language="JavaScript" src="./register.js"></script>
		<script>
		function autoInput(zipcode, address) {
			var address_value = zipcode + " " + address;
			window.opener.register.email.value = address_value;
			window.close();
		}
	</script>
</head>
<body>
<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>더 많은 기능이용</p>
								<h2>우편번호 검색</h2>
							</header>
<form method="post" action="address_result.jsp" name="address">
	<div class="row uniform">

		<div class="10u 12u$(xsmall)">
			<input type="text" name="address" id="address" value="" placeholder="주소를 입력하세요." />
		</div>

		<div class="2u$ 12u$(xsmall)">
			<a href="#" class="button alt" onclick="addressCheck()">검색</a>
		</div>

	</div>
</form>
						</div>
					</div>
				</div>
			</section>
</body>
</html>