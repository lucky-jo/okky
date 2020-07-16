<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/header.jsp"%>

<ul class="nav nav-sidebar nav-main">

	<li data-toggle="tooltip" data-placement="right" 
	data-container="body" title="Q&A"><a href="/qna/list" 
	class="link"><i class="nav-icon fa fa-database"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" 
	data-container="body" title="Tech"><a href="/tech/list" 
	class="link"><i class="nav-icon fa fa-code"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li   data-toggle="tooltip" data-placement="right" 
	data-container="body" title="커뮤니티"><a href="/comunity/list" 
	class="link"><i class="nav-icon fa fa-comments"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" 
	data-container="body" title="칼럼"><a href="/column/list" 
	class="link"><i class="nav-icon fa fa-quote-left"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li  class="active" data-toggle="tooltip" data-placement="right" 
	data-container="body" title="Jobs"><a href="/jobs/list" 
	class="link"><i class="nav-icon fa fa-group"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" 
	title="Github Issues"><a href="https://github.com/okjsp/okky/issues" 
	class="link" target="_blank"><i class="fa fa-github"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">Jobs</h3>
            <ul class="nav">
                <li><a href="/jobs/list" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">All</span><span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq null ? 'nav-selected':''}"/> '><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/list?category=a" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">좋은회사/나쁜회사</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq 'a' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/list?category=b" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">구인</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq 'b' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/list?category=c" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">구직</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq 'c' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/list?category=d" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">eBrainJobs</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq 'd' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/jobs/list?category=e" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">구인(정규직)</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq 'e' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
               
            </ul>
            <div class="special-nav">
            </div>
        </div>
<div id="list-article" class="content scaffold-list" role="main">
	<div id="list-article" class="content scaffold-list" role="main">

		<div class="nav" role="navigation">

			<a href="/jobs/insertForm"
				class="create btn btn-success btn-wide pull-right"><i
				class="fa fa-pencil"></i> 새 글 쓰기</a>

			<h4>Jobs</h4>
			<form action="/articles/jobs" method="get"
				name="category-filter-form" id="category-filter-form">
				<div class="category-filter-wrapper">
					<div class="category-filter-query pull-right">
						<div class="input-group input-group-sm">
							<input type="search" name="query" id="search-field"
								class="form-control" placeholder="검색어" value="" /> <span
								class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>

							</span>
						</div>
					</div>

					<ul class="list-sort pull-left">
						<li><a href="/jobs/list" data-sort="id" class=" <c:out value="${pageMaker.cri.sorted eq null ? 'active':''}" />
																		<c:out value="${pageMaker.cri.sorted eq '' ? 'active':''}" />">최신순</a></li>
						<li><a href="/jobs/list?sorted=like" class=" <c:out value="${pageMaker.cri.sorted eq 'like' ? 'active':''}" />" >추천순</a></li>
						<li><a href="/jobs/list?sorted=reply" class=" <c:out value="${pageMaker.cri.sorted eq 'reply' ? 'active':''}" />" ">댓글순</a></li>
						<%--<li><a href="/qna/list" class="category-sort-link ">스크랩순</a></li>--%>
						<li><a href="/jobs/list?sorted=view" class=" <c:out value="${pageMaker.cri.sorted eq 'view' ? 'active':''}" />" ">조회순</a></li>
					</ul>

					<input type="hidden" name="sort" id="category-sort-input"
						value="id" /> <input type="hidden" name="order"
						id="category-order-input" value="desc" />
				</div>


			</form>

		</div>

		<div class="panel panel-default">

			<!-- Table -->

			<ul class="list-group">



				<c:forEach var="melon" items="${melon}">
						<c:if test="${melon.exist == 1}">
						<li
							class="list-group-item list-group-item-question list-group-no-note clearfix">

							<div class="list-title-wrapper clearfix">
								<div class="list-tag clearfix">
									<span class="list-group-item-text article-id">${melon.seq}</span>
									<a href="#"
										class="list-group-item-text item-tag label label-info"><i
										class="fa fa-comments"></i> ${melon.category}</a>

								</div>

							 	<h5 class="list-group-item-heading list-group-item-evaluate">
									<a href="/jobs/get?seq=${melon.seq }&board=${melon.board}"> ${melon.title} </a>
								</h5>
							</div>

							<div class="list-summary-wrapper clearfix">

								<div class="list-group-item-summary clearfix">
									<ul>
									<c:if test="${melon.replycount > 0 }">
										<i class="item-icon fa fa-comment "></i> ${melon.replycount}
									</c:if>
									<c:if test="${melon.replycount < 1 }">
										<li class="item-icon-disabled"><i
											class="item-icon fa fa-comment "></i> ${melon.replycount}</li>
									</c:if>
									<c:if test="${melon.likecount > 0 }">
										<li class="item-icon fa fa-thumbs-up">${melon.likecount }</li>
									</c:if>
									<c:if test="${melon.likecount < 1 }">
										<li class="item-icon-disabled"><i
											class="item-icon fa fa-thumbs-up"></i>${melon.likecount }</li>
									</c:if>
										<li class=""><i class="item-icon fa fa-eye"></i> ${melon.cnt}</li>
									</ul>
								</div>
							</div> 
 
							<div class="list-group-item-author clearfix">
								<div class='avatar avatar-list clearfix '>
									<a href='#' class='avatar-photo'><img
										src='//www.gravatar.com/avatar/7fa2d4d22e174192ba72a9d91acf2eb0?d=identicon&s=30' /></a>
									<div class="avatar-info">
										<a class="nickname" href="#" title="${melon.id}">${melon.id}</a>
										<div class="activity">
											<span class="fa fa-flash"></span>활동
										</div>
										<div class="date-created">
											<span class="timeago" title="${melon.regdate}">${melon.regdate}</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						</c:if>
				</c:forEach>

			</ul>
		</div>
	</div>
</div>

<div class="text-center">

	<ul class="pagination pagination-sm">
		<c:if test="${pageMaker.prev}">
			<li><a href="list${pageMaker.makeSearch(1)}">First&nbsp;</a></li>
			<li><a href="list${pageMaker.makeSearch(pageMaker.sPageNo-1)}">&laquo;&nbsp;</a></li>
			<!-- listcri?currPage=8&PerPageRow=10 -->
		</c:if>

		<c:forEach begin="${pageMaker.sPageNo}" end="${pageMaker.ePageNo}"
			var="i">
			<c:choose>
				<c:when test="${pageMaker.cri.currPage==i}">
					<li class="active"><span>${i}</span></li>
				</c:when>
				<c:otherwise>
					<li><a href="/jobs/list${pageMaker.makeSearch(i)}" class="step">${i }</a></li>
				</c:otherwise>
			</c:choose>
			<%-- <c:out value="${pageMaker.cri.currPage == i ? 'class=active':''}"/> --%>
			<!--  		<li class="disabled"><span>...</span></li>
		<li><a href="/qna/list?" class="step">8013</a></li>
		<li class="next"><a href="/qna/list?" class="step">&raquo;</a></li> -->
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.ePageNo > 0}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.ePageNo+1)}">&nbsp;&raquo;</a></li>
			<li><a href="list${pageMaker.makeSearch(pageMaker.lastPageNo)}">&nbsp;Last</a></li>
		</c:if>
	</ul>

</div>
</div>

<%@include file="../includes/footer.jsp"%>