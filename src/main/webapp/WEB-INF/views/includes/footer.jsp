<%--
  Created by IntelliJ IDEA.
  User: last2
  Date: 2020-06-29
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"%>


</div>
<div class="right-banner-wrapper">

    <div class="right-banner">
        <a href="/banner/stats/290" target="_K"><img src="//file.okky.kr/banner/1592890052184.jpg" style="width:160px;"/></a>
    </div>
    <div class="google-ad">
        <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <!-- okjspad_160x500 -->
        <ins class="adsbygoogle"
             style="display:inline-block;width:160px;height:500px"
             data-ad-client="ca-pub-8103607814406874"
             data-ad-slot="6573675943"></ins>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
    </div>

</div>
<div id="footer" class="footer" role="contentinfo">
    <div class="row">
        <div class="col-sm-9">
            <div style="float: left;margin-right: 10px;height:100px;">
                <img src="//okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png" />
            </div>
            <div>
                <a href="/intro/about">About OKKY</a>
                | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
                | <a href="/intro/ad">광고문의</a>
                | <a href="mailto:info@okky.kr">Contact</a>
                | <a href="https://www.facebook.com/okky.sns" target="_blank">Facebook</a>
                | <a href="https://github.com/okjsp/okky" target="_blank">Github</a>  v0.12
                <hr style="margin: 8px 0;"/>
                <strong>상호명</strong> : 이브레인 | <strong>대표명</strong> : 노상범 | <strong>사업자등록번호</strong> : 144-81-32887 | <strong>문의전화</strong> : 02-6925-5202
                <br/> <strong>주소</strong> : 서울 강남구 봉은사로 303 TGL경복빌딩 502호 (06103)
                <br/> @ 2020 <a href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
            </div>
        </div>
        <div class="sponsor-banner col-sm-3">
            <div class="sponsor-banner-head">Sponsored by</div>
            <div class="sponsor-banner-images">
                <a href="http://www.inames.co.kr" target="_blank"><img src="//okky.kr/assets/spb_inames-47b092113795fdf02b8d8b0f36f91c5f.png" alt="아이네임즈"/></a>
            </div>
        </div>
    </div>

</div>
</div>

</div>
<script>
    var contextPath = "", encodedURL = "%2Farticles%2Fquestions";
</script>
<script src="//okky.kr/assets/application-857e72d372e881813d8d698bad484d96.js" type="text/javascript" ></script>
<script src="//okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript" ></script>


<script>
    $(function() {
        $('.category-sort-link').click(function(e) {
            $('#category-sort-input').val($(this).data('sort'));
            $('#category-order-input').val($(this).data('order'));
            e.preventDefault();
            $('#category-filter-form')[0].submit();
        });

        $('#search-field').focus(function() {
            $('#job-filter').show();
        });

        $('#job-filter-close').click(function() {
            $('#job-filter').hide();
        });

        $('#filter-job-group li').click(function() {
            $('#filter-job-group li').removeClass('active');
            $(this).addClass('active');

            var id = $(this).data('id');

            $('.filter-duty').hide();
//                  $('.filter-duty input').prop('checked', false);
            $('#filter-duty-'+id).show();
            $('#filter-group-input').val(id);
        });
    });
</script>



<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-6707625-5', 'auto');
    ga('send', 'pageview');

</script>


<div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

<div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

</body>
</html>

