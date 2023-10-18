<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 블로그</title>
 <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Black+Ops+One&family=Noto+Sans+KR&family=Parisienne&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <style>

        #sideMenu{
            border: 1px solid black;
            width: 150px;
            background-color: rgb(237, 251, 89);
            margin-top: 70px;
            
        }
        #listMenu{
            list-style: none;
            margin-top: 15px;
        }
        #listMenu > a{
            text-decoration: none;
            font-family: 'Noto Sans KR', sans-serif;
            text-align: center;
            font-weight: 700;
            color: black;
        }
        #listMenu:hover{
            background-color: rgb(224, 191, 5);
            
        }
        #sideTop{
            border: 1px solid black;
            width: 150px;
            height: 555px;
            background-color: rgb(237, 251, 89);
            
            
        }
        #sideTop p{
            float: left;
            font-size: 9px;
        }
        #memberPic{
            border: 1px solid black;
            width: 85px;
            height: 85px;
            margin-top: 30px;
            margin-left: 30px;
        }
        #md{
            border: 1px solid black;
            width: 40px;
            height: 20px;
            margin-top: 8px;
            margin-left: 22px;
        }
        #nickName{
            border: 1px solid black;
            width: 40px;
            height: 20px;
            margin-top: 100px;
            margin-left: 22px;
        }
                
        #page{
        	border: 1px solid black;
        	width:100%;
        	height: 1000px;
        	display:block;
        	margin:0 auto;
        }
        #pageCenter{
            border: 1px solid black;
        	width:100%;
        	height: 1200px;
        	display: flex;
            justify-content: center;

        }
        
        #centerMain{
        	border:1px solid black;
        	width: 1050px;
        	height:1200px;
        	float: right;

        }
        #myRecipe{
        border:1px solid black;
        width:900px;
        height:400px;
        }
        .myRecipeList{
        border:1px solid black;
        width:250px;
        height:250px;
        float: left;
        margin-left:30px;
        margin-top:30px;
        text-align: center;
        }
        
        a{
        text-decoration:none;
        color:black;
        
        }
        
        #recipePic1{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #recipePic2{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #recipePic3{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #chef{
        border:1px solid black;
        width:900px;
        height:400px;
        float: left;
        }
        .myChefList{
        border:1px solid black;
        width:250px;
        height:250px;
        float: left;
        margin-left:30px;
        margin-top:30px;
        text-align: center;
        }
        #chefPic1{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #chefPic2{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #chefPic3{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #recipeBook{
        border:1px solid black;
        width:900px;
        height:400px;
        float: left;
        }
        .myRecipeBookList{
        border:1px solid black;
        width:250px;
        height:250px;
        float: left;
        margin-left:30px;
        margin-top:30px;
        text-align: center;
        }
        #recipeBookPic1{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #recipeBookPic2{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
        #recipeBookPic3{
        border:1px solid black;
        width:180px;
        height:180px;
        margin-top:15px;
        margin-left:35px;
        margin-bottom: 10px;
        }
    </style>
</head>
<body>
    	
<%@ include file="/views/common/header.jspf" %>
        <div id="pageCenter">
        <div id="sideTop">
            <p>내 리워드: </p>
            <div id="memberPic">
                <div id="nickName">
                    <p>닉네임</p>
                </div>
                <div id="md">
                    <p>내 등급</p>
                </div>
            </div>
            <div id="sideMenu">
                <ul>
                    <li id="listMenu"><a href="<%= contextPath %>/yrmemberUpdateConfirmForm.me">회원정보 변경</a></li>
                    <li id="listMenu"><a href="<%= contextPath %>/yrmemberRewardList.mp?memNo=<%= loginMember.getMemNo() %>">리워드</a></li>
                    <li id="listMenu"><a href="<%= contextPath %>/yrmemberCouponList.mp?memNo=<%= loginMember.getMemNo() %>&selected=recentSort">쿠폰</a></li>
                    <li id="listMenu"><a href="">선물함</a></li>
                    <li id="listMenu"><a href="<%= contextPath %>/recipeBook.me">레시피북</a></li>
                    <li id="listMenu"><a href="<%= contextPath %>/subscribeChef.me">구독셰프</a></li>
                    <li id="listMenu"><a href="<%= contextPath %>/recipe.me">게시물관리</a></li>
                    <li id="listMenu"><a href="">쇼핑정보</a></li>
                    <li id="listMenu"><a href="<%= contextPath %>/dm.me">쪽지</a></li>
                    
                </ul>
                
            </div>
        </div>
        <diV id="centerMain">
    
        <div id="myRecipe">
        <h3>내 레시피</h3>
        <a href="#">더보기</a>
        	<div id="myRecipeList1" class="myRecipeList">
        	<div id="recipePic1"></div>
        	<div id="recipeTitle1"><a href="#" id="title">제목</a></div>
        	
        </div>
            <div id="myRecipeList2" class="myRecipeList">
        	<div id="recipePic2"></div>
        	<div id="recipeTitle2"><a href="#" id="title">제목</a></div>
        </div>
            <div id="myRecipeList3" class="myRecipeList">
        	<div id="recipePic3"></div>
        	<div id="recipeTitle3"><a href="#" id="title">제목</a></div>
        </div>
        
        
        </div>
        <div id="chef">
        <h3>구독셰프</h3>
        <a href="#">더보기</a>
	        <div id="myChefList1" class="myChefList">
        	<div id="chefPic1"></div>
        	<div id="chefId1"><a href="#" id="id">셰프아이디</a></div>
        </div>
	        <div id="myChefList2" class="myChefList">
        	<div id="chefPic2"></div>
        	<div id="chefId2"><a href="#" id="id">셰프아이디</a></div>
        </div>
  	        <div id="myChefList3" class="myChefList">
        	<div id="chefPic3"></div>
        	<div id="chefId3"><a href="#" id="id">셰프아이디</a></div>
        </div>
		</div>
		
		<div id="recipeBook">
        <h3>레시피북</h3>
        <a href="#">더보기</a>
	        <div id="myRecipeBook1" class="myRecipeBookList">
        	<div id="recipeBookPic1"></div>
        	<div id="recipeBookTitle1"><a href="#" id="recipeBookTt">레시피북 제목</a></div>
        </div>
	        <div id="myRecipeBook2" class="myRecipeBookList">
        	<div id="recipeBookPic2"></div>
        	<div id="recipeBookTitle2"><a href="#" id="recipeBookTt">레시피북 제목</a></div>
        </div>
	        <div id="myRecipeBook3" class="myRecipeBookList">
        	<div id="recipeBookPic3"></div>
        	<div id="recipeBookTitle3"><a href="#" id="recipeBookTt">레시피북 제목</a></div>
        </div>
		</div>
		
		
		
		
		</div>
        

		        
        </div>

       
       
       
       
      
<%@ include file="/views/common/footer.jspf" %>
        
    
</body>
</html>



















