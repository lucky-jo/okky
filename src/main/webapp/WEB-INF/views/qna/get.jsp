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
        <div class="sidebar-category-nav">
            <h3 class="sub-title">Q&A</h3>
            <ul class="nav">
                <li><a href="/qna/list" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span><span class='nav-indicator <c:out value="${maker.cri.category eq null ? 'nav-selected':''}"/> '><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/qna/list?category=a" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'a' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
                <li><a href="/qna/list?category=b" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class='nav-indicator <c:out value="${maker.cri.category eq 'b' ? 'nav-selected':''}"/>'><span class="nav-selected-dot"></span></span></a></li>
            </ul>
            <div class="special-nav">
            </div>
        </div>



<div id="article" class="content" role="main">



	<div class="nav" role="navigation">
		<a href="/qna/register" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 새 글 쓰기</a>

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
                                        <li><a href="/qna/update?seq=${get.seq}" class="edit"><i class="fa fa-edit fa-fw" ></i> 수정 </a></li>
                                        
                                            <li><a href="/qna/delete" id="article-delete-btn"><i class="fa fa-trash-o fa-fw" onclick="return confirm(&#39;정말로 삭제하시겠습니까?&#39;)"></i> 삭제 </a></li>
                                        
                                    </ul>
                                </div>
                            </form>
                        </div>


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