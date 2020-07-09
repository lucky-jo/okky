<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="ko" class="no-js"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>OKKY - All That Developer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="//okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="//okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
    <link rel="apple-touch-icon" sizes="114x114" href="//okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <meta property="og:image" content="//okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">

    <link rel="stylesheet" href="//okky.kr/assets/application-4938a5785f86450f51f45a6a41f3bf4e.css"/>

    <!--[if lt IE 9]>
    <script src="//okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
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
<%--            메인 페이지 로고--%>
            <h1><div class="logo"><a href="/"><img src="//okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png" alt="OKKY" title="OKKY"/></a></div></h1>
<%--            구글 검색 아이콘--%>
            <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
                <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a></li>
            </ul>
<%--            구글 검색 form--%>
            <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search">
                <div class="input-group">
                    <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
                    <input type="hidden" name="q" />
                    <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
                </div>
            </form>

            <div class="nav-user nav-sidebar">

                <%--회원가입 로그인--%>
                   <sec:authorize access="isAuthenticated()">
                       <sec:authentication var="user" property="principal" />
                    
                    
                        <div class='avatar avatar-medium clearfix '><a href='/member/info?userid=${user.member.userid }' class='avatar-photo'><img src='/resources/user/${user.member.image}' width="30" height="30"/></a> <div class="avatar-info"><a class="nickname" href="/member/info?userid=${user.member.userid }"  title="${user.member.nickname}">${user.member.nickname}</a> <div class="activity block"><span class="fa fa-flash"></span> ${user.member.apoint}</div></div></div>

                        <div class="nav-user-action">
                            <div class="nav-user-func">
                                <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click" tabindex="0">
                                    <i id="user-func-icon" class="fa fa-cog"></i>
                                </a>
                            </div>
                            <div class="nav-user-func">
                                <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click" tabindex="0">
                                    <i id="user-notification-icon" class="fa fa-bell" ></i>
                                    <span id="user-notification-count" class="badge notification" style="display:none;">0</span>
                                </a>
                            </div>
                        </div>
                        <form action="/member/customLogout" method="post" style="display:none;" ><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton" /></form>

                        <script id="setting-template" type="text/template">
                            <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                                <h3 class="popover-title"></h3>
                                <div class="popover-footer clearfix" id="user-func-popover">
                                    <label href="/member/costomLogout" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                                    <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                                </div>
                            </div>
                        </script>
                        
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <ul class="nav nav-sidebar">
                            <li ><a href="/member/customLogin" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                            <li ><a href="/member/register" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
                        </ul>
                        </sec:authorize>

 <%--               <ul class="nav nav-sidebar">
                    <li ><a href="/member/customLogin" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                    <li ><a href="/member/register" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
                </ul>--%>

            </div>
            <%--왼쪽 사이드 바 메뉴--%>
            <ul class="nav nav-sidebar nav-main">

                <li  ><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

                <li  ><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

                <li  ><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

                <li  ><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

                <li  ><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

            </ul>

            <ul class="nav nav-sidebar nav-bottom">
                <li ><a href="https://github.com/ildang100/okky" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
            </ul>
        </div>
        <%--사이드 메뉴 종료--%>


        <div class="main-banner-wrapper">
            <div class="main-banner"><a href="/banner/stats/289" target="_H"><img src="//file.okky.kr/banner/1591950362102.jpg" /></a></div>
        </div>

        <div id="index" class="content scaffold-list clearfix" role="main">
            <div class="col-sm-6 main-block-left">
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-flag"></i> Editor's Choice</h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/676405">과기정통부, SW프리랜서 대상 표준계약서 제도 시행</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/21016' class='avatar-photo'><img src='//www.gravatar.com/avatar/f50ed624226bd860725f788e4dcdbb47?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/21016"  title="sbroh">sbroh</a> <div class="activity"><span class="fa fa-flash"></span> 9k</div><div class="date-created"><span class="timeago" title="2020-02-06 16:18:40.0">2020-02-06 16:18:40</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/674111">개발자라면 반드시 알아야하는 기본기</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/5322' class='avatar-photo'><img src='//www.gravatar.com/avatar/307d31079ac2364a12f843e2634b23ef?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/5322"  title="fender">fender</a> <div class="activity"><span class="fa fa-flash"></span> 17k</div><div class="date-created"><span class="timeago" title="2020-01-30 11:57:42.0">2020-01-30 11:57:42</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/573182">[SI업계 고발 기획기사] 사람 잡는 금융권 차세대 프로젝트</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/21016' class='avatar-photo'><img src='//www.gravatar.com/avatar/f50ed624226bd860725f788e4dcdbb47?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/21016"  title="sbroh">sbroh</a> <div class="activity"><span class="fa fa-flash"></span> 9k</div><div class="date-created"><span class="timeago" title="2019-04-25 08:38:16.0">2019-04-25 08:38:16</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/533991">《프리랜서 가이드라인 by OKKY》 출간 공지</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/45597' class='avatar-photo'><img src='//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/45597"  title="OKKY">OKKY</a> <div class="activity"><span class="fa fa-flash"></span> 1k</div><div class="date-created"><span class="timeago" title="2018-12-20 17:47:26.0">2018-12-20 17:47:26</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/452426">OKKY 스팸 단어로 인한 글 등록 불가 문제 관련 공지사항</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/45597' class='avatar-photo'><img src='//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/45597"  title="OKKY">OKKY</a> <div class="activity"><span class="fa fa-flash"></span> 1k</div><div class="date-created"><span class="timeago" title="2018-03-28 13:43:36.0">2018-03-28 13:43:36</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

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
                                                <a href="/column/detail?seq=${list.seq}">${list.title}</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/20715' class='avatar-photo'><img src='//www.gravatar.com/avatar/37dbe4c4ad6a9c0bdb2f8805bc8aa165?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/20715"  title="${list.id}">${list.id}</a> <div class="activity"><span class="fa fa-flash"></span> 265</div><div class="date-created"><span class="timeago" title="2020-06-22 14:21:19.0">2020-06-22 14:21:19</span> </div> </div></div>
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
                    <h4 class="main-header"><i class="fa fa-database"></i> Q&A <a href="/qna/list" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">

                            <c:forEach var="list" items="${qnalist}">
                                <c:if test="${list.exist == 1}">
                                    <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                        <div class="list-title-wrapper">
                                            <h5 class="list-group-item-heading list-group-item-evaluate">
                                                <a href="/qna/get?seq=${list.seq}">${list.title}</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/102818' class='avatar-photo'><img src='//www.gravatar.com/avatar/f04fdb3890d8f86eca6add0a549961cf?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/102818"  title="눙엉">${list.id}</a> <div class="activity"><span class="fa fa-flash"></span> 활동</div><div class="date-created"><span class="timeago" title="2020-06-28 13:42:52.0">${list.regdate}</span> </div> </div></div>
                                                </div>
                                            </h5>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${list.exist != 1}">
                                    <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                        <div class="list-title-wrapper">
                                            <h5 class="list-group-item-heading list-group-item-evaluate">
                                                삭제 된 게시글 입니다.
                                                <div class="list-group-item-author pull-right clearfix">
                                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/102818' class='avatar-photo'><img src='//www.gravatar.com/avatar/f04fdb3890d8f86eca6add0a549961cf?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/102818"  title="눙엉">${list.id}</a> <div class="activity"><span class="fa fa-flash"></span> 활동</div><div class="date-created"><span class="timeago" title="2020-06-28 13:42:52.0">${list.regdate}</span> </div> </div></div>
                                                </div>
                                            </h5>
                                        </div>
                                    </li>
                                </c:if>

                            </c:forEach>
                        </ul>
                    </div>

                </div>
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-comment"></i> 커뮤니티 <a href="/column/list" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">

                            <c:forEach var="list" items="${communitylist}">
                                <c:if test="${list.exist == 1}">
                                    <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                        <div class="list-title-wrapper">
                                            <h5 class="list-group-item-heading list-group-item-evaluate">
                                                <a href="/article/731815">${list.title}</a>
                                                <div class="list-group-item-author pull-right clearfix">
                                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/82503' class='avatar-photo'><img src='//graph.facebook.com/2217702278558119/picture?width=10&height=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/82503"  title="봄꾸">${list.id}</a> <div class="activity"><span class="fa fa-flash"></span> 활동</div><div class="date-created"><span class="timeago" title="2020-06-28 12:44:58.0">${list.regdate}</span> </div> </div></div>
                                                </div>
                                            </h5>
                                        </div>
                                    </li>
                                </c:if>
                                <c:if test="${list.exist != 1}">
                                    <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                        <div class="list-title-wrapper">
                                            <h5 class="list-group-item-heading list-group-item-evaluate">
                                                삭제 된 게시글 입니다.
                                                <div class="list-group-item-author pull-right clearfix">
                                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/82503' class='avatar-photo'><img src='//graph.facebook.com/2217702278558119/picture?width=10&height=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/82503"  title="봄꾸">${list.id}</a> <div class="activity"><span class="fa fa-flash"></span> 활동</div><div class="date-created"><span class="timeago" title="2020-06-28 12:44:58.0">${list.regdate}</span> </div> </div></div>
                                                </div>
                                            </h5>
                                        </div>
                                    </li>
                                </c:if>

                            </c:forEach>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-sm-4 main-block-right">

                <div class="main-block main-block-banner"><a href="/banner/stats/283" target="_amc"><img src="//file.okky.kr/banner/1590654347390.jpg" /></a></div>

                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-code"></i> Tech <a href="/articles/tech" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">
                        <div class="panel-body">

                            <div class="article-middle-block clearfix">
                                <div class="list-tag clearfix" style="">
                                    <a href="/articles/news" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> IT News & 정보</a>
                                    <a href="/articles/tagged/코더스하이" class="list-group-item-text item-tag label label-gray">코더스하이</a> <a href="/articles/tagged/링고스타" class="list-group-item-text item-tag label label-gray">링고스타</a> <a href="/articles/tagged/ios" class="list-group-item-text item-tag label label-gray">ios</a>
                                </div>
                                <h5><a href="/article/730890">역대 최고의 iOS 아카데미 정보입니다.</a></h5>
                                <div class="list-group-item-author clearfix">
                                    <div class='avatar avatar-x-small clearfix pull-right'><a href='/user/info/163' class='avatar-photo'><img src='//www.gravatar.com/avatar/8352af5ed3aebfe3c39b5ed670e2a9f8?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/163"  title="kenu">kenu</a> <div class="activity"><span class="fa fa-flash"></span> 49k</div><div class="date-created"><span class="timeago" title="2020-06-26 00:07:03.0">2020-06-26 00:07:03</span> </div> </div></div>
                                </div>
                            </div>

                            <div class="article-middle-block clearfix">
                                <div class="list-tag clearfix" style="">
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/okdevtv" class="list-group-item-text item-tag label label-gray">okdevtv</a> <a href="/articles/tagged/regexp" class="list-group-item-text item-tag label label-gray">regexp</a>
                                </div>
                                <h5><a href="/article/730886">망한 정규식 치환 다시 해보았습니다.</a></h5>
                                <div class="list-group-item-author clearfix">
                                    <div class='avatar avatar-x-small clearfix pull-right'><a href='/user/info/163' class='avatar-photo'><img src='//www.gravatar.com/avatar/8352af5ed3aebfe3c39b5ed670e2a9f8?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/163"  title="kenu">kenu</a> <div class="activity"><span class="fa fa-flash"></span> 49k</div><div class="date-created"><span class="timeago" title="2020-06-25 23:15:04.0">2020-06-25 23:15:04</span> </div> </div></div>
                                </div>
                            </div>

                            <div class="article-middle-block clearfix">
                                <div class="list-tag clearfix" style="">
                                    <a href="/articles/tips" class="list-group-item-text item-tag label label-info"><i class="fa fa-code"></i> Tips & 강좌</a>
                                    <a href="/articles/tagged/oracle" class="list-group-item-text item-tag label label-gray">oracle</a> <a href="/articles/tagged/sql" class="list-group-item-text item-tag label label-gray">sql</a>
                                </div>
                                <h5><a href="/article/730242">쿼리 튜닝(?) 이야기 2부</a></h5>
                                <div class="list-group-item-author clearfix">
                                    <div class='avatar avatar-x-small clearfix pull-right'><a href='/user/info/93375' class='avatar-photo'><img src='//www.gravatar.com/avatar/1d49d5c639c555ff05f974207c27c206?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/93375"  title="ljseokd">ljseokd</a> <div class="activity"><span class="fa fa-flash"></span> 316</div><div class="date-created"><span class="timeago" title="2020-06-25 01:08:44.0">2020-06-25 01:08:44</span> </div> </div></div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-quote-left"></i> 칼럼 <a href="/articles/columns" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="/articles/tagged/TDD" class="list-group-item-text item-tag label label-gray">TDD</a>
                            <h5><a href="/article/725426">유용한 테스트 케이스를 위한 개발자의 자세</a></h5>
                            <p class="main-block-desc">&nbsp;<a href="/article/725426"> Private 메서드는 테스트해야 할까요? 말아야 할가요?  꽤 오래된 논쟁이죠~  유용한 테스트 케이스에 대해 정리한 내용 공유합니다.     https://blog.shire...</a></p>
                        </div>
                    </div>

                </div>
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-book"></i> 학원/홍보 <a href="/articles/promote" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/730637">[추천공모전]자율협력주행 및 C-ITS 서비스 아이디어·사업모델 공모전(~7/31)</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/48320' class='avatar-photo'><img src='//www.gravatar.com/avatar/7964f8437ac3ed8328ddda0c2c8bb2e8?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/48320"  title="씽굿">씽굿</a> <div class="activity"><span class="fa fa-flash"></span> 1k</div><div class="date-created"><span class="timeago" title="2020-06-25 17:15:52.0">2020-06-25 17:15:52</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731147">[73기] 대한민국 개발자의 생존전략 인생 로드맵 part1. 7월 5일</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/26434' class='avatar-photo'><img src='//www.gravatar.com/avatar/88a63574d1150c8d5128308629039f64?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/26434"  title="hanq">hanq</a> <div class="activity"><span class="fa fa-flash"></span> 24k</div><div class="date-created"><span class="timeago" title="2020-06-26 14:25:14.0">2020-06-26 14:25:14</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731179">온라인으로 취득하는 취업에 유용한 국가자격증!! 사회복지사2급 &amp; 보육교사2급자격증 !!</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/91309' class='avatar-photo'><img src='//www.gravatar.com/avatar/d46f916c43c0557f0644e31602017c49?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/91309"  title="평생교육원2">평생교육원2</a> <div class="activity"><span class="fa fa-flash"></span> 510</div><div class="date-created"><span class="timeago" title="2020-06-26 15:02:06.0">2020-06-26 15:02:06</span> </div> </div></div>
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
                        <img src="//okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png" />
                    </div>
                    <div>
                        <a href="/intro/about">About OKKY</a>
                        | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
                        | <a href="/intro/ad">광고문의</a>
                        | <a href="mailto:info@okky.kr">Contact</a>
                        | <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
                        | <a href="https://github.com/okjsp/okky" target="_blank">Github</a>  v0.12
                        <hr style="margin: 8px 0;"/>
                        <strong>상호명</strong> : 이브레인 | <strong>대표명</strong> : 노상범 | <strong>사업자등록번호</strong> : 144-81-32887 | <strong>문의전화</strong> : 02-6925-5202
                        <br/> <strong>주소</strong> : 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103)
                        <br/> @ 2020 <a href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
                    </div>
                </div>
                <div class="sponsor-banner col-sm-3">
                    <div class="sponsor-banner-head">Sponsored by</div>
                    <div class="sponsor-banner-images">
                        <a href="http://www.inames.co.kr" target="_blank"><img src="//okky.kr/assets/spb_inames-47b092113795fdf02b8d8b0f36f91c5f.png" alt="아이네임즈"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    var contextPath = "", encodedURL = "%2F";
</script>
<script src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js" type="text/javascript" ></script>
<script src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript" ></script>

<script>
    $(function () {
        $('.timeago').timeago();
    });
</script>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-6707625-5', 'auto');
    ga('send', 'pageview');

</script>


<div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

</body>
</html>

