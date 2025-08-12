$(document).ready(function() { 
	// 더보기
	const more = document.getElementById("more")

	more.addEventListener("click", function() {
		$('.number_list').toggleClass('active');
		if(more.innerText === '목차 더보기') {
			more.innerText = '목차 접기';
		} else more.innerText ='목차 더보기';
	});
});

//체험단 지역 선택 필터 탭
$(document).ready(function(){
		$('ul.reg01 li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.reg01 li').removeClass('current');
			$('.tab_con').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});

	});
	
	//로그인 탭
$(document).ready(function(){
		$('ul.mem_tab li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.mem_tab li').removeClass('current');
			$('.mem_con').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});

	});