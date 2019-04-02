<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>评论页面</title>
    <base href="<?php echo site_url(); ?>">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/mint-ui.min.css">
    <link rel="stylesheet" href="css/comment.css">
    <script src="js/rem.js"></script>

</head>
<body>
<div id="app">
    <mt-header title="所有评论">
        <mt-button @click="goBack" icon="back" slot="left">返回</mt-button>
    </mt-header>
    <div id="img-show">
        <div class="table"></div>
    </div>
    <div class="comment-top">
        <span>用户点评</span>
    </div>
    <div class="page-comments">
        <div class="mod-rating commentInfo">
            <ul class="overall-rating">
                <li class="item"><em><?php echo $score->total_score ?></em>评分</li>
                <li class="item"><em><?php echo $total ?></em>点评</li>

                <li class="score-rating">
                    <span>位置：<?php echo $score->traffic_score ?></span>
                    <span>清洁：<?php echo $score->clean_score ?></span>
                    <span>设施：<?php echo $score->facility_score ?></span>
                    <span>服务：<?php echo $score->manage_score ?></span>
                </li>
            </ul>

        </div>
        <div class="recommended">
            <div class="mtab-list-hd">
                <div class="left-all item commentfilter current"><span>全部</span></div>
            </div>
        </div>
        <?php foreach ($data as $comm) { ?>
            <div id="commentcontent_1" class="commentcontent" style="">
                <div class="noComment" style="display: none;"></div>
                <ol class="commentlist list">
                    <li>
                        <div class="customer">
                            <img class="pic" src="<?php echo $comm->portrait ?>"
                                 onerror="javascript:this.src='http://www.hrbyueju.com/<?php echo $comm->portrait ?>'">
                            <p class="user">
                                <span>【<?php echo $comm->username ?>】</span>
                                <span><?php echo $comm->score ?>分</span>
                                <span>推荐</span>
                            </p>
                            <p class="time"><?php echo $comm->start_time ?>至<?php echo $comm->end_time ?><i
                                        class="f-r"><?php echo $comm->comm_time ?> 点评</i></p>
                        </div>
                        <p class="text"><?php echo $comm->content ?></p>
                        <ul class="pics-list miniCommentPics">
                            <?php
                            if (isset($comm->comment_imgs)) {
                                foreach ($comm->comment_imgs as $imgs) { ?>
                                    <li>
                                        <img src="<?php echo $imgs->img_thumb_src ?>"
                                             onerror="javascript:this.src='http://www.hrbyueju.com/<?php echo $imgs->img_thumb_src ?>'">
                                    </li>
                                <?php }
                            } ?>

                        </ul>

                    </li>
                </ol>
            </div>
        <?php } ?>

    </div>
</div>
<script src="js/zepto.js"></script>
<script src="js/vue.min.js"></script>
<script src="js/mintUI.min.js"></script>
<script>
    new Vue({
        el: '#app',
        methods: {
            goBack: function () {
                window.history.go(-1);
            }
        }
    });
</script>
<script>
    $(function ($) {
        $.fn.slideDown = function (duration) {
            var position = this.css('position');
            this.show();
            this.css({
                position: 'absolute',
                visibility: 'hidden'
            });
            var height = this.height();
            this.css({
                position: position,
                visibility: 'visible',
                overflow: 'hidden',
                height: 0
            });
            this.css({
                height: height
            }, duration);
        };
        $.fn.slideUp = function (duration) {
            this.css({
                height: 0
            }, duration);
        };
    });

    $('.left-all').on('tap', function () {
        $(this).addClass('current').siblings('div').removeClass('current');
        $('.commentcontent').css('display', 'block');
        $('.pic-content').css('display', 'none');

    });
    $('.right-pic').on('tap', function () {
        $(this).addClass('current').siblings('div').removeClass('current');
        $('.commentcontent').css('display', 'none');
        $('.pic-content').css('display', 'block');
    });

    $('.hd').on('tap', function () {

        $(this).toggleClass('rotate').siblings().toggleClass('hide');

    });


    $(function () {
        var $imgShow = $('#img-show');
        var $tab = $('.table');
        var iNow = 0;
        $('.pics-list li img').on('tap', function (e) {
            var index = $(this).index();
            iNow = index;
            $imgShow.show();
            $tab.css({
                background: '#fff url(' + ($(this).attr('src')).replace(/\\/g, "/") + ') no-repeat center',
                backgroundSize: 'contain',
            });
            e.preventDefault();
        });
        $imgShow.on('tap', function (e) {
            $imgShow.hide();
            e.preventDefault();
        });
    })
</script>
</body>
</html>