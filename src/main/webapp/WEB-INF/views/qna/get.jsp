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

	<li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>
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
					<form method="post" name="article-delete-form" id="article-delete-form" ><input type="hidden" name="_method" value="DELETE" id="_method" />
						<div class="dropdown">
							<a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/qna/update?seq=${get.seq}" class="edit"><i class="fa fa-edit fa-fw" ></i> 수정 </a></li>
                                        
								<li><a href="/qna/delete?seq=${get.seq }" id="article-delete-btn"><i class="fa fa-trash-o fa-fw" onclick="return confirm(&#39;정말로 삭제하시겠습니까?&#39;)"></i> 삭제 </a></li>
                                        
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="panel panel-default clearfix">
		<!-- List group -->
		<ul class="list-group">

			<li id="note-title" class="list-group-item note-title">
				<h3 class="panel-title">답변 <span id="note-count">리플갯수</span></h3>
			</li>

			<li class="list-group-item note-item clearfix" id="note-2015116">
				<form action="/content/update/2015116" method="post" data-id="2015116" class="note-update-form" ><input type="hidden" name="_method" value="PUT" id="_method" />
					<div class="content-body panel-body pull-left">




						<div class="note-select-indicator note-selected">
							<i class="fa fa-check"></i>
						</div>




						<div class='avatar avatar-medium clearfix '><a href='/user/info/94672' class='avatar-photo'><img src='//www.gravatar.com/avatar/bd61deea96013981955dcb445d4a7399?d=identicon&s=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/94672"  title="정교니">정교니</a> <div class="activity"><span class="fa fa-flash"></span> 404</div><div class="date-created"><span class="timeago" title="2020-07-03 16:24:44.0">2020-07-03 16:24:44</span> </div> </div></div>
						<fieldset class="form">
							<article id="note-text-2015116" class="list-group-item-text note-text">

								<pre class=" language-java" style="line-height:1.42857"><code class=" language-java">if(name.equals(&#34;SELECT * FROM SCHEDULE WHERE NAME &#61; &#39;&#34; &#43; name &#43; &#34;&#39;&#34;))</code></pre><p>이 부분은</p><p>입력한 name이라는 변수와 </p><pre class=" language-java" style="line-height:1.42857"><code class=" language-java">&#34;SELECT * FROM SCHEDULE WHERE NAME &#61; &#39;&#34; &#43; name &#43; &#34;&#39;&#34;)</code></pre><p>이라는 하나의 문자열을 비교하는 구문이 되네요.</p><p>Select 해서 나온 결과 값을 name.equals(    ) 안에 넣어주는게 맞을것 같아요.</p>

							</article>
						</fieldset>
					</div>

					<div class="content-function pull-right text-center">
						<div class="content-function-group">
							<div class="note-evaluate-wrapper"><a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2015116"><i id="note-evaluate-assent-2015116" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="추천"></i></a><div id="content-vote-count-2015116" class="content-eval-count">0</div><a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2015116"><i id="note-evaluate-dissent-2015116" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="반대"></i></a></div>
						</div>
					</div>

				</form>

				<form action="/content/delete/2015116" method="post" id="note-delete-form-2015116" ><input type="hidden" name="_method" value="DELETE" id="_method" />
				</form>
			</li>

			<li class="list-group-item note-item clearfix" id="note-2015129">
				<form action="/content/update/2015129" method="post" data-id="2015129" class="note-update-form" ><input type="hidden" name="_method" value="PUT" id="_method" />
					<div class="content-body panel-body pull-left">




						<div class="note-select-indicator note-deselected">
							<i class="fa fa-comment"></i>
						</div>




						<div class='avatar avatar-medium clearfix '><a href='/user/info/103851' class='avatar-photo'><img src='//graph.facebook.com/1959001237566188/picture?width=40&height=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/103851"  title="이름은포기한다">이름은포기한다</a> <div class="activity"><span class="fa fa-flash"></span> 20</div><div class="date-created"><span class="timeago" title="2020-07-03 16:35:56.0">2020-07-03 16:35:56</span> </div> </div></div>
						<fieldset class="form">
							<article id="note-text-2015129" class="list-group-item-text note-text">

								<p>그럼 name.equals(   )안에 어떤 내용이 들어가야 하나요?</p><p>잘 모르겠습니다ㅠㅠ</p>

							</article>
						</fieldset>
					</div>

					<div class="content-function pull-right text-center">
						<div class="content-function-group">
							<div class="note-evaluate-wrapper"><a href="javascript://" class="note-vote-btn" role="button" data-type="assent" data-eval="true" data-id="2015129"><i id="note-evaluate-assent-2015129" class="fa fa-angle-up note-evaluate-assent-assent" data-placement="left" data-toggle="tooltip" title="추천"></i></a><div id="content-vote-count-2015129" class="content-eval-count">0</div><a href="javascript://" class="note-vote-btn" role="button" data-type="dissent" data-eval="true" data-id="2015129"><i id="note-evaluate-dissent-2015129" class="fa fa-angle-down note-evaluate-dissent-dissent" data-placement="left" data-toggle="tooltip" title="반대"></i></a></div>
						</div>
					</div>


				</form>

				<form action="/content/delete/2015129" method="post" id="note-delete-form-2015129" ><input type="hidden" name="_method" value="DELETE" id="_method" />
				</form>
			</li>

			<li class="list-group-item note-form clearfix">


				<div class="panel-body">
					<form action="/article/addNote/734943" method="post" class="note-create-form" >

						<div class="content-body panel-body pull-left">
							<div style="margin-left: 5px;">

								<div class="note-select-indicator note-deselected">
									<i class="fa fa-edit"></i>
								</div>


								<div class='avatar avatar-medium clearfix '><a href='/user/info/94647' class='avatar-photo'><img src='//www.gravatar.com/avatar/9673f3346e67c0417b21e970fcc821cb?d=identicon&s=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/94647"  title="일당백">일당백</a> <div class="activity block"><span class="fa fa-flash"></span> 37</div></div></div>

							</div>
							<fieldset class="form">
								<input type="hidden" name="note.textType" value="HTML" id="note.textType" />
								<textarea name="note.text" id="note-create" placeholder="댓글 쓰기" class="form-control" ></textarea>
							</fieldset>
						</div>
						<div class="content-function-cog note-submit-buttons clearfix">
							<p><a href="javascript://" id="note-create-cancel-btn" class="btn btn-default btn-wide" style="display: none;">취소</a></p>
							<input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide" value=" 등록" disabled="disabled" />
						</div>
					</form>

				</div>
				<div class="panel-body">
					<h5 class="text-center"><a href="/login/auth?redirectUrl=%2Farticle%2F734930" class="link">로그인</a>을 하시면 답변을 등록할 수 있습니다.</h5>
				</div>

			</li>
		</ul>
	</div>

</div>
<%@include file="../includes/footer.jsp"%>