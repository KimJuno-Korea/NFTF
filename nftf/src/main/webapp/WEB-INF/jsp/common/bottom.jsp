<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:eval expression="@environment.getProperty('payment.accesstoken')" var="accesstoken" />
<spring:eval expression="@environment.getProperty('payment.iscd')" var="iscd" />   
	<footer class="gray">
		<div class="block">
			<div class="row">
				<div class="col-lg-12">
					<div class="widget">
						<div class="mega-widget">
							<div class="row">
								<div class="col-lg-2" style="vertical-align: middle;">
									<div class="image-area">
									<a class="logo" href="${pageContext.request.contextPath}/index" ><img class="logo-black" src="${pageContext.request.contextPath}/customimages/TRADING365__.png" alt=""></a>
									</div>
								</div>
								<div class="col-lg-4">
									<span>종합 프로젝트 2021</span>
									<span>비 대면 중고거래 시스템 Trading 365</span>
								</div>
								<div class="col-lg-6">
									<span>팀 삼위일체</span>
									<span>@김준오 @박주현 @김도현</span>
									<span>#선문대학교</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom-line style2">
			<span>© 2021 Trading 365 All rights reserved. Design by Creative Layers</span>
			<a href="#scrollup" class="scrollup" title=""><i class="la la-arrow-up"></i></a>
		</div>
	</footer>
</body>

 <!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- Bootstrap Js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Slick Js -->
<script defer src="${pageContext.request.contextPath}/js/slick.min.js"></script>
<!-- Main Js -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<!-- Add Main JS -주현 -->


<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/modernizr.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/script.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/slick.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/parallax.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/select-chosen.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.scrollbar.min.js" type="text/javascript"></script>
<script>
	var openBtn = $('#openMenu');
	var topMenu = $('#topMenu');
	var topHidden = $('#topHidden');
	var menuIcon = $('#menuIcon');
	var signupModal = $('#signupModal');
	var showSignup = $('#showSignup');
	var closeSignupBtn = $('#closeSignupBtn');
	var closeLoginBtn = $('#closeLoginBtn');
	var showLogin = $('#showLogin');
	var loginModal = $('#loginModal');
	var showSignup2 = $('#showSignup2');
	var showLogin2 = $('#showLogin2');
	
	closeSignupBtn.click(function() {
		signupModal.modal('hide');
	});
	
	closeLoginBtn.click(function() {
		loginModal.modal('hide');
	});

	openBtn.click(function(){
		if (topMenu.css('visibility') != 'hidden') {
			topMenu.css('visibility', 'hidden');
			topMenu.css('opacity', '0');
			topMenu.css('height', '0');
			topHidden.css('margin-bottom', '150px');
			menuIcon.attr('src', '${pageContext.request.contextPath}/customimages/menu.png');
			
		} else {
			topMenu.css('visibility', 'visible');
			topMenu.css('opacity', '1');
			topMenu.css('height', '300px');
			topHidden.css('margin-bottom', '450px');
			menuIcon.attr('src', '${pageContext.request.contextPath}/customimages/menu-close.png');
		}
	});
	
	showSignup.click(function() {
		signupModal.modal('show');
	});
	
	showLogin.click(function() {
		loginModal.modal('show');
	});
	
	showSignup2.click(function() {
		signupModal.modal('show');
	});
	
	showLogin2.click(function() {
		loginModal.modal('show');
	});
	
	//검증 , 정규식 사용해야됨
$(document).on("keyup", "#signupInputPhone", function() {$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	
	if ($(this).val().length >= 13) {
		 $('#signupResponseKeyBtn').attr('disabled', false);
		 
	} else {
		 $('#signupResponseKeyBtn').attr('disabled', true);
	}
});
	
	function getNow() {
		var now = new Date();
		var year = now.getFullYear();
		var month;
		var day;
		
		if (now.getDate() < 10) {
			day = "0" + (now.getDate());
		} else {
			day = now.getDate();
		}
		
		if (now.getMonth() < 9) {
			month = "0" + (now.getMonth() + 1);
		} else {
			month = now.getMonth() + 1;
		}
		
		return year + month + day;
	}
	
	
	$("#signupInputCheckPw").on("keyup", function() {
		if ($('#signupInputCheckPw').val() != '') {
			if ($('#signupInputPw').val() != $(this).val()){
				$('#signupViewCheckPw').text('비밀번호가 일치하지 않습니다');
				$('#signupViewCheckPw').css('height', '50px');
				$('#signupViewCheckPw').css('color', '#ff495a');
				$('#signupData').data('signupCheckPw', false);
			} else {
				$("#signupViewCheckPw").text('비밀번호가 일치합니다.');
				$('#signupViewCheckPw').css('height', '50px');
				$('#signupViewCheckPw').css('color', '#02bb18');
				$('#signupData').data('signupCheckPw', true);
			} 
		} else {
			$('#signupViewCheckPw').css('height', '0px');
			$('#signupViewCheckPw').css('color', '#ffffff');
		}
	});
	
	$('#signupInputId').blur(function() {
		
		if ($('#signupInputId').val() != '') {
			 var id = {
					 "id" : $("#signupInputId").val()
			 }
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/check',
				type : 'POST',
				data : JSON.stringify(id),
				success : function(result) {
					if (result == true) {
						$('#signupViewCheckId').css('height', '50px');
						$("#signupViewCheckId").text('사용할 수 있는 아이디 입니다.');
						$('#signupViewCheckId').css('color', '#02bb18');
						$('#signupData').data("signupCheckId", true);
						
					} else {
						$('#signupInputId').val('');
						$('#signupViewCheckId').css('height', '50px');
						$('#signupViewCheckId').text('사용할 수 없는 아이디 입니다.');
						$('#signupViewCheckId').css('color', '#ff495a');
						$('#signupData').data("signupCheckId", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		} else {
			$('#signupViewCheckId').css('height', '0px');
			$('#signupViewCheckId').css('color', '#ffffff');
		}
	});
	
	 function signupReceiveKey() {
		 var signupInputPhone = $('#signupInputPhone').val();
		 var signupInputId = $('#signupInputId').val();
		 
		 if (signupInputId != '') {
			 
			 if (signupInputPhone != '' && signupInputPhone.length >= 13) {
				 var phoneData = {
						 "id" : signupInputId,
						 "phone" : signupInputPhone
				 }
				 

				$.ajax({
					dataType : 'json',
					contentType : 'application/json; charset=utf-8;',
					url : '${pageContext.request.contextPath}/user/key/signup',
					type : 'POST',
					data : JSON.stringify(phoneData),
					success : function(result) {
						if (result == 1) {
							$('#signupData').data("signupCheckPhone", true);
							$("#signupResponseKeyBtn").attr("disabled", true);
							$("#signupInputPhone").attr("disabled", true);
						    $("#signupInputKey").attr("disabled", false);
						} else if (result == 0){
							$('#signupData').data('signupCheckPhone', false);
							alert("아이디와 전화번호가 불일치 합니다.");
						} else if (result == -2) {
							$('#signupData').data('signupCheckPhone', false);
							alert("이미 존재하는 전화번호 입니다.");
						} else {
							$('#signupData').data('signupCheckPhone', false);
							alert("알 수 없는 오류");
						}
					}, error : function() {
						console.log("에러");
					}
				});
			 } else {
				 alert('전화번호가 올바르지 않습니다.');
			 }
		 } else {
			alert('아이디를 입력해 주세요.');
		}
	} 

	 $("#signupInputKey").blur(function() {
		if ($("#signupInputKey").val() != '') {
			$("#signupResponseKeyBtn").attr("disabled", true);
		    $("#signupInputKey").attr("disabled", false);
		    
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/key/check',
				type : 'POST',
				data : JSON.stringify($("#signupInputKey").val()),
				success : function(result) {
					if (result == true) {
						$('#signupViewCheckKey').text('인증번호가 일치합니다.');
						$('#signupViewCheckKey').css('height', '50px');
						$('#signupViewCheckKey').css('color', '#02bb18');
						$('#signupData').data("signupCheckKey", true);
						
					} else {
						$('#signupInputKey').val('');
						$('#signupViewCheckKey').text('인증번호가 일치하지 않습니다');
						$('#signupViewCheckKey').css('height', '50px');
						$('#signupViewCheckKey').css('color', '#ff495a');
						$('#signupData').data("signupCheckKey", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		} else {
			$('#signupViewCheckKey').css('height', '0px');
			$('#signupViewCheckKey').css('color', '#ffffff');
		}
	});
	 
	function guid() {
		  function _s4() {
		    return ((1 + Math.random()) * 0x10000 | 0).toString().substring(1);
		  }
		  return _s4() + _s4()  + _s4();
	}
	
	function getPinAccount() {
		
		if ($('#signupInputAccountNo').val() != '') {
			var data = {
				    "Header": {
				        "ApiNm": "OpenFinAccountDirect",
				        "Tsymd": getNow(),
				        "Trtm": "000000",
				        "Iscd": "${iscd}",
				        "FintechApsno": "001",
				        "ApiSvcCd": "DrawingTransferA",
				        "IsTuno": guid(),
				        "AccessToken": "${accesstoken}"
				    },
				    "DrtrRgyn" : "N",
				    "BrdtBrno" : "20210520",
				    "Bncd" : $("#signupInputBankNo").val(),
				    "Acno" : $("#signupInputAccountNo").val()
				}
			
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : 'https://developers.nonghyup.com/OpenFinAccountDirect.nh',
				type : 'POST',
				data : JSON.stringify(data),
				success : function(result) {
					if (result.Rgno != null) {
						$("#rgno").text(result.Rgno);
						$("#signupViewCheckAccountNo").text('인증성공');
						$('#signupViewCheckAccountNo').css('height', '50px');
						$('#signupViewCheckAccountNo').css('color', '#02bb18');
						signupCheckPinAccount();
					} else {
						$("#signupViewCheckAccountNo").text('계좌 인증실패');
						$('#signupViewCheckAccountNo').css('height', '50px');
						$('#signupViewCheckAccountNo').css('color', '#ff495a');
					}
				}, error : function() {
					console.log("에러");
					$("#signupViewCheckAccountNo").text('계좌 인증실패');
					$('#signupViewCheckAccountNo').css('height', '50px');
					$('#signupViewCheckAccountNo').css('color', '#ff495a');
				}
			});
		} else {
			$('#signupViewCheckAccountNo').css('height', '0px');
			$('#signupViewCheckAccountNo').css('color', '#ffffff');
			alert('계좌번호를 입력해 주세요.');
		}
	}
	
	function signupCheckPinAccount() {
			var data = {
				    "Header": {
				        "ApiNm": "CheckOpenFinAccountDirect",
				        "Tsymd": getNow(),
				        "Trtm": "000000",
				        "Iscd": "${iscd}",
				        "FintechApsno": "001",
				        "ApiSvcCd": "DrawingTransferA",
				        "IsTuno": guid(),
				        "AccessToken": "${accesstoken}"
				    },
				    "Rgno" : $("#rgno").text(),
				    "BrdtBrno" : "20210520"
				}
			
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : 'https://developers.nonghyup.com/CheckOpenFinAccountDirect.nh',
				type : 'POST',
				data : JSON.stringify(data),
				success : function(result) {
					if (result.FinAcno != null) {
						$("#signupInputPinAccount").val(result.FinAcno);
						signup();
					} else {
						$("#signupViewCheckAccountNo").text('핀 어카운트 발급 실패');
						$('#signupViewCheckAccountNo').css('height', '50px');
						$('#signupViewCheckAccountNo').css('color', '#ff495a');
						}
					
				}, error : function() {
					$("#signupViewCheckAccountNo").text('핀 어카운트 발급 실패');
					$('#signupViewCheckAccountNo').css('height', '50px');
					$('#signupViewCheckAccountNo').css('color', '#ff495a');
				}
			});
	}
	 
	function signupSubmit() {
		var phone = $('#signupData').data('signupCheckPhone');
		var key = $('#signupData').data('signupCheckKey');
		var id = $('#signupData').data('signupCheckId');
		var pw = $('#signupData').data('signupCheckPw');
		
		var no = $('#signupData').data('signupCheckAccountNo');
		var pin = $('#signupData').data('signupCheckPinAccount');
		
		if (id) {
			if (pw) {
				if (phone) {
					if (key) {
						/* 완료 누르면 계좌인증하고 핀어카운트받고 다 되면 서브밋 */
						$("#signupInputPhone").attr("disabled", false);
						getPinAccount();
					} else {
						alert('인증번호를 입력해 주세요.');
					}
				} else {
					alert('전화번호를 입력해 주세요.');
				}
			} else {
				alert('비밀번호를 입력해 주세요');
			}
		} else {
			alert('아이디 중복확인을 해주세요.');
		}
	} 
	
	function signup() {
		var data = {
				"id" : $('#signupInputId').val(),
				"pw" : $('#signupInputPw').val(),
				"phone" : $('#signupInputPhone').val(),
				"bankNo" : $('#signupInputBankNo').val(),
				"accountNo" : $('#signupInputAccountNo').val(),
				"pinAccount" : $('#signupInputPinAccount').val(),
				"division" : "M",
				"email" : ""
		}
		
		$.ajax({
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			url : '${pageContext.request.contextPath}/user',
			type : 'POST',
			data : JSON.stringify(data),
			success : function(result) {
				if (result) {
					location.reload();
					alert('회원가입을 성공했습니다.');
				} else {
					alert('회원가입에 실패하였습니다.');
				}
			}, error : function() {
				console.log("에러");
			}
		});
	}
	
	function login() {
		var loginInputId = $('#loginInputId');
		var loginInputPw = $('#loginInputPw');
		
		if (loginInputId.val() != '') {
			if (loginInputPw.val() != '') {
				
				var data = {
						"id" : loginInputId.val(),
						"pw" : loginInputPw.val()
				}
				
				$.ajax({
					dataType : 'json',
					contentType : 'application/json; charset=utf-8;',
					url : '${pageContext.request.contextPath}/login',
					type : 'POST',
					data : JSON.stringify(data),
					success : function(result) {
						if (result) {
							location.reload();
						} else {
							alert('로그인에 실패하였습니다.');
						}
					}, error : function() {
						console.log("에러");
					}
				});
				
			} else {
				alert('비밀번호를 입력해 주세요');
			}
		} else {
			alert('아이디를 입력해 주세요');
		}
	}
</script>
