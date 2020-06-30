*** Settings ***
Library           random
Library           DateTime
Library           OperatingSystem
Library           String    # Library    ../Library/robotPatch.py

*** Variables ***
@{MOCP_interface_names}    no4GBusSendMsgService    no4GBusCheckMsgService    changeMainProduct    rightsOrderQuery    productDetaiQuery    orderDetailQuery    serviceOrderQuery
...               availableiQuery    productListQuery    returnOrder
&{MOCP_GateWay_Servs}    client=http://183.233.87.203:58083

*** Keywords ***
