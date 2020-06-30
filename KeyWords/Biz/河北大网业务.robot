*** Settings ***
Resource          通用业务逻辑处理.robot

*** Keywords ***
读取4G套餐短信下发请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[0]}
    ${reqx}    读取包结构    ${req_flag}.req.json
    ${systemtime}    MOCP时间戳
    ${CIOP_RANDNUM}    Set Variable    ${systemtime}
    ${sign}    Set Variable    ${CIOP_RANDNUM}#advert#CIOP
    log    ${sign}
    ${CIOP_TOKEN}    evaluate    hashlib.md5('${sign}'.encode(encoding='utf8')).hexdigest()    hashlib
    Comment    ${CIOP_TOKEN}    Convert To Uppercase    ${CIOP_TOKEN}
    重置节点数据    $.CIOP_RANDNUM=${CIOP_RANDNUM}    $.CIOP_TOKEN=${CIOP_TOKEN}

读取非4G套餐办理请求
    [Arguments]    @{kvs}
    Set Test Variable    ${req_flag}    ${MOCP_interface_names[1]}
    ${reqx}    读取包结构    ${req_flag}.req.json
    ${systemtime}    MOCP时间戳
    ${CIOP_RANDNUM}    Set Variable    ${systemtime}
    ${sign}    Set Variable    ${CIOP_RANDNUM}#advert#CIOP
    log    ${sign}
    ${CIOP_TOKEN}    evaluate    hashlib.md5('${sign}'.encode(encoding='utf8')).hexdigest()    hashlib
    Comment    ${CIOP_TOKEN}    Convert To Uppercase    ${CIOP_TOKEN}
    重置节点数据    $.CIOP_RANDNUM=${CIOP_RANDNUM}    $.CIOP_TOKEN=${CIOP_TOKEN}
