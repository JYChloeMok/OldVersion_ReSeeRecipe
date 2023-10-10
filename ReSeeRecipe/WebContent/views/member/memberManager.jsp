<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.semi.member.model.vo.Member, com.kh.semi.common.model.vo.PageInfo" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	// 페이징바 만들 때 필요한 변수 미리 세팅
	int memlistCount = pi.getListCount();
	int memlistPage = pi.getCurrentPage();
	int memStartPage = pi.getStartPage();
	int memEndPage = pi.getEndPage();
	int memMaxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자]회원 관리 </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <!-- JSON -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- GSON -->
    
    <!--GSON Ajax 통신 하기 위해 필요  -->
     
    <script type="text/javascript">
    
/*     $.getJSON("/views/member/memberManager.jsp", function(data){
		var htmlContent = "";
		data.forEach((m) => {
			htmlContent += "<tr>";
			htmlContent += "<td>"+ m.getMemNo +"<td>";
			htmlContent += "<td>"+ m.getMemName +"<td>";
			htmlContent += "<td>"+ m.getMemId +"<td>";
			htmlContent += "<td>"+ m.getMemNickName +"<td>";
			htmlContent += "<td>"+ m.getMemEmail +"<td>";
			htmlContent += "<td>"+ m.getEnrollDate +"<td>";
			htmlContent += "<td>"+ m.getMemReward +"<td>";
			htmlContent += "</tr>";
		})
		document.querySelector("#memAll tbody").innerHTML = htmlContent;
	}) */
    
	//<!-- Ajax 써보자 -->
    
 /*    function selectMembers(){
    	$.ajax({
    		url : 'hlmembermanage.ma',
    		success : function(result){
    			console.log('내가 들어왔다');
    		},
    		error : function(){
    			console.log('이래도 못들어오네');
    		}
    	})
    	
    }
     */
    </script>
    
<style>

    h2{
        text-align: center;
    }
    .totalMem{
        caption-side: top;
    }
    .w3-bar{
        text-align: center;
    }
    .header2{
        text-align: right;
    }
    .header1 > div{
        float : left;
    }

    #searchMember{
        max-width: 300px;
    }
    
    #memberdetailbtn{
        text-align : center;
    }
</style>



</head>
<body>

	<%@ include file="../manager/navbar.jsp" %>
<div class="rs-content">
	<br><br>
    <h2>[ 회원 관리 ]- 회원 정보 조회</h2>
    <br><br>
    
    <div class="container">
        <div class="header1">
            <div class="input-group mt-3 mb-3">
                <div class="input-group-prepend">
                  <button type="button" class="btn btn-warning btn-outline-secondary dropdown-toggle" data-toggle="dropdown">
                    조회
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">회원ID</a>
                    <a class="dropdown-item" href="#">닉네임</a>
                    <a class="dropdown-item" href="#">이름</a>
                  </div>
                </div>
                <input type="text" class="form-control" placeholder="검색할 내용을 입력하세요" id="searchMember" name="searchMember" required>
                <div class="input-group-append">
                    <button class="btn btn-warning" type="submit">검색</button>
                </div>
            </div>
        </div>
        <div class="header2">
            <!-- <button class="w3-button w3-round w3-yellow">작성하기</button> -->
            <button class="w3-button w3-round w3-yellow">회원 수정</button>
            <button class="w3-button w3-round w3-yellow">회원 삭제</button>
        </div>
       <!--  <h2>총 회원 <%=pi.getListCount() %>명</h2>--> 
        <table class="table" id="memAll">
            <caption class="totalMem">총 회원  <%=pi.getListCount() %>명</caption>
          <thead class="thead-light">
            <tr>
              <th>
                <div class="form-check">
                    <label class="form-check-label">
                    <!-- <input type="checkbox" class="form-check-input" value="">-->
                     <input type="checkbox"  name="example1">
                    </label>
                </div>
              </th>
              <th>번호</th>
              <th>이름</th>
              <th>회원ID</th>
              <th>닉네임</th>
              <th>이메일</th>
              <th>가입일자</th>
              <th>회원등급명</th>
            </tr>
          </thead>
          <tbody id="memAllList">
          <!-- 회원이 있을 수도 있고 없을 수도 있음 -->
          
		  <% if(list.isEmpty()) { %> 
                <!-- 회원이 없을 때 -->
                <tr>
                    <td colspan="5">회원이 존재하지 않습니다.</td>
                </tr>
		  <%} else { %> 
                <!-- 회원이 있을 때 -->
                <% for(Member m : list) { %> 
                    <tr>
                    	<td>
                			<div class="form-check">
                    		<label class="form-check-label">
                    		<input type="checkbox" name="example2">
                   		<!-- <input type="checkbox" class="form-check-input" value=""> -->	
                   			</label>
                			</div>
             			 </td>
             		   
                		<td><%= m.getMemNo()  %></td>
                		<td><%= m.getMemName() %></td>
                		<td><%= m.getMemId() %></td>
                		<td><%= m.getMemNickname() %></td>
                		<td><%= m.getMemEmail() %></td>
                		<td><%= m.getEnrollDate() %></td>
                		<td><%= m.getMemGradeName() %></td>
                	 	
                	</tr>  
               <% } %>  
			<% } %>   
			 
          </tbody>
        </table>
        
        <script>
        $(function(){
			$('#memAllList > tr').on("dbclick", detailMemberView){
				
			});
			
        	function detailMebmerView(){
        		const mno =  $(this).children().eq(1).text();
				location.href = '<%=contextPath%>/hldetailmember.ma?mno=' + mno;
        	}
		});
        
        </script>
    </div>
   
   
   
   
   
    <br><br><br><br>
    <div class="w3-bar">
    	<% if(memlistPage != 1) { %>
    		<button onclick="page('<%=memlistPage -1 %>');" class="w3-button w3-yellow">&lt;</button>
    	<% } %>
    	
    	<% for(int i = memStartPage; i <= memEndPage; i++) { %>
    		<% if(memlistPage != i) { %>
    			<button onclick="page('<%=i %>');" class="w3-button w3-yellow"><%=i %></button>
    		<% } else { %>
    			<button disabled class="w3-button w3-yellow"><%=i %></button>
    		<% } %>
    	<% } %>
    	
    	<% if(memlistPage != memMaxPage) { %>
    		<button onclick="page('<%=memlistPage + 1 %>');" class="w3-button w3-yellow">&gt;</button>
    	<% } %>
    	<!--  
        <a href="#" class="w3-button">«</a>
        <a href="#" class="w3-button w3-yellow">1</a>
        <a href="#" class="w3-button">2</a>
        <a href="#" class="w3-button">3</a>
        <a href="#" class="w3-button">4</a>
        <a href="#" class="w3-button">5</a>
        <a href="#" class="w3-button">»</a>
        -->
    </div>
</div>	
	
	<script>
	
	
		// 회원 리스트 페이징처리 함수
		function page(e){
			this.location.href = "<%=contextPath %>/hlmembermanage.ma?cmpage=" + e;
		}
		
		
		
		// 회원 정보 조회 테이블에서 회원 행을 클릭하면 자세히보기 기능
		// Ajax 통신
		/*
		$(function(){
			$('#memAllList > tr').on("click", detailMember);
		});
		function detailMember(){
			$.ajaxSettings.traditional = true;
			$.ajax({
				url : 'hldetailmember.ma',
				data : {mno : $(this).children().eq(1).text()},
				success : function(result){
					console.log(result);
					console.log('회원 상세 조회 성공');
					console.log(typeof(result.enrollDate));
					let resultStr = '';
					resultStr += '<br><br>'+ '<h2>회원 정보 상세보기</h2>'
					    	   + '<br><br>' + '<div class="container">' 
					    	   + '<div class="from-control">'
					    	   + '<table class="table">'
					      	   + '<tr>'
							   + '<th>회원번호</th>'
							   + '<td>' + result.memNo + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원이름</th>'
							   + '<td>' + result.memName + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원아이디</th>'
							   + '<td>' + result.memId + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원닉네임</th>'
							   + '<td>' + result.memNickname + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원이메일</th>'
							   + '<td>' + result.memEmail + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>가입일자</th>'
							   + '<td>' + result.enrollDate + '<td>'
							   + '</tr>'
							   + '<tr>'
							   + '<th>회원등급명</th>'
							   + '<td>' + result.memGradeName + '<td>'
							   + '</tr>' 
							   + '</table>'
					           + '<br><br>'
					           + '<div id="memberdetailbtn">'
					           + '<button id="memberupdateFormbtn" class="w3-button w3-round w3-yellow">수정하기</button>' + '\t'
					           + '<button onclick="abc()" id="memberList" class="w3-button w3-round w3-yellow">목록으로</button>'
					           + '</div>'
					           + '</div>'
					   		   + '</div>';
							   
					$('.rs-content').html(resultStr);
				},
				error : function(result){
					console.log('회원 상세 조회 실패');
					$('.rs-content').text('회원 상세 조회가 되지 않습니다');
				}
				
			})
		};
		*/
		
		/*
		$(function(){
		
			$('#memberList').click(function(){
			
				abc();
			})	
		});
		*/
		
		
//		function abc(){
			

	//	}

		
		
		
		
		
		
		/*
		$(function(){
			$('#memberupdateFormbtn').on("click", updateFormMember);
			console.log('클릭된다');
		});
		function updateFormMember(){
			$.ajax({
				url : 'hlupdatemeberForm.ma',
				data : {mno : $('.table > childredn() > eq(1).text()')},
				success : function(result){
					console.log(result);
		}
				*/
				
				
		// /hldetailmember.ma		
			
		
		
	
	</script>
	
	
</body>
</html>