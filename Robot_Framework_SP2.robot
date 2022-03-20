*** Settings ***
Library           Selenium2Library

*** Variables ***
${clickSignin}    xpath= //li[@class='active']/a[contains(.,'Sign in')]
${inputEmail}     id=email_create
${clickRegister}    id=SubmitCreate
${inputFrstName}    xpath=//input[@name='customer_firstname']
${inputLstName}    xpath=//input[@name='customer_lastname']
${inputPass}      xpath=//input[@id='passwd']
${selectTglLahir}    xpath=//select[@id='days']/option[6]
${selectBlnLahir}    xpath = //option[contains(.,'September')]
${selectThnLahir}    xpath = //option[contains(.,'1999')]
${inputEmailLogin}    xpath=//input[@id='email']
${inputPassLogin}    xpath=//input[@id='passwd']
${submitLogin}    xpath=//button[@id='SubmitLogin']
${verifyWrongPass}    xpath=//ol/li
${clickAddFrstAddress}    xpath=//span[.='Add my first address']
${inputCompany}    xpath=//input[@id='company']
${inputAddress}    xpath=//input[@id='address1']
${inputPostalCode}    xpath=//input[@id='postcode']
${inputCity}      xpath=//input[@id='city']
${selectState}    xpath=//select[@id='id_state']
${selectCountry}    xpath=//select[@id='id_country']
${inputHomePhone}    xpath=//input[@id='phone']
${inputMobilePhone}    xpath=//input[@id='phone_mobile']
${inputAddInfo}    xpath=//textarea[@id='other']
${submitAddress}    xpath=//button[@id='submitAddress']
${errorSave}      xpath=//li[.="The Zip/Postal code you've entered is invalid. It must follow this format: 00000"]
${errorSave2}     xpath=//li[.='This country requires you to chose a State.']
${headingAddress}    xpath=//h1[@class='page-heading']
${successRegist}    xpath=//p[@class='alert alert-success']
${createAccount}    xpath=//button[@id='submitAccount']
${verifyWrongEmail}    xpath=//ol/li
${backToAccount}    xpath=//span[contains(.,'Back to your account')]
${myPersonalInfo}    xpath=//span[.='My personal information']
${oldPassword}    xpath=//input[@id='old_passwd']
${newPassword}    xpath=//input[@id='passwd']
${confirmNewPass}    xpath=//input[@id='confirmation']
${submitChange}    //button[@name='submitIdentity']
${passDontMatch}    xpath=//li[.='The password and confirmation do not match.']
${alertSuccess}    xpath=//p[@class='alert alert-success']
${backToHome}     xpath=//span[contains(.,'Back to your account')]
${hotelLocation}    xpath=//input[@id='hotel_location']
${selectIndonesia}    xpath=//li[contains(.,\'Indonesia\')]
${backHome}       xpath=//span[contains(.,'Home')]
${searchHotel}    xpath=//li[@class='search_result_li']
${hotelPrime}     xpath=//button[@id='id_hotel_button']
${checkin}        xpath=//input[@id='check_in_time']
${selectDate}     xpath=//a[.='17']
${checkout}       xpath=//input[@id='check_out_time']
${selectDate2}    xpath=//a[.='20']
${searchNow}      xpath=//span[.='Search Now']
${sortByRating}    xpath=//button[@id='gst_rating']
${ratingDescending}    xpath=//a[.='Rating Descending']
${sortByPrice}    xpath=//button[@id='price_ftr']/span[@class='caret pull-right margin-top-7']
${highestFirst}    xpath=//a[contains(.,'Price : Highest first')]
${checkBox}       xpath=//div[@id='filter_results']//div[@class='col-sm-12 lf_sub_cont']/div[1]//input[@value='5']
${verifyNoRoom}    xpath=//span[.='No room available for this hotel!']
${clearFilter}    xpath=//div[@id='filter_results']/div[@class='col-sm-12']/div[1]//span[@class='pull-right clear_filter']
${backToPageRooms}    xpath=//div[@class='row cat_cont']
${sliderPrice}    xpath=//div[@id='filter_price_silder']/a[1]
${bookNow}        xpath=//div[@id='category_data_cont']/div[1]//span[.='Book Now']
${boxSuccessAddToCart}    xpath=//div[@id='layer_cart']/div[@class='clearfix']
${buttonExit}     xpath=//span[@class='cross']
${shoppingCart}    xpath=//div[@class='shopping_cart']/a[@href='http://qa.cilsy.id:8080/en/quick-order']
${buttonCheckout}    xpath=//span[contains(.,'Check out')]
${summaryRoom}    xpath=//div[@id='oprder-opc-accordion']/div[contains(.,'Rooms & Price Summary')]
${removeOrder}    xpath=//a[contains(.,'Remove')]
${verifyRemoveOrder}    xpath=//p[@class='alert alert-warning']
${proceedToCheckout}    xpath=//span[contains(.,'Proceed to checkout')]
${buttonProceed}    xpath=//div[@class='col-sm-12 proceed_btn_block']/a[contains(.,'Proceed')]
${buttonProceed2}    xpath=//div[@id='collapse-guest-info']//a[contains(.,'Proceed')]
${clickCheckbox}    xpath=//input[@id='cgv']
${payByBank}      xpath=//span[.='(order processing will be longer)']
${othPaymentMtd}    xpath=//a[contains(.,'Other payment methods')]
${confirmOrder}    xpath=//span[contains(.,'I confirm my order')]
${completeOrder}    xpath=//p[@class='alert alert-success']
${payByCheck}     xpath=//a[contains(.,'Pay by check (order processing will be longer)')]
${invalidRegister}    xpath=//div[@id='create_account_error']
${dropdwonUser}    xpath=//button[@id='user_info_acc']
${clickAccount}    xpath=//a[.='Accounts']
${buttonAdd}      xpath=//div[@id='category_data_cont']/div[1]//div[@class='rm_qty_cont pull-right clearfix']//a[1]
${buttonMinus}    xpath=//div[@id='category_data_cont']/div[1]//i[@class='icon-minus']
${buttonMenu}     xpath=//button[@class='nav_toggle']
${homeMenu}       xpath=//a[.='Home']
${logout}         xpath=//a[.='Logout']
${payByPaypal}    xpath=//a[contains(.,'Pay with your card or your PayPal account')]
${paypalError}    xpath=//h2[.='Error occurred:']

*** Test Cases ***
TC_NavigateToUrl
    [Documentation]    This test case is navigate user to URL http://qa.cilsy.id:8080/en/
    [Setup]
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window

TC_Register
    [Documentation]    This test case for registering account for new user
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmail}    anindy@yahoo.com
    Click Element    ${clickRegister}
    Wait Until Element Is Visible    ${inputFrstName}
    Input Text    ${inputFrstName}    Fanny
    Input Text    ${inputLstName}    Restu Anindi
    Input Text    ${inputPass}    abcdef
    Select From List By Value    //select[@id='days']    5
    Select From List By Value    //select[@id='months']    9
    Select From List By Value    //select[@id='years']    1999
    Click Element    ${createAccount}
    Page Should Contain    ${successRegist}    Your account has been created.

TC_NormalLogin
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    fanny_0599@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}

TC_InvalidPassword
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    fanny_0599@yahoo.com
    Input Text    ${inputPassLogin}    abcdefg
    Click Element    ${submitLogin}
    Element Text Should Be    ${verifyWrongPass}    Authentication failed.

TC_Invalid Email
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    a@yahoo.com
    Input Text    ${inputPassLogin}    abcdef
    Click Element    ${submitLogin}
    Element Text Should Be    ${verifyWrongEmail}    An email address required.

TC_InvalidAddress
    [Documentation]    This test case is for testing invalid save address without fill the postal zip field.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdef
    Click Element    ${submitLogin}
    Click Element    ${dropdwonUser}
    Click Element    ${clickAccount}
    Click Element    ${clickAddFrstAddress}
    Input Text    ${inputAddress}    Jl. Damai 1
    Input Text    ${inputCompany}    Cilsy
    Input Text    ${inputCity}    Jaksel
    Select From List By Value    //select[@id='id_state']    245
    Select From List By Value    xpath=//select[@id='id_country']    111
    Input Text    ${inputHomePhone}    021021021
    Input Text    ${inputMobilePhone}    087875751882
    Input Text    ${inputAddInfo}    Iam a student
    Click Element    ${submitAddress}
    Element Text Should Be    ${errorSave}    The Zip/Postal code you've entered is invalid. It must follow this format: 00000

TC_InvalidAddress2
    [Documentation]    This test case is for testing invalid save address without fill the country field.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdef
    Click Element    ${submitLogin}
    Click Element    ${dropdwonUser}
    Click Element    ${clickAccount}
    Click Element    ${clickAddFrstAddress}
    Input Text    ${inputAddress}    Jl. Damai 1
    Input Text    ${inputPostalCode}    12270
    Input Text    ${inputCompany}    Cilsy
    Input Text    ${inputCity}    Jaksel
    Select From List By Value    xpath=//select[@id='id_country']    111
    Input Text    ${inputHomePhone}    021021021
    Input Text    ${inputMobilePhone}    087875751882
    Input Text    ${inputAddInfo}    Iam a student
    Click Element    ${submitAddress}
    Element Text Should Be    ${errorSave2}    This country requires you to chose a State.

TC_ValidAddress
    [Documentation]    ditambah no 1 untuk testing checkout dulu
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdef
    Click Element    ${submitLogin}
    Click Element    ${dropdwonUser}
    Click Element    ${clickAccount}
    Click Element    ${clickAddFrstAddress}
    Input Text    ${inputCompany}    Cilsy
    Input Text    ${inputAddress}    Jl. Damai 1
    Input Text    ${inputPostalCode}    12270
    Input Text    ${inputCity}    Jaksel
    Select From List By Value    //select[@id='id_state']    245
    Select From List By Value    xpath=//select[@id='id_country']    111
    Input Text    ${inputHomePhone}    021021021
    Input Text    ${inputMobilePhone}    087875751882
    Input Text    ${inputAddInfo}    Iam a student
    Click Element    ${submitAddress}
    Element Text Should Be    ${headingAddress}    MY ADDRESSES

TC_InvalidChangePassword
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdef
    Click Element    ${submitLogin}
    Click Element    ${dropdwonUser}
    Click Element    ${clickAccount}
    Click Element    ${myPersonalInfo}
    Input Text    ${oldPassword}    abcdef
    Input Text    ${newPassword}    abcdeF
    Input Text    ${confirmNewPass}    abcdef
    Click Element    ${submitChange}
    Element Text Should Be    ${passDontMatch}    The password and confirmation do not match.

TC_ValidPassword
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdef
    Click Element    ${submitLogin}
    Click Element    ${dropdwonUser}
    Click Element    ${clickAccount}
    Click Element    ${myPersonalInfo}
    Input Text    ${oldPassword}    abcdef
    Input Text    ${newPassword}    abcdeF
    Input Text    ${confirmNewPass}    abcdeF
    Click Element    ${submitChange}
    Element Text Should Be    ${alertSuccess}    Your personal information has been successfully updated.

TC_SearchNow
    [Documentation]    This test case is for testing the search button function.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}

TC_SortByRating
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByRating}
    Sleep    2
    Click Element    ${ratingDescending}

TC_SortByPrice
    [Documentation]    This test case for sorting the highest price room.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}

TC_GuestRatingFilter
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Sleep    2
    Click Element    ${checkBox}
    Sleep    2
    Page Should Contain Element    ${verifyNoRoom}

TC_ClearFilter
    [Documentation]    This test case is for testing the clear search filter.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${checkBox}
    Sleep    3
    Page Should Contain Element    ${verifyNoRoom}
    Click Element    ${clearFilter}
    Sleep    3
    Page Should Contain Element    ${backToPageRooms}

TC_FilterPrice
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${checkBox}
    Sleep    3
    Page Should Contain Element    ${verifyNoRoom}
    Click Element    ${clearFilter}
    Sleep    3
    Page Should Contain Element    ${backToPageRooms}
    Click Element    ${sliderPrice}

TC_AddToCart
    [Documentation]    This test case is to ensure that the cart contains the correct order.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Sleep    2
    Click Element    ${bookNow}
    Sleep    2
    Page Should Contain Element    ${boxSuccessAddToCart}
    Click Element    ${buttonExit}
    Mouse Over    ${shoppingCart}

TC_SummaryRoom
    [Documentation]    This test case is to verify the summary room is appear after user make order.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${buttonMenu}
    Sleep    1
    Click Element    ${homeMenu}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Sleep    2
    Click Element    ${bookNow}
    Sleep    2
    Page Should Contain Element    ${boxSuccessAddToCart}
    Click Element    ${buttonExit}
    Mouse Over    ${shoppingCart}
    Click Element    ${buttonCheckout}
    Page Should Contain Element    ${summaryRoom}

TC_RemoveOrder
    [Documentation]    This test case to remove the order and ensure the order is successfully deleted.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${buttonMenu}
    Sleep    1
    Click Element    ${homeMenu}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Click Element    ${bookNow}
    Sleep    2
    Page Should Contain Element    ${boxSuccessAddToCart}
    Click Element    ${buttonExit}
    Mouse Over    ${shoppingCart}
    Click Element    ${buttonCheckout}
    Page Should Contain Element    ${summaryRoom}
    Sleep    2
    Click Element    ${removeOrder}
    Sleep    2
    Element Text Should Be    ${verifyRemoveOrder}    Till now you did not added any room in your cart.

TC_PayByBank
    [Documentation]    This test case is to ensure the payment by Bank is success.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${buttonMenu}
    Sleep    1
    Click Element    ${homeMenu}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Click Element    ${bookNow}
    Sleep    2
    Page Should Contain Element    ${boxSuccessAddToCart}
    Click Element    ${proceedToCheckout}
    Click Element    ${buttonProceed}
    Click Element    ${buttonProceed2}
    Click Element    ${clickCheckbox}
    Sleep    2
    Click Element    ${payByBank}
    Click Element    ${confirmOrder}
    Element Text Should Be    ${completeOrder}    Your order on Sekolah QA is complete.

TC_ChangePayment
    [Documentation]    This test case is to change the payment method successfully.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${buttonMenu}
    Sleep    1
    Click Element    ${homeMenu}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Click Element    ${bookNow}
    Sleep    2
    Page Should Contain Element    ${boxSuccessAddToCart}
    Click Element    ${proceedToCheckout}
    Click Element    ${buttonProceed}
    Click Element    ${buttonProceed2}
    Click Element    ${clickCheckbox}
    Sleep    2
    Click Element    ${payByBank}
    Sleep    2
    Click Element    ${othPaymentMtd}
    Sleep    2
    Click Element    ${payByCheck}
    Click Element    ${confirmOrder}
    Element Text Should Be    ${completeOrder}    Your order on Sekolah QA is complete.

TC_InvalidRegister
    [Documentation]    This test case for account who has been registered.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Click Element    ${clickSignin}
    Input Text    ${inputEmail}    anindyf@yahoo.com
    Click Element    ${clickRegister}
    Page Should Contain Element    ${invalidRegister}    An account using this email address has already been registered. Please enter a valid password or request a new one.

TC_ButtonAddQty
    [Documentation]    This test case is to increase the quantity hotel by the (+) button.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Sleep    2
    Double Click Element    ${buttonAdd}

TC_ButtonMinusQty
    [Documentation]    This test case is to decrease the quantity hotel by the (-) button.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${backHome}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Sleep    2
    Double Click Element    ${buttonAdd}
    Sleep    2
    Double Click Element    ${buttonMinus}

TC_Logout
    [Documentation]    This test case is to ensure user able to logout.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${dropdwonUser}
    Sleep    2
    Click Element    ${logout}

TC_PaymentByPaypal
    [Documentation]    This test case is to ensure the payment by paypal is complete successfully.
    Open Browser    http://qa.cilsy.id:8080/en/    Chrome
    Maximize Browser Window
    Click Element    ${clickSignin}
    Input Text    ${inputEmailLogin}    anindyf@yahoo.com
    Input Text    ${inputPassLogin}    abcdeF
    Click Element    ${submitLogin}
    Click Element    ${buttonMenu}
    Sleep    1
    Click Element    ${homeMenu}
    Click Element    ${hotelPrime}
    Click Element    ${searchHotel}
    Click Element    ${checkin}
    Click Element    ${selectDate}
    Click Element    ${checkout}
    Click Element    ${selectDate2}
    Click Element    ${searchNow}
    Click Element    ${sortByPrice}
    Click Element    ${highestFirst}
    Click Element    ${bookNow}
    Sleep    2
    Page Should Contain Element    ${boxSuccessAddToCart}
    Click Element    ${proceedToCheckout}
    Click Element    ${buttonProceed}
    Click Element    ${buttonProceed2}
    Click Element    ${clickCheckbox}
    Sleep    2
    Click Element    ${payByPaypal}
    Element Text Should Be    ${paypalError}    Your order on Sekolah QA is complete.
