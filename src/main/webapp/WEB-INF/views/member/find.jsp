<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko" class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>OKKY - 회원정보 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="//okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="//okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="//okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta property="og:image"
	content="//okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">

<link rel="stylesheet"
	href="//okky.kr/assets/application-4938a5785f86450f51f45a6a41f3bf4e.css" />
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<!--[if lt IE 9]>
    <script src="//okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript"></script>
<!--    <script src="/resources/jqLib/joinCheck.js"></script>-->

<meta name="layout" content="main">

</head>
<body>
	<div class="layout-container">
		<div class="main ">

			<div class="sidebar ">

				<a href="javascript://" class="sidebar-header"> <i
					class="fa fa-bars sidebar-header-icon"></i>
				</a>

				<h1>
					<div class="logo">
						<a href="/"><img
							src="//okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png"
							alt="OKKY" title="OKKY" /></a>
					</div>
				</h1>

				<ul id="search-google-icon"
					class="nav nav-sidebar nav-sidebar-search-wrapper">
					<li class="nav-sidebar-search"><a href="javascript://"
						class="link" id="search-google" data-toggle="popover"
						data-trigger="click"><i class="fa fa-search"></i></a></li>
				</ul>

				<form id="search-google-form" name="searchMain"
					class="nav-sidebar-form" action="https://www.google.com/search">
					<div class="input-group">
						<input type="text" name="qt" class="form-control input-sm"
							placeholder="Google 검색" /> <input type="hidden" name="q" /> <span
							class="input-group-btn">
							<button class="btn btn-default btn-sm" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>

				<div class="nav-user nav-sidebar">

					<ul class="nav nav-sidebar">
						<li><a href="/member/login" class="link"><i
								class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
						<li><a href="#" class="link"><i class="fa fa-user"></i> <span
								class="nav-sidebar-label">회원가입</span></a></li>
					</ul>

				</div>

				<ul class="nav nav-sidebar nav-main">

					<li><a href="/qna/list" class="link"><i
							class="nav-icon fa fa-database"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

					<li><a href="/tech/list" class="link"><i
							class="nav-icon fa fa-code"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

					<li><a href="/comunity/list" class="link"><i
							class="nav-icon fa fa-comments"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

					<li><a href="/column/list" class="link"><i
							class="nav-icon fa fa-quote-left"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

					<li><a href="/jobs/list" class="link"><i
							class="nav-icon fa fa-group"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

				</ul>

				<ul class="nav nav-sidebar nav-bottom">
					<li><a href="https://github.com/ildang100/okky" class="link"
						target="_blank"><i class="fa fa-github"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Github</span></a>
					</li>
				</ul>
			</div>
			<div id="create-user" class="content" role="main">
				<h3 class="content-header">계정 찾기</h3>
				<form action="/find/user/send" method="post">
					<div class="col-sm-8 col-sm-offset-2">
						<div class="panel panel-default panel-margin-10">
							<div class="panel-body panel-body-content text-center">
								<p class="lead">이메일 주소를 입력해 주세요.</p>
								<p>
									회원 가입시 입력하신 이메일 주소를 입력하시면,<br /> 해당 이메일로 아이디 및 비밀번호 변경 링크를
									보내드립니다.
								</p>

								<div class="form-group">
									<input type="email" name="email"
										class="form-control form-control-inline text-center"
										placeholder="이메일 주소" value="" />
								</div>
								<button type="submit" class="btn btn-primary">계정 찾기</button>
								<a href="/" class="btn btn-default">취소</a>
							</div>
						</div>
					</div>
				</form>
			</div>

			<%--<div class="col-md-6 main-block-right">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-header">SNS로 가입하기</h5>
                    </div>
                    <div class="panel-body panel-margin sns-buttons">
                        <a href="/oauth/facebook/authenticate?redirectUrl=" provider="facebook"
                           class="btn btn-facebook btn-block"><i class="fa fa-facebook fa-fw"></i> Facebook 으로 가입하기</a>

                        <a href="/oauth/google/authenticate?redirectUrl=" provider="google"
                           class="btn btn-google btn-block"><i class="fa fa-google fa-fw"></i> Google 로 가입하기</a>
                    </div>
                </div>
            </div>--%>

		</div>

		<div class="right-banner-wrapper"></div>
		<div id="footer" class="footer" role="contentinfo">
			<div class="row">
				<div class="col-sm-9">
					<div style="float: left; margin-right: 10px; height: 100px;">
						<img
							src="//okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png" />
					</div>
					<div>
						<a href="/intro/about">About OKKY</a> | <a href="/user/privacy"
							data-toggle="modal" data-target="#userPrivacy">개인정보보호</a> | <a
							href="/intro/ad">광고문의</a> | <a href="mailto:info@okky.kr">Contact</a>
						| <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
						| <a href="https://github.com/okjsp/okky" target="_blank">Github</a>
						v0.12
						<hr style="margin: 8px 0;" />
						<strong>상호명</strong> : 이브레인 | <strong>대표명</strong> : 노상범 | <strong>사업자등록번호</strong>
						: 144-81-32887 | <strong>문의전화</strong> : 02-6925-5202 <br /> <strong>주소</strong>
						: 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103) <br /> @ 2020 <a
							href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
					</div>
				</div>
				<div class="sponsor-banner col-sm-3">
					<div class="sponsor-banner-head">Sponsored by</div>
					<div class="sponsor-banner-images">
						<a href="http://www.inames.co.kr" target="_blank"><img
							src="//okky.kr/assets/spb_inames-47b092113795fdf02b8d8b0f36f91c5f.png"
							alt="아이네임즈" /></a>
					</div>
				</div>
			</div>

		</div>
	</div>

	</div>
	<script>
		var contextPath = "", encodedURL = "%2Fuser%2Fregister";
	</script>
	<script
		src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js"
		type="text/javascript"></script>
	<script
		src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js"
		type="text/javascript"></script>

	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-6707625-5', 'auto');
		ga('send', 'pageview');
	</script>

	<div id="userPrivacy" class="modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<div id="userAgreement" class="modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

</body>
</html>

