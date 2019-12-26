*** Settings ***
Library     Selenium2Library
Library     String
*** Variable ***

${btn}      //*[@class="FPdoLc VlcLAe"]//*[@value="ค้นหาด้วย Google"]
${Price}    //*[@class="roboto-thin screen768 ng-binding"]


*** Keywords ***


*** Test Case ***

TC01
    [Tags]                     positve
    Open Browser               https://www.google.com/                                        Chrome
    Close Browser

TC02
    [Tags]                     positve
    Open Browser               https://www.google.com/                                        Chrome
    Maximize Browser Window
    Input Text                 //*[@name="q"]                                                 facebook
    Click Element              //*[@id="lga"]
    Click Button               ${btn}
    Close Browser


TC03
    Open Browser               https://www.google.com/                                        Chrome
    Maximize Browser Window
    Input Text                 //*[@name="q"]                                                 robot framework
    Click Element              //*[@id="lga"]
    Click Button               ${btn}
    Click Element              //*[@ref="https://robotframework.org/"]//*[@class="LC20lb"]
    ${textOutput}              Get Text                                                       //*[@class="main-header"]
    Log To Console             ${textOutput}
    Run Keyword If             '${textOutput}'== 'ROBOT FRAME WORK/'                          Run Keyword                                              Log To Console    Step is Pass
    ...                        ELSE                                                           Log To Console                                           Step is False
    Close Browser

TC04
    #เปิดเว็บ
    Open Browser               http://advantageonlineshopping.com/#/                          Chrome
    #ขยายจอใหญ่
    Maximize Browser Window
    sleep                      10
    #เลือกโหมดสินค้า
    Click Element              //*[@class="rowSection"]//*[@id="miceImg"]
    Sleep                      10
    #เก็ทคำ MICE ออกมา
    ${MICE}                    Get Text                                                       //*[@data-ng-class="{ noPromotedProduct : viewAll }"]
    Log To Console             ${MICE}
    Run Keyword If             '${MICE}'== 'MICE'                                             Run Keyword                                              Log To Console    Step is Pass
    ...                        ELSE                                                           Log To Console                                           Step is False
    Sleep                      10
    #เลือกสินค้าเลือกสินค้า
    ${ITEM}                    Get Element Count                                              //*[@class="productName ng-binding"]
    Log To Console             ITEM: ${ITEM}
    Sleep                      10
    Click Element              //*[@id="31"]
    Sleep                      10

    #ราคา
    ${Price}                   Get Text                                                       ${Price}
    Log To Console             ${Price}
    Run Keyword If             '${Price}'== '$79.99'                                          Run Keyword                                              Log To Console    Step is Pass
    ...                        ELSE                                                           Log To Console                                           Step is False

    #เพิ่มจำนวนสินค้า
    sleep                      5
    :FOR  ${R1}  IN RANGE  1  8
    \    Click Element         //*[@class="plus"]


    ${Price}=                  Remove String                                                  ${Price}                                                 $

    ${Price}=                  Convert To Number                                              ${Price}
    log to console             Price : ${Price}
    ${TEST1}=                  Evaluate                                                       ${Price}*8
    Log To Console             Price : ${TEST1}
    Close Browser