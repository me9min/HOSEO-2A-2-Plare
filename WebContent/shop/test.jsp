<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>One Sports</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/Nunito.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
  <meta charset="utf-8">
<!-- Sidebar -->
    

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-1">
          <img src="/img/logo/white_new.png">
        </div>
        <div class="sidebar-brand-text mx-3">One Sports</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Toto &amp; Shop
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseToto" aria-expanded="true" aria-controls="collapseToto">
          <i class="fas fa-chess-queen"></i>
          <span>토토</span>
        </a>
        <div id="collapseToto" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/toto/ladder">사다리</a>
            <a class="collapse-item" href="/toto/dice">홀짝</a>
            <a class="collapse-item" href="/toto/graph">그래프</a>
            <h6 class="collapse-header">Betting:</h6>
            <a class="collapse-item" href="buttons.html">게임배팅</a>
            <a class="collapse-item" href="buttons.html">스포츠배팅</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseShop" aria-expanded="true" aria-controls="collapseShop">
          <i class="fas fa-store"> <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span></i>
          <span>상점</span>
        </a>
        <div id="collapseShop" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/itemShop">아이템샵</a>
            <a class="collapse-item" href="/creditShop">크레딧샵</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
         Board
      </div>

      <!-- Nav Item - Charts -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="charts.html"> -->
<!--           <i class="fas fa-calendar-week"></i> -->
<!--           <span>이벤트</span></a> -->
<!--       </li> -->

      <!-- Nav Item - Tables -->
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBoard" aria-expanded="true" aria-controls="collapseBoard">
          <i class="fas fa-book-reader"></i>
          <span>게시판</span>
        </a>
        <div id="collapseBoard" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
<!--             <a class="collapse-item" href="/qna">공지사항</a> -->
            <a class="collapse-item" href="/boardList">자유게시판</a>
            <a class="collapse-item" href="/qna">Q&amp;A</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Etc
      </div>

       <!-- Nav Item - Tables -->
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAboutUs" aria-expanded="true" aria-controls="collapseAboutUs">
          <i class="fas fa-user-friends"></i>
          <span>About Us</span>
        </a>
        <div id="collapseAboutUs" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/project">프로젝트 소개</a>
            <a class="collapse-item" href="/history">연혁</a>
            <a class="collapse-item" href="/introduceTeam">팀원소개</a>
          </div>
        </div>
      </li>
	  <div class="sidebar-heading">
        PRIVATE
      </div>
      <!-- VIP Room -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVip" aria-expanded="true" aria-controls="collapseVip">
          <i class="fas fa-store"> <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span></i>
          <span>VIP</span>
        </a>
        <div id="collapseVip" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/vip">입장하기</a>
          </div>
        </div>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    <!-- End of Sidebar --></ul>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
<meta charset="utf-8">

<!-- Topbar Navbar -->


<ul class="navbar-nav ml-auto">
	<!-- Nav Item - User Information -->
	<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class="mr-2 d-none d-lg-inline small">회원가입/로그인</span>
			<i class="fas fa-user"></i>
	</a> <!-- Dropdown - User Information -->
		<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
			<a class="dropdown-item" href="/registerCust"> <i class="fas fa-user-plus"></i> 회원가입
			</a> <a class="dropdown-item" href="/login"> <i class="fas fa-sign-in-alt"></i> 로그인
			</a> <a class="dropdown-item" href="/findID_PW"> <i class="fas fa-lock-open"></i> ID/PW 찾기
			</a>
		</div></li>
</ul></nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="row">
						<h2 class="text-title">크레딧 샵</h2>
						<a class="btn btn-light btn-circle" href="#"> <i class="fas fa-info-circle"></i>
						</a>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-8 col-sm-12 col-xs-12">
							<div class="input-group mb-3">
								<select class="custom-select" id="category" onchange="javascript:getList(-1,'N');">
									<option selected="" value="0">전체보기</option>
									
										<option value="10001">주류</option>
									
										<option value="10002">총기류</option>
									
										<option value="10003">카드류</option>
									
										<option value="10004">기호품</option>
									
										<option value="10005">칩류</option>
									
										<option value="10006">스포츠용품</option>
									
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="basic-addon1" id="search">
								<button type="button" class="btn btn-secondary">검색</button>
							</div>
						</div>
					</div>
					<br>

					<!-- 따라다니는 광고 레이어 시작-->
					<!-- 					<div class="fixed-bottom-right"> -->
					<!-- 						<img src="img/add/nomoney.png"> -->
					<!-- 					</div> -->
					<!-- 따라다니는 광고 레이어 마지막 -->

					<div class="container" id="creditMain"><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="//modunsports.com/web/product/big/201803/173_shop1_840916.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>	프로모릭스 야구글러브</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000036')">				</span>			</h5>			<p class="card-text">				<span>14,900</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.danawa.com/prod_img/500000/003/429/img/7429003_1.jpg?shrink=500:500&amp;_v=20190312090416" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>미즈노 GMVP1154PSE6ARON 내야수용 야구글러브</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000035')">				</span>			</h5>			<p class="card-text">				<span>188,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://www.costco.co.kr/medias/sys_master/images/hd0/h64/10975219056670.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>윌슨 야구 글러브-레드</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000034')">				</span>			</h5>			<p class="card-text">				<span>39,900</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://image.auction.co.kr/itemimage/12/27/f0/1227f07f06.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>스타야구배트 야구뱃트 야구뱃 나무 세트</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000033')">				</span>			</h5>			<p class="card-text">				<span>17,500</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.danawa.com/prod_img/500000/450/046/img/6046450_1.jpg?shrink=500:500&amp;_v=20180411114415" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>프로모릭스 나무 야구배트 30</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000032')">				</span>			</h5>			<p class="card-text">				<span>15,900</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.danawa.com/prod_img/500000/429/248/img/4248429_1.jpg?shrink=500:500&amp;_v=20180405155846" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>나스포 익사이팅 메이저 나무배트 30</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000031')">				</span>			</h5>			<p class="card-text">				<span>15,840</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.danawa.com/prod_img/500000/162/498/img/2498162_1.jpg?shrink=500:500&amp;_v=20190917105909" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>프랭클린 A11 1570</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000030')">				</span>			</h5>			<p class="card-text">				<span>8,200</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.danawa.com/prod_img/500000/981/211/img/2211981_1.jpg?shrink=500:500&amp;_v=20160809151005" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>윌슨 A1217 연식 야구공</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000029')">				</span>			</h5>			<p class="card-text">				<span>4,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="//samsunglionsshop.com/web/product/big/201707/269_shop1_469279.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>라이온즈 로고볼 야구공</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000028')">				</span>			</h5>			<p class="card-text">				<span>5,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/18/2/2/9/6/9/5/pqwUY/2043229695_B.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>STAR 스타 축구공 몬타나 5호 SB895</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000027')">				</span>			</h5>			<p class="card-text">				<span>5,630</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://i.011st.com/ex_t/R/400x400/1/85/0/src/pd/19/4/4/3/8/3/6/xriwJ/2349443836_B.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>Molten 2019 아시안컵 공인구 5호</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000026')">				</span>			</h5>			<p class="card-text">				<span>128,500</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.danawa.com/prod_img/500000/009/082/img/6082009_1.jpg?shrink=500:500&amp;_v=20180423171555" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>나스포 익사이팅 축구공</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000025')">				</span>			</h5>			<p class="card-text">				<span>6,390</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Daewoo_DP51.JPG/300px-Daewoo_DP51.JPG" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>K-5</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000024')">				</span>			</h5>			<p class="card-text">				<span>250,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://img.bemil.chosun.com/site/data/img_dir/2017/06/29/2017062901936_0.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>K-1 기관단총</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000023')">				</span>			</h5>			<p class="card-text">				<span>400,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://cfs7.tistory.com/image/21/tistory/2008/08/01/21/04/4892fbceb0380" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>소염기</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000022')">				</span>			</h5>			<p class="card-text">				<span>70,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://upload.wikimedia.org/wikipedia/commons/3/32/%D0%90%D0%9A-47.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>AK-47</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000021')">				</span>			</h5>			<p class="card-text">				<span>450,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://imgaz.staticbg.com/thumb/large/upload/2012/chenjianwei/SKU087607.1.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>24 캐럿 골드 호일 도금 포커 카드</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000020')">				</span>			</h5>			<p class="card-text">				<span>7,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://singisingi.com/web/product/big/201702/215_shop1_424288.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>월드시리즈 오브 포커카드</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000019')">				</span>			</h5>			<p class="card-text">				<span>10,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://cdn.ownerclan.com/tnXxm6p8BAmbQ7Ulk7ko5Fbe0OE9PjFYJ4xO1qIxrDk/marketize/auto/as/v1.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>마카오 스타 카지노칩 포커칩 세트</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000018')">				</span>			</h5>			<p class="card-text">				<span>200</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://image.lotte.com/goods/35/61/30/16/5/516306135_1_550.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>홀트레이드 포커칩세트</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000017')">				</span>			</h5>			<p class="card-text">				<span>20,390</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://image.lotte.com/goods/61/58/13/82/4/482135861_1_550.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>카드놀이 칩 세트 300P</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000016')">				</span>			</h5>			<p class="card-text">				<span>30,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://image.yes24.com/Goods/67114692/800x0" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>포커 트럼프 카드 게임 골드</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000015')">				</span>			</h5>			<p class="card-text">				<span>23,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://i.011st.com/t/300/pd/17/2/6/7/2/8/9/PPBbn/1791267289_L300.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>홀덤 플레잉 카드</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000014')">				</span>			</h5>			<p class="card-text">				<span>7,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/1231813602/thumb-1231813602_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>루이 로드레 크리스탈 2006</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000013')">				</span>			</h5>			<p class="card-text">				<span>600,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/1073615120/thumb-1073615120_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>발렌타인 파이니스트 700ml</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000012')">				</span>			</h5>			<p class="card-text">				<span>33,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/8475150437/thumb-8475150437_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>돔 페리뇽 2006</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000011')">				</span>			</h5>			<p class="card-text">				<span>280,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/1449239192/thumb-1449239192_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>바톤 진 750ml</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000010')">				</span>			</h5>			<p class="card-text">				<span>8,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/1071113360/thumb-1071113360_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>올드파12년 500ml</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000009')">				</span>			</h5>			<p class="card-text">				<span>55,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src=" http://www.kajawine.kr/data/item/1316069846/thumb-1316069846_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>앱솔루트 보드카</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000008')">				</span>			</h5>			<p class="card-text">				<span>6,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/4526817140/thumb-4526817140_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>우드포드 리저브</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000007')">				</span>			</h5>			<p class="card-text">				<span>140,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/1549783464/thumb-BarondeSenac_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>바론 드 세냑</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000006')">				</span>			</h5>			<p class="card-text">				<span>20,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://www.kajawine.kr/data/item/1070682152/thumb-1070682152_l1_360x480.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>바카디</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000005')">				</span>			</h5>			<p class="card-text">				<span>22,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div><div class="row">	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="http://gdimg.gmarket.co.kr/1622912847/still/600?ver=1560142638" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>삐에로 화투카드/고스톱</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000004')">				</span>			</h5>			<p class="card-text">				<span>1,700</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/%ED%98%84%EC%9A%A9_K2_%EC%86%8C%EC%B4%9D.png/300px-%ED%98%84%EC%9A%A9_K2_%EC%86%8C%EC%B4%9D.png" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>K-2</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000003')">				</span>			</h5>			<p class="card-text">				<span>500,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://www.omynara.com/wp-content/uploads/2017/09/%EC%98%A4%EB%AF%B8%EB%A1%9C%EC%A0%9C%EA%B2%B0_thumb.jpg" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>오미로제 스파클링</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000002')">				</span>			</h5>			<p class="card-text">				<span>89,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div>	<div class="card col-lg-3 col-md-3 col-sm-6  col-xs-12">		<img class="card-img-top" alt="" ...'="" style="height: 180px; width:180px;;" src="https://t1.daumcdn.net/cfile/tistory/25368737586BCC310C" onerror="this.src='/img/error/notFound.jpg'">		<div class="card-body">			<hr>			<h5 class="card-title">				<span>원카드</span><span style="float: right"> <input class="btn-secondary" type="button" value="상세보기" onclick="javascript:openProduct('30000001')">				</span>			</h5>			<p class="card-text">				<span>5,000</span>크레딧<span style="float: right"><input class="btn-secondary" type="button" value="장바구니">			</span></p>		</div>	</div></div></div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white"><meta charset="utf-8">
 <div class="container my-auto">
   <div class="copyright text-center my-auto">
   	<div style="display:inline-block;">
   		<img src="/img/OneSports.png" style="vertical-align: baseline" width="120px">
   	</div>	
   	<div style="display:inline-block;line-height: normal;">주소 : 서울특별시 강서구 등촌3동 강서로 420<br>
   	팀 이름 : FamilyToto | 사이트 명 : OneSports | 2019년 2학년 2학기 JSP프로젝트<br>
   	조원 : 박지호(조장), 하상준(서브코더), 여규원(퍼블리셔), 이길호(블로거)<br>
   	<a href="https://blog.naver.com/familytoto2019_2b02" target="_blank">블로그</a> | 
   	<a href="https://github.com/bjh0501/OneSports" target="_blank">깃 허브</a><br>
    Copyright © FamilyToto 2019</div>
   </div>
 </div>
 
 <style>
 
 </style></footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->

		<!-- Bootstrap core JavaScript-->
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="/js/sb-admin-2.min.js"></script>


<script>	
	function comma(num) {
		var len, point, str;

		num = num + "";
		point = num.length % 3;
		len = num.length;

		str = num.substring(0, point);
		while (point < len) {
			if (str != "")
				str += ",";
			str += num.substring(point, point + 3);
			point += 3;
		}

		return str;
	}
	
	var page = 0;
	
	$(function() { //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.		
		getList(page, 'N');
		page+=20;
	});

	$(window).scroll(
		function() { //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
			if ($(window).scrollTop() >= $(document).height()
				- $(window).height()) {
			getList(page, 'N');
			page += 20;
		}
	});

	var beforeSearch = "-";
	
	function getList(page, searchGubun) {
		if(searchGubun == "Y") {
			if($("#search").val() == beforeSearch) {
				return;
			}
		}
			
		if(page == -1) {
			$("#creditMain").html("");
			page = 0;
		}
		
		beforeSearch = $("#search").val();
		
		if(page == -1) {
			page = 0;
		}
		
		$.ajax({
			url : "/creditShop/list?pagingNo=" + page,
			type : "POST",
			cache : false,
			dataType : "json",
			data : {
				categoryNo :  $("#category").val()   
			,	productName : $("#search").val()
			},
			success : function(data) {
				str = "";

				var i = 0;
				var num = data.length;

				if (num > 20) {
					num = 20;
				}

				while (i < num) {
					str += "<div class='row'>";

					for (var j = 0; j < 4; j++) {
						if (data[i] != undefined) {
							var img = "";

							if (data[i].productImgUrl != undefined) {
								img = data[i].productImgUrl;
							}

							var productName = data[i].productName;
							var productNo = data[i].productNo;
							var productCredit = comma(data[i].productCredit);

							str += "	<div class='card col-lg-3 col-md-3 col-sm-6  col-xs-12'>";
							str += "		<img class='card-img-top' alt=''...' style='height: 180px; width:180px;;'";
							str += "			src='" + img + "'";
							str += "			onerror=this.src='/img/error/notFound.jpg'>";
							str += "		<div class='card-body'>";
							str += "			<hr>";
							str += "			<h5 class='card-title'>";
							str += "				<span>"
									+ productName
									+ "</span><span style='float: right'> <input";
							str += "					class='btn-secondary' type='button' value='상세보기'";
							str += "					onclick=javascript:openProduct('" + productNo + "')>";
							str += "				</span>";
							str += "			</h5>";
							str += "			<p class='card-text'>";
							str += "				<span>"
									+ productCredit
									+ "</span>크레딧<span style='float: right'><input";
							str += "					class='btn-secondary' type='button' value='장바구니'>";
							str += "			</p>";
							str += "		</div>";
							str += "	</div>";

							if (i >= num) {
								break;
							}

							i++;
						}
					}

					str += "</div>";
				}

				page+=10;
				$("#creditMain").append(str);
				$("#creditMain").slideDown(200);
			},
			error : function(request, status, error) {
				var msg = "ERROR : " + request.status + "<br>"
				msg += +"내용 : " + request.responseText + "<br>" + error;
				console.log(msg);
			}
		});
	};

	function openProduct(productNo) {
		var win = window.open("/showProduct/" + productNo, "_blank");
	    win.focus();
	}
	
	$("#search").keyup(function(e){getList(-1, "Y"); });
</script>

</div></body></html>