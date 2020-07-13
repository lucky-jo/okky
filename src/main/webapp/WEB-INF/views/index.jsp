<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <meta property="og:image" content="//okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
    <link rel="stylesheet" href="//okky.kr/assets/application-4938a5785f86450f51f45a6a41f3bf4e.css"/>
    <!--[if lt IE 9]>
    <script src="//okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript"></script>
    <![endif]-->
    <meta name="layout" content="main_with_banner"/>
    <meta name="google-site-verification" content="DkGncyJVqYFVekHithdbYnKgklkyKVwruPZ18WUDjr0"/>
</head>
<body>
<div class="layout-container">
    <div class="main index">
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
            <%--비로그인시 보여지는 화면--%>
            <sec:authorize access="isAnonymous()">
                <div class="nav-user nav-sidebar">

                    <ul class="nav nav-sidebar">
                        <li><a href="/member/customLogin" class="link"><i class="fa fa-sign-in"></i> <span
                                class="nav-sidebar-label">로그인</span></a></li>
                        <li><a href="/member/register" class="link"><i class="fa fa-user"></i> <span
                                class="nav-sidebar-label">회원가입</span></a></li>
                    </ul>

                </div>
            </sec:authorize>
            <ul class="nav nav-sidebar nav-main">

                <li><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

                <li><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

                <li><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

                <li><a href="/columnm/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

                <li><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span
                        class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

            </ul>

            <ul class="nav nav-sidebar nav-bottom">
                <li><a href="https://github.com/ildang100/okky" class="link" target="_blank"><i
                        class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github</span></a>
                </li>
            </ul>
        </div>

        <%--본문 시작--%>
        <div id="index" class="content scaffold-list clearfix" role="main">
            <div class="col-sm-6 main-block-left">
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-flag"></i> Editor's Choice</h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">
                            <c:forEach var="list" items="${best}">
                                <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                        <h5 class="list-group-item-heading list-group-item-evaluate">
                                            <a href="/article/735343">&#39;악덕 보도방&#39; 구분법.</a>
                                            <div class="list-group-item-author pull-right clearfix">
                                                <div class='avatar avatar-x-small clearfix '><a href='/user/info/21016'
                                                                                                class='avatar-photo'><img
                                                        src='//www.gravatar.com/avatar/f50ed624226bd860725f788e4dcdbb47?d=identicon&s=10'/></a>
                                                    <div class="avatar-info"><a class="nickname" href="/user/info/21016"
                                                                                title="sbroh">sbroh</a>
                                                        <div class="activity"><span class="fa fa-flash"></span> 9k</div>
                                                        <div class="date-created"><span class="timeago"
                                                                                        title="2020-07-04 21:26:59.0">2020-07-04 21:26:59</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </h5>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-sm-6 main-block-right">
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-star"></i> Weekly Best</h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">
                            <c:forEach var="list" items="${best}">
                                <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                        <h5 class="list-group-item-heading list-group-item-evaluate">
                                            <a href="/columnm/detail?seq=${list.seq}">${list.title}</a>
                                            <div class="list-group-item-author pull-right clearfix">
                                                <div class='avatar avatar-x-small clearfix '><a href='/user/info/21442'
                                                                                                class='avatar-photo'><img
                                                        src='//www.gravatar.com/avatar/ab4c2d1dead2e8b4383f40a0b6222b25?d=identicon&s=10'/></a>
                                                    <div class="avatar-info"><a class="nickname" href="/user/info/21442"
                                                                                title="${list.id}">${list.id}</a>
                                                        <div class="activity"><span class="fa fa-flash"></span> 457</div>
                                                        <div class="date-created"><span class="timeago"
                                                                                        title="2020-07-04 20:08:31.0">2020-07-04 20:08:31</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </h5>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="col-sm-8 main-block-left">
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-database"></i> Q&A <a href="/articles/questions"
                                                                                  class="main-more-btn pull-right"><i
                            class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">
                            <c:forEach var="list" items="${qnalist}">
                                <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                    <div class="list-title-wrapper">
                                        <h5 class="list-group-item-heading list-group-item-evaluate">
                                            <a href="/qna/get?seq=${list.seq}">${list.title}</a>
                                            <div class="list-group-item-author pull-right clearfix">
                                                <div class='avatar avatar-x-small clearfix '><a href='/user/info/49491'
                                                                                                class='avatar-photo'><img
                                                        src='//www.gravatar.com/avatar/06abbd8dc732da5bfd24567f2125a7d0?d=identicon&s=10'/></a>
                                                    <div class="avatar-info"><a class="nickname" href="/user/info/49491"
                                                                                title="${list.id}">${list.id}</a>
                                                        <div class="activity"><span class="fa fa-flash"></span> 1k</div>
                                                        <div class="date-created"><span class="timeago"
                                                                                        title="2020-07-09 17:08:35.0">2020-07-09 17:08:35</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </h5>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-comment"></i> 커뮤니티 <a href="/articles/community"
                                                                                  class="main-more-btn pull-right"><i
                            class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">
                            <c:forEach var="list" items="${communitylist}">
                                <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                    <div class="list-title-wrapper">
                                        <h5 class="list-group-item-heading list-group-item-evaluate">
                                            <a href="/comunity/get?seq=${list.seq}">${list.title}</a>
                                            <div class="list-group-item-author pull-right clearfix">
                                                <div class='avatar avatar-x-small clearfix '><a href='/user/info/80511'
                                                                                                class='avatar-photo'><img
                                                        src='//www.gravatar.com/avatar/0007d053068c17303825e04128234c3c?d=identicon&s=10'/></a>
                                                    <div class="avatar-info"><a class="nickname" href="/user/info/80511"
                                                                                title="${list.id}">${list.id}</a>
                                                        <div class="activity"><span class="fa fa-flash"></span> 338</div>
                                                        <div class="date-created"><span class="timeago"
                                                                                        title="2020-07-09 17:08:53.0">2020-07-09 17:08:53</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </h5>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-sm-4 main-block-right">

                <div class="main-block">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- okkyad_250x250 -->
                    <ins class="adsbygoogle"
                         style="display:inline-block;width:250px;height:250px"
                         data-ad-client="ca-pub-8103607814406874"
                         data-ad-slot="4095178752"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>

                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-code"></i> Tech <a href="/articles/tech"
                                                                               class="main-more-btn pull-right"><i
                            class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">
                        <div class="panel-body">

                            <div class="article-middle-block clearfix">
                                <div class="list-tag clearfix" style="">
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i
                                            class="fa fa-code"></i> IT News & 정보</a>

                                </div>
                                <h5><a href="/article/738029">지겨운 언어 순위...</a></h5>
                                <div class="list-group-item-author clearfix">
                                    <div class='avatar avatar-x-small clearfix pull-right'><a href='/user/info/4005'
                                                                                              class='avatar-photo'><img
                                            src='//www.gravatar.com/avatar/ccbae27311370eb08d0833cd074b8054?d=identicon&s=10'/></a>
                                        <div class="avatar-info"><a class="nickname" href="/user/info/4005"
                                                                    title="lloydkwon">lloydkwon</a>
                                            <div class="activity"><span class="fa fa-flash"></span> 2k</div>
                                            <div class="date-created"><span class="timeago"
                                                                            title="2020-07-09 15:50:17.0">2020-07-09 15:50:17</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="article-middle-block clearfix">
                                <div class="list-tag clearfix" style="">
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i
                                            class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/vuejs"
                                       class="list-group-item-text item-tag label label-gray">vuejs</a> <a
                                        href="/articles/tagged/expressjs"
                                        class="list-group-item-text item-tag label label-gray">expressjs</a>
                                </div>
                                <h5><a href="/article/737558">Vuejs, Expressjs 회원가입</a></h5>
                                <div class="list-group-item-author clearfix">
                                    <div class='avatar avatar-x-small clearfix pull-right'><a href='/user/info/96159'
                                                                                              class='avatar-photo'><img
                                            src='//www.gravatar.com/avatar/78b414eebf6acacff1c1cf33aa05a1c5?d=identicon&s=10'/></a>
                                        <div class="avatar-info"><a class="nickname" href="/user/info/96159"
                                                                    title="코지 코더">코지 코더</a>
                                            <div class="activity"><span class="fa fa-flash"></span> 193</div>
                                            <div class="date-created"><span class="timeago"
                                                                            title="2020-07-08 21:21:15.0">2020-07-08 21:21:15</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="article-middle-block clearfix">
                                <div class="list-tag clearfix" style="">
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i
                                            class="fa fa-code"></i> Tips & 강좌</a>

                                </div>
                                <h5><a href="/article/737542">복습하기좋은 공부방법 공유</a></h5>
                                <div class="list-group-item-author clearfix">
                                    <div class='avatar avatar-x-small clearfix pull-right'><a href='/user/info/73717'
                                                                                              class='avatar-photo'><img
                                            src='//www.gravatar.com/avatar/64fcbef7e8e40c2dbe3b3557605bf198?d=identicon&s=10'/></a>
                                        <div class="avatar-info"><a class="nickname" href="/user/info/73717"
                                                                    title="Frudy">Frudy</a>
                                            <div class="activity"><span class="fa fa-flash"></span> 4k</div>
                                            <div class="date-created"><span class="timeago"
                                                                            title="2020-07-08 20:14:13.0">2020-07-08 20:14:13</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/articles/columns"
                                                                                   class="main-more-btn pull-right"><i
                            class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="/articles/tagged/test"
                               class="list-group-item-text item-tag label label-gray">test</a>
                            <h5><a href="/article/737955">좋은 테스트란 무엇일까?_뮤테이션 테스트</a></h5>
                            <p class="main-block-desc">&nbsp;<a href="/article/737955"> 이번 학기에 배운 수업이 인상에 깊게 남아 그 일부를
                                정리해보았습니다. A) 좋은 테스팅의 조건과 coverage intro 테스트 성능을 측정할 때...</a></p>
                        </div>
                    </div>

                </div>
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-book"></i> 학원/홍보 <a href="/articles/promote"
                                                                                class="main-more-btn pull-right"><i
                            class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">


                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/737293">[리멤버 커리어] 코딩 잘 될 것만 같은 개발자 선물 이벤트</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103405'
                                                                                            class='avatar-photo'><img
                                                    src='//graph.facebook.com/3635196946495555/picture?width=10&height=10'/></a>
                                                <div class="avatar-info"><a class="nickname" href="/user/info/103405"
                                                                            title="본원이십네다">본원이십네다</a>
                                                    <div class="activity"><span class="fa fa-flash"></span> 40</div>
                                                    <div class="date-created"><span class="timeago"
                                                                                    title="2020-07-08 14:11:54.0">2020-07-08 14:11:54</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </h5>
                                </div>
                            </li>


                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/737739">[중앙정보처리학원] 머신러닝 기반 빅데이터 플랫폼 개발자 취업 연계교육</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/68557'
                                                                                            class='avatar-photo'><img
                                                    src='//graph.facebook.com/1718111788267124/picture?width=10&height=10'/></a>
                                                <div class="avatar-info"><a class="nickname" href="/user/info/68557"
                                                                            title="charles!">charles!</a>
                                                    <div class="activity"><span class="fa fa-flash"></span> 687</div>
                                                    <div class="date-created"><span class="timeago"
                                                                                    title="2020-07-09 10:20:48.0">2020-07-09 10:20:48</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </h5>
                                </div>
                            </li>


                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/737035">[KOCCA] 2020 콘텐츠임팩트 교육과정 교육생 모집</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/89941'
                                                                                            class='avatar-photo'><img
                                                    src='//www.gravatar.com/avatar/8a7fa0b7d16da949a0e774c31a04028b?d=identicon&s=10'/></a>
                                                <div class="avatar-info"><a class="nickname" href="/user/info/89941"
                                                                            title="dbwjd9632">dbwjd9632</a>
                                                    <div class="activity"><span class="fa fa-flash"></span> 30</div>
                                                    <div class="date-created"><span class="timeago"
                                                                                    title="2020-07-08 09:05:49.0">2020-07-08 09:05:49</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
        </div>


        <div class="right-banner-wrapper">


            <div class="google-ad">
                <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                <!-- okjspad_160x500 -->
                <ins class="adsbygoogle"
                     style="display:inline-block;width:160px;height:500px"
                     data-ad-client="ca-pub-8103607814406874"
                     data-ad-slot="6573675943"></ins>
                <script>
                    (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
            </div>

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
                        | <a href="https://github.com/ildang100/okky" target="_blank">Github</a> v0.12
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
    var contextPath = "", encodedURL = "%2F";
</script>
<script src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js" type="text/javascript"></script>
<script src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript"></script>

<script src="//okky.kr/assets/apps/notification-6b08014e71e33528f46d161042f6e463.js" type="text/javascript"></script>


<script>
    $(function () {
        $('.timeago').timeago();
    });
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
