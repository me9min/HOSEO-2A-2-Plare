<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<%@ page import = "Bean.Board" %>
<%@ page import = "Bean.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>가이드</title>
		<style>
			#guide_bg{
				background-image:url("../assets/images/guide_bg.jpg") !important;
				background-attachment:fixed !important;
				width:100%;
				height:100%;
			}
			#guide_color{
				background-color:#000000 !important;
			}
			#guide_title{
				color:#ee1111;
			}
			#guide_key{
				font-weight:800;
				text-align:center !important;
			}
		</style>
<%@ include file="/assets/include/menu.jsp" %>
<%@ include file="/assets/include/guide_top.jsp" %>

<section class="wrapper style2" id="guide_bg">
				<div class="inner">
					<div class="box">
						<div class="content" id="guide_color">
		<h3 id="guide_title">진행목표</h3><br>
		<div>
			목표는 좀비들로 가득 찬 맵에서 탈출하거나 살아남는 것입니다<br><br>
			탈출 맵의 경우 중간중간에 문을 용접하거나 열쇠를 찾아헤매는 등의 과제들이 준비되어 있습니다<br>
			또한 레프트 4 데드 2 와 같이 플레이 할 때마다 맵의 진행 경로가 매번 달라지는게 특징입니다<br><br>
			서바이벌 맵은 일정 시간마다 맵 구석구석에서 나오는 장비와 <br>
			헬기가 보내 주는 보급품으로 목표 라운드까지 살아남아야 합니다
		</div><br>
		
		<h3 id="guide_title"> 조작키</h3><br>
		
		<div class="row uniform">
			<div class ="2u 12u$(xsmall)" id="guide_key">
			W, A, S, D
			</div>
			<div class ="10u 12u$(xsmall)">
				기본 조작키. 각각 앞, 왼쪽, 뒤, 오른쪽으로 이동합니다
			</div>
			
			<div class ="2u 12u$(xsmall)" id="guide_key">
				R
			</div>
			<div class ="10u 12u$(xsmall)">
				현재 들고 있는 총의 실탄을 갈아줍니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key"  style="line-height:38px;vertical-align:middle">
				R 길게 입력
			</div>
			<div class ="10u 12u$(xsmall)">
				여분의 실탄이 있을 경우, 총의 실탄이 가득차지 않았을 경우<br>
				현재 들고 있는 총에 들어있는 남은 실탄과 여분의 실탄 수를 함께 보여줍니다
			</div>	
			
			<div class ="2u 12u$(xsmall)" id="guide_key">
				C
			</div>
			<div class ="10u 12u$(xsmall)">
				현재 미션의 내용을 확인하거나 나침반으로 찾아야하는 물건의 위치를 확인할 때 사용합니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				Shift
			</div>
			<div class ="10u 12u$(xsmall)">
				달리기. 기본 조작키와 함께 누르면서 더욱 빠르게 달라실 수 있습니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				Ctrl
			</div>
			<div class ="10u 12u$(xsmall)">
				앉기. 한 칸 정도의 좁게 생긴 통로에 들어가거나 스테미너를 빠르게 회복할 때 사용합니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				1
			</div>
			<div class ="10u 12u$(xsmall)">
				인벤토리, 무전기나 둔기들, 총이나 탄창 등 가지고 있는 아이템들을 볼 수 있습니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key" style="line-height:38px;vertical-align:middle">
				2
			</div>
			<div class ="10u 12u$(xsmall)">
				탄창 인벤토리로 탄창들을 관리하는 인벤토리로 1번 인벤토리에서는 우클릭으로 물건을 버리지만<br>
				탄창 인벤토리에서는 좌클릭으로 물건을 버립니다.
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key" style="line-height:38px;vertical-align:middle">
				3
			</div>
			<div class ="10u 12u$(xsmall)">
				보이스 커맨드. 마이크 채팅 대신 간단한 도움 요청, 탄창 필요, 따라오게 하기 등의<br>
				말을 할 때 사용합니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				Q
			</div>
			<div class ="10u 12u$(xsmall)">
				마지막으로 사용했었던 무기를 다시 불러옵니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				E
			</div>
			<div class ="10u 12u$(xsmall)">
				행동하기. 주로 문을 열거나 어떤 기기들을 사용할 때 많이 사용합니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				H
			</div>
			<div class ="10u 12u$(xsmall)">
				현재 들고 있었던 무기를 다시 넣고, 맨 손 상태로 만들어줍니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				F
			</div>
			<div class ="10u 12u$(xsmall)">
				자신이 가지고 있는 라이터 또는 손전등을 가지고 있다면 손전등을 꺼내어줍니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				F 길게 입력
			</div>
			<div class ="10u 12u$(xsmall)">
				손전등을 인벤토리에 소지하고 있는 경우에는 F를 길게 입력하면 라이터가 나오게 됩니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				G 
			</div>
			<div class ="10u 12u$(xsmall)">
				자신이 들고 있는 무기를 버립니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				G 길게 입력
			</div>
			<div class ="10u 12u$(xsmall)">
				자신이 들고 있는 무기를 멀리 던져서 버립니다 (좀비에게 맞을 경우 데미지를 입힐 수 있습니다)
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key" style="line-height:56px;vertical-align:middle">
				V
			</div>
			<div class ="10u 12u$(xsmall)">
				밀쳐내기. 사정거리가 좁은 둔기로 좀비를 상대할 때 밀쳐내기를 해주시면 아주 좋습니다<br>
				평소에는 좀비에게 물릴고 할 때, 또는 갑작스럽게 기습하는 러너들을 밀쳐낼 때 사용해도 좋습니다<br>
				때로는 전기톱을 작동시킬 때 V로 캔슬하여 기름을 조금 더 아낄 수 있다고도 합니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				T 또는 Y
			</div>
			<div class ="10u 12u$(xsmall)">
				채팅 창을 열어줍니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				`
			</div>
			<div class ="10u 12u$(xsmall)">
				관리자 콘솔 창을 열어줍니다  (단, 개발자 콘솔 사용에 체크가 되어있어야 사용이 가능합니다)
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key" style="line-height:56px;vertical-align:middle">
				X
			</div>
			<div class ="10u 12u$(xsmall)">
				M16A4 등과 같은 라이플의 단발 또는 연발 사격의 설정을 도와줍니다<br>
				빨간색으로 나와있는 실탄 아이콘의 개수가 1개면 단발 사격(Semi),<br>
				3개나 5개면 연발 사격(Auto)상태가 됩니다.
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				좌클릭
			</div>
			<div class ="10u 12u$(xsmall)">
				둔기를 휘두르거나, 탄창 인벤토리에서 탄창을 버릴 때 등에 사용합니다.
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key" style="line-height:38px;vertical-align:middle">
				우클릭
			</div>
			<div class ="10u 12u$(xsmall)">
				소화기를 사용하는 미션이나 용접기를 사용하여 문을 용접할 때, <br>
				일반 인벤토리에서 아이템을 버릴 때 등에 사용합니다
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key">
				U
			</div>
			<div class ="10u 12u$(xsmall)">
				 총알을 분리한다 
			</div>
			<div class ="2u 12u$(xsmall)" id="guide_key" style="line-height:38px;vertical-align:middle">
				K
			</div>
			<div class ="10u 12u$(xsmall)">
				총기류만 가능하며 총구를 머리에 조준하는 모션을 취한 후 총알 한발을 소모한다<br>
				(K를 눌러 자살을 취소 할 수도 있다.)
			</div>
		</div><br>
		
		<h3 id="guide_title">TIP</h3><br>
		
		<div>
			원처럼 생긴 이 인벤토리가 물건들로 가득 차게 되면 더 이상 주울 수 없게 되며<br> 중복 아이템의 경우 주우실 수 없게 됩니다<br>
			아이템을 혼자서 독차지 하는 사람들을 감안하여 만들어진 기능입니다<br><br>
			
			아이템을 적게 들고 계실 수록 이동속도가 빨라지며<br>
			인벤토리가 완전히 가득 찬 상태에서는 이동속도가 갑자기 느려지므로<br>
			적어도 1% 이상의 여유 공간을 남겨두신 상태가 훨씬 효율적입니다<br><br>
			
			탄창이 1발이라도 들어있는 총은 일반 인벤토리를 열였을 때,<br>
			빨간색으로 표시가 되지만 탄창이 1발도 남아있지 않은 총의 경우 흰색으로 표시되게 됩니다<br>
			그래서 일반 아이템들(수류탄, 야전삽, 손전등 등)은 모두 빨간색으로 표시되면서 사용이 가능합니다
		</div>
	
</div></div></div></section>

			
<%@ include file="/assets/include/foot.jsp" %>

</html>