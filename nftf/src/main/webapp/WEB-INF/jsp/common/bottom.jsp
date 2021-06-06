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
$(document).on("keyup", "#inputPhone", function() {$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	
	if ($(this).val().length >= 13) {
		 $('#responseKeyBtn').attr('disabled', false);
		 
	} else {
		 $('#responseKeyBtn').attr('disabled', true);
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
	
	
	$("#inputCheckPw").on("keyup", function() {
		if ($('#inputCheckPw').val() != '') {
			if ($('#inputPw').val() != $(this).val()){
				$('#viewCheckPw').text('비밀번호가 일치하지 않습니다');
				$('#viewCheckPw').css('height', '50px');
				$('#viewCheckPw').css('color', '#ff495a');
				$('#data').data('checkPw', false);
			} else {
				$("#viewCheckPw").text('비밀번호가 일치합니다.');
				$('#viewCheckPw').css('height', '50px');
				$('#viewCheckPw').css('color', '#02bb18');
				$('#data').data('checkPw', true);
			} 
		} else {
			$('#viewCheckPw').css('height', '0px');
			$('#viewCheckPw').css('color', '#ffffff');
		}
	});
	
	$('#inputId').blur(function() {
		
		if ($('#inputId').val() != '') {
			 var id = {
					 "id" : $("#inputId").val()
			 }
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/check',
				type : 'POST',
				data : JSON.stringify(id),
				success : function(result) {
					if (result == true) {
						$('#viewCheckId').css('height', '50px');
						$("#viewCheckId").text('사용할 수 있는 아이디 입니다.');
						$('#viewCheckId').css('color', '#02bb18');
						$('#data').data("checkId", true);
						
					} else {
						$('#inputId').val('');
						$('#viewCheckId').css('height', '50px');
						$('#viewCheckId').text('사용할 수 없는 아이디 입니다.');
						$('#viewCheckId').css('color', '#ff495a');
						$('#data').data("checkId", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		} else {
			$('#viewCheckId').css('height', '0px');
			$('#viewCheckId').css('color', '#ffffff');
		}
	});
	
	 function receiveKey() {
		 var inputPhone = $('#inputPhone').val();
		 var inputId = $('#inputId').val();
		 
		 if (inputId != '') {
			 
			 if (inputPhone != '' && inputPhone.length >= 13) {
				 var phoneData = {
						 "id" : inputId,
						 "phone" : inputPhone
				 }
				 

				$.ajax({
					dataType : 'json',
					contentType : 'application/json; charset=utf-8;',
					url : '${pageContext.request.contextPath}/user/key/signup',
					type : 'POST',
					data : JSON.stringify(phoneData),
					success : function(result) {
						if (result == 1) {
							$('#data').data('checkPhone', true);
							$("#responseKeyBtn").attr("disabled", true);
							$("#inputPhone").attr("disabled", true);
						    $("#inputKey").attr("disabled", false);
						} else if (result == 0){
							$('#data').data('checkPhone', false);
							alert("아이디와 전화번호가 불일치 합니다.");
						} else if (result == -2) {
							$('#data').data('checkPhone', false);
							alert("이미 존재하는 전화번호 입니다.");
						} else {
							$('#data').data('checkPhone', false);
							alert("알 수 없는 오류");
						}
					}, error : function() {
						console.log("에러");
					}
				});
			 } else {
				 alert('전화번호를 입력해 주세요.');
			 }
		 } else {
			alert('아이디를 입력해 주세요.');
		}
	} 

	 $("#inputKey").blur(function() {
		if ($("#inputKey").val() != '') {
			$("#responseKeyBtn").attr("disabled", true);
		    $("#inputKey").attr("disabled", false);
		    
			$.ajax({
				dataType : 'json',
				contentType : 'application/json; charset=utf-8;',
				url : '${pageContext.request.contextPath}/user/key/check',
				type : 'POST',
				data : JSON.stringify($("#inputKey").val()),
				success : function(result) {
					if (result == true) {
						$('#viewCheckKey').text('인증번호가 일치합니다.');
						$('#viewCheckKey').css('height', '50px');
						$('#viewCheckKey').css('color', '#02bb18');
						$('#data').data("checkKey", true);
						
					} else {
						$('#inputKey').val('');
						$('#viewCheckKey').text('인증번호가 일치하지 않습니다');
						$('#viewCheckKey').css('height', '50px');
						$('#viewCheckKey').css('color', '#ff495a');
						$('#data').data("checkKey", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		} else {
			$('#viewCheckKey').css('height', '0px');
			$('#viewCheckKey').css('color', '#ffffff');
		}
	});
	 
	function guid() {
		  function _s4() {
		    return ((1 + Math.random()) * 0x10000 | 0).toString().substring(1);
		  }
		  return _s4() + _s4()  + _s4();
	}
	
	function getPinAccount() {
		
		if ($('#inputAccountNo').val() != '') {
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
				    "Bncd" : $("#inputBankNo").val(),
				    "Acno" : $("#inputAccountNo").val()
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
						$("#viewCheckAccountNo").text('인증성공');
						$('#viewCheckAccountNo').css('height', '50px');
						$('#viewCheckAccountNo').css('color', '#02bb18');
						checkPinAccount();
					} else {
						$("#viewCheckAccountNo").text('계좌 인증실패');
						$('#viewCheckAccountNo').css('height', '50px');
						$('#viewCheckAccountNo').css('color', '#ff495a');
					}
				}, error : function() {
					console.log("에러");
					$("#viewCheckAccountNo").text('계좌 인증실패');
					$('#viewCheckAccountNo').css('height', '50px');
					$('#viewCheckAccountNo').css('color', '#ff495a');
				}
			});
		} else {
			$('#viewCheckAccountNo').css('height', '0px');
			$('#viewCheckAccountNo').css('color', '#ffffff');
			alert('계좌번호를 입력해 주세요.');
		}
	}
	
	function checkPinAccount() {
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
						$("#inputPinAccount").val(result.FinAcno);
						signup();
					} else {
						$("#viewCheckAccountNo").text('핀 어카운트 발급 실패');
						$('#viewCheckAccountNo').css('height', '50px');
						$('#viewCheckAccountNo').css('color', '#ff495a');
						}
					
				}, error : function() {
					$("#viewCheckAccountNo").text('핀 어카운트 발급 실패');
					$('#viewCheckAccountNo').css('height', '50px');
					$('#viewCheckAccountNo').css('color', '#ff495a');
				}
			});
	}
	 
	function signupSubmit() {
		var phone = $('#data').data('checkPhone');
		var key = $('#data').data('checkKey');
		var id = $('#data').data('checkId');
		var pw = $('#data').data('checkPw');
		
		var no = $('#data').data('checkAccountNo');
		var pin = $('#data').data('checkPinAccount');
		
		if (id) {
			if (pw) {
				if (phone) {
					if (key) {
						/* 완료 누르면 계좌인증하고 핀어카운트받고 다 되면 서브밋 */
						$("#inputPhone").attr("disabled", false);
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
				"id" : $('#inputId').val(),
				"pw" : $('#inputPw').val(),
				"phone" : $('#inputPhone').val(),
				"bankNo" : $('#inputBankNo').val(),
				"accountNo" : $('#inputAccountNo').val(),
				"pinAccount" : $('#inputPinAccount').val(),
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
