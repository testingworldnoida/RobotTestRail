*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Test Teardown  LogStatusToTestRail

*** Variables ***
${URL}  https://testingworldindia.testrail.io


*** Test Cases ***
TC_001 Login Logout
    open browser  https://www.facebook.com   Chrome
    maximize browser window
    should be equal  1  2


*** Keywords ***

LogStatusToTestRail
    log to console  ${TEST_STATUS}
    run keyword if  '${TEST_STATUS}' == 'PASS'   LogStatusPass
    run keyword if  '${TEST_STATUS}' == 'FAIL'   LogStatusFail

LogStatusPass
    ${header}=	Create Dictionary	Content-Type=application/json
    ${auth}=  create list  testingworldindia@gmail.com   SHPJd6uwgmmPUjAbk80g
    ${param}=  create dictionary  status_id=1
    create session  Session1  ${URL}  auth=${auth}  headers=${header}
    ${Res}=  post request  Session1   /index.php?/api/v2/add_result_for_case/1/1  data=${param}
    log to console  ${Res.status_code}
    log to console  ${Res.json()}

LogStatusFail
    ${header}=	Create Dictionary	Content-Type=application/json
    ${auth}=  create list  testingworldindia@gmail.com   SHPJd6uwgmmPUjAbk80g
    ${param}=  create dictionary  status_id=5
    create session  Session1  ${URL}  auth=${auth}  headers=${header}
    ${Res}=  post request  Session1   /index.php?/api/v2/add_result_for_case/1/1  data=${param}
    log to console  ${Res.status_code}
    log to console  ${Res.json()}
