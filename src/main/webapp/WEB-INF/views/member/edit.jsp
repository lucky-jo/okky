<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="user" property="principal"/>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko" class="no-js"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>OKKY - All That Developer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="//okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="//okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
    <link rel="apple-touch-icon" sizes="114x114"
          href="//okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta property="og:image" content="//okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">

    <link rel="stylesheet" href="//okky.kr/assets/application-4938a5785f86450f51f45a6a41f3bf4e.css"/>

    <!--[if lt IE 9]>
    <script src="//okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript"></script>
    <![endif]-->

    <meta name="layout" content="main">

    <link rel="stylesheet" href="//okky.kr/assets/style.css"/>
    <link rel="stylesheet" href="//okky.kr/assets/APW-style-4cc590ebaca176a1481738f6db45886f.css"/>

</head>
<body>
<div class="layout-container">
    <div class="main ">

        <div class="sidebar ">

            <a href="javascript://" class="sidebar-header">
                <i class="fa fa-bars sidebar-header-icon"></i>
            </a>

            <h1>
                <div class="logo"><a href="/"><img
                        src="//okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png" alt="OKKY" title="OKKY"/></a>
                </div>
            </h1>

            <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
                <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google"
                                                  data-toggle="popover" data-trigger="click"><i
                        class="fa fa-search"></i></a></li>
            </ul>

            <form id="search-google-form" name="searchMain" class="nav-sidebar-form"
                  action="https://www.google.com/search">
                <div class="input-group">
                    <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색"/>
                    <input type="hidden" name="q"/>
                    <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
                </div>
            </form>

            <%--로그인 시 출력 화면--%>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication var="user" property="principal"/>
                <div class="nav-user nav-sidebar">
                    <div class='avatar avatar-medium clearfix '><a href='/member/info?userid=${user.member.userid }' class='avatar-photo'><img
                            src='/resources/user/${user.member.image }'/></a>
                        <div class="avatar-info"><a class="nickname" href="/member/info?userid=${user.member.userid }" title="${user.member.nickname }">${user.member.nickname }</a>
                            <div class="activity block"><span class="fa fa-flash"></span> ${user.member.apoint }</div>
                        </div>
                    </div>
                    <div class="nav-user-action">
                        <div class="nav-user-func">
                            <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click"
                               tabindex="0">
                                <i id="user-func-icon" class="fa fa-cog"></i>
                            </a>
                        </div>
                        <div class="nav-user-func">
                            <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click"
                               tabindex="0">
                                <i id="user-notification-icon" class="fa fa-bell"></i>
                                <span id="user-notification-count" class="badge notification"
                                      style="display:none;">0</span>
                            </a>
                        </div>
                    </div>
                    <form action="/logout/index" method="post" style="display:none;"><input type="submit"
                                                                                            name="logoutButton"
                                                                                            value="logoutButton"
                                                                                            id="logoutButton"/></form>
                    <script id="setting-template" type="text/template">
                        <div class="popover popover-fixed" role="tooltip">
                            <div class="arrow"></div>
                            <h3 class="popover-title"></h3>
                            <div class="popover-footer clearfix" id="user-func-popover">
                                <a href="/member/customLogout" class="popover-btn"><i class="fa fa-sign-out"></i>
                                    로그아웃</a>
                                <a href="/member/edit?userid=${user.member.userid}" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                            </div>
                        </div>
                    </script>

                    <script id="notification-template" type="text/template">
                        <div class="popover popover-fixed" role="tooltip">
                            <div class="arrow"></div>
                            <h3 class="popover-title"></h3>
                            <div class="popover-content" id="notification-popover"></div>
                        </div>
                    </script>

                    <script id="search-google-template" type="text/template">
                        <div class="popover popover-fixed" role="tooltip">
                            <div class="arrow"></div>
                            <h3 class="popover-title">Google 검색</h3>
                            <div class="popover-content" id="search-google-popover">
                                <form id="search-google-form" name="searchMain" class="nav-sidebar-form"
                                      action="https://www.google.com/search"
                                      onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">
                                    <div class="input-group">
                                        <input type="text" name="qt" class="form-control input-sm"
                                               placeholder="Google 검색"/>
                                        <input type="hidden" name="q"/>
                                        <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="submit"><i
                                            class="fa fa-search"></i></button>
                                </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </script>
                </div>
            </sec:authorize>

            <ul class="nav nav-sidebar nav-main">

                <li><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

                <li><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

                <li><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

                <li><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

                <li><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

            </ul>

            <ul class="nav nav-sidebar nav-bottom">
                <li><a href="https://github.com/ildang100/okky" class="link" target="_blank"><i
                        class="fa fa-github"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Github</span></a>
                </li>
            </ul>
        </div>

        <div id="create-user" class="content clearfix" role="main">
            <h3 class="content-header">회원 정보 수정</h3>
            <div class="col-md-6 main-block-left">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class='avatar avatar-medium clearfix '><a href='/user/info/94647' class='avatar-photo'><img
                                src='//www.gravatar.com/avatar/9673f3346e67c0417b21e970fcc821cb?d=identicon&s=40'/></a>
                            <div class="avatar-info"><a class="nickname" href="/user/info/94647" title="일당백">일당백</a>
                                <div class="activity block"><span class="fa fa-flash"></span> 37</div>
                            </div>
                        </div>
                    </div>
                    <form action="/member/edit" method="post" class="form-signup form-user panel-body" id="loginForm"
                          autocomplete="off">

                        <fieldset>
                            <div class="form-group">
                                <label class="control-label">이메일 주소</label>
                                <input type="text" name="email" class="form-control input-sm" placeholder="이메일"
                                       required="" value="${user.member.email }"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">이름</label>
                                <input type="text" name="username" class="form-control input-sm" placeholder="이름"
                                       required="" value="${user.member.username }"/>
                            </div>
                            <div class="form-group">
                                <label class="control-label">닉네임</label>
                                <input type="text" name="nickname" class="form-control input-sm" placeholder="닉네임"
                                       required="" value="${user.member.nickname }"/>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="allowed" checked="checked" id="person.dmAllowed"/> 이메일
                                    수신 동의
                                    <input type="hidden" name="userid" value="${user.member.userid}"/>
                                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                                </label>
                            </div>
                        </fieldset>
                        <button class="btn btn-primary btn-block" type="submit">정보 수정</button>
                    </form>

                    <div class="panel panel-default">
                        <div class="panel-body panel-margin">
                            <a href="/member/passwordChange" class="btn btn-info btn-block">비밀번호 변경</a>

                            <a href="/user/withdrawConfirm" class="btn btn-default btn-block">회원 탈퇴</a>
                        </div>
                    </div>

                </div>

            </div>
            <!-- 미구현하기로 함 -->
            <div class="col-md-6 main-block-right">

                <%--<form action="/member/edit" method="post" >--%>


                </form>
                <!-- <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-header">SNS 연결</h5>
                    </div>
                    <div class="panel-body panel-margin sns-buttons">

                            <a href="/oauth/facebook/authenticate?redirectUrl=" provider="facebook" class="btn btn-facebook btn-block"><i class="fa fa-facebook fa-fw"></i> Facebook 연결하기</a>

                            <div id="facebook-connect-link" class="btn btn-disconnect btn-block"><i class="fa fa-chain-broken fa-fw"></i> Google 연결 끊기</div>

                    </div>
                </div> -->
                <!-- <div class="panel panel-default">
                    <div class="panel-body panel-margin">
                        <a href="/user/passwordChange" class="btn btn-info btn-block">비밀번호 변경</a>

                        <a href="/user/withdrawConfirm" class="btn btn-default btn-block">회원 탈퇴</a>
                    </div>
                </div> -->
            </div>

            <!-- <div class="col-md-12 APW-setting">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5 class="panel-header">AutoPassword™ 설정</h5>
                    </div>
                    <div class="panel-body panel-margin">
                        <div class="APW-setting-panel">
                            <p>비밀번호 관리가 힘들다면 <span class="APW-blue">AutoPassword™</span>를 사용하세요!</p>
                            <p>사용자 대신 스마트폰에서 일회용 비밀번호를 생성하고 입력해주는 <span class="APW-underline">비밀번호 대체 서비스</span>입니다.</p>
                        </div>
                        <button class="btn btn-primary" type="button" id="btnAdd">설정하기</button>
                    </div>
                </div>
            </div> -->

        </div>

        <div class="right-banner-wrapper">

        </div>
        <div id="footer" class="footer" role="contentinfo">
            <div class="row">
                <div class="col-sm-9">
                    <div style="float: left;margin-right: 10px;height:100px;">
                        <img src="//okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png"/>
                    </div>
                    <div>
                        <a href="/intro/about">About OKKY</a>
                        | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
                        | <a href="/intro/ad">광고문의</a>
                        | <a href="mailto:info@okky.kr">Contact</a>
                        | <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
                        | <a href="https://github.com/okjsp/okky" target="_blank">Github</a> v0.12
                        <hr style="margin: 8px 0;"/>
                        <strong>상호명</strong> : 이브레인 | <strong>대표명</strong> : 노상범 | <strong>사업자등록번호</strong> :
                        144-81-32887 | <strong>문의전화</strong> : 02-6925-5202
                        <br/> <strong>주소</strong> : 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103)
                        <br/> @ 2020 <a href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
                    </div>
                </div>
                <div class="sponsor-banner col-sm-3">
                    <div class="sponsor-banner-head">Sponsored by</div>
                    <div class="sponsor-banner-images">
                        <a href="http://www.inames.co.kr" target="_blank"><img
                                src="//okky.kr/assets/spb_inames-47b092113795fdf02b8d8b0f36f91c5f.png" alt="아이네임즈"/></a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<script>
    var contextPath = "", encodedURL = "%2Fuser%2Fedit";
</script>
<script src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js" type="text/javascript"></script>
<script src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript"></script>

<script src="//okky.kr/assets/apps/notification-6b08014e71e33528f46d161042f6e463.js" type="text/javascript"></script>

<script>

    $(function ($) {

        $("[id=btnAdd]").click(function (e) {
            location.href = "/autoPassword/joinStep";
        });
        $("[id=btnCancel]").click(function (e) {
            location.href = "/autoPassword/delUserAutopassword";
        });

    })

</script>

<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-6707625-5', 'auto');
    ga('send', 'pageview');

</script>

<div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

</body>
</html>
