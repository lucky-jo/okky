<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="/resources/jqLib/comunityCheck.js"></script>
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
		href="https://github.com/ildang100/okky" class="link"
		target="_blank"><i class="fa fa-github"></i> <span
			class="nav-sidebar-label nav-sidebar-category-label">Github	Issues</span></a></li>
</ul>
</div>
<div class="sidebar-category-nav">
	<h3 class="sub-title">Jobs</h3>
		<ul class="nav">
		<li><a href="/jobs/list?sorted=" class="link"><span
				class="nav-sidebar-label nav-sidebar-category-label">All</span><span
				class='nav-indicator <c:out value="${pageMaker.cri.category eq null ? 'nav-selected':''}" /> '><span
					class="nav-selected-dot"></span></span></a></li>
	</ul>
	<div class="special-nav"></div>
</div>

<div id="article" class="content" role="main">

	<div class="nav" role="navigation">
		<a href="/jobs/register"
			class="create btn btn-success btn-wide pull-right"><i
			class="fa fa-pencil"></i> 새 글 쓰기</a>

		<h4>사는얘기</h4>
	</div>

	<div class="panel panel-default clearfix fa-">
		<div class="panel-heading clearfix">
			<div class='avatar avatar-medium clearfix pull-left'>
				<a href='/user/info/77218' class='avatar-photo'><img
					src='/resources/user/${writer.image}' /></a>
				<div class="avatar-info">
					<a class="nickname" href="/user/info/77218" title="${writer.nickname}">${writer.nickname}</a>
					<div class="activity">
						<span class="fa fa-flash"></span>${writer.apoint}
					</div>
					<div class="date-created">
						<span class="timeago" title="${get.updatedate}">${get.updatedate}</span>
					</div>
				</div>
			</div>
			<div class="content-identity pull-right">
				<div class="content-identity-count">
					<i class="fa fa-comment"></i> ${get.replycount}
				</div>
				<div class="content-identity-count">
					<i class="fa fa-eye"></i> ${get.cnt}
				</div>
			</div>
		</div>
		<div class="content-container clearfix">
			<div id="content-body" class="panel-body content-body pull-left">
				<div class="content-tags">
					<span class="list-group-item-text article-id">#${get.seq}</span> <a
						href="/articles/life"
						class="list-group-item-text item-tag label label-info"><i
						class="fa fa-comments"></i> ${get.category}</a>
				</div>
				<h2 class="panel-title">${get.title}</h2>
				<hr />
				<article class="content-text" itemprop="articleBody">

					<pre>${get.content}</pre>

				</article>

			</div>

			<div id="content-function"
				class="content-function pull-right text-center">
				<div class="content-function-group">
					<div class="note-evaluate-wrapper">
						<c:choose>
							<c:when test="${liketype == 1 }">
								<a  href="/like/delete?seq=${get.seq}&board=${get.board}&liketype=1&writer=${get.id}"
									class="note-vote-btn" role="button" data-type="assent"
									data-eval="true" data-id="2010634"><i
									id="note-evaluate-assent-2010634"
									class="fa fa-angle-up note-evaluate-assent-unvote "
									data-placement="left" data-toggle="tooltip" title="추천"
									onclick="return confirm(&#39;추천을 취소하시겠습니까?&#39;)"></i></a>
								<div id="content-vote-count-2010634" class="content-eval-count">${get.likecount}</div>
								<a href="javascript://" class="note-vote-btn" role="button"
									data-type="dissent" data-eval="true" data-id="2010634"><i
									id="note-evaluate-dissent-2010634"
									class="fa fa-angle-down note-evaluate-dissent-disabled"
									data-placement="left" data-toggle="tooltip" title="반대"></i></a>
							</c:when>
							<%--<i id="note-evaluate-assent-2010634" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="추천">--%>
							<c:when test="${liketype == 0 }">
								<a	href="/like/like?seq=${get.seq}&board=${get.board}&liketype=1&writer=${get.id}"
									class="note-vote-btn" role="button" data-type="assent"
									data-eval="true" data-id="2013409"><i
									id="note-evaluate-assent-2013409"
									class="fa fa-angle-up note-evaluate-assent-assent"
									data-placement="left" data-toggle="tooltip" title="추천"></i></a>
								<div id="content-vote-count-2013409" class="content-eval-count">${get.likecount }</div>
								<a	href="/like/like?seq=${get.seq}&board=${get.board}&liketype=-1&writer=${get.id}"
									class="note-vote-btn" role="button" data-type="dissent"
									data-eval="true" data-id="2013409"><i
									id="note-evaluate-dissent-2013409"
									class="fa fa-angle-down note-evaluate-dissent-dissent"
									data-placement="left" data-toggle="tooltip" title="반대"></i></a>
							</c:when>
							<c:when test="${liketype == -1 }">
								<a  href="javascript://" class="note-vote-btn" role="button"
									data-type="assent" data-eval="true" data-id="2010634"><i
									id="note-evaluate-assent-2010634"
									class="fa fa-angle-up note-evaluate-assent-disabled "
									data-placement="left" data-toggle="tooltip" title="추천"></i></a>
								<div id="content-vote-count-2010634" class="content-eval-count">${get.likecount}</div>
								<a  href="/like/delete?seq=${get.seq}&board=${get.board}&liketype=-1&writer=${get.id}"
									class="note-vote-btn" role="button" data-type="dissent"
									data-eval="true" data-id="2010634"
									onclick="return confirm(&#39;비추천를 취소하시겠습니까?&#39;)"><i
									id="note-evaluate-dissent-2010634"
									class="fa fa-angle-down note-evaluate-dissent-unvote"
									data-placement="left" data-toggle="tooltip" title="반대"></i></a>
							</c:when>

						</c:choose>
						<%--<a href="/qna/like?seq=${get.seq}&id=${get.id}&board=${get.board}&liketype=1" class="note-vote-btn" role="button"
							data-type="assent" data-eval="true" data-id="2013409"><i
							id="note-evaluate-assent-2013409"
							class="fa fa-angle-up note-evaluate-assent-assent"
							data-placement="left" data-toggle="tooltip" title="추천"></i></a>
						<div id="content-vote-count-2013409" class="content-eval-count">${get.likecount }</div>
						<a href="javascript://" class="note-vote-btn" role="button"
							data-type="dissent" data-eval="true" data-id="2013409"><i
							id="note-evaluate-dissent-2013409"
							class="fa fa-angle-down note-evaluate-dissent-dissent"
							data-placement="left" data-toggle="tooltip" title="반대"></i></a>--%>
					</div>
				</div>
				<div class="content-function-group article-scrap-wrapper">
					<a href="javascript://" id="article-scrap-btn" data-type="scrap"><i
						class="fa fa-bookmark " data-toggle="tooltip"
						data-placement="left" title="스크랩"></i></a>
					<div id="article-scrap-count" class="content-count">0</div>
				</div>
			</div>
			<div class="content-function-cog share-btn-wrapper">
				<div class="dropdown">
					<a
						href="http://www.facebook.com/sharer/sharer.php?app_id=1451111438499030&sdk=joey&u=https%3A%2F%2Fokky.kr%2Farticle%2F734025&display=popup&ref=plugin"
						class="btn-facebook-share"><i
						class="fa fa-facebook-square fa-fw" data-toggle="tooltip"
						data-placement="left" title="페이스북 공유"></i></a>

				</div>
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal" var="pinfo"/>
				<c:if test="${pinfo.username eq get.id }">
				<div class="dropdown">
					<form method="post" name="article-delete-form"
						id="article-delete-form">
						<input type="hidden" name="_method" value="DELETE" id="_method" />
						<div class="dropdown">
							<a href="javascript://" data-toggle="dropdown"><i
								class="fa fa-cog" data-toggle="tooltip" data-placement="left"
								title="게시물 설정"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/jobs/update?seq=${get.seq}&id=${get.id}" class="edit"><i
										class="fa fa-edit fa-fw"></i> 수정 </a></li>

								<li><a href="/jobs/delete?seq=${get.seq }"
									id="article-delete-btn"
									onclick="return confirm(&#39;정말로 삭제하시겠습니까?&#39;)"><i
										class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>

							</ul>
						</div>
					</form>
				</div>
				</c:if>
				</sec:authorize>
			</div>
		</div>
	</div>

	<div class="panel panel-default clearfix">
		<!-- List group -->
		<ul class="list-group">

			<li id="note-title" class="list-group-item note-title">
				<h3 class="panel-title">
					답변 <span id="note-count">${get.replycount}</span>
				</h3>
			</li>
			<c:forEach var="merge" items="${mergeReplylist }">
				<c:if test="${merge.board.rexist == 1 }">
					<li class="list-group-item note-item clearfix" id="note-2015714">
						<form action="/content/update/2015714" method="post"
							data-id="2015714" class="note-update-form">
							<input type="hidden" name="_method" value="PUT" id="_method" />
							<div class="content-body panel-body pull-left">

								<div class="note-select-indicator note-deselected">
									<i class="fa fa-comment"></i>
								</div>

								<div class='avatar avatar-medium clearfix '>
									<a href='/user/info/43814' class='avatar-photo'><img
										src='/resources/user/${merge.member.image}' /></a>
									<div class="avatar-info">
										<a class="nickname" href="/user/info/43814" title="defult">${merge.board.rid }</a>
										<div class="activity">
											<span class="fa fa-flash"></span> ${merge.member.apoint}
										</div>
										<div class="date-created">
											<span class="timeago" title="${merge.board.regdate }">${merge.board.regdate }
											</span> 작성 <span class="date-saperate">∙ ${merge.board.rupdatedate }</span>
											수정됨

										</div>
									</div>
								</div>
								<fieldset class="form">
									<article id="note-text-2015714"
										class="list-group-item-text note-text">
										<pre>${merge.board.rcontent }</pre>
									</article>
								</fieldset>
							</div>

							<div class="content-function pull-right text-center">
								<div class="content-function-group">
									<div class="note-evaluate-wrapper">
										<c:choose>
											<c:when test="${merge.board.liketype == 1 }">
												<a  href="/like/replydelete?rseq=${list.rseq}&board=${merge.board.board}&parentBoard=${get.board}&parentSeq=${get.seq}&liketype=1&writer=${get.id}"
													class="note-vote-btn" role="button" data-type="assent"
													data-eval="true" data-id="2010634"><i
													id="note-evaluate-assent-2010634"
													class="fa fa-angle-up note-evaluate-assent-unvote "
													data-placement="left" data-toggle="tooltip" title="추천"
													onclick="return confirm(&#39;추천을 취소하시겠습니까?&#39;)"></i></a>
												<div id="content-vote-count-2010634"
													class="content-eval-count">${merge.board.rlikecount}</div>
												<a  href="javascript://" class="note-vote-btn" role="button"
													data-type="dissent" data-eval="true" data-id="2010634"><i
													id="note-evaluate-dissent-2010634"
													class="fa fa-angle-down note-evaluate-dissent-disabled"
													data-placement="left" data-toggle="tooltip" title="반대"></i></a>
											</c:when>
											<%--<i id="note-evaluate-assent-2010634" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="추천">--%>
											<c:when test="${list.liketype == 0 }">
												<a  href="/like/replylike?rseq=${merge.board.rseq}&board=${merge.board.board}&parentBoard=${get.board}&parentSeq=${get.seq}&liketype=1&writer=${get.id}"
													class="note-vote-btn" role="button" data-type="assent"
													data-eval="true" data-id="2013409"><i
													id="note-evaluate-assent-2013409"
													class="fa fa-angle-up note-evaluate-assent-assent"
													data-placement="left" data-toggle="tooltip" title="추천"></i></a>
												<div id="content-vote-count-2013409"
													class="content-eval-count">${merge.board.rlikecount }</div>
												<a  href="/like/replylike?rseq=${merge.board.rseq}&board=${merge.board.board}&parentBoard=${get.board}&parentSeq=${get.seq}&liketype=-1&writer=${get.id}"
													class="note-vote-btn" role="button" data-type="dissent"
													data-eval="true" data-id="2013409"><i
													id="note-evaluate-dissent-2013409"
													class="fa fa-angle-down note-evaluate-dissent-dissent"
													data-placement="left" data-toggle="tooltip" title="반대"></i></a>
											</c:when>
											<c:when test="${merge.board.liketype == -1 }">
												<a  href="javascript://" class="note-vote-btn" role="button"
													data-type="assent" data-eval="true" data-id="2010634"><i
													id="note-evaluate-assent-2010634"
													class="fa fa-angle-up note-evaluate-assent-disabled "
													data-placement="left" data-toggle="tooltip" title="추천"></i></a>
												<div id="content-vote-count-2010634"
													class="content-eval-count">${merge.board.rlikecount}</div>
												<a  href="/like/replydelete?rseq=${merge.board.rseq}&board=${list.board}&parentBoard=${get.board}&parentSeq=${get.seq}&liketype=-1&writer=${get.id}"
													class="note-vote-btn" role="button" data-type="dissent"
													data-eval="true" data-id="2010634"
													onclick="return confirm(&#39;비추천를 취소하시겠습니까?&#39;)"><i
													id="note-evaluate-dissent-2010634"
													class="fa fa-angle-down note-evaluate-dissent-unvote"
													data-placement="left" data-toggle="tooltip" title="반대"></i></a>
											</c:when>

										</c:choose>
									</div>
								</div>
							</div>
							<!-- 로그인 및 아이디 확인 후 출력 -->
							<sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq list.rid }">
							<div id="content-function-cog-2014246"
								class="content-function-cog">
								<div class="dropdown">
									<a href="javascript://" data-toggle="dropdown"><i
										class="fa fa-cog" data-toggle="tooltip" data-placement="left"
										title="게시물 설정"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="javascript://" class="note-edit-btn"
											data-id="2014246"><i class="fa fa-edit fa-fw"></i> 수정</a></li>
										<li><a
											href="/colreply/delete?rseq=${merge.board.rseq }&seq=${merge.board.seq}"
											class="note-delete-btn" data-id="2014246"><i
												class="fa fa-trash-o fa-fw"></i> 삭제</a></li>
									</ul>
								</div>
								<div class="buttons" style="display: none;">
									<p>
										<a href="javascript://"
											class="btn btn-default btn-wide note-edit-cancel-btn">취소</a>
									</p>
									<p>
										<input type="submit" name="create"
											class="btn btn-success btn-wide" value="저장" id="create" />
									</p>
								</div>
							</div>
							</c:if>
							</sec:authorize>


						</form>

						<form action="/content/delete/2015714" method="post"
							id="note-delete-form-2015714">
							<input type="hidden" name="_method" value="DELETE" id="_method" />
						</form>

					</li>
				</c:if>
			</c:forEach>
			<li class="list-group-item note-item clearfix" id="note-2015129">

				<form action="/content/delete/2015129" method="post"
					id="note-delete-form-2015129">
					<input type="hidden" name="_method" value="DELETE" id="_method" />
				</form>
			</li>

			<li class="list-group-item note-form clearfix">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication var="user" property="principal" />
					<div class="panel-body">
						<form action="/colreply/register" method="post"
							class="note-create-form">

							<div class="content-body panel-body pull-left">
								<div style="margin-left: 5px;">

									<div class="note-select-indicator note-deselected">
										<i class="fa fa-edit"></i>
									</div>

									<div class='avatar avatar-medium clearfix '>
										<a href='/user/info/94647' class='avatar-photo'><img
											src='/resources/user/${user.member.image}' /></a>
										<div class="avatar-info">
											<a class="nickname" href="/user/info/94647" title="<sec:authentication property="principal.username"/>"><sec:authentication property="principal.username"/></a>
											<div class="activity block">
												<span class="fa fa-flash"></span> ${user.member.apoint}
											</div>
										</div>
									</div>

								</div>
								<fieldset class="form">
									<textarea name="rcontent" id="note-create" placeholder="댓글 쓰기"
										class="form-control"></textarea>
								</fieldset>
							</div>
							<div class="content-function-cog note-submit-buttons clearfix">
								<p>
									<a href="javascript://" id="note-create-cancel-btn"
										class="btn btn-default btn-wide" style="display: none;">취소</a>
								</p>
								<input type="submit" name="create" id="btn-create-btn"
									class="btn btn-success btn-wide" value=" 등록" />
								<!-- disabled="disabled"  -->
								<input type="hidden" name="rid"
									value="<sec:authentication property="principal.username"/>" />
								<input type="hidden" name="seq" value="${get.seq }" />
							</div>
						</form>
					</div>
				</sec:authorize> 
				<sec:authorize access="isAnonymous()">
					<div class="panel-body">
						<h5 class="text-center">
							<a href="/colreply/register?seq=${get.seq}"
								class="link">로그인</a>을 하시면 답변을 등록할 수 있습니다.
						</h5>
					</div>
				</sec:authorize>
			</li>
		</ul>
	</div>

</div>
<%@include file="../includes/footer.jsp"%>