<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<!-- 버튼 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 아이콘 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
	/* 기본 아우터 div 세팅 */
	#recipe-sort-bar-wrap {
		width: 1000px;
		height: 50px;
		margin: auto;
		box-sizing: border-box;
	}

	/* div요소 기본 세팅 */
	div { box-sizing: border-box; }
	
	/* h3요소 기본세팅 */
	h3 {
		margin : 0px;
		padding : 7%;
		font-size: 20px;
		display: inline-block;
	}

	/**********************************************************/
	/* 메뉴바 내부 div 블록들 전체 세팅 */
	#recipe-sort-bar-wrap > div {
		height: 100%;
		float: left;
		text-align: center;
	}
	/**********************************************************/
	/* 아이콘이미지 div블록 세팅 */
	#recipe-sort-bar-img {width: 4%;}

	/* 정렬기준 + 글쓰기 div 블록 세팅 */
	.recipe-sort-bar-menu {
		width: 15%;
	}

	/* 검색 div 블록 세팅 */
	#recipe-search-area {
		width: 21%;
	}

	#recipe-search-area div {
		height: 100%;
		padding-top: 4.5%;
	}

	/* 검색창 세팅 */
	#recipe-keyword-search-box {
		width: 80%;
		height: 70%;
		box-sizing: border-box;
		border: 2px solid rgb(255, 145, 77);
		border-radius: 5px;
	}

	#recipe-keyword-search-box::placeholder {
		font-size: 1px;
		text-align: center;
		color: rgb(175, 175, 175);
	}

	#recipe-keyword-search-btn {
		font-size:15px;
		padding: 0px;
		padding-bottom: 2%;
		color: rgb(255, 145, 77);
	}




	div {border:1px solid black; }
</style>
</head>
<body>

	<div id="recipe-sort-bar-wrap">
		<div id="recipe-sort-bar-img">
			<img src="#"><!--아이콘 이미지 삽입필요-->
		</div>
		<!-- 레시피 정렬 기준 + 글작성버튼 -->
		<div class="recipe-sort-bar-menu">
			<input type="hidden" value="selectRecipeListLt">
			<h3 class="recipe-sort-by">최신순</h3>
		</div>
		<div class="recipe-sort-bar-menu">
			<input type="hidden" value="selectRecipeListHt">
			<h3 class="recipe-sort-by">좋아요순</h3>
		</div>
		<div class="recipe-sort-bar-menu">
			<input type="hidden" value="selectRecipeListVw">
			<h3 class="recipe-sort-by">조회수순</h3>
		</div>
		<div class="recipe-sort-bar-menu">
			<input type="hidden" value="selectRecipeListPo">
			<h3 class="recipe-sort-by">인기셰프순</h3>
		</div>
		<div class="recipe-sort-bar-menu">
			<input type="hidden" value="insertRecipe">
			<h3 class="recipe-sort-by">글작성</h3>
		</div>
		<!-- 레시피 키워드 검색창 -->
		<div id="recipe-search-area">
			<div>
				<form action="#" method="get">
					<input type="search" id="recipe-keyword-search-box" name="recipeSearchWord" placeholder="키워드를 입력하세요">
					<button type="submit" id="recipe-keyword-search-btn" class="fa fa-search btn"></button>
				</form>
			</div>
		</div>
	</div>
	

	<!-- 정렬기준에 맞게 레시피리스트 조회 요청 -->
	<script>
		$(function(){
			$('.recipe-sort-by').click(function(){
				const sortBy = $(this).siblings().val();
				location.href = '<%= request.getContextPath() %>/' + sortBy + '.re';
			})
		})
	</script>



</body>
</html>