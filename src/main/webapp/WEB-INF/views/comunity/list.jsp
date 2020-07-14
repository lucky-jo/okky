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

	<li  class="active" data-toggle="tooltip" data-placement="right" 
	data-container="body" title="커뮤니티"><a href="/comunity/list" 
	class="link"><i class="nav-icon fa fa-comments"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" 
	data-container="body" title="칼럼"><a href="/columnm/list" 
	class="link"><i class="nav-icon fa fa-quote-left"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" 
	data-container="body" title="Jobs"><a href="/jobs/list" 
	class="link"><i class="nav-icon fa fa-group"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" 
	title="Github Issues"><a href="https://github.com/ildang100/okky"
	class="link" target="_blank"><i class="fa fa-github"></i> <span 
	class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">커뮤니티</h3>
            <ul class="nav">
                <li><a href="/comunity/list" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">All</span><span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq null ? 'nav-selected':''}"/> '><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=공지사항&sorted=" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq '공지사항' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=사는얘기&sorted=" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq '사는얘기' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=포럼&sorted=" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq '포럼' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=IT행사&sorted=" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">IT행사</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq 'IT행사' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=정기모임%2F스터디&sorted=" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq '정기모임/스터디' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=학원%2F홍보&sorted=" class="link"><span 
                		class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span 
                		class='nav-indicator <c:out value="${pageMaker.cri.category eq '학원/홍보' ? 'nav-selected':''}"/>'><span 
                		class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav"></div>
        </div>
<div id="list-article" class="content scaffold-list" role="main">
	<div id="list-article" class="content scaffold-list" role="main">

		<div class="nav" role="navigation">

			<a href="/comunity/register"
				class="create btn btn-success btn-wide pull-right"><i
				class="fa fa-pencil"></i> 새 글 쓰기</a>

			<h4>커뮤니티</h4>
			<form action="/comunity/list" method="get"
				name="category-filter-form" id="category-filter-form">
				<div class="category-filter-wrapper">
					<div class="category-filter-query pull-right">
						<div class="input-group input-group-sm">
								<input type="hidden" name="categoty"
								value="${pageMaker.cri.category }"> <input type="hidden"
								name="searchType" value="tcw"> <input type="search"
								name="keyword" id="search-field" class="form-control"
								placeholder="검색어" value="${pageMaker.cri.keyword}" /> <span
								class="input-group-btn">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-search"></i>
								</button>

							</span>
						</div>
					</div>

					<ul class="list-sort pull-left">
						<li><a href="/comunity/list" data-sort="id"
							class=" <c:out value="${pageMaker.cri.sorted eq null ? 'active':''}" />
																		<c:out value="${pageMaker.cri.sorted eq '' ? 'active':''}" />">최신순</a></li>
						<li><a href="/comunity/list?sorted=like"
							class=" <c:out value="${pageMaker.cri.sorted eq 'like' ? 'active':''}" />">추천순</a></li>
						<li><a href="/comunity/list?sorted=reply"
							class=" <c:out value="${pageMaker.cri.sorted eq 'reply' ? 'active':''}" />"">댓글순</a></li>
						<%--<li><a href="/comunity/list" class="category-sort-link ">스크랩순</a></li>--%>
						<li><a href="/comunity/list?sorted=view"
							class=" <c:out value="${pageMaker.cri.sorted eq 'view' ? 'active':''}" />"">조회순</a></li>
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

				<c:forEach var="merge" items="${mergelist}">
					<c:if test="${merge.board.replycount > 0 }">
						<li
								class="list-group-item list-group-item-question list-group-has-note clearfix">

							<div class="list-title-wrapper clearfix">
								<div class="list-tag clearfix">
									<span class="list-group-item-text article-id">${merge.board.seq}</span>
									<a href="#"
									   class="list-group-item-text item-tag label label-info"><i
											class="fa fa-comments"></i> ${merge.board.category}</a>
								</div>

								<h5 class="list-group-item-heading list-group-item-evaluate">
									<a
											href="/comunity/get?seq=${merge.board.seq }&board=${merge.board.board}&id=${merge.board.id}">
											${merge.board.title} </a>
								</h5>
							</div>

							<div class="list-summary-wrapper clearfix">

								<div class="list-group-item-summary clearfix">
									<ul>
										<li
												class="${merge.board.replycount > 0 ? '' : 'item-icon-disabled' }  "><i
												class="item-icon fa fa-comment "></i>
												${merge.board.replycount}</li>
										<li
												class="${merge.board.likecount > 0 ? '' : 'item-icon-disabled' }  "><i
												class="item-icon fa fa-thumbs-up"></i>${merge.board.likecount }</li>
										<li
												class="${merge.board.cnt > 0 ? '' : 'item-icon-disabled' }"><i
												class="item-icon fa fa-eye"></i> ${merge.board.cnt}</li>
									</ul>
								</div>

							</div>

							<div class="list-group-item-author clearfix">
								<div class='avatar avatar-list clearfix '>
									<a href='/member/info?userid=${merge.member.userid}' class='avatar-photo'><img
											src='/resources/user/${merge.member.image}' /></a>
									<div class="avatar-info">
										<a class="nickname" href="/member/info?userid=${merge.member.userid}" title="defult">${merge.member.nickname}</a>
										<div class="activity">
											<span class="fa fa-flash"></span>${merge.member.apoint}
										</div>
										<div class="date-created">
											<span class="timeago" title="${merge.board.regdate}">${merge.board.regdate}</span>
										</div>
									</div>
								</div>
							</div>
						</li>
					</c:if>
					<c:if test="${merge.board.replycount == 0 }">
						<li
								class="list-group-item list-group-item-question list-group-no-note clearfix">

							<div class="list-title-wrapper clearfix">
								<div class="list-tag clearfix">
									<span class="list-group-item-text article-id">${merge.board.seq}</span>
									<a href="#"
									   class="list-group-item-text item-tag label label-info"><i
											class="fa fa-comments"></i> ${merge.board.category}</a>
								</div>

								<h5 class="list-group-item-heading list-group-item-evaluate">
									<a
											href="/comunity/get?seq=${merge.board.seq }&board=${merge.board.board}&id=${merge.board.id}">
											${merge.board.title} </a>
								</h5>
							</div>

							<div class="list-summary-wrapper clearfix">

								<div class="list-group-item-summary clearfix">
									<ul>
										<li
												class="${merge.board.replycount > 0 ? '' : 'item-icon-disabled' }  "><i
												class="item-icon fa fa-comment "></i>
												${merge.board.replycount}</li>

										<li
												class="${merge.board.likecount > 0 ? '' : 'item-icon-disabled' }  "><i
												class="item-icon fa fa-thumbs-up"></i>${merge.board.likecount }</li>
										<li class="${merge.board.cnt > 0 ? '' : 'item-icon-disabled' }"><i
												class="item-icon fa fa-eye"></i> ${merge.board.cnt}</li>
									</ul>
								</div>
							</div>

							<div class="list-group-item-author clearfix">
								<div class='avatar avatar-list clearfix '>
									<a href='/member/info?userid=${merge.member.userid}' class='avatar-photo'><img
											src='/resources/user/${merge.member.image }' /></a>
									<div class="avatar-info">
										<a class="nickname" href="/member/info?userid=${merge.member.userid}" title="${merge.member.userid}">${merge.member.nickname}</a>
										<div class="activity">
											<span class="fa fa-flash"></span>${merge.member.apoint }
										</div>
										<div class="date-created">
											<span class="timeago" title="${merge.board.regdate}">${merge.board.regdate}</span>
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
					<li><a href="/comunity/list${pageMaker.makeSearch(i)}" class="step">${i }</a></li>
				</c:otherwise>
			</c:choose>
			<%-- <c:out value="${pageMaker.cri.currPage == i ? 'class=active':''}"/> --%>
			<!--  		<li class="disabled"><span>...</span></li>
		<li><a href="/comunity/list?" class="step">8013</a></li>
		<li class="next"><a href="/comunity/list?" class="step">&raquo;</a></li> -->
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.ePageNo > 0}">
			<li><a href="list${pageMaker.makeSearch(pageMaker.ePageNo+1)}">&nbsp;&raquo;</a></li>
			<li><a href="list${pageMaker.makeSearch(pageMaker.lastPageNo)}">&nbsp;Last</a></li>
		</c:if>
	</ul>

</div>
</div>

<%@include file="../includes/footer.jsp"%>