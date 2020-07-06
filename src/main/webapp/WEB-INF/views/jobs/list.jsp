<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script>
$(function(){
   $('#searchBtn').on("click",function(){
            self.location="/jobs/list"
               +"${pageMaker.makeQuery(1)}"
               +"&searchType="
               +$("#searchType").val()
               /* + $("select option:selected").val() */
               +"&keyword="
               +$("#keyword").val();
   });
});
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
<div class="sidebar-category-nav">
            <h3 class="sub-title">Jobs</h3>
            <ul class="nav">
                <li><a href="/jobs/jlist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/jlist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">좋은회사/나쁜회사</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/jlist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">구인</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/jlist" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">구직</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>          
            </ul>
            <div class="special-nav">
            </div>
        </div>
        <div id="list-article" class="content scaffold-list" role="main">

<div>
   Jobs
   <div style="float: right;"><a href="/jobs/jinsert" >새 글 쓰기</a></div>
</div><br><br>
<div style="border: 10px;">
   검색창
</div><br>
<div style="float: right;" id="searchBar">
   <select name="searchType" id="searchType">
      <option value="n" <c:out value="${pageMaker.cri.searchType==null ? 'selected':'' }"/>>
      ---</option>
      <option value="t" <c:out value="${pageMaker.cri.searchType eq 't' ? 'selected':'' }"/>>
      Title</option>
      <option value="c" <c:out value="${pageMaker.cri.searchType eq 'c' ? 'selected':'' }"/>>
      Content</option>
      <option value="w" <c:out value="${pageMaker.cri.searchType eq 'w' ? 'selected':'' }"/>>
      Writer</option>
      <option value="tc" <c:out value="${pageMaker.cri.searchType eq 'tc' ? 'selected':'' }"/>>
      Title or Content</option>
      <option value="cw" <c:out value="${pageMaker.cri.searchType eq 'cw' ? 'selected':'' }"/>>
      Content or Writer</option>
      <option value="tcw" <c:out value="${pageMaker.cri.searchType eq 'tcw' ? 'selected':'' }"/>>
      Title or Content or Writer</option>
   </select>
   <input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}">
   <button style="float: right;" id="searchBtn">Search</button>
</div><br>

<div>
최신순  추천순  댓글순  스크랩순  조회순
</div>
<br>
<table>
   <c:forEach var="mm" items="${melon}">
   <tbody>
      <tr align="center" height="30">
         <td style="color: gray;">#${mm.seq}&nbsp;</td>
         <td rowspan="0">댓글</td>
         <td rowspan="0">좋아요</td>
         <td rowspan="0">${mm.cnt}</td>
         <td rowspan="0">image</td>
         <td>${mm.id}</td>
      </tr>
      <tr align="center" height="30" bordercolor="gray">
         <td><a href="/jobs/jdetail?seq=${mm.seq}">${mm.title}</a></td>
         <td>${mm.regdate}</td>
      </tr>
   </tbody>
   </c:forEach>
</table>

<div align="center">
<!-- 1) -->
<c:if test="${pageMaker.prev}">
   <a href="list${pageMaker.makeSearch(1)}">First&nbsp;</a>
   <a href="list${pageMaker.makeSearch(pageMaker.sPageNo-1)}">&laquo;&nbsp;</a>
               <!-- listcri?currPage=8&PerPageRow=10 -->
</c:if>

<!--  2)  -->
<c:forEach begin="${pageMaker.sPageNo}"
         end="${pageMaker.ePageNo}" var="i">
   <c:choose>
       <c:when test="${pageMaker.cri.currPage==i}">
          <font size="5" color="Orange">${i}</font>&nbsp;
       </c:when>
       <c:otherwise>
          <a href="list${pageMaker.makeSearch(i)}">${i}</a>&nbsp;
       </c:otherwise>
    </c:choose>      
   <%-- <c:out value="${pageMaker.cri.currPage == i ? 'class=active':''}"/> --%>
  </c:forEach>
<!--  3) --> 
  <c:if test="${pageMaker.next && pageMaker.ePageNo > 0}">
   <a href="list${pageMaker.makeSearch(pageMaker.ePageNo+1)}">&nbsp;&raquo;</a>
   <a href="list${pageMaker.makeSearch(pageMaker.lastPageNo)}">&nbsp;Last</a>
  </c:if>

</div>
<%@include file="../includes/footer.jsp"%>