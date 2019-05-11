*** Settings ***
Library  SikuliLibrary  mode=NEW


*** Variables ***




*** Test Cases ***
TC_001_Window_Automation
    start sikuli process
    add image path   C:/Users/TestingWorld/Desktop/Images
    click  StartButton.png
    input text  SearchBox.png   calculator