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
<script>
	var oneclick = 1; // 요총 한번만 할 수 있는 스위치(1=on, 0=off)
	var authclick = 1;
	var ii = 0;
	var pp = 0;
	var nn = 0;
	var nc = 0;
	var em = 0;

	var idCheck = function() {
		if (idCheck) {

		}
		var userid = $('#username').val();
		if (userid.length < 4) {
			$('#idCheck1').attr("style", "");
			return false;
		} else if (userid.replace(/[a-z.0-9]/gi, '').length > 0) {
			$('#idCheck1').attr("style", "display: none");
			$('#idCheck2').attr("style", "");
			return false;
		} else {
			$('#idCheck1').attr("style", "display: none");
			$('#idCheck2').attr("style", "display: none");
			$.ajax({
				type : 'Get',
				url : '/member/useridDuplicate',
				data : {
					userid : userid
				},
				success : function(data) {
					if (data.message == '200') {
						$('#idCheck3').attr("style", "display: none");
						ii = 1;
						return true;
					} else if (data.message == 'fail') {
						$('#idCheck3').attr("style", "");
						return false;
					}
				}
			});

		}
	}; // idCheck()

	var pwCheck = function() {
		var password = $('#password').val();
		var pLength = password.length;
		if (password.length < 4) {
			$('#pwCheck1').attr("style", "");
			return false;
		} else if (password.replace(/[!-*]/gi, '').length >= pLength) {
			$('#pwCheck1').attr("style", "display: none");
			$('#pwCheck2').attr("style", "");
			return false;
		} else if (password.replace(/[0-9.!-*]/gi, '').length > 0) {
			$('#pwCheck2').attr("style", "display: none");
			$('#pwCheck3').attr("style", "");
		} else {
			$('#pwCheck1').attr("style", "display: none");
			$('#pwCheck2').attr("style", "display: none");
			$('#pwCheck3').attr("style", "display: none");
			pp = 1;
			return true;
		}
	}; // pwCheck()

	/* 	var emCheck = function() {
	 var email = $('#email').val();
	 var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	 if (exptext.test(email) == false) {
	 $('#emailCheck1').attr("style", "");
	 return false;
	 } else {
	 $('#emailCheck1').attr("style", "display: none");
	 $.ajax({
	 type : 'Get',
	 url : '/member/emailDuplicate',
	 data : {
	 email : email
	 },
	 success : function(data) {
	 if (data.message == '200') {
	 $('#emailCheck2').attr("style", "display: none");
	 emailauth = 1;
	 } else if (data.message == 'fail') {
	 $('#emailCheck2').attr("style", "");
	 }
	 }
	 });
	 }
	 }; // emCheck() */

	var nmCheck = function() {
		var name = $('#fullName').val();
		if (name.length < 2) {
			console.log(name.length);
			$('#nameCheck1').attr("style", "");
			return false;
		} else if (name.replace(/[a-z.가-힇]/gi, '').length > 0) {
			$('#nameCheck1').attr("style", "display: none");
			$('#nameCheck2').attr("style", "");
			return false;
		} else {
			$('#nameCheck1').attr("style", "display: none");
			$('#nameCheck2').attr("style", "display: none");
			nn = 1;
			return true;
		}
	}; // nmCheck()

	var nickCheck = function() {
		var nickname = $('#nickname').val();
		if (nickname.replace(/[a-z.가-힇.0-9]/gi, '').length > 0) {
			$('#nickCheck2').attr("style", "");
			return false;
		} else {
			$('#nickCheck2').attr("style", "display: none");
			$.ajax({
				type : 'Get',
				url : '/member/nicknameDuplicate',
				data : {
					nickname : nickname
				},
				success : function(data) {
					if (data.message == '200') {
						$('#nickCheck1').attr("style", "display: none");
						nc = 1;
						return true;
					} else if (data.message == 'fail') {
						$('#nickCheck1').attr("style", "");
						return false;
					}
				}
			});
		}
	}; // nickCheck()
	// 이메일 유효성 검사
	var mailauth = function(e) {
		if (oneclick == 0) {
			return false;
		} else {
			console.log(oneclick);
			var email = $('#email').val();
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if (exptext.test(email) == false) {
				$('#emailCheck1').attr("style", "");
				return false;
			} else {
				$('#emailCheck1').attr("style", "display: none");
				$
						.ajax({
							type : 'Get',
							url : '/member/emailDuplicate',
							data : {
								email : email
							},
							success : function(data) {
								if (data.message == '200') {
									console.log("ㅇㅇ");
									$('#emailCheck2').attr("style",
											"display: none");
									em = 1;
									$
											.ajax({
												type : 'Get',
												url : "/member/sendauthkey",
												data : {
													email : document
															.getElementById("email").value
												},
												success : function(data) {
													if (data.message == '200') {
														$('#authkeybox').attr(
																"style", "");
														oneclick = 0; // 최종 성공시에 0을 줘서 리턴false
														return true;
													} else if (data.message == 'fail') {
														$('#authkeybox')
																.attr("style",
																		"display: none");
														return false;
													}
												}
											}); // ajax
									return true;
								} else if (data.message == 'fail') {
									console.log("ㄴㄴ");
									$('#emailCheck2').attr("style", "");
									return false;
								}
							}
						});
			}

		}
	};
	// 인증키 유효성 검사
	var authkeycheck = function() {
		if (authclick == 0) {
			console.log(authclick);
			return false;
		} else {
			console.log(authclick);
			var authk = $('#inputauthkey').val();
			if (authk.length < 4) {
				$('#authCheck1').attr("style", "");
				return false;
			} else if (authk.replace(/[0-9]/gi, '').length > 0) {
				$('#authCheck1').attr("style", "display: none");
				$('#authCheck2').attr("style", "");
				return false;
			} else {
				$('#authCheck2').attr("style", "display: none");
				$.ajax({
					type : 'Get',
					url : "/member/authkeycheck",
					data : {
						email : document.getElementById("email").value,
						authkey : document.getElementById("inputauthkey").value
					},
					success : function(data) {
						if (data.message == '200') {
							$('#authkeysuccess').attr("style", "");
							$('#email').attr("readonly", "readonly");
							$('#inputauthkey').attr("readonly", "readonly");
							$('#authkeybox').remove();
							$('#emailbox').remove();
							document.getElementById('join').disabled = "";
							authclick = 0;
							return true;
						} else if (data.message == 'fail') {
							$('#authCheck2').attr("style", "");
							$('#authkeybox').attr("style", "");
							return false;
						}
					}
				}); // ajax
			}
		}
	};
	// 전체 유효성 검사 통과 후 회원가입
	var duplicationCheck = function() {
		console.log('ㅇㅇ');
		if (ii == 1 && pp == 1 && nn == 1 && nc == 1 && em == 1) {
			document.getElementById("loginForm").submit();
			return true;
		} else {
			$('#finalCheck').attr("style", "");
			return false;
		}
	};
</script>

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
						<li><a href="/member/customLogin" class="link"><i
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
				<h3 class="content-header">회원가입</h3>
				<div class="col-md-6 main-block-left">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-header">이메일로 가입하기</h5>
						</div>
						<form action="/member/register" method="post"
							class="form-signup form-user panel-body" id="loginForm"
							autocomplete="off">
							<div class="alert alert-danger" role="alert"<%--style="display: none"--%>>
								<ul>
									<li style="display: none" id="idCheck1">[아이디] : 4 글자 이상
										입력하세요 ~~</li>
									<li style="display: none" id="idCheck2">[아이디] : 영문자 와 숫자
										로만 입력하세요 ~~</li>
									<li style="display: none" id="idCheck3">[아이디] : 이미 중복된 값이
										존재합니다.</li>
									<li style="display: none" id="pwCheck1">[비밀번호] : 4 글자 이상
										입력하세요 ~~</li>
									<li style="display: none" id="pwCheck2">[비밀번호] : 특수문자를 반드시
										1개 이상 입력하세요 ~~</li>
									<li style="display: none" id="pwCheck3">[비밀번호] : 숫자와 특수문자
										로만 입력하세요 ~~</li>
									<li style="display: none" id="nameCheck1">[이름] : 2 글자 이상
										입력하세요 ~~</li>
									<li style="display: none" id="nameCheck2">[이름] : 한글 또는
										영문으로만 입력하세요 ~~</li>
									<li style="display: none" id="nickCheck1">[닉네임] : 이미 중복된
										값이 존재합니다.</li>
									<li style="display: none" id="nickCheck2">[닉네임] : 한글 / 영문
										/ 숫자만 가능합니다.</li>
									<li style="display: none" id="emailCheck1">[이메일] : 이메일 형식이
										아닙니다.</li>
									<li style="display: none" id="emailCheck2">[이메일] : 이미 중복된
										값이 존재합니다.</li>
									<li style="display: none" id="authCheck1">[인증키] : 숫자 4개를
										입력하세요.</li>
									<li style="display: none" id="authCheck2">[인증키] : 인증번호가 맞지
										않습니다.</li>
									<li style="display: none" id="authkeysuccess">[인증키] :
										인증성공.</li>
									<li style="display: none" id="finalCheck">[입력오류] : 확인하지 않은
										항목이 있습니다. 확인 후 전송하세요.</li>

								</ul>
							</div>
							<div class="alert " role="alert" style="display: none"
								id="authkeybox">
								<input type="text" class="form-control input-sm" name="authkey"
									placeholder="인증번호 4자리" id="inputauthkey" maxlength="4">
								<div class="btn btn-primary btn-block" onclick="authkeycheck()">인증확인</div>
							</div>

							<div>

								<input type="text" name="userid" class="form-control input-sm"
									required="" placeholder="아이디" value="" id="username"
									onfocusout="idCheck()" /> <input type="password" name="userpw"
									class="form-control input-sm" placeholder="비밀번호" required=""
									value="" id="password" onfocusout="pwCheck()" /> <input
									type="text" name="email" class="form-control input-sm"
									placeholder="이메일" required="" value="" id="email" />
								<div>
									<div class="btn btn-primary btn-block" id="emailbox"
										onclick="mailauth()">이메일 인증</div>
								</div>
								<input type="text" name="username" class="form-control input-sm"
									placeholder="이름" required="" value="" id="fullName"
									onfocusout="nmCheck()" /> <input type="text" name="nickname"
									class="form-control input-sm" placeholder="닉네임" required=""
									value="" id="nickname" onfocusout="nickCheck()" />
								<div class="checkbox">
									<label> <input type="checkbox" name="allowed"
										value="true" checked="checked"> 이메일 수신 동의
									</label>
								</div>
							</div>

							<%--<div class="recaptcha-wrapper">

                            <script src="https://www.google.com/recaptcha/api.js?" async defer></script>
                            <div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
                            <noscript>
                                <div style="width: 302px; height: 352px;">
                                    <div style="width: 302px; height: 352px; position: relative;">
                                        <div style="width: 302px; height: 352px; position: absolute;">
                                            <iframe src="https://www.google.com/recaptcha/api/fallback?k=6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"
                                                    frameborder="0" scrolling="no"
                                                    style="width: 302px; height:352px; border-style: none;">
                                            </iframe>
                                        </div>
                                        <div style="width: 250px; height: 80px; position: absolute; border-style: none;
        bottom: 21px; left: 25px; margin: 0px; padding: 0px; right: 25px;">
        <textarea id="g-recaptcha-response" name="g-recaptcha-response"
                  class="g-recaptcha-response"
                  style="width: 250px; height: 80px; border: 1px solid #c1c1c1;
        margin: 0px; padding: 0px; resize: none;" value="">
        </textarea>
                                        </div>
                                    </div>
                                </div>
                            </noscript>

                        </div>--%>
						</form>
						<button class="btn btn-primary btn-block"
							onclick="return duplicationCheck()" id="join" disabled>아래
							약관을 동의하며 회원 가입</button>

						<div class="signup-block">
							<a href="/user/agreement" data-toggle="modal"
								data-target="#userAgreement">회원가입약관</a> <span
								class="inline-saperator">/</span> <a href="/user/privacy"
								data-toggle="modal" data-target="#userPrivacy">개인정보취급방침</a>
						</div>

					</div>
				</div>
				<div class="col-md-6 main-block-right">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-header">SNS로 가입하기</h5>
						</div>
						<!-- 네이버 로그인 창으로 이동 -->
						<div id="naver_id_login" style="text-align: center">
							<a href="${url}"><img width="223"
								src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
						</div>
					</div>
				</div>

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
								href="http://www.ebrain.kr" target="_blank">eBrain
								Management</a>
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

