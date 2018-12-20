$(window).scroll(function () {
	var scrollTop = $(this).scrollTop();
	var scrollHeight = $(document).height();
	var windowHeight = $(this).height();
	if (scrollTop + windowHeight == scrollHeight) {
		$.post('/next',function(list){
			var context=list.context

		})
		function myeach(){
			$.each
		}
		$(".right_left_content").append("<h1>sadsadsa</h1>")
			var insert1='<div class="img_box " ></div>'
			insert1+='<div class="text_box "><h4>独立游戏《Bad North》steam版发售</h4><span>带有Roguelike元素的实时策略独立游戏《Bad North》在steam发售，游戏自带中文，评价特别好评，游戏正在促销中，国区售价45元。</span></div>'
			insert1+='<div class="from_who">'
			insert1+='<div class="from_who_img"><img src="image/pic1.jpg"></div>'
			insert1+="<div class='from_who_text'>游侠网官方微博 11月17日 14:09</div></div>"
			insert1+='<div class="bottom_tool ">'
			insert1+='<ul><li><a href=" "><i class="fa fa-star-o"></i>&nbsp;收藏</a></li>'
			insert1+='<li><a href=" "><i class="fa fa-commenting-o"></i>&nbsp;评论</a></li>'
			insert1+='<a href=" "><i class="fa fa-thumbs-o-up"></i>&nbsp;点赞</a></li></ul></div></div>'
			
					
				
      //此处是滚动条到底部时候触发的事件，在这里写要加载的数据，或者是拉动滚动条的操作

//var page = Number($("#redgiftNextPage").attr('currentpage')) + 1;
//redgiftList(page);
//$("#redgiftNextPage").attr('currentpage', page + 1);
 
        }
});
