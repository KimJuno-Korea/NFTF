<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
var boardNo = '${board.no}'; //게시글 번호
var sessionUserId = '${sessionScope.id}'; //세션에 저장된 사용자 아이디
 
/* $('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm의 내용을 가져옴
    console.log("click");
    replyInsert(insertData); //Insert 함수호출(아래)
}); */

function replyClick() {
	var insertData = $('[name=replyInsertForm]').serialize(); //replyInsertForm의 내용을 가져옴
	replyInsert(insertData); //Insert 함수호출(아래)
}

//댓글 목록 
function replyList(){
    $.ajax({
        url : '/reply',
        type : 'get',
        data : {'boardNo':boardNo},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){
                a += '<li><div class="comment" style="border-bottom: 1px solid #e8ecec;"><div class="comment-detail">';
                a += '<h3>' + value.userId + '</h3><div class="date-comment">';
                if(value.userId == sessionUserId) {
                	a += '<div id="bt_event_'+value.no+'" style="display:block">'
                	a += '<a onclick="deleteConfirm('+value.no+');"><i class="la la-calendar-o"></i>삭제</a>';
                	a += '<a onclick="replyUpdateForm('+value.no+',\''+value.content+'\');"><i class="la la-calendar-o"></i>';
                	a += '수정 </a></div>';
                }
                a += '<a style="cursor: default;"><i class="la la-calendar-o"></i>'+value.registrateDate+'</a>';
                if(value.editStatus == 'Y') {
                	a += '<a style="cursor: default;"><i class="la la-calendar-o"></i>(수정됨)</a>';
                }
                a += '</div><div class="commentContent'+value.no+'"> <p> 내용 : '+value.content;+'</p></div>';
                a += '</div></div></li>';
            });
            
            $(".replyList").html(a);
        }
    });
}
 
//댓글 등록
function replyInsert(insertData){
    $.ajax({
        url : '/reply',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replyUpdateForm(no, content){
	document.getElementById("bt_event_" + no).style.display="none";
    var update ='';
    
    update += '<div class="pf-field">';
    update += '<textarea name="content_'+no+'">'+content+'</textarea>';
    update += '<button class="button-custom2" type="button" onclick="replyUpdate('+no+')"name="replyInsertBtn">댓글 수정</button>';
    update += '</div>';
    
    
    $('.commentContent'+no).html(update);
    
}
 
//댓글 수정
function replyUpdate(no){
    var updateContent = $('[name=content_'+no+']').val();
    
    $.ajax({
        url : '/reply',
        type : 'PUT',
        data : {'content' : updateContent, 'no' : no},
        success : function(data){
            if(data == 1) replyList(boardNo); //댓글 수정후 목록 출력
        }
    });
    document.getElementById("bt_event_" + no).style.display="block";
}

function deleteConfirm(no) {
	var chk = confirm("해당 댓글을 삭제하시겠습니까?");
	if (chk) {
		replyDelete(no);
	}
}

//댓글 삭제 
function replyDelete(no){
    $.ajax({
        url : '/reply',
        type : 'DELETE',
        data : {'no' : no},
        success : function(data){
            if(data == 1) replyList(boardNo); //댓글 삭제후 목록 출력 
        }
    });
}
 
$(document).ready(function(){
    replyList(); //페이지 로딩시 댓글 목록 출력 
});
 
</script>