<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>  


<style>
    /* Bordered form */
    form {
    border: 3px solid #f1f1f1;
    }

    /* Full-width inputs */
    input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    }

    /* Set a style for all buttons */
    button {
    background-color: rgb(88, 87, 87);
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    }

    /* Add a hover effect for buttons */
    button:hover {
    opacity: 0.8;
    }

    /* Add padding to containers */
    .container {
    padding: 100px 350px;
    }

    /* The "Forgot password" text */
    span.psw {
    float: right;
    padding-top: 16px;
    }

    #title{
      padding-top: 100px;
      display : flex;
      align-items: center;
      justify-content: center;
    }
    
    #updateMemberPwd{
    	display : none;
    }

    #updateMemberPwd > label{
      font-size: 12px;
      margin : 0px 0px 5px 0px;
    }

</style>

</head>
<body>
	<!-- header부분 (상단 메인 메뉴바) -->
	<%@ include file="/views/common/header.jspf" %>

    <!-- ajax로 처리 
    <form action="yrsearchMemberPwd.me" method="post">
	-->
      <h1 id="title"><b>비밀번호 찾기</b></h1>
      <div class="container">

          <input type="text" placeholder="아이디" name="memberId" required>
      
          <input type="text" placeholder="이메일" name="memberEmail" required>

          <!-- 인증코드 입력창 -->
          <input type="text" placeholder="인증코드 입력" name="certificationCode" required>
          <!-- <button type="submit">확인</button> -->
          <button type="button" onclick="searchMemberPwd();">확인</button>
          
          <div id="searchMemberPwd"> </div>

          <!-- 비밀번호 재설정 -->
          <div id="updateMemberPwd">
	          <input type="password" placeholder="비밀번호 재설정" name="memberPwd" maxlength="20" required>
            <label for="memberPwd">* 영문, 숫자, 특수문자(!@#$+^*) 포함 8 ~ 20자로 입력 가능합니다.</label>
	          <input type="password" placeholder="비밀번호 재설정 확인" name="memberPwdCheck" maxlength="20" required>
            <label for="memberPwdCheck">* 비밀번호가 일치하지 않습니다.</label>
	      	  <button type="button" id="updatePwdBtn" onclick="updateMemberPwd();">비밀번호 재설정하기</button>
          </div>
	          <button type="button" onclick="location.href='<%= contextPath %>/yrloginForm.me'">로그인하러 가기</button>
        </div>
        
      <!-- </form> -->
      
    <!-- footer 푸터영역 -->
	<%@ include file="/views/common/footer.jspf" %>
	
	<script>
		const $memberId = $('input[name=memberId]');
		const $memberEmail = $('input[name=memberEmail]');
	
		function searchMemberPwd(){
			$.ajax({
				url : 'yrsearchMemberPwd.me',
				data : {memberId : $memberId.val(),
						memberEmail : $memberEmail.val()},
				success : function(result){
					if(result == 'null'){
						$('#searchMemberPwd').text('조회된 결과가 없습니다.');
					} else{
						$('#searchMemberPwd').text('비밀번호 재설정');
						$('#updateMemberPwd').attr('style', "display:block;");
					}
				},
				error : function(){
					console.log('비밀번호 찾기 AJAX통신 실패!');
				}
			})
		};
		
		const $memberPwd = $('input[name=memberPwd]');
		const $memberPwdCheck = $('input[name=memberPwdCheck]');

    // 비밀번호 재설정 유효성 검사
    // 비밀번호 (영문 숫자 특수문자 !@#$+^* 포함 8 ~ 20자)
    $(function(){
      $('input[name=memberPwd]').keyup(function(){

        var $regExp = /^[a-zA-Z0-9!@#$+^*]{8,20}$/;
        
        if(!$regExp.test($('input[name=memberPwd]').val())){
          $('label[for="memberPwd"]').css('color', 'red');
          $('#updatePwdBtn').attr('disabled', true);
        } else{
          $('label[for="memberPwd"]').css('color', 'black');
          $('#updatePwdBtn').attr('disabled', false);
        }
      })
    })
		
		function updateMemberPwd(){
			
			if($memberPwd.val() != $memberPwdCheck.val()){
				console.log("비밀번호 달라");
        $('label[for="memberPwdCheck"]').text("* 비밀번호가 일치하지 않습니다.").css('color', 'red');
			} else{ // 비밀번호 재설정 및 확인 동일작성
			$.ajax({
				url : 'yrupdateMemberPwd.me',
				data : {memberId : $memberId.val(),
						memberPwd : $memberPwd.val()		
				},
				success : function(result){
					if(result == 'S'){
						Swal.fire({
							  title: '비밀번호 재설정 성공',
							  text: "비밀번호가 변경되었습니다.",
							  icon: 'success',
							  confirmButtonColor: '#3085d6',
							  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
							  $(location).attr("href", "views/member/memberLogin.jsp");
						  }
						})

					} else{
						// ★★★★★★★★★★★★여기서 jsp로 보내니까 다시 입력하면 AJAX통신 오류가 뜸
            Swal.fire({
							  title: '비밀번호 재설정 실패',
							  text: "다시 시도해 주십시오.",
							  icon: 'error',
							  confirmButtonColor: '#d33',
							  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.isConfirmed) {
							  
							  $(location).attr("href", "views/member/searchMemberPwdForm.jsp");
						  }
						})
					}

				},
				error : function(){
					console.log('비밀번호 재설정 AJAX통신 실패!');
				}
			})
			}
    };
	
	</script>

  </body>
</html>