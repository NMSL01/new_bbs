$(function(){
    $('.reflash_button').click(function () {
        window.location.reload();
    })
    // 回复按钮和隐藏按钮显示，获取点击的id
    $('a[class^="00"]').click(function () {

        // 一级评论的id
        v_id = '.' + $(this).attr('class')
        //收起按钮id
        v_id2 = '#hidd' + $(this).attr('class')

        // 回复按钮隐藏
        $(v_id).parent().hide();
        // 显示
        $(v_id2).parent().show();
        me=$(this)
        //   获取多级评论
        floor_id = $(this).attr('id')
        $.post('/comment/this_comment', {'floor_id': floor_id, 'article': article_id.id}, function (data) {
            //调用获取函数
            if(data!=''){
                floor_id_2=floor_id
                get_comment_2(data.result, v_id, '', '',data.floor_id)
                //添加加载按钮
                if(data.count>='5'){
                    get_page(me,floor_id_2)
                }
            }
            // 插入输入框
            get_input(me)
        })



    })

    // 点击取消回复  隐藏回复列表
    $('a[id^="hidd"]').click(function () {
        v_id2 = '#' + $(this).attr('id')
        v_id = '.' + $(this).attr('id').slice(4)
        $(v_id2).parent().hide();
        $(v_id).parent().show();
        // 删除当前楼层的回复
        $(v_id).parent().nextAll('div:eq(1)').children('div:eq(0)').children().remove()
        $(v_id).parent().nextAll('div:eq(1)').children('div:eq(1)').children().remove()
        $(v_id).parent().nextAll('div:eq(1)').children('div:eq(2)').children().remove()
        $(v_id).parent().nextAll('div:eq(1)').children('div:eq(3)').children().remove()

    })


    // 添加底部输入框
    function get_input(me) {
        // 生成id随即数
        var input_id = Math.random() * Math.random()
        // father_id
        var father_id = me.attr('id')
        // 提交表单
        value1 = '<div class="append">'
        value1 += '<div class="append_1"><input type="text" class="in_1">'
        value1 += '<input type="submit" value="发表" class=' + input_id+' name="'+me.attr('id')+'"'
        value1 += ' id=' + father_id
        value1 += ' ></div></div>'
        // 添加输入框
        me.parent().parent().find('div[class="comment_input"]').append(value1)
    }

         //插入加载按钮
        function get_page(me,floor_id) {

            var input_id = Math.random() * Math.random()+1
            value='<div style="float:left" class="get_page">'+'<a href="javascript:;" class="'+input_id+'"'+' id="'+floor_id+'"'+'>加载更多</a></div>'
            me.parent().parent().find('div[class="comment_load"]').append(value)
            }

     //加载按钮
        $(document).on('click','a[class^="1."]',function () {
            //获得floor_id
            floor_id=$(this).attr('id')
            //回复按钮id
            v_id='.'+$(this).parents('div[class="comment_child_out_out"]').prevAll('div[class="bot_right"]').children().attr('class')

            //加载按钮被点击后隐藏
            $(this).parent().remove()
                url='/comment/paginator'
                $(v_id).parent().nextAll('div[class="comment_child_out_out"]').find('ul[class="clearfix"]').remove()
                $.post(url,{'floor_id':floor_id,'article':'1'},function (data) {
                    //获取5后面的评论
                    get_comment_2(data.page_list,v_id,data.page_range,data.page_num,'')
                    // get_page($(v_id),floor_id)
                    // get_input($(v_id))
                })

        })

        //楼钟楼分页按钮
        $(document).on('click','a[class^="2."]',function () {
            //获取页码
            page=$(this).html()
            floor_id=$(this).attr('id')
            //获取回复按钮class
            v_id='.'+$(this).parents('div[class="comment_child_out_out"]').prev().prev().children('a').attr('class')
            me=$(this)
            $.post('/comment/paginator',{'num':page,'floor_id':floor_id},function (data) {
                //post中无法获取外部$(this)
                me.parents('div[class="comment_child_out_out"]').children('div[class="comment_child_out"]').children().remove()
                me.parents('div[class="comment_child_out_out"]').children('div[class="comment_paginator"]').children().remove()
                get_comment_2(data.page_list,v_id,data.page_range,data.page_num,'')
            })
        })

      //提交评论 用post提交评论，动态生成的标签用on绑定事件
                    $('body').on("click", "input[class^='0.']", function () {
                            var me=$(this)
                            send_comment(me)
                })
                function send_comment(me){
                        var father_id = me.attr('id')
                        floor_id=me.attr('name')
                        // 获取评论内容
                        var content = me.parents().find('input[class="in_1"]').val()
                        reg=/\s:.*/m;
                        content=content.match(reg)
                        if(content!=null){
                            content=content.toString().slice(2)
                        }
                        else{
                            father_id=me.attr('name')
                            content = me.parents().find('input[class="in_1"]').val()
                        }
                        // 获取自身id
                        var this_id = article_id.user_id
                        //楼层id
                //    回复按钮id
                    v_id='.'+me.parents('div[class="right_bot"]').find('a:eq(1)').attr('class')

                // 向后台传参
                    var context = { 'this_comment_id':v_id.slice(1),'article':article_id.id, 'father_id': father_id,'content': content,'floor_id':floor_id}
                    // 输入为空时不请求
                    if (content != '') {
                        // $.post('/comment/submit', context, function (data) {
                        //    get_comment(data.result,v_id)
                        // })
                        $.ajax({
                            url:'/comment/submit',
                            data:context,
                            type:'post',
                            dataType:'json',
                            async:true,
                            success:function (data) {
                                get_comment_2(data.result,v_id,'','',data.floor_id)
                            }
                        })
                    }
                }
                // 楼钟楼回复按钮
                $(document).on('click','a[class^="0."]',function(){
                    // 获得父id
                    father_id=$(this).attr('id')
                    // 获得发表按钮对象
                    me=$(this).parents('div[class="comment_child_out_out"]').find('input:eq(1)')
                    me.attr({name: $(this).attr('floor_id')})
                    // 将按钮对象id改为楼中楼回复id，即父id
                    me.attr({id:father_id})
                    // 获得回复对象的姓名写入输入框
                    username="回复 "+$(this).parent().prev().children('a:eq(0)').html()+' :'
                    me.prev().attr({value:username})
                })

    //获得评论函数
    function get_comment_2(data, v_id, page_range, page_num,floor_id) {
        value1 = '<ul class="clearfix">'
        $.each(data, function (index, index2) {
            // 获取自身id
            this_id = index2.id
            // 获取评论时间
            startime = index2.startime
            startime = startime.slice(0, 10) + " " + startime.slice(11, 19) + ' '
            // 内容
            comment = index2.content
            // 用户名
            username = "<a href='javascript:;'>" + index2.username + "</a>"
            // 父用户名
            father_name = index2.fathername
            // 如果父id为当前楼层id，则不显示回复谁
            var reg = /\s/;
            ceshi1 = father_name.match(reg)
            // 如果为子评论，取出回复谁的username
            if (ceshi1 == null) {
                username = username + ':  回复:' + '<a href="javascript:;">' + father_name + '</a>'

            }
            // 生成id随即数
            var input_id = Math.random() * Math.random()

            value1 += '<li><div class="comment_image"><a href="">头</a>'
            value1 += '</div><div class="content">' + username + ':  ' + comment + '</div>'
            value1 += '<span class="content_2">' + startime + '<a href="javascript:;" floor_id="' + floor_id + '" class=' + input_id + ' id=' + this_id + '>回复</a></span></li>'
            // 插入多级评论

        })
        value1 += "</ul>"
        $(v_id).parent().nextAll('div[class="comment_child_out_out"]').children('div[class="comment_child_out"]').append(value1)


    //  插入分页按钮默认不显示，当点击加载更多时显示
    if (page_range != '') {
        page=$(v_id).parent().find('div[class="comment_paginator_in"]')
        if (page.attr('class') != undefined) {
            //删除当前页
            page.remove()
        }
        if(page_range.length!=1){
            value2='<div class="comment_paginator_in">'
            floor_id=$(v_id).attr('id')
            $.each(page_range, function (index, index2) {
                var input_id = Math.random() * Math.random() + 2
                    //判断是否为当前页面
                    if (page_num != index + 1) {
                        value2 += '<a  id="'+floor_id+'" class="' + input_id + '" href="javascript:;">' + index2 + ' </a>'
                    } else {
                        //将页码放入val内
                        value2 += '<a  id="'+floor_id+'" class=' + input_id + '" >' + index2 + ' </a>'
                    }
            })
            value2+='</div>'
            var insert_2 = $(v_id).parent().next().next().children('div[class="comment_paginator"]')
            insert_2.append(value2)
        }

    }
}

})