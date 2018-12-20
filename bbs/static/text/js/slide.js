$(function(){
	var len=$('.slide_pics li').length;
	var sli=$('.slide_pics li')
	var now=0;
	var wait=0;
	var prev=$('.prev')
	var next=$('.next')

	sli.not(':first').css({left:760});
	sli.each(function(index){
		var $li =$('<li>')
		if(index==0){
			$li.addClass("active");
		}
		$li.appendTo($('.points'));

	})	

	//底部按钮
	point=$('.points li')
	point.click(function(){
		// alert($(this).index())
		wait=$(this).index()
		move()
		
	})


	//自动播放
	setInterval(function(){
		wait++
		move()

	},6000);

	//左右按钮
	next.click(function(){  
		wait++
		move()
	})
	prev.click(function(){  
		wait--
		move()
	})




	function move(){
		//极端情况
		if(wait<0){
			wait=3
			$('.slide_pics li').eq(wait).css({left:-760});
			$('.slide_pics li').eq(now).stop().animate({left:760});
			$('.slide_pics li').eq(wait).stop().animate({left:0});
			now=wait;
			point.eq(wait).addClass("active").siblings().removeClass('active');
			return
		}
		if(wait>4){
			wait=0
			$('.slide_pics li').eq(wait).css({left:760});
			$('.slide_pics li').eq(now).stop().animate({left:-760});
			$('.slide_pics li').eq(wait).stop().animate({left:0});
			now=wait;
			point.eq(wait).addClass("active").siblings().removeClass('active');
			return
		}
		if(wait==now){
			return
		}




		if(wait>now){
			$('.slide_pics li').eq(wait).css({left:760});
			$('.slide_pics li').eq(now).stop().animate({left:-760});
		}
		else{
			$('.slide_pics li').eq(wait).css({left:-760});
			$('.slide_pics li').eq(now).stop().animate({left:760});
		}
			$('.slide_pics li').eq(wait).stop().animate({left:0});
			now=wait;
			point.eq(wait).addClass("active").siblings().removeClass('active');
	  }
})