<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
var no = '${list.no}'; //게시글 번호

function branchInfo() {
	console.log('no : ' + no);
	$.ajax({
		url :'/branchName',
		type : 'post',
		data : {'no':no},
		success : function(data) {
			console.log(data);
			document.getElementById(branchName).innerHTML = data;
		}
	});
}

$(document).ready(function(){
	branchInfo(boardNo); //페이지 로딩시 거래방식 거래함인 게시글의 거래함 위치 출력
});
</script>