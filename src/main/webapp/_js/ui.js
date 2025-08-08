$('.navi_btn').click(function(){
		$('.navi').stop(true).fadeToggle('fast');
		$(this).toggleClass('on');
		$('#tm_header').toggleClass('on');
	});

$('.close').click(function(){
		$('.navi').stop(true).fadeOut('fast');
		$('#tm_header').removeClass('on');
	});



//dep01, dep02
$('.lnb .dep01 > li:has(.dep02)').children('a').addClass('has-sub');
if($(window).width() <= 1024) {
	$(".lnb .dep01 > li > a").click(function(){
		if($(this).is(".has-sub")){
			event.preventDefault();
			$(this).parent().siblings('li').children('ul.dep02').stop().slideUp();
			$(this).parent().siblings('li').children('a').removeClass('on');
			$(this).siblings('ul').stop().slideToggle();
			$(this).toggleClass('on');
		}else{
		}
	});
};

//search
 $('.sch_btn').click(function(){
		$('.tm_sch_wrap').fadeIn();
		//$('#header').addClass('click');
	});
	$('.tm_x').click(function(){
		$('.tm_sch_wrap').fadeOut();
		//$('#header').removeClass('click');
});


//gnb
$('#header ul.gnb > li').mouseenter(function(){
	$('#header ul.gnb > li').removeClass('on');
	$('#header .gnb_sub').stop().hide();
	$(this).addClass('on');
	$(this).find('.gnb_sub').stop().fadeIn(200);
});
$('#header ul.gnb > li').mouseleave(function(){
	$('#header ul.gnb > li').removeClass('on');
	$('#header .gnb_sub').stop().fadeOut(200);
});