<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="resources/jqLib/comunityCheck.js"></script>
<script>
var tCheck=false;

$(function() {
	$('#title').focus();
	$('#title').focusout(function() {
	 	tCheck=ttCheck();
	}); // title_focusout
}); // ready

function inCheck() {
	if (tCheck==true ) {
		return true;
	}else {
		tCheck=ttCheck();
		return false;
	};
} //inCheck 
</script>
<ul class="nav nav-sidebar nav-main">

	<li data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li class="active"  data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>
<h2>새 글 쓰기</h2>

<div>image</div>
<div>
	${logID}
</div>
	<form action="/jobs/insert" method="post">
		<table>
			<tr height="60">
				<td>
					<select name="category" id="category">
  						<option value="0">게시판을 선택해주세요</option>
    					<option value="1">사는 얘기</option>
    					<option value="2">포럼</option>
    					<option value="3">IT 행사</option>
    					<option value="4">정기모임/스터디</option>
    					<option value="5">학원/홍보</option>
  					</select>
				</td>
			</tr>
			<tr height="60">
				<td><input type="text" name="title" id="title" value="제목을 입력해주세요"></td>
			</tr>
			<tr height="60">
				<td><textarea rows="20" cols="60" name="content"></textarea></td>
			</tr>
				<td><input type="reset" value="취소">
					<input type="submit" value="등록">
					<input type="hidden" name="id" value="hongildong"></td>
		</table>
	</form>
<%@include file="../includes/footer.jsp"%>