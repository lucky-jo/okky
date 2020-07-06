<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
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
<h2>** [글 수정] **</h2>
<form action="/jobs/update" method="post">
<table>
  <tr><td bgcolor="Chartreuse">S E Q</td>
      <td><input type="text" name="seq" value="${Detail.seq}" readonly="readonly">
  </td></tr>
  <tr><td bgcolor="Chartreuse">Title</td>
      <td><input type="text" name="title" value="${Detail.title}">
  </td></tr>
  <tr><td bgcolor="Chartreuse">I  D</td>
      <td><input type="text" name="id" value="${Detail.id}" readonly="readonly">
  </td></tr>
  <tr><td bgcolor="Chartreuse">Content</td>
      <td><textarea name="content" rows="10" cols="40">${Detail.content}</textarea>
  </td></tr>
  <tr><td bgcolor="Chartreuse">RegDate</td>
      <td><input type="text" name="regdate" value="${Detail.regdate}" readonly="readonly">
  </td></tr>
  <tr><td bgcolor="Chartreuse">ViewCount</td>
      <td><input type="text" name="cnt" value="${Detail.cnt}" readonly="readonly">
  </td></tr>
  <tr><td></td>
  	  <td><input type="submit" value="글수정">&nbsp;
  	      <input type="reset"  value="Reset">
  </td></tr>
</table>
</form><br>
<br>
<hr>
<a href="home">Home</a><br>
<%@include file="../includes/footer.jsp"%>