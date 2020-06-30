*** Settings ***
Resource          ../../KeyWords/Biz/任我看大网业务.robot
Resource          ../../KeyWords/Biz/通用业务逻辑处理.robot

*** Test Cases ***
权益商品综合退订，退单重复
    读取权益商品综合退订请求
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=2    $.bizDesc=退单重复

权益商品综合退订，手机号格式错误，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.number=1581864****
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1    $.respCode=02

权益商品综合退订，msgType节点为空，返回错误码
    读取权益商品综合退订请求
    删除请求节点    $.msgType
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，msgType节点值为空，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.msgType=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，msgType节点值为空串，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.msgType=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，version节点为空，返回错误码
    读取权益商品综合退订请求
    删除请求节点    $.version
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，version值为非1.0.0，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.version=2.0.0
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，version节点值为空，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.version=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，version节点值为空串，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.version=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，channelCode节点为空，返回错误码
    读取权益商品综合退订请求
    删除请求节点    $.channelCode
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，channelCode节点值为空，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.channelCode=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，channelCode节点值为空串，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.channelCode=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益商品综合退订，number节点为空，返回错误码
    读取权益商品综合退订请求
    删除请求节点    $.number
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1

权益商品综合退订，number节点值为空，返回错误码
    读取权益商品综合退订请求
    更新节点数据    $.number=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1    $.respDesc=[ field:, message:object has missing required properties (["number"]) ]    $.respCode=01

权益商品综合退订，number节点值为空串，返回错误码
    读取可订购权益产品查询请求
    更新节点数据    $.number=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1    $.respCode=02    $.respDesc=[ field:/number, message:string "" is too short (length: 0, required minimum: 11) ]

权益商品综合退订，json格式错误，返回错误码
    读取可订购权益产品查询请求
    去掉请求体最后括号
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1

权益商品综合退订，消息体为空，返回错误码
    读取可订购权益产品查询请求
    删除请求节点    $.msgType    $.version    $.channelCode
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101
