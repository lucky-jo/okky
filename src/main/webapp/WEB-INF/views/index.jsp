<%--
  Created by IntelliJ IDEA.
  User: last2
  Date: 2020-06-28
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
                <ul class="nav nav-sidebar">
                    <li ><a href="/login/auth?redirectUrl=%2F" class="link"><i class="fa fa-sign-in"></i> <span class="nav-sidebar-label">로그인</span></a></li>
                    <li ><a href="/user/register" class="link"><i class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
                </ul>

            </div>
            <%--왼쪽 사이드 바 메뉴--%>
            <ul class="nav nav-sidebar nav-main">

                <li  ><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

                <li  ><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

                <li  ><a href="/community/clist" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

                <li  ><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

                <li  ><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

            </ul>

            <ul class="nav nav-sidebar nav-bottom">
                <li ><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
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








                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/728624">정말 너무나 기적같은 일이 일어났습니다 너무 행복하네요</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/20715' class='avatar-photo'><img src='//www.gravatar.com/avatar/37dbe4c4ad6a9c0bdb2f8805bc8aa165?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/20715"  title="gagave">gagave</a> <div class="activity"><span class="fa fa-flash"></span> 265</div><div class="date-created"><span class="timeago" title="2020-06-22 14:21:19.0">2020-06-22 14:21:19</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/728980">상습적으로 임금체불하는 IT 보안업체 국민청원 부탁드립니다.</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/28588' class='avatar-photo'><img src='//www.gravatar.com/avatar/dbb9900b5af1827dc3a0ce5cf6c8d9ae?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/28588"  title="HeuJung">HeuJung</a> <div class="activity"><span class="fa fa-flash"></span> 205</div><div class="date-created"><span class="timeago" title="2020-06-23 01:02:07.0">2020-06-23 01:02:07</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/728505">신기록 달성</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/91431' class='avatar-photo'><img src='//www.gravatar.com/avatar/4ec9d02a5c35137f2deb82352edcbbf7?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/91431"  title="디자인패시브">디자인패시브</a> <div class="activity"><span class="fa fa-flash"></span> 1k</div><div class="date-created"><span class="timeago" title="2020-06-22 11:14:01.0">2020-06-22 11:14:01</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/729204">ㄹ*ㄹ 이런업체는 처음보네요. 황당합니다.</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/37515' class='avatar-photo'><img src='//www.gravatar.com/avatar/7dc040cbc3d1a7f353b3c6df8577b8c7?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/37515"  title="우중캠퍼">우중캠퍼</a> <div class="activity"><span class="fa fa-flash"></span> 105</div><div class="date-created"><span class="timeago" title="2020-06-23 14:13:15.0">2020-06-23 14:13:15</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/728515">제대로된 첫사랑이 끝났네요</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/94883' class='avatar-photo'><img src='//www.gravatar.com/avatar/991890eba4728e5a5e0e100200d4e8c1?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/94883"  title="zkzkzhzj">zkzkzhzj</a> <div class="activity"><span class="fa fa-flash"></span> 121</div><div class="date-created"><span class="timeago" title="2020-06-22 11:23:11.0">2020-06-22 11:23:11</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>

            <div class="col-sm-8 main-block-left">
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-database"></i> Q&A <a href="/articles/questions" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">






                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731820">안드로이드 layout 질문입니다.</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/102818' class='avatar-photo'><img src='//www.gravatar.com/avatar/f04fdb3890d8f86eca6add0a549961cf?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/102818"  title="눙엉">눙엉</a> <div class="activity"><span class="fa fa-flash"></span> 20</div><div class="date-created"><span class="timeago" title="2020-06-28 13:42:52.0">2020-06-28 13:42:52</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731819">자바스크립트 오류</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/92413' class='avatar-photo'><img src='//www.gravatar.com/avatar/26bb83c5a0fc04261f0a0e6a63839f97?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/92413"  title="민들레홀씨">민들레홀씨</a> <div class="activity"><span class="fa fa-flash"></span> 150</div><div class="date-created"><span class="timeago" title="2020-06-28 13:14:06.0">2020-06-28 13:14:06</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731818">파일 복사가 안돼요 ㅜㅜ</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103541' class='avatar-photo'><img src='//www.gravatar.com/avatar/867f6400ed5388516665fce5c31cfbb3?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103541"  title="문성">문성</a> <div class="activity"><span class="fa fa-flash"></span> 10</div><div class="date-created"><span class="timeago" title="2020-06-28 13:03:04.0">2020-06-28 13:03:04</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731817">[C# Winform] ShowDialog() 로 모달폼을 생성 후 그냥 닫기버튼으로 닫으면 UI 컨트롤 리소스 해제가 일부분이 되나요 ?</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/94023' class='avatar-photo'><img src='//www.gravatar.com/avatar/13395716b7a9e4e9dfde2bf66ba81aab?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/94023"  title="JoRaengE">JoRaengE</a> <div class="activity"><span class="fa fa-flash"></span> 154</div><div class="date-created"><span class="timeago" title="2020-06-28 12:57:40.0">2020-06-28 12:57:40</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731814">테이블 가로 스크롤 상단에 고정할수 없나요??</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/54674' class='avatar-photo'><img src='//www.gravatar.com/avatar/f258ffd3fa38335d9812d1ca58ddc9ad?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/54674"  title="안녕안녕안녕!">안녕안녕안녕!</a> <div class="activity"><span class="fa fa-flash"></span> 845</div><div class="date-created"><span class="timeago" title="2020-06-28 12:07:29.0">2020-06-28 12:07:29</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731813">형태소분석기 특정 품사만</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/92372' class='avatar-photo'><img src='//www.gravatar.com/avatar/22c38f464954beee539f44f4fbb50b5b?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/92372"  title="에러뜨지마라ㅠ">에러뜨지마라ㅠ</a> <div class="activity"><span class="fa fa-flash"></span> 406</div><div class="date-created"><span class="timeago" title="2020-06-28 11:39:19.0">2020-06-28 11:39:19</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731803">형태소 분석기 너무 오래걸려요 ㅠㅠ</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/92372' class='avatar-photo'><img src='//www.gravatar.com/avatar/22c38f464954beee539f44f4fbb50b5b?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/92372"  title="에러뜨지마라ㅠ">에러뜨지마라ㅠ</a> <div class="activity"><span class="fa fa-flash"></span> 406</div><div class="date-created"><span class="timeago" title="2020-06-28 10:32:41.0">2020-06-28 10:32:41</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731799">스프링으로 만든 홈페이지를 다른사람도 볼수있게 배포해보려고합니다</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/101958' class='avatar-photo'><img src='//www.gravatar.com/avatar/7f3f34ad4d1d053b884e9467553b7b5b?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/101958"  title="로라스">로라스</a> <div class="activity"><span class="fa fa-flash"></span> 40</div><div class="date-created"><span class="timeago" title="2020-06-28 05:14:34.0">2020-06-28 05:14:34</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-success clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731797">springboot, jpa / mysql 연동이 잘안되는것같습니다..(에러로그 및 전체코드o)</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103537' class='avatar-photo'><img src='//www.gravatar.com/avatar/518df01837632a41805cbc4c69dea236?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103537"  title="독한나물">독한나물</a> <div class="activity"><span class="fa fa-flash"></span> 10</div><div class="date-created"><span class="timeago" title="2020-06-28 03:02:48.0">2020-06-28 03:02:48</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731789">react 셋팅 질문있습니다...</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/36687' class='avatar-photo'><img src='//www.gravatar.com/avatar/89f8032d8095a35a3aed5da28437bf60?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/36687"  title="kolol">kolol</a> <div class="activity"><span class="fa fa-flash"></span> 1k</div><div class="date-created"><span class="timeago" title="2020-06-28 01:29:43.0">2020-06-28 01:29:43</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

                        </ul>
                    </div>

                </div>
                <div class="main-block">
                    <h4 class="main-header"><i class="fa fa-comment"></i> 커뮤니티 <a href="/articles/community" class="main-more-btn pull-right"><i class="fa fa-ellipsis-h"></i></a></h4>

                    <div class="panel panel-default">

                        <!-- Table -->

                        <ul class="list-group">








                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731815">개발자 면접을 비개발자 1명이서 보는 경우?</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/82503' class='avatar-photo'><img src='//graph.facebook.com/2217702278558119/picture?width=10&height=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/82503"  title="봄꾸">봄꾸</a> <div class="activity"><span class="fa fa-flash"></span> 849</div><div class="date-created"><span class="timeago" title="2020-06-28 12:44:58.0">2020-06-28 12:44:58</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731812">저의 전공 중 하나인 회계에 대한 이야기.(여긴 오킨데...)</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/36066' class='avatar-photo'><img src='//www.gravatar.com/avatar/4c403b2c49cbd4c7b62cc5b375d7cdb4?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/36066"  title="우루부루구루">우루부루구루</a> <div class="activity"><span class="fa fa-flash"></span> 983</div><div class="date-created"><span class="timeago" title="2020-06-28 11:24:14.0">2020-06-28 11:24:14</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731811">대학에 대해 이야기를 들을 때마다 드는 생각.</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/36066' class='avatar-photo'><img src='//www.gravatar.com/avatar/4c403b2c49cbd4c7b62cc5b375d7cdb4?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/36066"  title="우루부루구루">우루부루구루</a> <div class="activity"><span class="fa fa-flash"></span> 983</div><div class="date-created"><span class="timeago" title="2020-06-28 11:17:20.0">2020-06-28 11:17:20</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731809">구글링의 비법은 잘 모르겠어요</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/73717' class='avatar-photo'><img src='//www.gravatar.com/avatar/64fcbef7e8e40c2dbe3b3557605bf198?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/73717"  title="Frudy">Frudy</a> <div class="activity"><span class="fa fa-flash"></span> 4k</div><div class="date-created"><span class="timeago" title="2020-06-28 11:07:34.0">2020-06-28 11:07:34</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731801">웹 개발용 맥북 사양 추천 부탁드립니다</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103539' class='avatar-photo'><img src='//www.gravatar.com/avatar/22555e24f590cbd5015a790480e29db8?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103539"  title="jamjari">jamjari</a> <div class="activity"><span class="fa fa-flash"></span> 15</div><div class="date-created"><span class="timeago" title="2020-06-28 08:17:02.0">2020-06-28 08:17:02</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731800">대화를 잘하는 법.나쁜 습관</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/77889' class='avatar-photo'><img src='//www.gravatar.com/avatar/68392ecbb57bd6be3a6a7c1960c1c615?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/77889"  title="ISA">ISA</a> <div class="activity"><span class="fa fa-flash"></span> 1k</div><div class="date-created"><span class="timeago" title="2020-06-28 06:43:12.0">2020-06-28 06:43:12</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731798">관리자 제외, 코드몽키로써 일 할 수 있는 직군 추천 해주세요</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103522' class='avatar-photo'><img src='//www.gravatar.com/avatar/bc386de159f64f5fd3f34fd39801fd65?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103522"  title="ondeu">ondeu</a> <div class="activity"><span class="fa fa-flash"></span> 3</div><div class="date-created"><span class="timeago" title="2020-06-28 04:53:43.0">2020-06-28 04:53:43</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731796">방통대 포기..</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/100629' class='avatar-photo'><img src='//www.gravatar.com/avatar/e569f170ffd1283e87f923da4d285f7c?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/100629"  title="개발자만다린">개발자만다린</a> <div class="activity"><span class="fa fa-flash"></span> -63</div><div class="date-created"><span class="timeago" title="2020-06-28 02:52:27.0">2020-06-28 02:52:27</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731795">리눅스를 설치하려는데 궁금한점이 있습니다.</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/11062' class='avatar-photo'><img src='//www.gravatar.com/avatar/e3f272befb117fd2ff50f8588a38d2e3?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/11062"  title="kryptonite">kryptonite</a> <div class="activity"><span class="fa fa-flash"></span> 584</div><div class="date-created"><span class="timeago" title="2020-06-28 02:25:27.0">2020-06-28 02:25:27</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731791">나중에  경력직으로 이직할떄 학점 많이 보나요?ㅜㅜ</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/100826' class='avatar-photo'><img src='//www.gravatar.com/avatar/4a76d6f600aaaf09931585ff5909f5f6?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/100826"  title="살남">살남</a> <div class="activity"><span class="fa fa-flash"></span> 103</div><div class="date-created"><span class="timeago" title="2020-06-28 01:44:58.0">2020-06-28 01:44:58</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731788">[송파] 데이터사이언스,AI,머신러닝,딥러닝관련 스터디 구합니다.!</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/79459' class='avatar-photo'><img src='//www.gravatar.com/avatar/adb170d4bbd11eee5d79e2b0b676497e?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/79459"  title="유희왕">유희왕</a> <div class="activity"><span class="fa fa-flash"></span> 15</div><div class="date-created"><span class="timeago" title="2020-06-28 01:20:54.0">2020-06-28 01:20:54</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>




                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731786">어떠한 웹을 만들때</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103534' class='avatar-photo'><img src='//www.gravatar.com/avatar/ecd3ee987496469d3f3560fabb9ebeeb?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103534"  title="jinhyeong">jinhyeong</a> <div class="activity"><span class="fa fa-flash"></span> 12</div><div class="date-created"><span class="timeago" title="2020-06-28 00:38:42.0">2020-06-28 00:38:42</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731782">펑..</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/100629' class='avatar-photo'><img src='//www.gravatar.com/avatar/e569f170ffd1283e87f923da4d285f7c?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/100629"  title="개발자만다린">개발자만다린</a> <div class="activity"><span class="fa fa-flash"></span> -63</div><div class="date-created"><span class="timeago" title="2020-06-28 00:12:37.0">2020-06-28 00:12:37</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731777">안녕하세요 대학교 4학년 학생입니다. 국비지원에 대해 여쭤보려고 합니다!</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/103531' class='avatar-photo'><img src='//www.gravatar.com/avatar/c1407daaa58128557e3fd1263d7bd8f6?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103531"  title="매콤주먹">매콤주먹</a> <div class="activity"><span class="fa fa-flash"></span> 10</div><div class="date-created"><span class="timeago" title="2020-06-27 23:58:35.0">2020-06-27 23:58:35</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731757">제 스펙으로 일본 게임 회사 취직할 수 있을까요?</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><span class='avatar-photo'><img src='//www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&s=10'/></span> <div class="avatar-info"><span class="nickname" title="유우타">유우타</span> <div class="activity"><span class="fa fa-lock"></span> </div><div class="date-created"><span class="timeago" title="2020-06-27 23:13:32.0">2020-06-27 23:13:32</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731743">안드올인  vs 딴거좀 하기</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/90244' class='avatar-photo'><img src='//www.gravatar.com/avatar/3da3db2656daf0e885b99e8a8cba596c?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/90244"  title="lIlIlIlIlI123">lIlIlIlIlI123</a> <div class="activity"><span class="fa fa-flash"></span> 235</div><div class="date-created"><span class="timeago" title="2020-06-27 22:52:27.0">2020-06-27 22:52:27</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731707">일반적으로 crud 만드는거랑 서버개발자랑은 다른 건가요?</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/92293' class='avatar-photo'><img src='//www.gravatar.com/avatar/12d44a58b5ce35ff7565ccdafff01550?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/92293"  title="unknown33572">unknown33572</a> <div class="activity"><span class="fa fa-flash"></span> 40</div><div class="date-created"><span class="timeago" title="2020-06-27 22:19:24.0">2020-06-27 22:19:24</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731698">컴퓨터공학의 기초</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/95796' class='avatar-photo'><img src='//www.gravatar.com/avatar/fbc24312e6ad7d69f73d4c4ade0994b1?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/95796"  title="DSSC0118">DSSC0118</a> <div class="activity"><span class="fa fa-flash"></span> 30</div><div class="date-created"><span class="timeago" title="2020-06-27 21:49:44.0">2020-06-27 21:49:44</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>







                            <li class="list-group-item list-group-item-small list-group-item-question list-group-has-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731695">에타 학과게시판 프론트엔드 글인데 공감하시나요</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/102819' class='avatar-photo'><img src='//www.gravatar.com/avatar/83d0548f398c61adf8f2089771e7d626?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/102819"  title="Pure">Pure</a> <div class="activity"><span class="fa fa-flash"></span> 20</div><div class="date-created"><span class="timeago" title="2020-06-27 21:38:44.0">2020-06-27 21:38:44</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>





                            <li class="list-group-item list-group-item-small list-group-item-question list-group-no-note clearfix">
                                <div class="list-title-wrapper">
                                    <h5 class="list-group-item-heading list-group-item-evaluate">
                                        <a href="/article/731684">지방 프로제긑를 가게 됐는데, 재직증명서 관련하여 질문드립니다.</a>
                                        <div class="list-group-item-author pull-right clearfix">
                                            <div class='avatar avatar-x-small clearfix '><a href='/user/info/42270' class='avatar-photo'><img src='//www.gravatar.com/avatar/74acd60f2949fb9bb665b6abb71134a6?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/42270"  title="씨저">씨저</a> <div class="activity"><span class="fa fa-flash"></span> 70</div><div class="date-created"><span class="timeago" title="2020-06-27 20:07:02.0">2020-06-27 20:07:02</span> </div> </div></div>
                                        </div>
                                    </h5>
                                </div>
                            </li>

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

