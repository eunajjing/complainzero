<%@ page contentType="text/html; charset=utf-8"%> 
<!--
date : 19-01-10
내용 : 뷰단 초기 설정 진행
date : 19-01-19
내용 : 버튼 정렬 수
작성자 : 고은아
-->
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('https://cdn.pixabay.com/photo/2017/05/24/12/08/broken-triangle-2340393__340.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>당신의 불만을 기다립니다</h3>
              <p>자유로운 불만 공유 사이트</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('https://png.pngtree.com/thumb_back/fw800/back_pic/03/61/31/0557a7322b6c277.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>시장 제품의 문제점에 대해 알아보세요</h3>
              <p>불만글을 토대로 새로운 아이디어를 창출해보세요</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
	 	<div class="carousel-item" style="background-image: url('https://png.pngtree.com/thumb_back/fw800/back_pic/03/62/14/2357a9a0f6e00b5.jpg')">
            <div class="carousel-caption d-none d-md-block">
              <h3>The world is an infinitely better place precisely because you weren't</h3>
              <p>The Imitation Game, 2014</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">

      <!-- 인기 게시글 시작 -->
      <br>
      <h2>인기 게시글</h2>
      <br>
      <div class="row">
      <%for(int i = 0 ; i< 6 ; i++) { %>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="https://pbs.twimg.com/media/Dd2nz3iU8AEnyWu.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project One</a>
              </h4>
              <p class="card-text">몇 글자까지 프론트에서 감당할 수 있을지를 시험하고 있습니다. 나중에 글자 수를 세면 되겠지? 더 써야겠네 아직도 중반이네
              세상에 그래서 얼마나 써야 되는 거야 할 말도 없어 죽겠구만 오 여기까지다</p>
              <!-- 124 자수 204 byte -->
            </div>
          </div>
        </div>
        <%} %>
      </div>
        <div class="rightOutDiv">
	        <div class="rightInDiv">
	          	<a class="btn btn-secondary" href="boardForm.do">더보기</a>
	      	</div>
        </div>
      <!-- 인기 게시글 끝 -->
       <!-- 최근 게시글 시작 -->
      <hr>
      <h2>최근 게시글</h2>
		<br>
      <br>
      <div class="row">
      <%for(int i = 0 ; i< 6 ; i++) { %>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="https://pbs.twimg.com/profile_images/975015892579893249/3ezbF4DG_400x400.jpg" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project One</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt?</p>
            </div>
          </div>
        </div>
        <%} %>
      </div>
        <div class="rightOutDiv">
	        <div class="rightInDiv">
	          	<a class="btn btn-secondary" href="boardForm.do">더보기</a>
	      	</div>
        </div>
      <!-- 최근 게시글 끝 -->

    </div>
    <!-- /.container -->
<br><br>
    