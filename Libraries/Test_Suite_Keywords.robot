*** Settings ***
Variables  variables.py
Library  SeleniumLibrary
Library  Collections
Library  String
*** Keywords ***
#Home page keywords
I can see a home page
    Verify Home Page's Elements
    Verify Home Page Contains Image

Verify home page's elements
    FOR  ${item}  IN  @{home_page_text_elements}
        Page Should Contain  ${item}
    END
Verify home page contains image
    Page Should Contain Image  ${image}
Go back to home page
    Click Element  ${back_home_button}
    Verify Home Page's Elements
#Purchase keywords
I can add an item to cart
    Click Element  ${add_to_cart_button}
    Element Text Should Be  ${shopping_cart_badge}   1
    Wait Until Element Is Visible   ${remove_from_cart_button}
    Page Should Contain Element  ${remove_from_cart_button}

I can see that an item has been added to cart
    Click Element  ${shopping_cart}
    Page Should Contain  Sauce Labs Backpack
    Page Should Contain  $29.99

I can place an order
    Click Element  ${checkout_button}
    Input First Name
    Input Last Name
    Input ZIP Code
    Click Element  ${continue_button}
    Overview and place an order
    Go Back To Home Page
Input first name
    Click Element  ${firstname_input}
    Input Text  ${firstname_input}  John
Input last name
    Click Element  ${lastname_input}
    Input Text  ${lastname_input}  Doe
Input ZIP code
    Click Element  ${postalcode_input}
    Input Text  ${postalcode_input}  12345
Overview and place an order
    Page Should Contain   Sauce Labs Backpack
    Scroll Element Into View  ${price}
    Element Should Contain   ${price}  29.99
    Element Should Contain  ${tax}  2.40
    Element Should Contain  ${total_price}  32.39
    Click Element  ${finish_button}
    Page Should Contain  Thank you for your order!

#Sorting keywords
Get inventory items list
    [Arguments]  ${items}
    @{elements}=  Get WebElements  ${items}
    ${lists}=    Create List
    FOR    ${locator}    IN  @{elements}
           ${list}=    Get Text    ${locator}
           Append To List    ${lists}    ${list}
    END
    [Return]  ${lists}
Remove $ from the items
    @{original_list}=  Get Inventory Items List  ${inventory_price}
    ${list}=  Create List
    FOR  ${item}  IN  @{original_list}
        ${str}=  Remove String  ${item}  $
        ${str}=  Convert To Number  ${str}
        Append To List  ${list}  ${str}
    END
    [Return]  ${list}
Sort the list of items
    [Arguments]  ${list}
    Sort list  ${list}
    [Return]  ${list}
Reverse the list of items
    [Arguments]  ${list}
    Sort List  ${list}
    Reverse list  ${list}
    [Return]  ${list}
Check selected sorting
    ${option}=  Get Selected List Value   ${filter_dropdown}
    [Return]  ${option}
Select sorting from the dropdown
    [Arguments]   ${sorting}
    Select From List By Value  ${filter_dropdown}    ${sorting}
Check that the items sorted A-Z
    ${default}=  Check selected sorting
    Should be Equal As Strings  ${default}  az
    ${original_list}=  Get Inventory Items List   ${inventory_list}
    ${sorted_list}=  Sort the list of items  ${original_list}
    Lists Should Be Equal   ${original_list}  ${sorted_list}
Check that the items sorted Z-A
    ${original_list_first} =  Get Inventory Items List  ${inventory_list}
    ${reversed_list}=  Reverse the list of items  ${original_list_first}
    Select Sorting From The Dropdown    za
    ${original_list}=  Get Inventory Items List  ${inventory_list}
    Lists Should Be Equal   ${original_list}  ${reversed_list}
Check that the items sorted low-high
    ${original_list_first}=  Remove $ from the items
    ${sorted_list}=  Sort the list of items  ${original_list_first}
    Select Sorting From The Dropdown   lohi
    ${original_list_second}=  Remove $ from the items
    Lists Should Be Equal  ${sorted_list}  ${original_list_second}
Check that the items sorted high-low
    ${original_list_first}=  Remove $ from the items
    ${sorted_list}=  Reverse the list of items  ${original_list_first}
    Select Sorting From The Dropdown   hilo
    ${original_list_second}=  Remove $ from the items
    Lists Should Be Equal  ${sorted_list}  ${original_list_second}


