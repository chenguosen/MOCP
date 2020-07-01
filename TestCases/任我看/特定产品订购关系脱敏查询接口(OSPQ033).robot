*** Settings ***
Resource          ../../KeyWords/Biz/通用业务逻辑处理.robot
Resource          ../../KeyWords/Biz/任我看大网业务.robot

*** Test Cases ***
特定产品订购关系脱敏查询，成功
    读取特定产品订购关系脱敏查询请求
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=1    $.bizDesc=0000|success

特定产品订购关系脱敏查询，商品对应关系不存在，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.goodsIdList=99902002000004100010
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=2    $.bizDesc=2010|抱歉，商品对应关系不存在！

特定产品订购关系脱敏查询，手机号格式错误，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.serviceNumber=1581864****
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，msgType节点为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    删除请求节点    $.msgType
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，msgType节点值为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.msgType=${None}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，msgType节点值为空串，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.msgType=${EMPTY}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，version节点为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    删除请求节点    $.version
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，version值为非1.0.0，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.version=2.0.0
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，version节点值为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.version=${None}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，version节点值为空串，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.version=${EMPTY}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101

特定产品订购关系脱敏查询，serviceType节点为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    删除请求节点    $.serviceType
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，serviceType节点值为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.serviceType=${None}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，serviceType节点值为空串，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.serviceType=${EMPTY}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，serviceNumber节点为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    删除请求节点    $.serviceNumber
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，serviceNumber节点值为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.serviceNumber=${None}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，serviceNumber节点值为空串，返回错误码
    读取特定产品订购关系脱敏查询请求
    更新节点数据    $.serviceNumber=${EMPTY}
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=0    $.bizCode=02

特定产品订购关系脱敏查询，json格式错误，返回错误码
    读取特定产品订购关系脱敏查询请求
    去掉请求体最后括号
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=1

特定产品订购关系脱敏查询，消息体为空，返回错误码
    读取特定产品订购关系脱敏查询请求
    删除请求节点    $.msgType    $.version    $.channelCode
    MOCP发送Reqx请求    /ifp/specificOrderQueryAction/${req_flag}.service
    校验应答字段值    $.hRet=101
