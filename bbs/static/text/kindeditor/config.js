KindEditor.ready(function(K) {
        // K.create('textarea[name=content_1]', {
        K.create('#id_content', {
            width: '750px',
            height: '200px',
            //django路由
            'uploadJson':'/kind/upload',
             //csrf
             // extraFileUploadParams: {"csrfmiddlewaretoken": $("[name='csrfmiddlewaretoken']").val()},
             //传输文件名
             filePostName: 'upload_img',
            //高度自适应
            autoHeightMode:true,
            //指定编辑器css
            cssPath:'/static/text/css/comment_write.css',
            //工具栏
            items: ['undo', 'redo','cut', 'copy', 'paste','image','media','fullscreen','emoticons', 'link','multiimage',],
             allowImageUpload  : true//运行上传图片
        });
});
