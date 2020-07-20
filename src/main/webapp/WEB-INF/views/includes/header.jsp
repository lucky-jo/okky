<%--
  Created by IntelliJ IDEA.
  User: last2
  Date: 2020-06-29
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"%>
<<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="ko" class="no-js"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>OKKY - Q&A</title>
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

	<script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>

    <meta name="layout" content="main_with_banner">
    



</head>
<body>
<div class="layout-container">
    <div class="main ">
        <div class="sidebar sidebar-category">

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

            <%--로그인 시 출력 화면--%>
            <sec:authorize access="isAuthenticated()">
                <sec:authentication var="user" property="principal"/>
                <div class="nav-user nav-sidebar">
                    <div class='avatar avatar-medium clearfix '><a href='/member/info?userid=${user.member.userid }' class='avatar-photo'><img
                            src='/resources/user/${user.member.image }'/></a>
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
<script>
    var contextPath = "", encodedURL = "%2F";
</script>
<script src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js" type="text/javascript"></script>
<script src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript"></script>

<script src="//okky.kr/assets/apps/notification-6b08014e71e33528f46d161042f6e463.js" type="text/javascript"></script>
            