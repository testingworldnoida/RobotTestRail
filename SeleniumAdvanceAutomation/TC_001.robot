*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library    TestRailAPIClient    testingworldindia.xyz.io    testingworldindia@gmail.com    SHPJd6uwgmmPUjAbk80g   	1


*** Variables ***
${Applicaion_URL}  http://thetestingworld.com/testings/


*** Test Cases ***
TC_001 Login Logout
    Open_Browser_Maxiamize
    select checkbox  xpath=//input[@name='terms']
    [Tags]    testrailid=1
    Fail    Test fail message


*** Keywords ***
Open_Browser_Maxiamize
    open browser  ${Applicaion_URL}  Chrome
    maximize browser window
