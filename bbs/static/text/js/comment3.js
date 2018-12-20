 $(function(){
     $('.reflash_button').click(function(){
				window.location.reload()
			})
        // 所有楼层的一级id，放在回复按钮的父元素id中，
        // 所有插入节点的操作都是根据楼层的一级回复按钮的id进行操作
        // 发表按钮默认id为一级id，当楼中楼回复时，修改发表按钮id为楼钟楼id

        // 回复按钮和隐藏按钮显示，获取点击的id
            $('a[id^="00"]').click(function(){
                // 用户id
                v_id = '#' + $(this).attr('id')
                //收起按钮id
                v_id2 = '#hidd' + $(this).attr('id')

                // 回复按钮隐藏
                $(v_id).parent().hide();
                // 显示
                $(v_id2).parent().show();

        // 放置多级评论
                // 获取floor_id
                var father_id = $(this).parent().attr('id')
                // user_id
                var this_id = online_user.id

                //向后台发送father_id，article_id,user_id,拿到评论前五条
                // $.post('/comment/this_comment', { 'father_id': father_id, 'article': '1', 'user_id': this_id }, function (data) {
                        // 获得前五条评论,当返回之回空时，不执行获取函数
                     $.ajax({
                            url:'/comment/this_comment',
                            data:{ 'father_id': father_id, 'article': '1', 'user_id': this_id ,'sign_2':''},
                            type:'post',
                            dataType:'json',
                            async:true,
                            success:function (data) {
                                if(data.result!=''){
                                    // 调用获得评论函数
                                    //加入参数sign_2,默认为空，若获得值说明加载按钮被点击
                                    get_comment(data.result,v_id,data.sign,data.sign_2)
                                }
                                    // 获得输入框
                                    get_input()
                            }
                        })

            // 添加底部输入框
            function get_input(){
                // 生成id随即数
                var input_id = Math.random() * Math.random()
                // father_id
                var father_id = $(v_id).parent().attr('id')
                // 提交表单
                value1 = '<div class="append">'
                value1 += '<div class="append_1"><input type="text" class="in_1">'
                value1 += '<input type="submit" value="发表" class=' + input_id
                value1 += ' id=' + father_id
                value1 += ' ></div></div>'
                // 添加输入框
                $(v_id).parent().parent().append(value1)
                }

            })
             // 获得评论
                    function get_comment(data,v_id,sign,sign_2){
                        get_comment_2(data,v_id,'','')
                        //sign_2，用来记录加载按钮是否点击，未点击则生成按钮
                        if(sign_2=='' && data!=null){
                            //sign用来判断是否分页
                            if(sign==2){
                               // 1为不分页，将id计入加载按钮中
                               id='1'
                                get_page(id)
                            }
                            if(sign==3){
                                id='2'
                                get_page(id)
                            }
                        }
                        //插入加载按钮
                        function get_page(id) {
                            var insert=$(v_id).parent().parent().children().last()
                                var input_id = Math.random() * Math.random()+1
                                    value='<div style="float:left" class="get_page"><a href="javascript:;" class="'+input_id+'"'+' id="'+id+'"'+'>加载更多</a></div>'
                                if(insert.attr('class')=='append'){
                                    insert.before(value)
                                }
                                else{
                                    insert.after(value)
                            }}

                    }
                    function get_comment_2(data,v_id,page_range,page_num){
                        value1='<div class="comment_child_out">'
                        $.each(data,function(index,index2){
                            // 获取自身id
                            this_id = index2.id
                            // 获取评论时间
                            startime = index2.startime
                            startime=startime.slice(0,10)+" "+startime.slice(11,19)+' '
                            // 内容
                            comment=index2.content
                            // 用户名
                            username="<a href='javascript:;'>"+index2.username+"</a>"
                            // 父用户名
                            father_name=index2.fathername
                            // 如果父id为当前楼层id，则不显示回复谁
                            var reg=/\s/;
                            ceshi1=father_name.match(reg)
                            // 如果为子评论，取出回复谁的username
                            if(ceshi1==null){
                                username=username+':  回复:'+'<a href="javascript:;">'+father_name+'</a>'

                            }
                            // 生成id随即数
                            var input_id = Math.random() * Math.random()

                            value1+='<div class="comment_child_f"><div class="comment_child">'
                            value1+='<ul><li><div class="comment_image"><a href="">头</a>'
                            value1+='</div><div class="content">'+username+':  '+comment+'</div>'
                            value1+='<span class="content_2">'+startime+'<a href="javascript:;" class='+input_id+' id='+this_id+'>回复</a></span></li></ul></div></div>'
                            // 插入多级评论



                        })
                        value1+="</div>"
                        // alert(value1)
                        var insert=$(v_id).parent().parent().children('div[class="comment_child_out"]')
                        if(insert.attr('class')!=undefined){
                            insert.after(value1)
                        }
                        if(insert.attr('class')==undefined){
                           $(v_id).parent().parent().children('div:eq(2)').after(value1)
                        }
                            // // 节点总是插入在输入框前
                            // if(insert.attr('class')==''){
                            //     insert.prev().before(value1)
                            // }
                            // else{
                            //     insert.after(value1)
                            // }

                        //  插入分页按钮默认不显示，当点击加载更多时显示
                        if(page_range!=''){
                            if($(".comment_paginator_out").attr('class')!=undefined){
                                //删除当前页
                                $(".comment_paginator_out").remove()
                            }
                            value2='<div class="comment_paginator_out">'
                                $.each(page_range,function (index,index2) {
                                    var input_id = Math.random() * Math.random()+2
                                    if(page_range.length!=1){
                                        if(page_num!=index+1){
                                            value2+='<a class="comment_paginator" id="'+input_id+'"' +'href="javascript:;">'+index2+' </a>'
                                        }
                                        else {
                                            //将页码放入val内
                                            value2+='<a class="comment_paginator" id="'+input_id+'" >'+index2+' </a>'

                                    }
                                    //判断是否为当前页面
                                    }
                                })
                            value2+='</div>'
                            var insert_2=$(v_id).parent().parent().children('div[class="comment_child_out"]')
                            insert_2.after(value2)
                            }
                    }
                // 多级评论分页按钮

                    $(document).on('click','a[id^="2."]',function () {
                            //再次调用分页函数，获得其他页面
                            v_id='#'+$(this).parent().prevAll('div[class="bot_right"]').children('a').attr('id')
                            floor_id=$(this).parent().prevAll('div[class="bot_right"]').attr('id')
                            $(this).parent().prev().remove()
                            //获得请求的页码
                            num=$(this).html()
                            $.post('/comment/paginator',{'num':num,'father_id':floor_id,'article':'1'},function (data) {
                                get_comment_2(data.page_list,v_id,data.page_range,data.page_num)
                            })

                    })


                //加载按钮
                    $(document).on('click','a[class^="1."]',function () {
                        //获得自身di来判断是否需要分页
                        this_id=$(this).attr('id')
                        //获得floor对象
                        floor_duixiang=$(this).parent().prevAll('div[class="bot_right"]')
                        //获得floor_id
                        floor_id=floor_duixiang.attr('id')
                        //获得一级回复按钮id
                        v_id='#'+floor_duixiang.children('a').attr('id')
                        //加载按钮被点击后隐藏
                        $(this).parent().hide()
                        if(this_id=='1'){
                        //id=1则不需要分页
                            sign_2=1
                            url='/comment/this_comment'
                            $.post(url,{'father_id':floor_id,'article':'1','sign_2':sign_2},function (data) {
                                //获取5后面的评论
                                get_comment(data.result,v_id,data.sign,data.sign_2)
                            })
                        }
                        else{
                            //发送分页请求
                            sign_2=2
                            url='/comment/paginator'
                            $(this).parent().prev().remove()
                            $.post(url,{'father_id':floor_id,'article':'1','sign_2':sign_2},function (data) {
                                //获取5后面的评论
                                get_comment_2(data.page_list,v_id,data.page_range,data.page_num)
                            })
                        }

                    })

                // ---------------------------------------------------------------
                    // 点击取消回复  隐藏回复列表
                    $('a[id^="hidd"]').click(function () {
                        v_id2 = '#' + $(this).attr('id')
                        v_id = '#' + $(this).attr('id').slice(4)
                        $(v_id2).parent().hide();
                        $(v_id).parent().show();
                        // 删除当前楼层的回复
                        $(v_id2).parent().next('.comment_child_f').remove()
                        $(v_id2).parent().next().next().nextAll().remove()
                    })


                //提交评论 用post提交评论，动态生成的标签用on绑定事件
                    $('body').on("click", "input[class^='0.']", function () {
                            var me=$(this)
                            send_comment(me,'')
                })
                function send_comment(me,true_father_id){
                        var father_id = me.attr('id')
                        // 获取father_id
                        if(true_father_id!=''){
                            father_id=true_father_id
                        }
                        // 获取评论内容
                        var content = me.prev().val()
                        reg=/\s:.*/m;
                        content=content.match(reg)
                        if(content!=null){

                            content=content.toString().slice(2)

                        }
                        else{
                            father_id=me.parents('div[class="append"]').prevAll('div[class="bot_right"]').attr('id')
                            content=me.prev().val()
                        }
                        // 获取自身id
                        var this_id = online_user.id
                        // 获得回复按钮对象
                        var true_father_id=me.parent().parent().parent().children('.bot_right')
                        // 获得回复按钮的id
                        v_id='#'+true_father_id.children().attr('id')
                        // alert(v_id)
                        // 获得楼层一级id
                        true_father_id_2=true_father_id.attr('id')

                // 向后台传参
                    var context = { 'article': '1', 'father_id': father_id, 'user_id': this_id, 'content': content,'floor_id':true_father_id_2}
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
                                get_comment(data.result,v_id)
                            }
                        })
                    }
                }
                // 楼钟楼回复按钮
                $(document).on('click','a[class^="0."]',function(){
                    // 获得父id
                    father_id=$(this).attr('id')
                    // 获得发表按钮对象
                    me=$(this).parents('div[class="comment_child_out"]').nextAll('div[class="append"]').children().children('input:eq(1)')
                    // 将按钮对象id改为楼中楼回复id，即父id
                    me.attr({id:father_id})
                    // 获得回复对象的姓名写入输入框
                    username="回复 "+$(this).parent().prev().children('a:eq(0)').html()+' :'
                    me.prev().attr({value:username})
                })

        })