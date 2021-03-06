*** Settings ***
Resource          ../../KeyWords/Biz/通用业务逻辑处理.robot
Resource          ../../KeyWords/Biz/任我看大网业务.robot

*** Test Cases ***
权益订单查询，成功
    读取权益订单查询请求
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=1

权益订单查询，msgType节点为空，返回错误码
    读取权益订单查询请求
    删除请求节点    $.msgType
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，msgType节点值为空，返回错误码
    读取权益订单查询请求
    更新节点数据    $.msgType=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，msgType节点值为空串，返回错误码
    读取权益订单查询请求
    更新节点数据    $.msgType=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，version节点为空，返回错误码
    读取权益订单查询请求
    删除请求节点    $.version
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，version值为非1.0.0，返回错误码
    读取权益订单查询请求
    更新节点数据    $.version=2.0.0
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，version节点值为空，返回错误码
    读取权益订单查询请求
    更新节点数据    $.version=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，version节点值为空串，返回错误码
    读取权益订单查询请求
    更新节点数据    $.version=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，channelCode节点为空，返回错误码
    读取权益订单查询请求
    删除请求节点    $.channelCode
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，channelCode节点值为空，返回错误码
    读取权益订单查询请求
    更新节点数据    $.channelCode=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，channelCode节点值为空串，返回错误码
    读取权益订单查询请求
    更新节点数据    $.channelCode=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101

权益订单查询，orderId节点为空，返回错误码
    读取权益订单查询请求
    删除请求节点    $.orderId
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1

权益订单查询，orderId节点值为空，返回错误码
    读取权益订单查询请求
    更新节点数据    $.orderId=${None}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=2    $.bizDesc=查询失败，当前渠道无此订单信息(000)

权益订单查询，orderId节点值为空串，返回错误码
    读取权益订单查询请求
    更新节点数据    $.orderId=${EMPTY}
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=3    $.bizDesc=Paramter Error()

权益订单查询，json格式错误，返回错误码
    读取权益订单查询请求
    去掉请求体最后括号
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=1

权益订单查询，消息体为空，返回错误码
    读取权益订单查询请求
    删除请求节点    $.msgType    $.version    $.channelCode
    MOCP发送Reqx请求    /ifp/poorderAction/${req_flag}.service
    校验应答字段值    $.hRet=101
