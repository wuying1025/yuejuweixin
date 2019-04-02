<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="keywords" content="悦居租房"/>
    <meta name="description" content="悦居租房"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>悦居租房</title>
    <base href="<?php echo site_url(); ?>">
    <link rel="apple-touch-icon-precomposed" href="">
    <link rel="Shortcut Icon" type="image/x-icon" href="">
    <link rel="stylesheet" href="css/mint-ui.min.css">
    <link rel="stylesheet" href="css/about-yueju.css">
    <script src="js/vue.min.js"></script>
    <script src="js/mintUI.min.js"></script>
</head>
<body>

<div id="app" class="page-welcome">
    <mt-header title="关于悦居租房">
        <mt-button @click="home" icon="back" slot="left">返回
        </mt-button>
    </mt-header>
    <div style="height: 150px;">
        <mt-swipe :show-indicators="true" :auto="2500">
            <mt-swipe-item><img
                        src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492237760181&di=3f2e49e54636670d42a6176081e9a599&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Flarge%2Fa72f9e0cgw1dtu2zxpdlcj.jpg"
                        alt="">
            </mt-swipe-item>
            <mt-swipe-item><img
                        src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492237760181&di=8b08a4070c7f6e098eb1bd1fc0ef50be&imgtype=0&src=http%3A%2F%2Fsrc.house.sina.com.cn%2Fimp%2Fimp%2Fdeal%2F91%2Feb%2Fa%2Fdab4668bfd3544b879dca897348_p7_mk7_cm750X750.jpg"
                        alt="">
            </mt-swipe-item>
            <mt-swipe-item><img
                        src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492832636&di=1f932136d1f0f007df05b6f63e279e69&imgtype=jpg&er=1&src=http%3A%2F%2Fsrc.house.sina.com.cn%2Fimp%2Fimp%2Fdeal%2Fc6%2Fcb%2Fd%2Fe1cca204eaefb87e172c3056c79_p7_mk7_cm750X750.jpg"
                        alt="">
            </mt-swipe-item>
        </mt-swipe>
    </div>
    <article>
        <div class="photo"><img
                    src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492245959476&di=9a6dc0238a07f82f7d319b26bca21a8a&imgtype=0&src=http%3A%2F%2Fsrc.house.sina.com.cn%2Fimp%2Fimp%2Fdeal%2Fbd%2F88%2F9%2Fb9ac5d8dfb7fa502dd5db16b029_p7_mk7_cm750X750.jpg">
        </div>
        <div class="text">
            <h2>国有企业是改善民生的根本保障</h2>
            <p>
                哈尔滨住房建设发展集团有限责任公司（以下简称住房建设集团）<br/>
                于2013年11月23日成立，是市政府批准出资成立<br/>
                市国资委作为国有资本出资人的国有独资有限责任公司<br/>
                公司注册资本5亿元人民币，净资产20.7亿元，在册职工1051人。
            </p>
        </div>
    </article>

    <article>
        <div class="photo"><img src="http://img.hrbzhufangjituan.com/upload/0/2/2017/4/1491814401162.jpg"></div>
        <div class="text">
            <h2>以资产为纽带的母子公司管理体制</h2>
        </div>
    </article>

    <article class="list">
        <h2 class="title"><span>下辖11家子公司</span></h2>
        <div class="box">
            <div class="img"><img src="http://img.hrbzhufangjituan.com/upload/0/2/2017/4/1491814401209.jpg" alt="">
            </div>
            <div class="txt">
                <ol>
                    <li>哈尔滨市房地产经营公司</li>
                    <li>哈尔滨综合开发建设有限公司</li>
                    <li>哈尔滨好民居建设投资发展有限公司</li>
                    <li>哈尔滨市天昊房地产开发建设有限公司</li>
                    <li>哈尔滨市河松房地产开发有限责任公司</li>
                    <li>哈尔滨市三开房地产开发有限公司</li>
                </ol>
                <ol>
                    <li>哈尔滨市旧城区开发建设指挥部</li>
                    <li>哈尔滨市新阳开发建设指挥部</li>
                    <li>哈尔滨市民用建筑设计院</li>
                    <li>哈尔滨市民用建筑设计院</li>
                    <li>哈尔滨市房地产经营公司</li>
                    <li>哈尔滨市民用建筑设计院</li>
                </ol>
                <ol>
                    <li>哈尔滨市房屋土地综合开发公司（一开发）</li>
                    <li>中房集团哈尔滨房地产开发公司（二开发）</li>
                </ol>
                <div class="comment">
                    <img src="https://staticfile.tujia.com/mobile/images/h5/promotion/yhjy/user1.png">
                    <div class="">
                        <p><span>刘总</span>2017-03-09</p>
                        <q>我们的三大发展定位是：突出房地产开发主业；承担棚改和保障性住房建设；参与土地一级整理</q>
                    </div>
                </div>
            </div>
        </div>
    </article>

    <article class="list">
        <h2 class="title"><span>管理团队</span></h2>
        <div class="box">
            <div class="img"><img
                        src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492246355773&di=f29f3985292e3a52a6d51da2dfb38933&imgtype=0&src=http%3A%2F%2Fwww.jianiang.cn%2Fuploads%2Fallimg%2F141019%2F8490-14101ZS551937.jpg"
                        alt="">
            </div>
            <div class="txt">
                <ol>
                    <li>公司设董事会，成员为7人，其中有1名职工代表出任董事</li>
                    <li>董事任期三年，任期届满，可连选连任</li>
                    <li>董事会设董事长1人，由出资人从董事会成员中指定</li>
                    <li>监事会设主席1人，由出资人从监事会成员中指定</li>
                    <li>监事任期每届为三年，任期届满，可连选连任</li>
                </ol>
                <div class="comment">
                    <img src="https://staticfile.tujia.com/mobile/images/h5/promotion/yhjy/user2.png">
                    <div>
                        <p><span>王总</span>2017-01-18</p>
                        <q>打造优秀管理团队的精髓就是调动员工工作的积极性，使之自觉地投入到工作中去，达到“无为而治”的境界。促成这个目标的实现，需要从多方面入手，要进行换位思考，充分了解员工的真实需求，有针对性地采取一些管理方法，把管理的科学性艺术性有机地结合起来，通过努力是能够在一定程度、一定范围、一定时期内可达到管理的高级境界——“没有管理的管理”。</q>
                    </div>
                </div>
            </div>
        </div>
    </article>

    <article class="list">
        <h2 class="title"><span>发展目标</span></h2>
        <div class="box">
            <div class="img"><img
                        src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492246630410&di=80d43b86dd50686b8c6dabd19ee65c1a&imgtype=0&src=http%3A%2F%2Fwww.zjhxjt.com%2FArticle%2FUploadFiles%2F12.jpg"
                        alt="">
            </div>
            <div class="txt">
                <ol>
                    <li>第一步是打基础—力争用3年时间，依托棚户区改造和保障性住房建设完成资本原始积累，净资产规模达到30亿元</li>
                    <li>第二步是增实力—力争用5年时间，通过与二级市场联动提升房地产开发建设市场竞争力，打造我市房地产开发龙头企业</li>
                    <li>第三步是求上市—力争用7年时间，全面建成现代企业制度，打造上市企业，实现做大做强</li>
                </ol>
                <div class="comment">
                    <img src="https://staticfile.tujia.com/mobile/images/h5/promotion/yhjy/user3.png">
                    <div>
                        <p><span>李总</span>2017-04-9</p>
                        <q>集团发展目标：具体目标分三步走</q>
                    </div>
                </div>
            </div>
        </div>
    </article>

    <footer class="about-yueju">

        <div class="info">
            <div class="logo"><img src="images/logo.png" alt="悦居租房-logo"></div>
            <div class="name">哈尔滨悦居房屋租赁有限责任公司</div>
            <div class="hotphone">客服热线： <a href="tel:4001881234">400-188-1234</a></div>
            <div class="link">联系我们：010-57619000 (转8000)</div>
        </div>
    </footer>

    <a class="tool-search" href="<?php echo site_url(); ?>">查找<br/>房屋</a>
</div>

<script>
    new Vue({
        el: '#app',
        methods: {
            home: function () {
                window.location = '<?php echo site_url();?>';
            }
        }
    });
</script>
</body>
</html>