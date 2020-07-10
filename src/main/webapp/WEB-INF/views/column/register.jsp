<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@include file="../includes/header.jsp"%>
<script src="/resources/jqLib/jquery-3.2.1.min.js"></script>
<script src="/resources/jqLib/comunityCheck.js"></script>
<script>
	function del() {
		if (confirm("정말 삭제하시겠습니까?") == true) {
			document.remove.submit();
		} else {
			return;
		}
	} // del()
</script>

<ul class="nav nav-sidebar nav-main">

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a href="/qna/list" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a href="/tech/list" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a href="/comunity/list" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

	<li  class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a href="/column/list" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

	<li  data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a href="/jobs/list" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

</ul>

<ul class="nav nav-sidebar nav-bottom">
	<li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
</ul>
</div>
        <div class="sidebar-category-nav">
            <h3 class="sub-title">칼럼</h3>
            	<ul class="nav">
		<li><a href="/column/list?sorted=" class="link"><span
				class="nav-sidebar-label nav-sidebar-category-label">All</span><span
				class='nav-indicator <c:out value="${pageMaker.cri.category eq null ? 'nav-selected':''}" /> '><span
					class="nav-selected-dot"></span></span></a></li>
	</ul>
            <div class="special-nav">
            </div>
        </div>



<div id="article-create" class="content" role="main">

	<div class="content-header">
		<h3>새 글 쓰기</h3>
	</div>
	<div class="panel panel-default clearfix">
		<div class="panel-heading clearfix">
			<div class='avatar avatar-medium clearfix pull-left'>
				<a href='/user/info/94647' class='avatar-photo'><img
					src='//www.gravatar.com/avatar/9673f3346e67c0417b21e970fcc821cb?d=identicon&s=40' /></a>
				<div class="avatar-info">
					<a class="nickname" href="/user/info/94647" title="일당백">일당백</a>
					<div class="activity block">
						<span class="fa fa-flash"></span> 37
					</div>
				</div>
			</div>

		</div>
		<div class="panel-body">
			<form action="/column/register" method="post"
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
							<select id="category" name="category" class="form-control"
								required="">
								<option value="default">게시판을 선택해 주세요.</option>

								<option value="Tech Q&A" data-external="" data-anonymity="false">
									Tech Q&A</option>
								<option value="Blockchain Q&A" data-external=""
									data-anonymity="false">Blockchain Q&A</option>
							</select>
						</div>
					</div> -->

					<div class="form-group  has-feedback">
						<div>
							<input type="text" name="title" required="" value=""
								placeholder="제목을 입력해 주세요." class="form-control" id="title" />
						</div>
					</div>

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
                                    <a href="/column/list" class="btn btn-default btn-wide" onclick="return confirm(&#39;정말로 취소하시겠습니까?&#39;)">취소</a>
                                    <input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="등록" id="create" />
                                    <input type="hidden" name="id" value="<sec:authentication property="principal.username"/>">
                                </fieldset>
                            </div>
					
				</fieldset>
			</form>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>