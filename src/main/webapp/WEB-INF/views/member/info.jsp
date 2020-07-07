<%--
  Created by IntelliJ IDEA.
  User: last2
  Date: 2020-07-07
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
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
    <title>OKKY - 회원정보 보기</title>
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

    <meta name="layout" content="main_with_banner">

</head>
<body>
<div class="layout-container">
    <div class="main ">

        <div class="sidebar ">

            <a href="javascript://" class="sidebar-header">
                <i class="fa fa-bars sidebar-header-icon"></i>
            </a>

            <h1><div class="logo"><a href="/"><img src="//okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png" alt="OKKY" title="OKKY"/></a></div></h1>

            <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
                <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a></li>
            </ul>

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

                <div class='avatar avatar-medium clearfix '><a href='/user/info/94647' class='avatar-photo'><img src='//www.gravatar.com/avatar/9673f3346e67c0417b21e970fcc821cb?d=identicon&s=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/94647"  title="일당백">일당백</a> <div class="activity block"><span class="fa fa-flash"></span> 37</div></div></div>

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
                <form action="/logout/index" method="post" style="display:none;" ><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton" /></form>

                <script id="setting-template" type="text/template">
                    <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                        <h3 class="popover-title"></h3>
                        <div class="popover-footer clearfix" id="user-func-popover">
                            <label href="" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                            <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                        </div>
                    </div>
                </script>

                <script id="notification-template" type="text/template">
                    <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                        <h3 class="popover-title"></h3>
                        <div class="popover-content" id="notification-popover"></div>
                    </div>
                </script>

                <script id="search-google-template" type="text/template">
                    <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                        <h3 class="popover-title">Google 검색</h3>
                        <div class="popover-content" id="search-google-popover">
                            <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="https://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">
                                <div class="input-group">
                                    <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
                                    <input type="hidden" name="q" />
                                    <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </script>



            </div>

            <ul class="nav nav-sidebar nav-main">

                <li  ><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

                <li  ><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

                <li  ><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

                <li  ><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

                <li  ><a href="/articles/jobs" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

            </ul>

            <ul class="nav nav-sidebar nav-bottom">
                <li ><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
            </ul>
        </div>


        <div id="user" class="content clearfix" role="main">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class='avatar avatar-big clearfix col-sm-3 text-center'><a href='/user/info/94647' class='avatar-photo'><img src='//www.gravatar.com/avatar/9673f3346e67c0417b21e970fcc821cb?d=identicon&s=150'/></a> </div>
                    <div class="user-info col-sm-9">
                        <div class="clearfix">
                            <h2 class="pull-left">일당백</h2>
                            <button class="btn btn-success pull-right btn-wide disabled"><i class="fa fa-plus"></i> 팔로우</button>
                        </div>
                        <div class="user-points">
                            <div class="user-point">
                                <div class="user-point-label"><i class="fa fa-flash"></i> 활동점수</div>
                                <div class="user-point-num"><a href="/user/info/94647/activity">37</a></div>
                            </div>
                            <div class="user-point">
                                <div class="user-point-label"><i class="fa fa-user"></i> 팔로잉</div>
                                <div class="user-point-num"><a href="#">0</a></div>
                            </div>
                            <div class="user-point">
                                <div class="user-point-label"><i class="fa fa-users"></i> 팔로워</div>
                                <div class="user-point-num"><a href="#">0</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2 user-info-nav pull-right">
                <ul class="nav">
                    <li class="active"><a href="/user/info/94647/activity">최근 활동</a> </li>
                    <li class=""><a href="/user/info/94647/articles">게시물 </a></li>

                    <li class=""><a href="/user/info/94647/scrapped">스크랩 </a></li>
                </ul>
            </div>
            <div class="col-sm-10 main-block-left pull-left">
                <ul class="list-group">











                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #732332
                                        질문의 <a href="/user/info/10621" class="nickname">pardon</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-07-05 14:56:18.0">2020-07-05 14:56:18.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/732332?note=2015810">프리하시는 분들.. 제발...</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/22487' class='avatar-photo'><img src='//www.gravatar.com/avatar/6e61e0bff69a035c0dbd4795e504a749?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22487"  title="jjsun9">jjsun9</a> <div class="activity "><span class="fa fa-flash"></span> 2k</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #732332
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-07-02 22:39:29.0">2020-07-02 22:39:29.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/732332?note=2014246">프리하시는 분들.. 제발...</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/22487' class='avatar-photo'><img src='//www.gravatar.com/avatar/6e61e0bff69a035c0dbd4795e504a749?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/22487"  title="jjsun9">jjsun9</a> <div class="activity "><span class="fa fa-flash"></span> 2k</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #734025
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-07-02 16:06:22.0">2020-07-02 16:06:22.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/734025?note=2013812">팀장과의 가치관 차이 어떻게 할가요..</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/77218' class='avatar-photo'><img src='//www.gravatar.com/avatar/d8bb3e40bda6895a753049fb0698cc5f?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/77218"  title="아캔두">아캔두</a> <div class="activity "><span class="fa fa-flash"></span> 115</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #734025
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-07-02 14:02:25.0">2020-07-02 14:02:25.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/734025?note=2013617">팀장과의 가치관 차이 어떻게 할가요..</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/77218' class='avatar-photo'><img src='//www.gravatar.com/avatar/d8bb3e40bda6895a753049fb0698cc5f?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/77218"  title="아캔두">아캔두</a> <div class="activity "><span class="fa fa-flash"></span> 115</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #734025
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-07-02 14:01:13.0">2020-07-02 14:01:13.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/734025?note=2013614">팀장과의 가치관 차이 어떻게 할가요..</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/77218' class='avatar-photo'><img src='//www.gravatar.com/avatar/d8bb3e40bda6895a753049fb0698cc5f?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/77218"  title="아캔두">아캔두</a> <div class="activity "><span class="fa fa-flash"></span> 115</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #733850
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-07-02 00:48:12.0">2020-07-02 00:48:12.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/733850?note=2013093">글 번호 조정 가능한 게시판을 만들수 있나요??? (사진 첨부)</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/99611' class='avatar-photo'><img src='//www.gravatar.com/avatar/6bbad583c4291892574ed05ff0f64e78?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/99611"  title="만원의행복">만원의행복</a> <div class="activity "><span class="fa fa-flash"></span> 6</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-success clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #701822
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-04-14 17:02:56.0">2020-04-14 17:02:56.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/701822?note=1949845">홈페이지 및 포트폴리오 만들려고 합니다 도움좀 부탁드립니다</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/88971' class='avatar-photo'><img src='//www.gravatar.com/avatar/3b23b821fdbded3094840dd454a9a847?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/88971"  title="kaser">kaser</a> <div class="activity "><span class="fa fa-flash"></span> 82</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-success clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #701832
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-04-14 16:57:22.0">2020-04-14 16:57:22.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/701832?note=1949838">자바를 어떻게 공부해야 하는지 모르겠습니다.</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/99535' class='avatar-photo'><img src='//www.gravatar.com/avatar/ca168a7f249c416f1f9f6297be50b033?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/99535"  title="JustZ">JustZ</a> <div class="activity "><span class="fa fa-flash"></span> 107</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-success clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #701832
                                        질문의 <a href="/user/info/38918" class="nickname">한경닷컴교육센터</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-04-14 16:56:38.0">2020-04-14 16:56:38.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/701832?note=1949784">자바를 어떻게 공부해야 하는지 모르겠습니다.</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/99535' class='avatar-photo'><img src='//www.gravatar.com/avatar/ca168a7f249c416f1f9f6297be50b033?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/99535"  title="JustZ">JustZ</a> <div class="activity "><span class="fa fa-flash"></span> 107</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #701088
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-04-12 23:53:29.0">2020-04-12 23:53:29.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/701088?note=1948390">관계형 db에서 er다이어그램 문제 질문이요!</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/97827' class='avatar-photo'><img src='//www.gravatar.com/avatar/e6eb7caca1d6dd488cf4904745bbc98f?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/97827"  title="흥이나네">흥이나네</a> <div class="activity "><span class="fa fa-flash"></span> 60</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-success clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #701121
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-04-12 23:48:18.0">2020-04-12 23:48:18.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/701121?note=1948388">문제풀이중 반복함수에서 못풀었습니다 ㅠㅠ 도움좀주시면 감사하겠습니다 !!</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/98757' class='avatar-photo'><img src='//www.gravatar.com/avatar/9a777ffbd39e0c0e00ae22e6cac3f09d?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/98757"  title="white25">white25</a> <div class="activity "><span class="fa fa-flash"></span> 50</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #697733
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-04-03 22:18:48.0">2020-04-03 22:18:48.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/697733?note=1942764">aws같은서버배포나 도커관련하여 개인과외해주실멘토찾습니다</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/98915' class='avatar-photo'><img src='//www.gravatar.com/avatar/de9db0b567f52f037483859ce320e754?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/98915"  title="언제나뉴비">언제나뉴비</a> <div class="activity "><span class="fa fa-flash"></span> 32</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #697733
                                        질문의 <a href="/user/info/98946" class="nickname">piljoong</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-04-03 22:17:31.0">2020-04-03 22:17:31.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/697733?note=1941748">aws같은서버배포나 도커관련하여 개인과외해주실멘토찾습니다</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/98915' class='avatar-photo'><img src='//www.gravatar.com/avatar/de9db0b567f52f037483859ce320e754?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/98915"  title="언제나뉴비">언제나뉴비</a> <div class="activity "><span class="fa fa-flash"></span> 32</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #697469
                                        질문의 <a href="/user/info/78543" class="nickname">난나나난</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-04-03 22:14:37.0">2020-04-03 22:14:37.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/697469?note=1941177">31살 웹개발자 신입으로 취직 얼마나 어렵습니까?</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/98904' class='avatar-photo'><img src='//www.gravatar.com/avatar/9eff1f0e0214f305c6e6fe2279d6fb28?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/98904"  title="back8239">back8239</a> <div class="activity "><span class="fa fa-flash"></span> 21</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #697469
                                        질문의 <a href="/user/info/96196" class="nickname">아휴</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-04-03 22:14:35.0">2020-04-03 22:14:35.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/697469?note=1941163">31살 웹개발자 신입으로 취직 얼마나 어렵습니까?</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/98904' class='avatar-photo'><img src='//www.gravatar.com/avatar/9eff1f0e0214f305c6e6fe2279d6fb28?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/98904"  title="back8239">back8239</a> <div class="activity "><span class="fa fa-flash"></span> 21</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #691060
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-03-22 20:13:54.0">2020-03-22 20:13:54.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/691060?note=1933431">[모집마감] 4인 웹 프로젝트 백엔드 취업준비생 모집합니다!</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/98060' class='avatar-photo'><img src='//www.gravatar.com/avatar/0ac50cd37495670270398c3587948418?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/98060"  title="플래시보">플래시보</a> <div class="activity "><span class="fa fa-flash"></span> 32</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">

                            <i class="fa fa-comment-o"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                        #692062
                                        게시물에 댓글을 남겼습니다.






                                    </span>
                                <span class="timeago" title="2020-03-22 20:11:37.0">2020-03-22 20:11:37.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/692062?note=1933428">SK총괄PM이 알려주는 자바웹 100% 무료강좌</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/77763' class='avatar-photo'><img src='//www.gravatar.com/avatar/cff413d68086749271a002f482adf8f2?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/77763"  title="(주)스티브리자바">(주)스티브리자바</a> <div class="activity "><span class="fa fa-flash"></span> 3k</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #690331
                                        질문의 <a href="/user/info/49304" class="nickname">꾸롱</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-03-19 23:20:06.0">2020-03-19 23:20:06.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/690331?note=1927914">개발자가 되기전에 배웠으면 좋을것들</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/51407' class='avatar-photo'><img src='//www.gravatar.com/avatar/7feeb3df86143d8a44ac87f37a93d2dd?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/51407"  title="anisky">anisky</a> <div class="activity "><span class="fa fa-flash"></span> 138</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">



                            <i class="fa fa-angle-up fa-lg"></i>





                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">


                                    #690331 게시물을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-03-19 23:20:03.0">2020-03-19 23:20:03.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">


                                <a href="/article/690331">개발자가 되기전에 배웠으면 좋을것들</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/51407' class='avatar-photo'><img src='//www.gravatar.com/avatar/7feeb3df86143d8a44ac87f37a93d2dd?d=identicon&s=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/51407"  title="anisky">anisky</a> <div class="activity "><span class="fa fa-flash"></span> 138</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>










                    <li class="list-group-item list-group-item-small  list-group-has-note clearfix">
                        <div class="list-icon-wrapper pull-left">




                            <i class="fa fa-angle-up fa-lg"></i>




                        </div>
                        <div class="list-title-wrapper list-activity">
                            <div class="list-activity-desc">
                                    <span class="list-activity-desc-text">




                                        #682463
                                        질문의 <a href="/user/info/87654" class="nickname">LuiGee</a>님의 답변을 추천 하였습니다.




                                    </span>
                                <span class="timeago" title="2020-02-23 03:54:48.0">2020-02-23 03:54:48.0</span>
                            </div>
                            <h5 class="list-group-item-heading ">




                                <a href="/article/682463?note=1910457">개발뉴비입니다. 프론트엔드 로드맵?</a>
                                <div class="list-group-item-author pull-right clearfix">
                                    <div class='avatar avatar-x-small clearfix '><a href='/user/info/85738' class='avatar-photo'><img src='//graph.facebook.com/2476821172547904/picture?width=10&height=10'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/85738"  title="택택">택택</a> <div class="activity "><span class="fa fa-flash"></span> 58</div></div></div>
                                </div>
                            </h5>
                        </div>
                    </li>

                </ul>
                <div class="text-center">

                    <ul class="pagination pagination-sm"><li class="prev disabled"><span>&laquo;</span></li><li class="active"><span>1</span></li><li><a href="/user/info/94647/activity?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step">2</a></li><li class="next"><a href="/user/info/94647/activity?offset=20&amp;max=20&amp;sort=id&amp;order=desc" class="step">&raquo;</a></li></ul>

                </div>
            </div>
        </div>

        <div class="right-banner-wrapper">

            <div class="right-banner">
                <a href="/banner/stats/292" target="_sba"><img src="//file.okky.kr/banner/1593482562407.jpg" style="width:160px;"/></a>
            </div>
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
    var contextPath = "", encodedURL = "%2Fuser%2Finfo%2F94647";
</script>
<script src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js" type="text/javascript" ></script>
<script src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript" ></script>

<script src="//okky.kr/assets/apps/notification-6b08014e71e33528f46d161042f6e463.js" type="text/javascript" ></script>




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

