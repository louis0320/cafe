function check_pw(){
 
    var pw = document.getElementById('password').value;
	var SC = ["!","@","#","$","%"];
    var check_SC = 0;
 
    if(pw.length < 6 || pw.length>16){
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('password').value='';
    }
    for(var i=0;i<SC.length;i++){
        if(pw.indexOf(SC[i]) != -1){
            check_SC = 1;
        }
    }
    if(check_SC == 0){
        window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
        document.getElementById('password').value='';
    }
    if(document.getElementById('password').value !='' && document.getElementById('pwd').value!=''){
        if(document.getElementById('password').value==document.getElementById('pwd').value){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='blue';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
			//alert("비밀번호가 일치하지 않습니다.");
        }
    }
}
/*
function validation_pw(){
	var pw = document.getElementById("password");
	var pwd = document.getElementById("pwd");
	
	if(pw!=pwd){
		alert("비번확인");
		response.sendRedirect("login.jsp");
	}else {
		response.sendRedirect("addBoard.jsp");
	}
}
*/


/*
	메인화면 사진 auto carousel 슬라이드
 */

// 1.초기값설정

var slideIndex= 0;

// 3.자동 슬라이드 실행함수 호출


autoSlide();
// 2.자동슬라이드 실행함수
function autoSlide(){
    // alert ('경고');
    // a. 변수선언
    var i;
    var slide = $('.slide');
    var dot = $('.dot');
    for (i=0;i<slide.length;i++){
        $('.slide').eq(i).css({display:'none'});
    }
    // c. slideIndex 값 동적으로 세팅
    slideIndex++;
    console.log(slideIndex);
    // d. 데이터 유효성 코딩 : 슬라이드 이미지 갯수보다 slide값이 초과되면 1로세팅 :0,1,2
    if(slideIndex > slide.length){
        slideIndex = 1;
    }
    // e. 첫번째 슬라이드 이미지 보이도록 코딩
    $('.slide').eq(slideIndex-1).css({display:'block'});
    // f. 첫번째 dot에 컬러 보이도록 코딩
    dot.eq(slideIndex-1).css({backgroundColor:'#20727d'});
    dot.eq(slideIndex-2).css({backgroundColor:'#ccc'});
    
    //g. 2초마다 새로고침(재귀호출)
    setTimeout(autoSlide,3000);
}



/*
	getBoard 페이지에서 삭제 버튼 누를때 알림창
 */
function removeCheck() {
	if(confirm("정말 삭제하시겠습니까?")==true) {
		document.removefrm.submit();
	}else {
		return false;
	}
}



/*
	jQuery
 */
$('document').ready(function(){
// 체크박스 전체선택
    $('#check_all').on('click',function(){
        $('.ck').prop('checked',this.checked);
    });
});












