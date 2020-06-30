*** Settings ***
Resource          ../../KeyWords/Biz/通用业务逻辑处理.robot
Resource          ../../KeyWords/Biz/河北大网业务.robot

*** Test Cases ***
非4G套餐短信下发，成功
    读取4G套餐短信下发请求
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.resultCode=0    $.CIOP_CODE=0    $.resultMsg=发送成功！

非4G套餐短信下发，频繁发送短信
    读取4G套餐短信下发请求
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.resultCode=1    $.CIOP_CODE=1    $.resultMsg=短信验证码，请勿频繁发送短信！

非4G套餐短信下发，CIOP_RANDNUM取值偏差超过正负10分钟，返回错误码
    读取4G套餐短信下发请求
    更新节点数据    $.CIOP_RANDNUM=2006291731581449
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=3

非4G套餐短信下发，CIOP_RANDNUM过长，返回错误码
    读取4G套餐短信下发请求
    更新节点数据    $.CIOP_RANDNUM=20062917315814491
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101

非4G套餐短信下发，签名校验失败，返回错误码
    读取4G套餐短信下发请求
    更新节点数据    $.CIOP_TOKEN=cd4187d6eed484d7648ea7d90054fd26
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=4

非4G套餐短信下发，CIOP_CHANNELID错误，返回错误码
    读取4G套餐短信下发请求
    更新节点数据    $.CIOP_CHANNELID=advert1
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=4

非4G套餐短信下发，CIOP_CHANNELID节点不存在，返回错误码
    读取4G套餐短信下发请求
    删除请求节点    $.CIOP_CHANNELID
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=4

非4G套餐短信下发，CIOP_RANDNUM节点不存在，返回错误码
    读取4G套餐短信下发请求
    删除请求节点    $.CIOP_RANDNUM
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101

非4G套餐短信下发，CIOP_TOKEN节点不存在，返回错误码
    读取4G套餐短信下发请求
    删除请求节点    $.CIOP_RANDNUM
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101

非4G套餐短信下发，BusiCode错误，返回错误码
    读取4G套餐短信下发请求
    更新节点数据    $.BusiCode=222222
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=1    $.CIOP_CODE=1    $.resultMsg=获取业务信息失败！

非4G套餐短信下发，手机号码错误，返回错误码
    读取4G套餐短信下发请求
    更新节点数据    $.MOBILE=1361311****
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=1    $.CIOP_CODE=1    $.resultMsg=手机号不合法！

非4G套餐短信下发，json格式错误，返回错误码
    读取4G套餐短信下发请求
    去掉请求体最后括号
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=1

非4G套餐短信下发，消息体为空，返回错误码
    读取4G套餐短信下发请求
    删除请求节点    $.CIOP_CHANNELID    $.CIOP_RANDNUM    $.CIOP_TOKEN    $.MOBILE    $.BusiCode
    MOCP发送Reqx请求    /bnhe/adPlatformAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101
