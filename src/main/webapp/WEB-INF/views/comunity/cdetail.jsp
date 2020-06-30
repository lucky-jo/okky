<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="/resources/jqLib/comunityCheck.js"></script>
<div class="sidebar-category-nav">
            <h3 class="sub-title">커뮤니티</h3>
            <ul class="nav">
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">IT 행사</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/clist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">

${detail.category}
<div style="float: right;"><a href="/comunity/cinsert" >새 글 쓰기</a></div>
		<table>
			<tbody>
				<tr align="center" height="30">
					<td rowspan="1">image</td>
					<td>${detail.id}</td>
				</tr>
				<tr>
					<td>${detail.regdate}</td>
				</tr>
				<tr align="center" height="30">
					<td style="color: gray;">#${detail.seq}&nbsp;${detail.category}</td>
				</tr>
				<tr>
					<td>${detail.title}</td>
				</tr>
				<tr>
					<td><textarea rows="10" cols="40" readonly="readonly">${detail.content}</textarea></td>
				</tr>
				<tr align="center" height="30" bordercolor="gray">
					<td>${detail.regdate}</td>
				</tr>
			</tbody>
		</table><br><br><br>
		<table>
			<tr>
				<td>댓글</td>
			</tr>
			<tr align="center" height="30">
				<td>${detail.id}</td>
			</tr>
			<tr>
				<td><textarea rows="10" cols="40" name="content"></textarea></td>
				<td><input type="submit" value="등록" onclick="inCheck()"></td>
			</tr>
		</table>
	</form>

<%@include file="../includes/footer.jsp"%>