*** Settings ***
Resource          ../../KeyWords/Biz/通用业务逻辑处理.robot
Resource          ../../KeyWords/Biz/天津大网业务.robot

*** Test Cases ***
主产品变更，成功
    读取主产品变更请求
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=0

主产品变更，手机号码格式错误，返回错误码
    读取主产品变更请求
    更新节点数据    $.SERIAL_NUMBER=1361311****
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=0    $.respCode=OCB000003467    $.respDesc=OCB000003467#该服务号码[1361311****]用户信息不存在！

主产品变更，CIOP_RANDNUM取值偏差超过正负10分钟，返回错误码
    读取主产品变更请求
    更新节点数据    $.CIOP_RANDNUM=2006291731581449
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=3

主产品变更，CIOP_RANDNUM过长，返回错误码
    读取主产品变更请求
    更新节点数据    $.CIOP_RANDNUM=20062917315814491
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101

主产品变更，CIOP_CHANNELID错误，返回错误码
    读取主产品变更请求
    更新节点数据    $.CIOP_CHANNELID=advert1
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=4

主产品变更，签名校验失败，返回错误码
    读取主产品变更请求
    更新节点数据    $.CIOP_TOKEN=cd4187d6eed484d7648ea7d90054fd26
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=4

主产品变更，CIOP_CHANNELID节点不存在，返回错误码
    读取主产品变更请求
    删除请求节点    $.CIOP_CHANNELID
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=4

主产品变更，CIOP_RANDNUM节点不存在，返回错误码
    读取主产品变更请求
    删除请求节点    $.CIOP_RANDNUM
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101

主产品变更，CIOP_TOKEN节点不存在，返回错误码
    读取主产品变更请求
    删除请求节点    $.CIOP_RANDNUM
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101

主产品变更，json格式错误，返回错误码
    读取主产品变更请求
    去掉请求体最后括号
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=1

主产品变更，消息体为空，返回错误码
    读取主产品变更请求
    删除请求节点    $.CIOP_CHANNELID    $.CIOP_RANDNUM    $.CIOP_TOKEN
    MOCP发送Reqx请求    /bntj/adPlatFormAction/${req_flag}.service
    校验应答字段值    $.CIOP_CODE=101
