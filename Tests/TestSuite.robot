*** Settings ***
Resource   ../Libraries/SetUp.robot
Resource   ../Libraries/Login_Keywords.robot
Resource  ../Libraries/Test_Suite_Keywords.robot
Suite Setup  I Open Browser
Suite Teardown  I Close All Browsers

*** Test Cases ***
As a standard user I can buy an item
    [Documentation]  Testing purchase of an item from home page
    [Tags]    positive
    I login as a standard user
    When I can see a home page
    And I can add an item to cart
    And I can see that an item has been added to cart
    Then I can place an order
    And Logout
As a locked user I cannot login
    [Documentation]  Testing that a locked user cannot login
    [Tags]  negative
    Given I login as a locked user
    Click login button
    Then An error appears on the login page
As a standard User I can see sorted A-Z items on the home page
    [Documentation]  Testing sorting
    [Tags]  positive  sorting
    I login as a standard user
    When I can see a home page
    Then Check that the items sorted A-Z
    And Logout
As a standard user I can sort Z-A items on the home page
    [Documentation]  Testing sorting
    [Tags]  positive  sorting
    I login as a standard user
    When I can see a home page
    Then Check that the items sorted Z-A
    And Logout
As a standard user I can sort low-high items on the home page
    [Documentation]  Testing sorting
    [Tags]  positive  sorting
    I login as a standard user
    When I can see a home page
    Then Check that the items sorted low-high
    And Logout
As a standard user I can sort high-low items on the home page
    [Documentation]  Testing sorting
    [Tags]  positive  sorting
    I login as a standard user
    When I can see a home page
    Then Check that the items sorted high-low
    And Logout