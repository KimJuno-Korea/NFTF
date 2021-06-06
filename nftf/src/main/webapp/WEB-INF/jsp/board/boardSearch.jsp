<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
function searchClick() { //검색 버튼 클릭시
	var selectData = $('[name=searchForm]').serialize(); //replyInsertForm의 내용을 가져옴
	boardSearch(selectData); //Insert 함수호출(아래)
	
};

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );

}

//게시글 검색
function boardSearch(selectData){
    $.ajax({
        url : '/boardsearch',
        type : 'post',
        data : selectData,
        success : function(data){
        	document.getElementById("boardList").style.display="none";
        	var path = getContextPath();
        	var a ='';
        	a += '<h4 style="color:black;">검색된 결과 입니다.</h4>'
            $.each(data, function(key, value){
            	a += '<div class="emply-list"><div class="emply-list-thumb">';
                a += '<img src="'+ path +'/photo/thumbnail/'+ value.no +'">';
                a += '</div><div class="emply-list-info">';
                
                a += '<div class="emply-pstn">';
                if (value.division == 'S') {
                	a += '<b style="color: #4381ff;">판매&nbsp;&nbsp;</b>';
                } else if (value.division == 'B') {
                	a += '<b style="color: #fb236a;">구매&nbsp;&nbsp;</b>';
                }
				
				if (value.tradeWay == 'D') {
					a += '<b style="color: black;">&nbsp;&nbsp;직거래&nbsp;&nbsp;</b>';
                } else if (value.tradeWay == 'P') {
                	a += '<b style="color: black;">&nbsp;&nbsp;택배&nbsp;&nbsp;</b>';
                } else if (value.tradeWay == 'T') {
                	a += '<b style="color: black;">&nbsp;&nbsp;거래함&nbsp;&nbsp;</b>';
                }
				
				if (value.status == 'S') {
					a += '<b style="color: #fb236a;">&nbsp;&nbsp;거래완료&nbsp;&nbsp;</b>';
				} else if (value.status == 'M') {
					a += '<b style="color: #1ede3e;">&nbsp;&nbsp;거래가능&nbsp;&nbsp;</b>';
				}
				a += '</div>';
                
				a += '<h3><a href="/board/'+ value.no +'">'+ value.title +'</a></h3>';
				
				var price = Number(value.price);
				
				if (value.division == 'S') {
					a += '<span  style="color:#4381ff">'+ price.toLocaleString() +'￦</span>';
				} else if (value.division == 'B') {
					a += '<span  style="color:#fb236a">'+ price.toLocaleString() +'￦</span>';
				}
				
				a += '<p>'+ value.content +'</p></div></div>';
            });
            
            $("#boardSearchResult").html(a);
        }
    });
}
</script>