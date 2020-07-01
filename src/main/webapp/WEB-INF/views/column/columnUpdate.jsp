<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">칼럼</h3>
            <ul class="nav">
                <li><a href="/column/update" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">
<h4>글 수정</h4>
</head>
<body>
<form action="/column/update" method="post">
<table>
  <tr><td>S E Q</td>
      <td><input type="text" name="seq" value="${Detail.seq}" readonly="readonly">
  </td></tr>
  <tr><td>Title</td>
      <td><input type="text" name="title" value="${Detail.title}">
  </td></tr>
  <tr><td>I  D</td>
      <td><input type="text" name="id" value="${Detail.id}" readonly="readonly">
  </td></tr>
  <tr><td>Content</td>
      <td><textarea name="content" rows="10" cols="40">${Detail.content}</textarea>
  </td></tr>
  <tr><td>RegDate</td>
      <td><input type="text" name="regdate" value="${Detail.regdate}" readonly="readonly">
  </td></tr>
  <tr><td>ViewCount</td>
      <td><input type="text" name="cnt" value="${Detail.cnt}" readonly="readonly">
  </td></tr>
  <tr><td></td>
  	  <td><input type="submit" value="글수정">&nbsp;
  	      <input type="reset"  value="Reset">
  </td></tr>
</table>
</form>
</body>
</html>
<%@include file="../includes/footer.jsp"%>