<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script>
function del() {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.remove.submit();
	}else{
		return;
	}
} // del() 
</script>


<ul class="nav nav-sidebar nav-main">

	<li data-toggle="tooltip" data-placement="right"
		data-container="body" title="Q&A"><a href="/qna/list"
		class="link"><i class="nav-icon fa fa-database"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="Tech"><a href="/tech/list" class="link"><i
			class="nav-icon fa fa-code"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="커뮤니티"><a href="/comunity/list" class="link"><i
			class="nav-icon fa fa-comments"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li data-toggle="tooltip" data-placement="right" data-container="body"
		title="칼럼"><a href="/column/list" class="link"><i
			class="nav-icon fa fa-quote-left"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li class="active" data-toggle="tooltip" data-placement="right" data-container="body"
		title="Jobs"><a href="/jobs/list" class="link"><i
			class="nav-icon fa fa-group"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>
<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" 
	title="Github Issues"><a 
	href="https://github.com/okjsp/okky/issues" 
	class="link" target="_blank"><i class="fa fa-github"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>














<div>
	Jobs
	<div style="float: right;">
	<a href="/jobs/updateForm?seq=${message.seq}">내글 수정</a>&nbsp;&nbsp;
	<a href="/jobs/delete?seq=${message.seq}">삭제</a>
	</div>
	
</div><br><br>
<div style="border: 10px;">
	content
</div><br>
<div>
최신순  추천순  댓글순  스크랩순  조회순
</div>
<br>
<table>
	<tr height="40"><td>Seq</td>
		<td>${Detail.seq}</td></tr>
	<tr height="40"><td>Title</td>
		<td>${Detail.title}</td></tr>
	<tr height="40"><td>Id</td>
		<td>${Detail.id}</td></tr>
	<tr height="40"><td>Content</td>
		<td><textarea rows="10" cols="40" readonly="readonly">${message.content}</textarea></td>
	</tr>
	<tr height="40"><td>Regdate</td>
		<td>${Detail.regdate}</td></tr>
	<tr height="40"><td>Count</td>
		<td>${Detail.cnt}</td></tr>
</table><br>




<form action="/jobs/rinsert" method="post">
<table>
<tr height="40"><td bgcolor="aqua" >Content</td>
	<td><textarea rows="10" cols="40" name="rcontent"></textarea>
	</td></tr>
<tr><td></td><td><input type="submit" value="댓글등록">
                 <input type="reset" value="취소">
                 <input type="hidden" name="rid" value="message">
                  <input type="hidden" name="seq" value="${message.seq}"></td>	
</table>
</form>


<%-- <div align="center">
<!-- 1) -->
<c:choose>
	<c:when test="${sPage>perPageNo}">
		<a href="plist?currPage=1">First</a>&nbsp;
		<a href="plist?currPage=${sPage-1}">Prev</a>&nbsp;&nbsp;
	</c:when>
	<c:otherwise>
		<font color="gray">First&nbsp;Prev&nbsp;&nbsp;</font>
	</c:otherwise>
</c:choose>
<!-- 2) -->
<c:forEach  var="i"  begin="${sPage}" end="${ePage}">
	<c:choose>
		<c:when test="${i==currPage}">
			<font size="5" color="Orange">${i}</font>
		</c:when>
		<c:otherwise>
			<a href="plist?currPage=${i}">${i}</a>
		</c:otherwise>
	</c:choose>
</c:forEach>
<!-- 3) -->
<c:choose>
	<c:when test="${ePage<totalPageNo}">
		<a href="plist?currPage=${ePage+1}">&nbsp;&nbsp;Next</a>
		<a href="plist?currPage=${totalPageNo}">&nbsp;Last</a>
	</c:when>
	<c:otherwise>
		<font color="gray">&nbsp;&nbsp;Next&nbsp;Last</font>
	</c:otherwise>
</c:choose>
</div> --%>
<%@include file="../includes/footer.jsp"%>