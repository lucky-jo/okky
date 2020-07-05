# okky - Clone - 팀 프로젝트

okky web-site_Clone / <https://okky.kr/>

### 팀원 소개

 * Project Manager 조재복 - last2599@gmail.com / <https://github.com/ildang100>

 * 이재성 - 이메일 / git

 * 김창대 - 이메일 / git

 * 엄만성 - 이메일 / git

### 역활 분담

 * PM 조재복 - Spring MVC 구현 설계 , FrontEnd 전체 , git merge , QnA 게시판 전체 , Tech 게시판  전체 , 각 팀원 Spring MVC에 대한 이해와 교육

 * 이재성 - Jobs 게시판 전체

 * 김창대 - Community 게시판 전체

 * 엄만성 - Column 게시판 전체


### 기능 구현
 * 조재복
    * 게시글 조회시 하루에 1번만 조회수 증가(중복증가 방지)
    * 댓글 작성시, 게시글의 댓글 수 증가
    * 좋아요 증가, 감소 기능 (중복 방지)
    * 트랜잭션 처리 
       * 글 조회 / 조회수 증가 / 회원활동 점수증가
       * 글 작성 / 회원활동 점수 증가
       * 글 삭제 / 회원활동 점수 감소
       * 
       * 댓글 작성 / 해당 글 댓글 갯수 증가 / 회원활동 점수 증가
       * 댓글 삭제 / 댓글 갯수 감소 / 회원활동 점수 감소
       