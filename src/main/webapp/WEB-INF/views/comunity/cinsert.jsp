<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="/resources/jqLib/comunityCheck.js"></script>
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
<h2>새 글 쓰기</h2>

<div>image</div>
<div>
	${logID}
</div>
	<form action="/comunity/insert" method="post">
		<table>
			<tr height="60">
				<td>
					<select name="category" id="category">
  						<option value="default">게시판을 선택해주세요</option>
    					<option value="a">사는 얘기</option>
    					<option value="b">포럼</option>
    					<option value="c">IT 행사</option>
    					<option value="d">정기모임/스터디</option>
    					<option value="e">학원/홍보</option>
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
					<input type="submit" value="등록" onclick="return inCheck()">
					<input type="hidden" name="id" value="hongildong"></td>
		</table>
	</form>
<%@include file="../includes/footer.jsp"%>