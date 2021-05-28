<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<div class="row">
		<h2>회원 가입</h2>
		<div class="col-lg-4 col-sm-7 col-10 mt-sm-5">
			<form id="form" action="${pageContext.request.contextPath}/user" method="post" >
				<div class="row">
					<input id="inputId" type="text" name="id" placeholder="아이디" maxlength="30" > <div id="viewCheckId" class="checkFont"></div>
					<input id="inputPw" type="text" name="pw" placeholder="비밀번호" maxlength="30"> <br>
					<input id="inputCheckPw" type="text" name="pwCheck" placeholder="비밀번호 확인" maxlength="30"> <div id="viewCheckPw" class="checkFont"></div>
					<input id="inputPhone" type="text" name="phone" placeholder="전화번호" maxlength="14" > <input type="button" id="responseKeyBtn" onclick="receiveKey()" value="인증번호 발송"><br>
					<input id="inputKey" type="text" name="key" placeholder="인증번호" disabled="disabled" maxlength="6" required> <div id="viewCheckKey" class="checkFont"></div>
					<select id="inputBankNo" name="bankNo">
						<option value="011" selected="selected">농협은행</option>
						<option value="012">농협상호금융</option>
						<option value="002">산업은행</option>
						<option value="003">기업은행</option>
						<option value="004">국민은행</option>
						<option value="081">KEB하나은행</option>
						<option value="020">우리은행</option>
						<option value="023">SC제일은행</option>
						<option value="045">새마을금고</option>
						<option value="088">신한은행</option>
						<option value="090">카카오뱅크</option>
					</select>
					<input id="inputAccountNo" type="text" name="accountNo" placeholder="계좌번호 (- 제외)"> <input id="checkAccountNo" type="button" onclick="getPinAccount()" value="계좌인증">
					<div id="viewCheckAccountNo" class="checkFont"></div>
					<input id="inputPinAccount" type="hidden" name="pinAccount">
					<input id="division" type="hidden" name="division" value="M">
					<input id="email" type="hidden" name="email" value="">
					<input id="rgno" type="hidden">
					<div id="data"></div>
			 	</div>
				<div class="row">
					<input type="button" id="signupBtn" onclick="signupSubmit()" value="가입하기">
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
//검증 , 정규식 사용해야됨
$(document).on("keyup", "#inputPhone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
	
	function getNow() {
		var now = new Date();
		var year = now.getFullYear();
		var month;
		var day = now.getDate().toString();
		
		if (now.getMonth() < 9) {
			month = "0" + (now.getMonth() + 1);
		} else {
			month = now.getMonth() + 1;
		}
		
		return year + month + day;
	}
	
	$("#inputCheckPw").blur(function() {
		if ($('#inputPw').val() != '') {
			if ($('#inputPw').val() != $(this).val()){
				$('#inputCheckPw').val('');
				$('#viewCheckPw').text('비밀번호가 일치하지 않습니다');
				$('#viewCheckPw').css('color', 'red');
				$('#data').data('checkPw', false);
			} else {
				$("#viewCheckPw").text('비밀번호가 일치합니다.');
				$('#viewCheckPw').css('color', 'green');
				$('#data').data('checkPw', true);
			} 
		}
	});
	
	$('#inputId').blur(function() {
		if ($('#inputId') != null) {
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
						$("#viewCheckId").text('사용할 수 있는 아이디 입니다.');
						$('#viewCheckId').css('color', 'green');
						$('#data').data("checkId", true);
						
					} else {
						$('#inputId').val('');
						$('#viewCheckId').text('사용할 수 없는 아이디 입니다.');
						$('#viewCheckId').css('color', 'red');
						$('#data').data("checkId", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		}
	});
	
	 function receiveKey() {
		 var phoneData = {
				 "id" : $("#inputId").val(),
				 "phone" : $("#inputPhone").val()
		 }
		 
		$("#responseKeyBtn").attr("disabled", true);
		$("#inputPhone").attr("disabled", true);
	    $("#inputKey").attr("disabled", false);
		$.ajax({
			dataType : 'json',
			contentType : 'application/json; charset=utf-8;',
			url : '${pageContext.request.contextPath}/user/key/signup',
			type : 'POST',
			data : JSON.stringify(phoneData),
			success : function(result) {
				if (result == 1) {
					$('#data').data('checkPhone', true);
				} else if (result == 0){
					$('#data').data('checkPhone', false);
					alert("아이디와 전화번호가 불일치 합니다.");
				} else {
					$('#data').data('checkPhone', false);
					alert("알 수 없는 오류");
				}
			}, error : function() {
				console.log("에러");
			}
		});
	} 

	 $("#inputKey").blur(function() {
		if ($("#inputKey").val() != null) {
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
						$("#viewCheckKey").text('인증번호가 일치합니다.');
						$('#viewCheckKey').css('color', 'green');
						$('#data').data("checkKey", true);
						
					} else {
						$('#inputKey').val('');
						$('#viewCheckKey').text('인증번호가 일치하지 않습니다');
						$('#viewCheckKey').css('color', 'red');
						$('#data').data("checkKey", false);
					}
				}, error : function() {
					console.log("에러");
				}
			});
		}
	});
	 
	function guid() {
		  function _s4() {
		    return ((1 + Math.random()) * 0x10000 | 0).toString().substring(1);
		  }
		  return _s4() + _s4()  + _s4();
	}
	
	
	
	function getPinAccount() {
		var data = {
			    "Header": {
			        "ApiNm": "OpenFinAccountDirect",
			        "Tsymd": getNow(),
			        "Trtm": "000000",
			        "Iscd": "000964",
			        "FintechApsno": "001",
			        "ApiSvcCd": "DrawingTransferA",
			        "IsTuno": guid(),
			        "AccessToken": "d75c7bca19d5354441a7b338903a60dcf7caad919f106fc3a004f8a67a5d6860"
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
					$('#viewCheckAccountNo').css('color', 'green');
					$('#data').data("checkAccountNo", true);
					checkPinAccount();
				}
			}, error : function() {
				console.log("에러");
				$("#viewCheckAccountNo").text('인증실패');
				$('#viewCheckAccountNo').css('color', 'red');
				$('#data').data("checkAccountNo", false);
			}
		});
	}
	
	
	function checkPinAccount() {
			var data = {
				    "Header": {
				        "ApiNm": "CheckOpenFinAccountDirect",
				        "Tsymd": getNow(),
				        "Trtm": "000000",
				        "Iscd": "000964",
				        "FintechApsno": "001",
				        "ApiSvcCd": "DrawingTransferA",
				        "IsTuno": guid(),
				        "AccessToken": "d75c7bca19d5354441a7b338903a60dcf7caad919f106fc3a004f8a67a5d6860"
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
						$('#data').data('checkPinAccount', true);
					}
				}, error : function() {
					console.log("에러");
					$('#data').data('checkPinAccount', false);
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
						if (no) {
							if (pin) {
								$("#inputPhone").attr("disabled", false);
								$('#form').submit();
							} else {
								alert('핀 어카운트 생성 실패');
							}
						} else {
							alert('계좌 인증을 해주세요');
						}
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
</script>
</html>