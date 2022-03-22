// 加载中图片路径
var LoadingSrc = "/public/wechat2/image/icon/icon_loading.png"

// // ajax请求封装
// function plumAjax(url, param, callBackDone, callBackAlways, callBackFail) {
//     $.ajax({
//         url: url,
//         data: param,
//         dataType: 'json',
//         method: "POST",
//         cache: false,
//         timeout: 20000 //毫秒单位
//     }).done(function (ret) {
//         callBackDone(ret);
//     }).always(function () {
//         if (typeof callBackAlways != "undefined")
//             callBackAlways();
//     }).fail(function () {
//         if (typeof callBackFail != "undefined")
//             callBackFail();
//     });
// }
/**
 * ajax请求封装
 */
function plumAjax(url, param, callBackDone, callBackAlways) {
    $.ajax({
        url: url,
        data: param,
        dataType: 'json',
        type: "POST",
        cache: false,
        timeout: 20000,
        success: function (ret) {
            callBackDone(ret);
        },
        complete: function () {
            callBackAlways()
        },
        error: function () {
            toastShow('服务器链接出错，请检查网络或重试');
        }
    });
}

//倒计时
var waitTime = 60;

function countDown(btn) {
    var set = "";
    if (waitTime === 0) {
        $(btn).html("获取验证码").removeClass("btnDisabled");
        waitTime = 60;
    } else {
        $(btn).html(waitTime + 'S').addClass("btnDisabled");
        waitTime--;
        set = setTimeout(function () {
            countDown(btn);
            clearTimeout(set);
        }, 1000)
    }
}

//关闭弹窗
$(".pop-up-div").on("click", function () {
    $('body').removeClass('mim-select-body-class')
    $(".pop-up-div").hide();
});
$(".cancelBtn").on("click", function () {
    $('body').removeClass('mim-select-body-class')
    $(".pop-up-div").hide();
});
$(".pop-up").on("click", function (e) {
    e.preventDefault();
    e.stopPropagation();
});

//数据加载中
function loadShow() {
    $("body").append($("<div class=\"loadingToast\">\n" +
        "    <div class=\"loadingToast-div\">\n" +
        "        <img alt='数据加载中' src=" + LoadingSrc + " class=\"loadingToast-img\"/>\n" +
        "        <p class=\"loadingToast-p\">数据加载中</p>\n" +
        "    </div>\n" +
        "</div>"))
}

function loadHide() {
    $(".loadingToast").remove()
}

//提示
function toastShow(str) {
    var setTime = "";
    if (str) {
        if ($(".mim-toast-show").length === 0) {
            $("body").append($("<div class='mim-toast-show'>" + str + "</div>"));
            setTime = setTimeout(function () {
                $(".mim-toast-show").remove();
                clearTimeout(setTime);
            }, 2000)
        }
    }
}

function plumNetworkFail() {
    toastShow('服务器连接失败，请重试');
}

//自定义验证
function verifyReg(str, value, bool) {
    /*
    * @param str验证类型（提供手机号和邮箱）或者验证的正则表达式 value验证的数值 bool是否必填
    * @return 1 验证通过  2 填入为空  3 格式不正确
    * */
    var mobileReg = /^0?(13|15|18|17|14|19|16)[0-9]{9}$/; /*手机号验证*/
    var emailReg = /^[\.a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;/*邮箱验证*/
    if (str === "phone") {
        if (bool) {
            if (!value) {
                return 2
            }
        }
        if (!!bool) {
            if (!mobileReg.test(value)) {
                return 3
            } else {
                return 1
            }
        } else {
            return 1
        }
    } else if (str === "email") {
        if (bool) {
            if (!value) {
                return 2
            }
        }
        if (!!value) {
            if (!emailReg.test(value)) {
                return 3
            } else {
                return 1
            }
        } else {
            return 1
        }
    } else {
        if (bool) {
            if (!value) {
                return 2
            }
        }
        if (!!bool) {
            if (!str.test(value)) {
                return 3
            } else {
                return 1
            }
        } else {
            return 1
        }
    }
}

//手机验证
function verificationPhoneFn(obj) {
    obj.value = obj.value.replace(/[^\d]/g, '');
    obj.value = obj.value.length <= 11 ? obj.value : obj.value.substring(0, 11);
    if (obj.value.length === 11) {
        if (verifyReg("phone", obj.value, true) === 3) {
            toastShow("请输入正确的手机号格式")
        }
    }
}

//限制只能输入正整数且保留二位小数
function payRestrictFn(obj) {
    obj.value = obj.value.replace(/[^\d.]/g, ""); //清除"数字"和"."以外的字符
    obj.value = obj.value.replace(/^\./g, ""); //验证第一个字符是数字
    obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个, 清除多余的
    obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数
    if (obj.value.indexOf(".") < 0 && obj.value != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的数字
        obj.value = parseFloat(obj.value);
    }
}

//列表弹窗
$(".mim-modal").on("click", function () {
    modalClose()
});
$(".mim-modal-div").on("click", function (e) {
    e.preventDefault();
    e.stopPropagation();
});

function modalOpen() {
    $('.mim-modal').fadeIn();
    $('body').addClass('mim-select-body-class')
}

function modalClose() {
    $('.mim-modal').fadeOut();
    $('body').removeClass('mim-select-body-class')
}

//模糊查询
function fuzzyQuery(list, keyWord) {
    var arr = [];
    for (var i = 0; i < list.length; i++) {
        if (list[i].indexOf(keyWord) >= 0) {
            arr.push(list[i]);
        }
    }
    return arr;
}

// 时间初始化
function mimSelectDate(clickStr, showStr, type, title_) {
    // clickStr 点击的div的
    // showStr 展示的div
    // type 1.每月开始时间 2.每月结束时间
    // title 标题改变
    var selectDateDom = clickStr;
    var showDateDom = showStr;
    type = (type === "" || type == null || typeof (type) == 'undefined') ? "" : type;
    title_ = (title_ === "" || title_ == null || typeof (title_) == 'undefined') ? "时间选择" : title_;
    var yearData = {}, monthData = {}, dateData = {};
    if (type === "2") {
        var now = new Date();
        var nowYear = now.getFullYear();
        var nowMonth = now.getMonth() + 1;
        var nowDate = now.getDate();
        showDateDom.attr('data-year', nowYear);
        showDateDom.attr('data-month', nowMonth);
        showDateDom.attr('data-date', nowDate);
        showDateDom.css({
            "color": "#006AFF",
            "fontWeight": "bold"
        }).val(nowYear + '年' + nowMonth + '月' + nowDate + '日').attr("data-time", nowYear + '-' + nowMonth + '-' + nowDate);

        // 数据初始化
        function formatYear(nowYear) {
            var arr = [];
            for (var i = nowYear - 5; i <= nowYear + 5; i++) {
                arr.push({
                    id: i + '',
                    value: i + '年'
                });
            }
            return arr;
        }

        function formatMonth() {
            var arr = [];
            for (var i = 1; i <= 12; i++) {
                arr.push({
                    id: i + '',
                    value: i + '月'
                });
            }
            return arr;
        }

        function formatDate(count) {
            var arr = [];
            for (var i = 1; i <= count; i++) {
                arr.push({
                    id: i + '',
                    value: i + '日'
                });
            }
            return arr;
        }

        yearData = function (callback) {
            // settimeout只是模拟异步请求，真实情况可以去掉
            // setTimeout(function() {
            callback(formatYear(nowYear))
            // }, 2000)
        };
        monthData = function (year, callback) {
            // settimeout只是模拟异步请求，真实情况可以去掉
            // setTimeout(function() {
            callback(formatMonth());
            // }, 2000);
        };
        dateData = function (year, month, callback) {
            // settimeout只是模拟异步请求，真实情况可以去掉
            // setTimeout(function() {
            if (/^(1|3|5|7|8|10|12)$/.test(month)) {
                callback(formatDate(31));
            } else if (/^(4|6|9|11)$/.test(month)) {
                callback(formatDate(30));
            } else if (/^2$/.test(month)) {
                if (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0) {
                    callback(formatDate(29));
                } else {
                    callback(formatDate(28));
                }
            } else {
                throw new Error('month is illegal');
            }
            // }, 2000);
            // ajax请求可以这样写
            /*
            $.ajax({
                type: 'get',
                url: '/example',
                success: function(data) {
                    callback(data);
                }
            });
            */
        };
    } else if (type === "1") {
        var date = new Date();
        date.setDate(1);
        var dateYear = date.getFullYear();
        var dateMonth = date.getMonth() + 1;
        var dateDate = date.getDate();
        showDateDom.attr('data-year', dateYear);
        showDateDom.attr('data-month', dateMonth);
        showDateDom.attr('data-date', dateDate);
        showDateDom.css({
            "color": "#006AFF",
            "fontWeight": "bold"
        }).val(dateYear + '年' + dateMonth + '月' + dateDate + '日').attr("data-time", dateYear + '-' + dateMonth + '-' + dateDate);

        // 数据初始化
        function formatYearFn(dateYear) {
            var arr = [];
            for (var i = dateYear - 5; i <= dateYear + 5; i++) {
                arr.push({
                    id: i + '',
                    value: i + '年'
                });
            }
            return arr;
        }

        function formatMonthFn() {
            var arr = [];
            for (var i = 1; i <= 12; i++) {
                arr.push({
                    id: i + '',
                    value: i + '月'
                });
            }
            return arr;
        }

        function formatDateFn(count) {
            var arr = [];
            for (var i = 1; i <= count; i++) {
                arr.push({
                    id: i + '',
                    value: i + '日'
                });
            }
            return arr;
        }

        yearData = function (callback) {
            callback(formatYearFn(dateYear))
        };
        monthData = function (year, callback) {
            callback(formatMonthFn());
        };
        dateData = function (year, month, callback) {
            if (/^(1|3|5|7|8|10|12)$/.test(month)) {
                callback(formatDateFn(31));
            } else if (/^(4|6|9|11)$/.test(month)) {
                callback(formatDateFn(30));
            } else if (/^2$/.test(month)) {
                if (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0) {
                    callback(formatDateFn(29));
                } else {
                    callback(formatDateFn(28));
                }
            } else {
                throw new Error('month is illegal');
            }
        };
    } else {
        var now_ = new Date();
        var now_Year = now_.getFullYear();
        var now_Month = now_.getMonth() + 1;
        var now_Date = now_.getDate();
        showDateDom.attr('data-year', now_Year);
        showDateDom.attr('data-month', now_Month);
        showDateDom.attr('data-date', now_Date);

        // 数据初始化
        function formatYearFn_(now_Year) {
            var arr = [];
            for (var i = now_Year - 5; i <= now_Year + 5; i++) {
                arr.push({
                    id: i + '',
                    value: i + '年'
                });
            }
            return arr;
        }

        function formatMonthFn_() {
            var arr = [];
            for (var i = 1; i <= 12; i++) {
                arr.push({
                    id: i + '',
                    value: i + '月'
                });
            }
            return arr;
        }

        function formatDateFn_(count) {
            var arr = [];
            for (var i = 1; i <= count; i++) {
                arr.push({
                    id: i + '',
                    value: i + '日'
                });
            }
            return arr;
        }

        yearData = function (callback) {
            callback(formatYearFn_(now_Year))
        };
        monthData = function (year, callback) {
            callback(formatMonthFn_());
        };
        dateData = function (year, month, callback) {
            if (/^(1|3|5|7|8|10|12)$/.test(month)) {
                callback(formatDateFn_(31));
            } else if (/^(4|6|9|11)$/.test(month)) {
                callback(formatDateFn_(30));
            } else if (/^2$/.test(month)) {
                if (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0) {
                    callback(formatDateFn_(29));
                } else {
                    callback(formatDateFn_(28));
                }
            } else {
                throw new Error('month is illegal');
            }
        };
    }

    selectDateDom.on('click', function () {
        var oneLevelId = showDateDom.attr('data-year');
        var twoLevelId = showDateDom.attr('data-month');
        var threeLevelId = showDateDom.attr('data-date');
        var iosSelect = new IosSelect(3,
            [yearData, monthData, dateData],
            {
                title: title_,
                itemHeight: 40,
                oneLevelId: oneLevelId,
                twoLevelId: twoLevelId,
                threeLevelId: threeLevelId,
                showLoading: true,
                callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                    showDateDom.attr('data-year', selectOneObj.id);
                    showDateDom.attr('data-month', selectTwoObj.id);
                    showDateDom.attr('data-date', selectThreeObj.id);
                    showDateDom.attr('data-time', selectOneObj.id + '-' + selectTwoObj.id + '-' + selectThreeObj.id);
                    showDateDom.css({
                        "color": "#006AFF",
                        "fontWeight": "bold"
                    }).val(selectOneObj.value + '' + selectTwoObj.value + '' + selectThreeObj.value);
                },
                fallback: function () {
                    var now_ = new Date();
                    var now_Year = now_.getFullYear();
                    var now_Month = now_.getMonth() + 1;
                    var now_Date = now_.getDate();
                    showDateDom.attr('data-year', now_Year).attr('data-month', now_Month).attr('data-date', now_Date).attr('data-time', '').css({
                        "color": "#333C4F",
                        "fontWeight": "400"
                    }).val('');
                }
            });
    });
}

// 地区初始化
function mimSelectRegion(clickStr, showStr, title_) {
    var selectContactDom = clickStr;
    var showContactDom = showStr;
    var contactProvinceCodeDom = $('#contact_province_code');
    var contactCityCodeDom = $('#contact_city_code');
    title_ = (title_ === "" || title_ == null || typeof (title_) == 'undefined') ? "地址选择" : title_;
    selectContactDom.on('click', function () {
        var sccode = showContactDom.attr('data-city-code');
        var scname = showContactDom.attr('data-city-name');
        var oneLevelId = showContactDom.attr('data-province-code');
        var twoLevelId = showContactDom.attr('data-city-code');
        var threeLevelId = showContactDom.attr('data-district-code');
        var iosSelect = new IosSelect(3,
            [iosProvinces, iosCitys, iosCountys],
            {
                title: title_,
                itemHeight: 44,
                relation: [1, 1],
                oneLevelId: oneLevelId,
                twoLevelId: twoLevelId,
                threeLevelId: threeLevelId,
                callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                    contactProvinceCodeDom.val(selectOneObj.id);
                    contactProvinceCodeDom.attr('data-province-name', selectOneObj.value);
                    contactCityCodeDom.val(selectTwoObj.id);
                    contactCityCodeDom.attr('data-city-name', selectTwoObj.value);
                    showContactDom.attr('data-province-code', selectOneObj.id);
                    showContactDom.attr('data-city-code', selectTwoObj.id);
                    showContactDom.attr('data-district-code', selectThreeObj.id);
                    showContactDom.attr('data-province-city', selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                    showContactDom.val(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                },
                fallback: function () {
                    contactProvinceCodeDom.val('');
                    contactProvinceCodeDom.attr('data-province-name', '');
                    contactCityCodeDom.val('');
                    contactCityCodeDom.attr('data-city-name', '');
                    showContactDom.attr('data-province-code', '');
                    showContactDom.attr('data-city-code', '');
                    showContactDom.attr('data-district-code', '');
                    showContactDom.attr('data-province-city', '');
                    showContactDom.val('');
                }
            });
    });
}

// 银行初始化
function mimSelectBank(clickStr, showStr, title_) {
    var selectBankDom = clickStr;
    var showBankDom = showStr;
    title_ = (title_ === "" || title_ == null || typeof (title_) == 'undefined') ? "银行卡选择" : title_;
    selectBankDom.on("click", function () {
        var bankId = showBankDom.attr('bank-name-id');
        var bankName = showBankDom.attr('bank-name');
        var iosSelect = new IosSelect(1,
            [bankData],
            {
                title: title_,
                itemHeight: 50,
                itemShowCount: 5,
                oneLevelId: bankId,
                callback: function (selectOneObj) {
                    showBankDom.attr("bank-name-id", selectOneObj.id).val(selectOneObj.value);
                },
                fallback: function () {
                    showBankDom.attr("bank-name-id", "").val('');
                }
            });
    });
}

// 单选框架初始化
function mimRadioFrame(clickStr, showStr, title_, data, callback_, fallback_) {
    var selectDom = clickStr;
    var showDom = showStr;
    title_ = (title_ === "" || title_ == null || typeof (title_) == 'undefined') ? "请选择" : title_;
    selectDom.on("click", function () {
        var id = showDom.attr('data-mim-id');
        var name = showDom.attr('data-mim-name');
        var iosSelect = new IosSelect(1,
            [data],
            {
                title: title_,
                itemHeight: 50,
                itemShowCount: 5,
                oneLevelId: id,
                callback: function (selectOneObj) {
                    return callback_(selectOneObj)
                },
                fallback: function () {
                    return fallback_()
                }
            });
    });
}

// 数量选择器初始化
function mimCountFn(number_, minimum_, step_, price_, callBackFn) {
    var number = number_; //实际数量/初始化数量
    var minimum = minimum_;//最小数量
    var step = step_; //步长
    var price = price_;//单价
    var countPrice = "";//总价
    //初始化
    var countNumberHtml = $(".mim-count-module .mim-count-number");
    var addCountHtml = $(".mim-count-module .add-num");
    var subtractCountHtml = $(".mim-count-module .subtract-num");
    countPrice = (Number(price) * Number(number)).toFixed(2);
    countNumberHtml.val(number).attr("count-price", countPrice);
    callBackFn();
    //加
    addCountHtml.on('click', function () {
        number = Number(number) + Number(step);
        countNumberHtml.val(number);
        countPrice = (Number(price) * Number(number)).toFixed(2);
        countNumberHtml.val(number).attr("count-price", countPrice);
        return callBackFn();
    });
    //减
    subtractCountHtml.on("click", function () {
        number = Number(number) - Number(step);
        if (number <= minimum) {
            number = minimum;
            toastShow('最小限购' + minimum);
        }
        countPrice = (Number(price) * Number(number)).toFixed(2);
        countNumberHtml.val(number).attr("count-price", countPrice);
        return callBackFn();
    })
    //输入数量
    countNumberHtml.on("blur", function () {
        var thisNumber = $(this).val()
        if (thisNumber) {
            if (Number(thisNumber) >= Number(minimum)) {
                number = thisNumber
                countPrice = (Number(price) * Number(thisNumber)).toFixed(2);
                countNumberHtml.val(thisNumber).attr("count-price", countPrice);
            } else {
                toastShow('最小限购' + minimum);
                number = minimum
                countPrice = (Number(price) * Number(minimum)).toFixed(2);
                countNumberHtml.val(minimum).attr("count-price", countPrice);
            }
        } else {
            number = minimum
            countPrice = (Number(price) * Number(minimum)).toFixed(2);
            countNumberHtml.val(minimum).attr("count-price", countPrice);
        }
        return callBackFn();
    });
}

//上传图片
function mimUploadImgFn(str, callBack) {
    str.on("input", function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            var result_ = e.target.result;
            var image = new Image();
            image.src = result_;
            image.onload = function () {
                var square = 1; //定义画布的大小，也就是图片压缩之后的像素var square = 0.2, //定义画布的大小，也就是图片压缩之后的像素

                if (image.width > 800 || image.height > 800) {
                    if (image.width > image.height) {
                        square = Math.floor(800 / image.width * 100) / 100;  //保留两位小数
                    } else {
                        square = Math.floor(800 / image.height * 100) / 100;  //保留两位小数
                    }
                }

                var canvas = document.createElement('canvas'),
                    context = canvas.getContext('2d'),
                    imageWidth = Math.round(square * image.width),    //压缩后图片的大小
                    imageHeight = Math.round(square * image.height),
                    data = '';
                canvas.width = imageWidth;
                canvas.height = imageHeight;
                context.clearRect(0, 0, imageWidth, imageHeight);
                context.drawImage(image, 0, 0, imageWidth, imageHeight);
                data = canvas.toDataURL('image/jpeg')  //这里是图片
                callBack(data)
            };
        };
        reader.readAsDataURL(str[0].files[0]);
    });
}

