<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>首页</title>
    <base href="<?php echo site_url(); ?>"/>
    <script src="js/rem.js"></script>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/index.css"/>
</head>
<body>
<div id="header">
    <div class="title">
        首页
    </div>
    <a href="javascript:;" class="menu-btn">
    </a>
    <div id="menu-top">
        <ul>
            <li class="menu-home">
                <i class="iconfont icon-home"></i>
                <a href="welcome/index" data-stat-label="首页">
                    首页
                </a>
            </li>
            <li class="menu-user">
                <i class="iconfont icon-about"></i>
                <a href="user"  data-stat-label="我的悦居">
                    我的悦居
                    <?php
                    $login_user = $this->session->userdata('userinfo');
                    if ($login_user) { ?>
                        (<em class="h-light">已登录</em>)
                    <?php } else { ?>
                        (<em class="h-light">未登录</em>)
                    <?php } ?>
                </a>
            </li>
            <li class="menu-favorites">
                <i class="iconfont icon-collect"></i><a href="welcome/collection_manage" data-stat-label="收藏">收藏</a>
            </li>
            <li class="menu-msg">
                <i class="iconfont icon-message"></i><a href="Welcome/message" data-stat-label="消息">消息</a>
                <span class="msg">&nbsp;</span>
            </li>
        </ul>
    </div>
</div>
<div class="container">
    <div id="nav">
        <a href="#">
            <img src="images/index-banner.jpg" alt=""/>
        </a>
    </div>
    <div class="search">
        <div class="fl search-box">
            <form action="house/index_search" method="post">
                <input class="fl search-box-ipt" placeholder="搜索房源..." type="text" name="content" />
                <input class="fl search-box-btn" type="submit" value=""/>
            </form>
        </div>
    </div>
    <a href="house/index_search" class="search all-house">全部房源</a>
    <div class="content">
        <div class="c-title">
            <h2>推荐房源</h2>
            <p>选择一个您合适的短租生活</p>
        </div>
        <div class="c-item-box">
            <?php
            foreach ($result as $index => $house) {
            ?>
            <div class="c-item">
                <a href="House/detail/<?php echo $house->house_id ?>">
                    <div class="p-img">
                        <img src="<?php echo ADMINPATH.$house->imgs[0]->img_thumb_src; ?>" alt=""/>
                    </div>
                    <div class="p-info">
                        <div class="fl p-title"><?php echo $house->title ?></div>
                        <div class="fr p-address"><?php echo $house->region ?></div>
                        <div class="p-detail"><?php echo $house->description ?></div>
                    </div>
                </a>
            </div>
                <?php
            }
            ?>

        </div>

    </div>
    <div class="footer">
        <div class="c-title">
            <h2>悦居便利你的生活</h2>
            <p>选择一个您合适的短租生活</p>
        </div>
        <ul class="f-icons clearfix">
            <li>
                <img src="images/footer-1.png" alt=""/>
                <div>安全交易</div>
            </li>
            <li>
                <img src="images/footer-2.png" alt=""/>
                <div>国企认证</div>
            </li>
            <li>
                <img src="images/footer-3.png" alt=""/>
                <div>其他认证</div>
            </li>
            <li>
                <img src="images/footer-4.png" alt=""/>
                <div>生活便捷</div>
            </li>
            <li>
                <img src="images/footer-5.png" alt=""/>
                <div>其他什么</div>
            </li>
        </ul>
    </div>
</div>
<script src="js/zepto.js"></script>
<script src="js/header.js"></script>
</body>
</html>