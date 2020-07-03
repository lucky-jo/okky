<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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

	<li data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li class="active"  data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">커뮤니티</h3>
            <ul class="nav">
                <li><a href="/comunity/list" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span><span class='nav-indicator <c:out value="${maker.cri.category eq null ? 'nav-selected':''}"/> '><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=a" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'a' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=b" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'b' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=c" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'c' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=d" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">IT행사</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'd' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=e" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'e' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/comunity/list?category=f" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'f' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>



<div id="article" class="content" role="main">



	<div class="nav" role="navigation">
		<a href="/comunity/register" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 새 글 쓰기</a>

		<h4>사는얘기</h4>
	</div>




	<div class="panel panel-default clearfix fa-">
		<div class="panel-heading clearfix">
			<div class='avatar avatar-medium clearfix pull-left'><a href='/user/info/77218' class='avatar-photo'><img src='//www.gravatar.com/avatar/d8bb3e40bda6895a753049fb0698cc5f?d=identicon&s=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/77218"  title="${get.title}">${get.id}</a> <div class="activity"><span class="fa fa-flash"></span> 113</div><div class="date-created"><span class="timeago" title="2020-07-02 11:47:20.0">2020-07-02 11:47:20</span> </div> </div></div>
			<div class="content-identity pull-right">
				<div class="content-identity-count"><i class="fa fa-comment"></i> 댓글수</div>
				<div class="content-identity-count"><i class="fa fa-eye"></i> ${get.cnt}</div>
			</div>
		</div>
		<div class="content-container clearfix">
			<div id="content-body" class="panel-body content-body pull-left">
				<div class="content-tags">
					<span class="list-group-item-text article-id">#${get.seq}</span>
					<a href="/articles/life" class="list-group-item-text item-tag label label-info"><i class="fa fa-comments"></i> ${get.category}</a>
				</div>
				<h2 class="panel-title">
					${get.title}
				</h2>
				<hr/>
				<article class="content-text" itemprop="articleBody">


					${get.content}


				</article>

			</div>

			<div id="content-function" class="content-function pull-right text-center">
				<div class="content-function-group">
					<div class="note-evaluate-wrapper"><a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2013409"><i id="note-evaluate-assent-2013409" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="추천"></i></a><div id="content-vote-count-2013409" class="content-eval-count">좋아요횟수</div><a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2013409"><i id="note-evaluate-dissent-2013409" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="반대"></i></a></div>
				</div>
				<div class="content-function-group article-scrap-wrapper">
					<a href="javascript://" id="article-scrap-btn" data-type="scrap"><i class="fa fa-bookmark " data-toggle="tooltip" data-placement="left" title="스크랩"></i></a>
					<div id="article-scrap-count" class="content-count">0</div>
				</div>
			</div>
			<div class="content-function-cog share-btn-wrapper">
				<div class="dropdown">
					<a href="http://www.facebook.com/sharer/sharer.php?app_id=1451111438499030&sdk=joey&u=https%3A%2F%2Fokky.kr%2Farticle%2F734025&display=popup&ref=plugin" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="페이스북 공유"></i></a>

				</div>
				
				<div class="dropdown">
                            <form action="/article/delete/734506" method="post" name="article-delete-form" id="article-delete-form" ><input type="hidden" name="_method" value="DELETE" id="_method" />
                                <div class="dropdown">
                                    <a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="/comunity/update?seq=${get.seq}" class="edit"><i class="fa fa-edit fa-fw" ></i> 수정 </a></li>
                                        
                                            <li><a href="/comunity/delete?seq=${get.seq }" id="article-delete-btn"><i class="fa fa-trash-o fa-fw" onclick="return confirm(&#39;정말로 삭제하시겠습니까?&#39;)"></i> 삭제 </a></li>
                                        
                                    </ul>
                                </div>
                            </form>
                        </div>


			</div>
		</div>
	</div>
	
	<div id="article-create" class="content" role="main">

	<div class="content-header">
		<h3>댓글</h3>
		<c:forEach var="list" items="${reply }">
		
		
		
		
		</c:forEach>
	</div>
	<div class="panel panel-default clearfix">
		<div class="panel-heading clearfix">
			<div class='avatar avatar-medium clearfix pull-left'>
				<a href='/user/info/94647' class='avatar-photo'><img
					src='//www.gravatar.com/avatar/9673f3346e67c0417b21e970fcc821cb?d=identicon&s=40' /></a>
				<div class="avatar-info">
					<a class="nickname" href="/user/info/94647" title="Kim">kim</a>
					<div class="activity block">
						<span class="fa fa-flash"></span> 37
					</div>
				</div>
			</div>

		</div>
		<div class="panel-body">
			<form action="/comunity/register" method="post"
				id="article-form" class="article-form" role="form"
				onsubmit="return postForm()">
				<input type="hidden" name="SYNCHRONIZER_TOKEN"
					value="e5959747-1ffb-4a10-b899-811d11569367"
					id="SYNCHRONIZER_TOKEN" /> <input type="hidden"
					name="SYNCHRONIZER_URI" value="/articles/questions/create"
					id="SYNCHRONIZER_URI" />
				<fieldset class="form">
					
<!-- 					<div class="form-group  has-feedback">
						<div>
							<input type="text" name="tagString" value="" placeholder="Tags,"
								data-role="tagsinput" class="form-control" id="tagString" />
						</div>
					</div> -->

					<div class="form-group  has-feedback">

						<textarea name="content" id="summernote" rows="20"
							class="form-control input-block-level"></textarea>
					</div>
					<!-- <input type="hidden" name="content.textType" value="HTML" id="content.textType" /> -->
					
					<div class="nav" role="navigation">
                                <fieldset class="buttons">
                                    <a href="/comunity/list" class="btn btn-default btn-wide" onclick="return confirm(&#39;정말로 취소하시겠습니까?&#39;)">취소</a>
                                    <input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="등록" id="create" />
                                    <input type="hidden" name="id" value="Kim">
                                </fieldset>
                            </div>
					
				</fieldset>
			</form>
		</div>
	</div>
</div>


	<div class="main-banner-wrapper">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- 728-90_Ressponsive -->
		<ins class="adsbygoogle"
			 style="display:inline-block;width:728px;height:90px"
			 data-ad-client="ca-pub-8103607814406874"
			 data-ad-slot="8622179990"></ins>
		<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>

</div>
<%@include file="../includes/footer.jsp"%>