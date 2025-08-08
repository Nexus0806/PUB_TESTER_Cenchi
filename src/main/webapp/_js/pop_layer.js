function layer_open(layer_id, pop_id){
	var temp = $('#' + layer_id);
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$( '#' + pop_id).fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		$('.pop-layer').focus();
	}else{
		temp.fadeIn();
	}

	$('a.cbtn').blur(function () {
		$('.pop_con').attr("tabindex", 0).show().focus();
	});
	
	temp.find('a.cbtn').click(function(e){
		if(bg){
			$('#' + pop_id).fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			$('a.focus').attr("tabindex", 0).show().focus();
		}else{
			temp.fadeOut();
		}
		e.preventDefault();
		$('a.focus').attr("tabindex", 0).show().focus();
	});

	$('#' + pop_id + ' .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
		$('#' + pop_id).fadeOut();
		e.preventDefault();
		$('a.focus').attr("tabindex", 0).show().focus();
	});

}