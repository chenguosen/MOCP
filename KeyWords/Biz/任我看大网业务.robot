*** Settings ***
Resource          通用业务逻辑处理.robot

*** Keywords ***
读取权益订单查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[3]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取权益产品详情查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[4]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取用户权益订单详情查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[5]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取用户权益订单查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[6]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取可领取权益查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[7]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取可订购权益产品查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[8]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取权益商品综合退订请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[9]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取特定产品订购关系脱敏查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[10]}
    ${reqx}    读取包结构    ${req_flag}.req.json

读取用户在网状态脱敏查询请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[11]}
    ${reqx}    读取包结构    ${req_flag}.req.json
