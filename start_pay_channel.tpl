<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="yes" name="apple-touch-fullscreen">
    <meta content="telephone=no,email=no" name="format-detection">
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <title>立即收款</title>
    <link rel="stylesheet" href="/public/wechatServer/css/mim-common-h5.css" type="text/css">
    <style>
        .mim-font-40 {
            height: 56px;
            font-size: 40px;
            font-weight: 500;
            color: #40434E;
            line-height: 56px;
        }

        .mim-font-25 {
            height: 36px;
            font-size: 25px;
            font-weight: 500;
            color: #40434E;
            line-height: 36px;
            margin-left: 4px;
        }

        #pay_amount {
            height: 50px;
            font-size: 36px;
            font-weight: 500;
            color: #006AFF;
            line-height: 50px;
            background: #FFFFFF;
            text-align: right;
        }

        .channel_list .storm {
            padding: 30px 12px 30px 20px;
            margin: 12px;
            background: #FFFFFF;
            border-radius: 8px;
        }

        .pitch {
            background: url("/public/wechatServer/images/index/gzh_bg_2@2x.png") no-repeat center center/100% !important;
        }

        .pitch p, .pitch span {
            color: #FFFFFF !important;
        }

        .pops-div {
            position: absolute;
            bottom: 0;
            width: 100%;
            min-height: 60px;
            background: #ffffff;
            box-sizing: border-box;
        }

        .pops-foot {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 80px;
            padding: 30px 30px 30px 55px;
            background: #ffffff;
            box-sizing: border-box;
            left: 0;
        }

        .submit-up-div, .pops-up-div, .video-wrapper, .video-faceDiv, .gatheringDiv, .quick-wrapper {
            position: fixed;
            z-index: 9;
            width: 100%;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, .5);
        }

        .submit-up-div .submit-up {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: calc(100% - 24px);
            min-height: 200px;
            overflow: auto;
            padding: 12px;
            background: #ffffff;
            border-radius: 8px;
            box-sizing: border-box;
            z-index: 9;
        }

        #goPage {
            width: 100%;
            height: 48px;
            margin-top: 30px;
            background: #F5F6F7;
            border-radius: 8px;
            padding: 12px;
        }

        .pop-operation-div div {
            width: 100%;
        }

        .mim-fontBold-26 {
            height: 37px;
            font-size: 26px;
            font-weight: bold;
            color: #333C4F;
            line-height: 37px;
        }

        .pops-div-list {
            width: 100%;
            position: absolute;
            bottom: 80px;
            max-height: 50vh;
            overflow: auto;
            background: #ffffff;
            box-sizing: border-box;
            -webkit-overflow-scrolling: touch;
            left: 0;
        }

        .popsHeader {
            position: fixed;
            width: 100%;
            left: 0;
            height: 60px;
            background: #fff;
        }

        .pops-list .storm {
            padding: 14px 14px 16px 14px;
            border-top: 1px solid #f7f7f7;
        }

        .pops-list .storm:last-child {
            border-bottom: 1px solid #f7f7f7;
        }

        .mim-drawer-header {
            text-align: center;
            margin-top: 140px;
        }

        .mim-font-18 {
            height: 25px;
            font-size: 18px;
            font-weight: 400;
            color: #333C4F;
            line-height: 25px;
        }

        #code {
            background-color: transparent;
            padding-left: 12px;
        }

        #payCode {
            background-color: transparent;
            padding-left: 12px;
        }

        .btnDisabled {
            background-color: #FFFFFF !important;
        }

        .video-wrapper .wrapper, .video-faceDiv .faceDiv, .gatheringDiv .gathering, .quick-wrapper .wrapper {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: calc(100% - 24px);
            height: 400px;
            overflow: auto;
            background: #ffffff;
            border-radius: 8px;
            box-sizing: border-box;
            z-index: 9;
        }

        .close {
            position: absolute;
            top: 12px;
            right: 12px;
        }

        #video {
            position: absolute;
            object-fit: cover;
            z-index: 10;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            transform: translate(-50%, -50%) rotateY(180deg);
            top: 50%;
            left: 50%;
            margin-top: -60px;
        }

        .cont {
            position: relative;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
            width: 250px;
            text-align: center;
            margin-top: 130px;
        }

        #tip, .bg1 {
            font-size: 18px;
            font-weight: 400;
            color: #333333;
            line-height: 25px;
            height: 50px;
        }

        #hint, .bg2 {
            font-size: 12px;
            font-weight: 400;
            color: #333333;
            line-height: 17px;
            margin-top: 15px;
        }

        #hint2 {
            font-size: 10px;
            font-weight: 400;
            color: #006AFF;
            line-height: 17px;
            margin-top: 30px;
            display: none;
        }

        #unidentifiable {
            position: absolute;
            width: 180px;
            height: 36px;
            background: #00B6FF;
            border-radius: 15px;
            text-align: center;
            transform: translateX(-50%);
            left: 50%;
            bottom: 55px;
            font-size: 12px;
            font-weight: 400;
            color: #FFFFFF;
            line-height: 36px;
            display: none;
        }

        .rect {
            border: 2px solid #a64ceb;
            left: -1000px;
            position: absolute;
            top: -1000px;
            z-index: 1100;
            display: none;
        }

        .imgBg {
            position: absolute;
            object-fit: cover;
            z-index: 10;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            transform: translate(-50%, -50%);
            top: 50%;
            left: 50%;
            margin-top: -95px;
        }

        .bank {
            width: 48%;
        }

        .bgP {
            height: 33px;
            font-size: 24px;
            font-weight: bold;
            color: #333C4F;
            line-height: 33px;
        }

        .mimRed {
            color: #F23D4F;
        }

    </style>
</head>
<body>
<div class="mim-cont mim-borderRadius-8" style="height: 120px">
    <div class="mim-flex-wrap-space-between">
        <p class="mim-font-40">￥</p>
        <div class="mim-flex-wrap-right">
            <label for="pay_amount">
                <input type="tel" id="pay_amount" class="mim-input" disabled readonly>
            </label>
            <p class="mim-font-25">元</p>
        </div>
    </div>
    <hr style="width: 100%;height: 1px;border: 1px solid #F7F7F7;margin-top: 10px"/>
    <div class="mim-flex-wrap-space-between" style="margin-top: 11px">
        <p class="mim-font-14 mimMinor">手续费：￥<span class="mim-font-14 mimMinor withdraw_fee"></span></p>
        <p class="mim-font-14 mimMinor">实际到账：￥<span class="mim-font-14 mimMinor withdraw_amount"></span></p>
    </div>
</div>
<div class="channel_list" style="margin-bottom: 68px">
    <!--<div class="storm mim-flex-wrap-space-between pitch">
        <div class="mim-flex-wrap-left">
            <p class="mim-fontBold-16" style="margin-right: 14px">在线支付</p>
            <p class="mim-font-14">费率：<span class="mim-font-14"></span></p>
        </div>
        <img src="/public/wechatServer/images/icon/icon_dui.png" alt="" class="iconfont14">
    </div>-->
</div>
<div class="mim-foot">
    <div class="mim-foot-btn mim-bgColor-btn mim-borderRadius-8 mim-fontBold-16 imGathering">立即收款</div>
</div>
<!--提交订单弹窗-->
<div class="submit-up-div" style="display: none">
    <div class="submit-up" style="height: 260px">
        <img src="/public/wechatServer/images/icon/icon_X.png" alt="" class="close iconfont24">
        <div class="mim-flex-wrap mim-fontBold-26" style="margin: 28px 0 2px 0;text-align: center">
            <p class="mim-fontBold-26">¥</p>
            <p class="mim-fontBold-26 pay_amount"></p>
        </div>
        <div class="mim-flex-wrap mim-font-12">支付金额</div>
        <div class="mim-flex-wrap-space-between" style="" id="goPage">
            <div class="mim-div mim-flex-wrap-left" style="display: none">
                <img src="" alt="" class="iconfont24 bankImg" style="border-radius: 50%">
                <div class="mim-font-12 bankNames" style="margin-left: 8px"></div>
                <div class="mim-font-12 mimRed needVerify" style="margin-left: 10px">(需验证)</div>
            </div>
            <div class="mim-font-14 add" style="display: none">请选择银行卡</div>
            <img src="/public/wechat2/image/icon/icon_next.png" alt="" class="iconfont16" style="margin-top: 2px">
        </div>
        <div class="pop-operation-div mim-flex-wrap-space-between">
            <div class="confirmBtn mim-bgColor-btn">提交订单</div>
        </div>
    </div>
</div>
<!--选择支付卡弹窗-->
<div class="pops-up-div" style="display: none">
    <div class="pops-div">
        <div class="pops-div-list">
            <div class="mim-flex-wrap popsHeader">
                <img src="/public/wechatServer/images/icon/iconBank24.png" alt=""
                     class="iconfont24 close" style="left: 14px;top: 16px">
                <h2 class="mim-font-16">选择支付卡</h2>
            </div>
            <div class="pops-list" style="margin-top: 60px"></div>
        </div>
        <div class="pops-foot">
            <p class="mim-font-14 mimBlue" id="goBingFn">新增绑卡</p>
        </div>
    </div>
</div>
<!--刷脸的弹窗-->
<div class="video-wrapper" style="display: none">
    <div class="wrapper">
        <img src="/public/wechatServer/images/icon/icon_X.png" alt="" class="close iconfont24">
        <button id="capture" style="display: none;"></button>
        <button id="playVideo" style="display: none;"></button>
        <canvas id="canvas" width="320" height="480" style="display: none"></canvas>
        <!-- video用于显示媒体设备的视频流，自动播放 -->
        <video id="video" src="" autoplay="true" preload="auto" loop muted
               playsinline="true"
               x-webkit-airplay="allow"
               x5-video-orientation="portraint"
               x5-video-player-type="h5"
               x5-video-player-fullscreen="true"
               webkit-playsinline="true">
        </video>
        <div class="cont" id="cont">
            <p class="mim-font-18" id="tip"></p>
            <p class="mim-font-12" id="hint"></p>
            <p class="mim-font-12" id="hint2">如果识别时打开的是后置摄像头<br/>
                请点击屏幕摄像头反转的图标<br/>
                即可切换到前置摄像头</p>
        </div>
        <div id="unidentifiable">开始人脸识别</div>
    </div>
</div>
<!--快捷支付的弹窗-->
<div class="quick-wrapper" style="display: none">
    <div class="wrapper" style="height: 380px">
        <img src="/public/wechatServer/images/icon/icon_X.png" alt="" class="close iconfont24">
        <p class="mim-flex-wrap mim-fontBold-26 pay_amount" style="margin-top: 40px"></p>
        <p class="mim-flex-wrap mim-font-12" style="margin-top: 2px">支付金额</p>
        <div class="mim-cont mim-borderRadius-8 mim-flex-wrap-left"
             style="margin-top: 30px;height: 48px;background: #f5f6f7">
            <img src="" alt="" class="iconfont24 bankImg" style="border-radius: 50%">
            <div class="mim-font-12 bankNames" style="margin-left: 8px"></div>
        </div>
        <div class="mim-cont mim-borderRadius-8 mim-flex-wrap-space-between"
             style="margin-top: 12px;height: 48px;background: #f5f6f7">
            <div class="mim-flex-wrap-left" style="width: 100%">
                <label for="payPhone" style="width: 21%">手机号</label>
                <input type="tel" disabled readonly id="payPhone" class="mim-font-12"
                       style="padding-left: 12px;color: #7981A2!important;">
            </div>
        </div>
        <div class="mim-cont mim-borderRadius-8 mim-flex-wrap-space-between"
             style="margin-top: 12px;height: 48px;background: #f5f6f7">
            <div class="mim-flex-wrap-left">
                <label for="payCode" style="width: 30%">验证码</label>
                <input type="tel" id="payCode" placeholder="请输入验证码" oninput="this.value=this.value.replace(/\D/g, '')"
                       maxlength="6" class="mim-font-12">
            </div>
            <div class="btn80 mim-bgColor-btn count-down">获取验证码</div>
        </div>
        <div class="mim-foot" style="background: #FFFFFF">
            <div data-err="1" class="mim-foot-btn mim-bgColor-btn mim-borderRadius-8 mim-fontBold-16 payConfirm">
                确认支付
            </div>
        </div>
    </div>
</div>
<!--人脸识别超时的弹框-->
<div class="video-faceDiv" style="display: none">
    <div class="faceDiv" style="text-align: center">
        <img src="/public/wechat2/image/img_rlsbcs@2x.png" alt="" class="imgBg">
        <div class="cont" style="margin-top: 50px;width: 300px">
            <p class="bg1 mimOrange"></p>
            <p class="bg2">请在识别的时候手机略低于头部<br>并保持光线充足</p>
        </div>
        <div class="mim-foot mim-flex-wrap-space-between" style="background: #FFFFFF">
            <div class="bank mim-foot-btn mim-bgColor-btn mim-borderRadius-8 mim-fontBold-16 goBackFn">返回首页</div>
            <div class="bank mim-foot-btn mim-bgColor-btn mim-borderRadius-8 mim-fontBold-16 againFn">再次识别</div>
        </div>
    </div>
</div>
<!--支付成功、失败的弹窗-->
<div class="gatheringDiv" style="display: none">
    <div class="gathering" style="text-align: center">
        <img src="" alt="" style="width: 100px;height: 100px;margin-top: -110px"
             class="imgBg suc-err-img"/>
        <div class="cont" style="margin-top: 12px;width: 300px">
            <p style="margin-top: 20px;width: 70%;margin-left: 15%;" class="mim-font-14 errP"></p>
            <p style="margin-top: 36px" class="bgP"></p>
            <div class="sucDiv" style="display: none">
                <div class="mim-font-14 bank_card" style="margin-top: 12px"></div>
                <div class="mim-font-12 mim-flex-vertical" style="margin-top: 20px">
                    <p class="mim-flex-wrap mimGray mim-font-12">到账短信提醒存在迟发或者是漏发的可能</p>
                    <p class="mim-flex-wrap mimGray mim-font-12" style="margin-top: 2px">具体请核实结算卡入账明细</p>
                    <p class="mimGray mim-font-12 hint_text" style="margin-top: 10px"></p>
                </div>
            </div>
        </div>
        <div class="mim-foot" style="background: #FFFFFF">
            <div style="display: none"
                 class="goBackFn sucGoBack mim-foot-btn mim-bgColor-btn mim-borderRadius-8 mim-fontBold-16">返回主页
            </div>
            <div style="display: none"
                 class="errGoBack mim-foot-btn mim-bgColor-btn mim-borderRadius-8 mim-fontBold-16">
                返回
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/public/wechatServer/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/public/wechatServer/js/tracking-min.js"></script>
<script type="text/javascript" src="/public/wechatServer/js/face-min.js"></script>
<script type="text/javascript" src="/public/wechatServer/js/mim-common-h5.js"></script>
<script type="text/javascript">
    let pay_amount = '<{$pay_amount}>'; //用户交易金额
    let channel_no = '<{$channel_no}>'; //通道号 40001刷脸  60001快捷
    let bankId = "<{$bank_id}>"; //信用卡id
    let withdraw_fee = ""; //手续费
    let withdraw_amount = ""; //实际到账钱
    let pageType = ""; //1.去添加 2. 去列表
    let is_binding = "";//是否绑定新表 1 绑定 2 未绑定 3直接调取创建订单接口
    let binding_url = "";//跳转到绑卡页面
    let order_id = "";//生成支付时生成的订单id
    let order_no = "";//获取验证码生成的订单号
    let payConfirm = $(".payConfirm");
    let ticket = "";//快捷支付需要
    let is_show_bank = ""//是否展示提交订单框
    //刷脸参数
    let flag = 0; // 判断是否拍照
    let tipFlag = 0; // 判断是否拍照
    let streamIns = null;// 视频流实例
    let offSupport = "";//机型是否支持 1 支持 2 不支持
    const SECOND = 1000;
    let setFaceTime = ""//刷脸计时器
    let tracker = ""; //new创建新刷脸
    let video = document.getElementById("video");//得到摄像头
    let capture = document.getElementById("capture");//模拟相机按钮
    let playVideo = document.getElementById("playVideo");//模拟播放按钮
    let cont = document.getElementById("cont");//提示語句
    let tip = document.getElementById('tip'); //提示語句
    let hint = document.getElementById('hint');//提示語句
    let hint2 = document.getElementById('hint2');//提示語句
    let unidentifiable = document.getElementById('unidentifiable');//调取微信摄像头按钮
    let canvas = document.getElementById("canvas");
    let context = canvas.getContext("2d");
    let imgUrl = "";// 拍照并保存为base64模式
    let cache_no = "";//人脸缓存信息


    //提交订单展示与隐藏
    let submitUpShow = () => {
        $('body').addClass('mim-select-body-class')
        $(".submit-up-div").show();
    };
    let submitUpHide = () => {
        $('body').addClass('mim-select-body-class')
        $(".submit-up-div").hide();
    };
    $(".submit-up-div .submit-up").on("click", ".close", () => {
        $('body').removeClass('mim-select-body-class')
        $(".submit-up-div").hide();
    });

    //选择支付卡弹窗展示与隐藏
    let popsUpShow = () => {
        $('body').addClass('mim-select-body-class')
        $(".pops-up-div").show();
    };
    let popsUpHide = () => {
        $('body').addClass('mim-select-body-class')
        $(".pops-up-div").hide();
    };
    $(".pops-up-div .pops-div").on("click", ".popsHeader", () => {
        $('body').removeClass('mim-select-body-class')
        $(".pops-up-div").hide();
        submitUpShow()
    });

    //人脸识别的展示与隐藏
    let videoWrapperShow = () => {
        $('body').addClass('mim-select-body-class');
        $(".video-wrapper").show();
    };
    let videoWrapperHide = () => {
        $('body').removeClass('mim-select-body-class');
        $(".video-wrapper").hide();
    };

    //快捷支付的展示与隐藏
    let quickWrapperShow = () => {
        $('body').addClass('mim-select-body-class');
        $(".quick-wrapper").show();
    };
    let quickWrapperHide = () => {
        $('body').removeClass('mim-select-body-class');
        $(".quick-wrapper").hide();
    };
    $(".quick-wrapper .wrapper").on("click", ".close", () => {
        $('body').removeClass('mim-select-body-class')
        $(".quick-wrapper").hide();
        submitUpShow()
    });


    (() => {
        //开始支付 通道选择
        loadShow();
        promiseAjax("/wechatserver/order/startPayChannelApi", {
            pay_amount: pay_amount,
            channel_no: channel_no,
        }).then(ret => {
            if (ret.ec === 200) {
                $("#pay_amount").val(pay_amount);
                $(".pay_amount").html(pay_amount);
                let retData = ret.data;
                is_show_bank = retData.is_show_bank.toString();
                $('.channel_list').append(appendHtml(retData.pay_channel));
                $(".withdraw_fee").html(withdraw_fee);
                $(".withdraw_amount").html(withdraw_amount);
                channel_no = $(".pitch").attr("data-id");
                switch (is_show_bank) {
                    case "1":
                        submitUpShow();
                        bankListFn();
                        break;
                }
            } else {
                toastShow(ret.em);
            }
        }, () => plumNetworkFail()).finally(() => loadHide())
    })();

    //页面渲染(不带活动)
    let appendHtml = ret => {
        let html = '';
        $.each(ret, function (i, val) {
            switch (val["selected"]) {
                case 1:
                    withdraw_fee = val["amount_calculate"].amount_fee;
                    withdraw_amount = val["amount_calculate"].withdraw_amount;
                    html += '<div class="storm mim-flex-wrap-space-between pitch"  data-id=\'' + val["channel_id"] + '\' data-fee=\'' + val["amount_calculate"].amount_fee + '\' data-withdraw=\'' + val["amount_calculate"].withdraw_amount + '\'>';
                    break;
                default:
                    html += '<div class="storm mim-flex-wrap-space-between" data-id=\'' + val["channel_id"] + '\' data-fee=\'' + val["amount_calculate"].amount_fee + '\' data-withdraw=\'' + val["amount_calculate"].withdraw_amount + '\'>';
                    break;
            }
            html += '<div class="mim-flex-wrap-left">';
            html += '<p class="mim-fontBold-16" style="margin-right: 14px">' + val["channel_name"] + '</p>';
            html += '<p class="mim-font-14">费率：<span class="mim-font-14">' + val["fee"] + '</span></p></div>';
            html += '<img src="/public/wechatServer/images/icon/icon_dui.png" alt="" class="iconfont14">';
            html += '</div>';
        });
        return html;
    };

    //通道切换
    $(".channel_list").on("click", ".storm", function () {
        $(this).addClass('pitch').siblings().removeClass("pitch");
        channel_no = $(this).attr("data-id");
        withdraw_fee = $(this).attr("data-fee");
        withdraw_amount = $(this).attr("data-withdraw");
        $(".withdraw_fee").html(withdraw_fee);
        $(".withdraw_amount").html(withdraw_amount);
    });

    //立即收款
    $(".imGathering").on("click", () => {
        loadShow();
        promiseAjax("/wechatserver/order/channelQueryApi", {
            channel_no: channel_no,
            latitude: lat,
            longitude: lag,
        }).then(ret => {
            if (ret.ec === 200) {
                submitUpShow()
            } else {
                toastShow(ret.em);
            }

        }, () => plumNetworkFail()).finally(() => {
            loadHide();
            bankListFn();
        });
    });

    //信用卡列表
    let bankListFn = () => {
        $('.pops-list').empty();
        loadShow();
        promiseAjax("/wechatserver/order/bankCardList", {
            channel_no: channel_no,
        }).then(ret => {
            if (ret.ec === 200) {
                let retData = ret.data.list;
                if (retData.length !== 0) {
                    pageType = "2"
                    if (bankId) {
                        $.each(retData, function (i, val) {
                            if (bankId === val.id) {
                                $('.pops-list').append(appendHtmlPopsList(retData));
                                $('.pops-list .storm').eq(i).append($('<img src="/public/wechat2/image/icon/icon_dh.png" alt="" class="iconfont16 onSelect">'));
                                bankId = retData[i].id;
                                is_binding = retData[i].is_binding.toString();
                                switch (is_binding) {
                                    case "1":
                                        $(".needVerify").hide();
                                        break;
                                    case "2":
                                        $(".needVerify").show();
                                        binding_url = retData[i].binding_url;
                                        break;
                                    case "3":
                                        $(".needVerify").show();
                                        break;
                                }
                                $(".bankNames").html(retData[i].name);
                                $(".bankImg").attr("src", retData[i].ico);
                            }
                        })
                    } else {
                        $('.pops-list').append(appendHtmlPopsList(retData));
                        $('.pops-list .storm:first').append($('<img src="/public/wechat2/image/icon/icon_dh.png" alt="" class="iconfont16 onSelect">'));
                        bankId = retData[0].id;
                        is_binding = retData[0].is_binding.toString();
                        switch (is_binding) {
                            case "1":
                                $(".needVerify").hide();
                                break;
                            case "2":
                                $(".needVerify").show();
                                binding_url = retData[0].binding_url;
                                break;
                            case "3":
                                $(".needVerify").show();
                                break;
                        }
                        $(".bankNames").html(retData[0].name);
                        $(".bankImg").attr("src", retData[0].ico);
                    }
                } else {
                    pageType = "1"
                }
                switch (pageType) {
                    case "1":
                        $(".add").show();
                        break;
                    case "2":
                        $(".mim-div").show();
                        break;
                }
            } else {
                toastShow(ret.em);
            }
        }, () => plumNetworkFail()).finally(() => loadHide());
    }

    //选择卡或者去添加新卡
    $("#goPage").on("click", () => {
        if (pageType === "1") {
            window.location.href = "/wechatserver/order/bindCardHtml?channel_no=" + channel_no + "&amount=" + pay_amount;
        } else if (pageType === "2") {
            submitUpHide();
            popsUpShow();
        }
    });

    //新增绑卡
    $("#goBingFn").on("click", () => {
        window.location.href = "/wechatserver/order/bindCardHtml?channel_no=" + channel_no + "&amount=" + pay_amount;
    })

    // 选择银行卡
    $(".pops-up-div .pops-list").on("click", '.storm', function () {
        if (!$(this).find('.onSelect').length) {
            $(this).append($('<img src="/public/wechat2/image/icon/icon_dh.png" alt="" class="iconfont16 onSelect">')).siblings()
                .find('.onSelect').remove();
        }
        bankId = $(this).attr("data-id");
        is_binding = $(this).attr("data-bind");
        binding_url = $(this).attr("data-url");
        $(".bankNames").html($(this).attr("data-name"));
        $(".bankImg").attr("src", $(this).attr("data-ico"));

        switch (is_binding) {
            case "1":
                $(".needVerify").hide();
                popsUpHide();
                submitUpShow();
                break;
            case "2":
                if (binding_url) {
                    window.location.href = binding_url + "?bank_id=" + bankId + "&channel_no=" + channel_no + "&amount=" + pay_amount;
                }
                break;
            case "3":
                createOrderFn();
                break;
        }

    });

    //创建支付订单
    let createOrderFn = () => {
        loadShow();
        promiseAjax("/wechatserver/order/createOrderApi", {
            pay_amount: pay_amount,
            channel_no: channel_no,
            bank_id: bankId,
            longitude: lag,
            latitude: lat,
        }).then(ret => {
            if (ret.ec === 200) {
                let retData = ret.data;
                order_id = retData.order_id;
                let is_scan_face = retData.is_scan_face;
                switch (is_scan_face) {
                    case 1: //刷脸
                        cameraRetrieval();
                        videoWrapperShow();
                        submitUpHide();
                        break;
                    case 2: //快捷
                        loadShow("验证码获取中");

                        return promiseAjax("/wechatserver/order/startOrderPay", {
                            order_id: order_id,
                            bank_id: bankId,
                            latitude: lat,
                            longitude: lag,
                        })
                    // break;
                }
            } else if (ret.ec === 300) {
                toastShow(ret.em);
                let bank_id = ret.data.bank_id;
                channel_no = ret.data.channel_no;
                setTimeout(() => {
                    window.location.href = "/wechatserver/order/startPayChannelHtml?pay_amount=" + pay_amount + "&channel_no=" + channel_no + "&bank_id=" + bank_id;
                }, 1000)
            } else if (ret.ec === 600) {
                order_no = ret.data.order_no;
                let phone = ret.data.phone;
                window.location.href = "/wechatserver/order/sendCodeHtml?phone=" + phone + "&order_no=" + order_no + "&amount=" + pay_amount + "&channel_no=" + channel_no + "&bank_id=" + bankId;
            } else {
                toastShow(ret.em);
            }
        }, () => plumNetworkFail()).finally(() => loadHide())
            .then(ret => {
                if (ret.ec === 600) {
                    quickWrapperShow();
                    submitUpHide();
                    waitTime = 60;
                    toastShow(ret.em);
                    countDown('.count-down');
                    let retData = ret.data;
                    ticket = retData.ticket;
                    let phone = retData.phone;
                    $('#payPhone').val(phone);
                } else {
                    toastShow(ret.em);
                }
            }, () => plumNetworkFail()).finally(() => loadHide());
    }

    //调取支付接口（获取快速支付验证码）
    $(".count-down").on("click", () => {
        loadShow("验证码获取中");
        promiseAjax("/wechatserver/order/startOrderPay", {
            order_id: order_id,
            bank_id: bankId,
            latitude: lat,
            longitude: lag,
            ticket: ticket,
        }).then(ret => {
            if (ret.ec === 600) {
                let retData = ret.data;
                ticket = retData.ticket;
                waitTime = 60;
                countDown('.count-down');
            } else {
                toastShow(ret.em);
            }
        }, () => plumNetworkFail()).finally(() => loadHide());
    });
    //银行卡列表渲染
    let appendHtmlPopsList = ret => {
        let html = '';
        $.each(ret, function (i, val) {
                html += '<div class="mim-flex-wrap-space-between storm" data-id=' + val["id"] + ' data-name=' + val["name"] + ' data-ico=' + val["ico"] + ' data-bind=' + val["is_binding"] + ' data-url=' + val["binding_url"] + '>';
                html += '<div class="mim-flex-wrap-left">';
                html += '<img src=' + val["ico"] + ' alt="" class="iconfont24" style="margin-right: 11px">';
                html += '<div class="mim-font-12">' + val["name"] + '</div>';
                if (val["is_binding"] !== 1) {
                    html += '<div class="mim-font-12 mimRed" style="margin-left: 16px">(需验证)</div>';
                }
                html += '</div></div>';
            }
        );
        return html;
    };

    //提交订单(打开刷脸、打开快捷)
    $(".confirmBtn").on("click", () => {
        video.play();
        switch (is_binding) {
            case "1":
                //创建支付订单
                createOrderFn();
                break;
            case "2":
                if (binding_url) {
                    window.location.href = binding_url + "?bank_id=" + bankId + "&channel_no=" + channel_no + "&amount=" + pay_amount;
                }
                break;
            case "3":
                //创建支付订单
                createOrderFn();
                break;
        }
    });

    //快捷支付的支付弹窗
    payConfirm.on("click", () => {
        let code = $("#payCode").val();
        let err = payConfirm.attr("data-err");
        if (!code) {
            toastShow("请输入验证码");
            return false;
        }
        if (err === "1") {
            payConfirm.attr("data-err", "2").addClass("mimBgMinor");
            loadShow();
            promiseAjax("/wechatserver/order/smsCodePayApi", {
                ticket: ticket,
                sms_code: code,
            }).then(ret => {
                payPop();
                if (ret.ec === 200) {
                    $(".suc-err-img").attr("src", "/public/wechat2/image/icon/icon_ok.png");
                    $(".sucDiv").show();
                    $(".sucGoBack").show();
                    $(".bgP").html("收款成功");
                } else {
                    $(".errGoBack").show().on("click", () => {
                        quickWrapperShow();
                        $(".gatheringDiv").hide();
                    });
                    $(".bgP").html("收款失败");
                    $(".errP").html(ret.em)
                    $(".suc-err-img").attr("src", "/public/wechat2/image/icon/icon_err.png");
                }
                return promiseAjax("/wechatserver/order/paySuccess")
            }, () => plumNetworkFail()).then(ret => {
                if (ret.ec === 200) {
                    let retData = ret.data;
                    $(".bank_card").html(retData.bank_card);
                    $(".hint_text").html(retData.text);
                } else {
                    toastShow(ret.em);
                }
            }, () => plumNetworkFail()).finally(() => {
                loadHide();
                payConfirm.attr("data-err", "1").removeClass("mimBgMinor");
            })
        }
    })

    // <!--------刷脸-------->
    //调取摄像头
    let cameraRetrieval = () => {
        setFaceTime = "";
        flag = 0; // 判断是否拍照
        tipFlag = 0; // 判断是否拍照
        if (navigator.mediaDevices !== undefined) {
            if (navigator.mediaDevices.getUserMedia
                || navigator.getUserMedia
                || navigator.webkitGetUserMedia
                || navigator.mozGetUserMedia
            ) {
                //调用用户媒体设备，访问摄像头
                offSupport = "1"
                getUserMedia({
                    video: {
                        width: {min: 960, ideal: 1280, max: 1920},
                        height: {min: 540, ideal: 720, max: 1080},
                        facingMode: "user", // 前置优先
                    }
                }, success, error);
            }
        } else {
            offSupport = "2"
            tip.innerText = "该机型暂不支持自动识别！";
            hint.innerText = "请点击下方按钮手动打开识别\n即可使用";
            hint2.style.display = "block";
            cont.style.cssText = "margin-top: -50px";
            video.style.display = "none";
            unidentifiable.style.display = "block";
            unidentifiable.addEventListener("click", function () {
                videoWrapperHide();
                openCamera();
            })
        }

        // 访问用户媒体设备的兼容方法
        function getUserMedia(constrains, success, error) {
            if (navigator.mediaDevices.getUserMedia) {
                //最新标准API
                navigator.mediaDevices.getUserMedia(constrains).then(success).catch(error);
            } else if (navigator.webkitGetUserMedia) {
                //webkit内核浏览器
                navigator.webkitGetUserMedia(constrains).then(success).catch(error);
            } else if (navigator.mozGetUserMedia) {
                //Firefox浏览器
                navigator.mozGetUserMedia(constrains).then(success).catch(error);
            } else if (navigator.getUserMedia) {
                //旧版API
                navigator.getUserMedia(constrains).then(success).catch(error);
            }
        }

        // 成功的回调函数
        function success(stream) {
            streamIns = stream
            //兼容webkit内核浏览器
            let CompatibleURL = window.URL || window.webkitURL;
            //将视频流设置为video元素的源
            try {
                video.src = CompatibleURL.createObjectURL(stream);
            } catch (e) {
                // throw new Error(e);
                video.srcObject = stream;
            }
            //模拟点击
            playVideo.click();

        }

        //模拟点击
        document.getElementById("playVideo").addEventListener("click", function () {
            // 播放视频
            video.play().then(function () {
                clearTimeout(setFaceTime);
                executeFn()
                tip.innerText = "正在检测人脸中...";
                hint.innerText = "请正对手机并将人脸移入框内\n保持光线充足";
            }).catch(function (err) {
                tip.innerText = "出错请退出重试";
                // tip.innerText = err;
            });
        });


        // 异常的回调函数
        function error(err) {
            offSupport = "2"
            tip.innerText = "您已拒绝使用摄像头";
            hint.innerText = "如需继续使用请退出重进";
            cont.style.cssText = "top:0";
            video.style.display = "none";
            unidentifiable.style.display = "block";
            unidentifiable.innerText = "确定"
            unidentifiable.addEventListener("click", function () {
                WeixinJSBridge.call('closeWindow');
            })
        }


    }

    //绘制追踪
    let executeFn = () => {
        tracker = new tracking.ObjectTracker('face'); // 可选 face, eye, mouth, 需要引入相应的js
        // 设置步长
        tracker.setInitialScale(4);
        tracker.setStepSize(2);
        tracker.setEdgesDensity(0.1);
        // 开始追踪
        tracking.track('#video', tracker);
        // 绑定监听方法
        tracker.on('track', handleTracked);
        // 15s后移除监听并提示超时
        setFaceTime = setTimeout(() => {
            promiseAjax("/wechatserver/order/exceptionNotification", {
                errorType: '4001',
                source: order_id,
                errorCode: '',
                errorMsg: '人脸识别超时',
            }).then(ret => {
                if (ret.ec === 200) {
                    faceErr();
                    $(".bg1").html(ret.em);
                } else {
                    toastShow(ret.em);
                }
            }, () => plumNetworkFail()).finally(() => {
                loadHide();
            });
        }, 15 * SECOND)

    }

    // 处理追踪事件
    let handleTracked = event => {
        if (event.data.length === 0) {
            // 没有检测到
            console.log('没有检测到人脸');
        } else {
            // 提示用户已经检测到人脸
            if (!tipFlag) {
                tip.innerText = '检测人脸成功，正在拍照，请保持不动2秒！';
                removeTracker()
            }
            // 1秒后拍照，仅拍一次
            if (!flag) {
                flag = 1;
                setTimeout(() => {
                    // 模拟btn点击事件
                    capture.click();
                    tip.innerText = '拍照完成！';
                    hint.innerText = "照片努力上传中\n请等待";
                    tipFlag = 1
                    closeStream();
                    uploadingFn();
                }, 1000);
            }
            // 人脸数据点阵处理
            event.data.forEach(window.plot)
        }
    }

    // 绘制追踪框
    window.plot = function ({x, y, width: w, height: h}) {
        // 创建框对象
        let rect = document.createElement('div');
        document.querySelector('.video-wrapper').appendChild(rect);
        rect.classList.add('rect');
        rect.style.width = w + 'px';
        rect.style.height = h + 'px';
        rect.style.left = (video.offsetLeft / 2 + x) + 'px';
        rect.style.top = (video.offsetTop / 2 + y) + 'px';
    };

    // 注册拍照按钮的单击事件
    document.getElementById("capture").addEventListener("click", function () {
        //绘制画面
        context.drawImage(video, 0, 0, 320, 480);
        // 保持图片为base64格式
        imgUrl = saveAsPNG(canvas);
        // 显示图片
        // cont.append(convertCanvasToImage(canvas));
    });

    // 保存成png格式的图片
    let saveAsPNG = canvas => {
        return canvas.toDataURL("image/png");
    }

    // 移除监听事件
    let removeTracker = () => {
        tracker.removeListener('track', handleTracked);
    }

    // 关闭摄像
    let closeStream = () => {
        try {
            streamIns.enabled = false;
            streamIns.getTracks()[0].stop();
            streamIns.getVideoTracks()[0].stop();
        } catch (e) {
            throw new Error(e);
        }
    }

    // canvas to Image
    let convertCanvasToImage = canvas => {
        let image = new Image();
        image.src = canvas.toDataURL("image/png");
        return image;
    }

    //拍照成功开始上传图片
    let uploadingFn = () => {
        loadShow("照片上传中");
        promiseAjax("/wechatserver/order/faceIdentifyApi", {
            face_image: imgUrl,
            order_id: order_id,
        }).then(ret => {
            if (ret.ec === 200) {
                cache_no = ret.data.cache_no;
                payPort();
            } else {
                faceErr();
                loadHide();
                $(".bg1").html(ret.em);
            }
        }, () => plumNetworkFail());
    }

    //图片上传成功后调取三方接口
    let payPort = () => {
        loadShow("银行处理中");
        promiseAjax("/wechatserver/order/startOrderPay", {
            order_id: order_id,
            bank_id: bankId,
            cache_no: cache_no,
            latitude: lat,
            longitude: lag,
        }).then(ret => {
            payPop();
            if (ret.ec === 200) {
                $(".suc-err-img").attr("src", "/public/wechat2/image/icon/icon_ok.png");
                $(".sucDiv").show();
                $(".sucGoBack").show();
                $(".bgP").html("收款成功");
            } else {
                $(".errGoBack").show().on("click", () => {
                    $(".pop-up-div").show();
                    $(".gatheringDiv").hide();
                });
                $(".bgP").html("收款失败");
                $(".errP").html(ret.em)
                $(".suc-err-img").attr("src", "/public/wechat2/image/icon/icon_err.png");
            }
            return promiseAjax("/wechatserver/order/paySuccess")
        }, () => plumNetworkFail()).finally(() => loadHide())
            .then(ret => {
                if (ret.ec === 200) {
                    let retData = ret.data;
                    $(".bank_card").html(retData.bank_card);
                    $(".hint_text").html(retData.text);
                } else {
                    toastShow(ret.em);
                }
            }, () => plumNetworkFail()).finally(() => loadHide())
    }


    //关闭刷脸弹窗
    $(".video-wrapper .wrapper").on("click", ".close", () => {
        if (offSupport !== "2") {
            closeStream();
            clearTimeout(setFaceTime);
        }
        videoWrapperHide();
        submitUpShow();
    });

    //返回首页
    $(".goBackFn").on("click", () => {
        window.location.href = "/wechatserver/user/userCenter"
    })

    //再次识别
    $(".againFn").on("click", () => {
        videoWrapperShow();
        $(".video-faceDiv").hide();
        cameraRetrieval();
    })

    //执行打开刷脸失败的弹窗
    let faceErr = () => {
        if (offSupport !== "2") {
            removeTracker();
            closeStream();
            clearTimeout(setFaceTime);
        }
        videoWrapperHide();
        submitUpHide();
        $(".video-faceDiv").show();
    };

    //执行支付成功或失败的弹窗
    let payPop = () => {
        videoWrapperHide();
        submitUpHide();
        $(".gatheringDiv").show();
        quickWrapperHide();
    }

    //继续识别调取微信
    let openCamera = () => {
        wx.chooseImage({
            count: 1, // 默认9
            sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
            sourceType: ['camera'], // 可以指定来源是相册还是相机，默认二者都有
            success: function (res) {
                let localIds = res.localIds[0].toString(); // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                wx.getLocalImgData({
                    localId: localIds, // 图片的localID
                    success: function (res) {
                        let localData = res.localData; // localData是图片的base64数据，可以用img标签显示
                        switch (source) {
                            case "android":
                                imgUrl = 'data:image/jpg;base64,' + localData
                                break;
                            case "IOS":
                                imgUrl = localData
                                break;
                        }
                        uploadingFn();
                    }
                });
            }
        });
    }
</script>
</body>
</html>

