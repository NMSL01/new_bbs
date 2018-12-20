$(function(){
			$('.reflash_button').click(function(){
				window.location.reload()
			})
			$(window).scroll(function () {
				var scrollTop = $(this).scrollTop();
				var scrollHeight = $(document).height();
				var windowHeight = $(this).height();
				var end_value=$('.right_left_content').children().length;
				if (scrollTop + windowHeight == scrollHeight) {
					var value=end_value
					$.post('/next2', {'num':end_value},function(list){
					alert(value)
						var context = list.list
						myeach(context)
					})
					function myeach(s1) {
						$.each(s1,function(index,index2){
						var insert1=" <div id='content_1'>"
						insert1 += '<div class="img_box " ></div>'
						insert1 += '<div class="text_box "><h4>'+index2[0]+'</h4><span>'+index2[1]+'</span></div>'
						insert1 += '<div class="from_who">'
						insert1 += '<div class="from_who_img"><img src="image/pic1.jpg"></div>'
						insert1 += "<div class='from_who_text'>"+index2[2]+"</div></div>"
						insert1 += '<div class="bottom_tool ">'
						insert1 += '<ul><li><a href=" "><i class="fa fa-star-o"></i>&nbsp;收藏</a></li>'
						insert1 += '<li><a href=" "><i class="fa fa-commenting-o"></i>&nbsp;评论</a></li>'
						insert1 += '<li><a href=" "><i class="fa fa-thumbs-o-up"></i>&nbsp;点赞</a></li></ul></div></div>'
						$('.right_left_content').append(insert1)
						if(index==9){
							end_value=index2[3]
						}
						})
					}
					// $(".right_left_content").append("<h1>sadsadsa</h1>")
					//此处是滚动条到底部时候触发的事件，在这里写要加载的数据，或者是拉动滚动条的操作
					//var page = Number($("#redgiftNextPage").attr('currentpage')) + 1;
					//redgiftList(page);
					//$("#redgiftNextPage").attr('currentpage', page + 1);
				}
			});
			})

		window.onload = function () {
			window.onscroll = function () {
				var flag = document.body.scrollTop || document.documentElement.scrollTop
				if (document.body.scrollTop || document.documentElement.scrollTop) {
					$('.top').css({ 'box-shadow': '0px 0px 5px 0px grey' })
				} else {
					$('.top').css({ 'box-shadow': 'none' })
				}
			}
		}