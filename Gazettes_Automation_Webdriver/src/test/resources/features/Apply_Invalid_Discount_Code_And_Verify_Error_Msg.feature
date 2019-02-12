Feature: Apply discount codes on notices and shop items, verify error messages.

  Scenario Outline: Logging in and placing 2441 notice.
    Given I am logged in as RegressionTest36@mailhog.com, with a password of Williams#1
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/belfast/2441/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is The Insolvency (Northern Ireland) Order 1989 (Art. 70 (1A)
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | 0                                | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-previousCompanyName-1 | dataAnalytics                    | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11090783                         | text      |
      | #this-company-1_gazorg-tradingAs-1           | DataAnalytics&Consultancy Ltd    | text      |
      | #this-company-1_gazorg-previouslyTradingAs-1 | dataAnalytics Ltd                | text      |
    And I fill in #this-company-principal-trading-address-1_vcard-postal-code-1 as ME2 2LA
    And I click 2441_principal_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2441_select_lookup_address_button
    And I wait for 2 seconds
    And I fill in #this-previous-trading-address-1_vcard-postal-code-1 as ME2 2LA
    And I click 2441_previous_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2441_previous_trading_lookup_address_select_button
    And I wait for 1 seconds
    And I click 2441_registered_address_enter_manually
    And I wait for 1 seconds
    And I fill in #this-company-registered-office-1_vcard-street-address-1 as SOME ROAD
    And I fill in #this-company-registered-office-1_vcard-locality-1 as SOMESTREET
    And I fill in #this-company-registered-office-1_vcard-postal-code-1 as ME2 2LA
    And I wait for 2 seconds
    And I fill in #this-company-1_gazorg-natureOfBusiness-1 as 62012
    And I wait for 2 seconds
    And I click 2441_meeting_details_attendees
    And I click 2441_meeting_details_attendees_contributories
    And I click 2441_meeting_procedure_drop_down
    And I click 2441_meeting_procedure_correspondance
    And I fill in the form
      | fieldName                                                | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfResolution-1 | 10         | date      |
    And I fill in #this-notifiableThing_corp-insolvency-hasResolution-1-1 as firstResolution
    And I fill in #this-notifiableThing_corp-insolvency-hasResolution-2-1 as secondResolution
    And I fill in #this-notifiableThing_corp-insolvency-hasResolution-3-1 as thirdResolution
    And I fill in #this-notifiableThing_corp-insolvency-hasResolution-4-1 as fourthResolution
    And I fill in #this-notifiableThing_corp-insolvency-hasResolution-5-1 as fifthResolution
    And I click 2441_resolutionsix_type
    And I click 2441_resolution_type_special
    And I fill in #this-notifiableThing_corp-insolvency-hasResolution-6-1 as sixthResolution
    And I fill in #this-signatory-1_foaf-name-1 as David Hoffmann
    And I fill in #this-IP1_foaf-name-1 as tempOfficeHolder
    And I fill in #this-IP1_person-hasIPnum-1 as officeHolderNumber
    And I fill in #this-IP-company-1_gazorg-name-1 as tempOrganisation
    And I click 2441_office_holder_address_checkbox
    And I wait for 2 seconds
    Then I verify #this-IP1-address-1_vcard-postal-code-1 contains text SE1 5SS
    And I fill in #this-IP2_foaf-name-1 as secondOfficer
    And I fill in #this-IP2_person-hasIPnum-1 as secondOfficeHolderNum
    And I fill in #this-IP-company-2_gazorg-name-1 as secondOrgName
    And I fill in #this-IP2-address-1_vcard-postal-code-1 as ME2 2LA
    And I click 2441_second_office_holder_address_lookup
    And I wait for 2 seconds
    And I click 2441_second_office_holder_address_select
    And I fill in #this-IP1_gaz-telephone-1 as +44 7700 900077
    And I fill in #this-IP1_gaz-email-1 as someUser@balanc3r.com
    And I fill in #this-IP1_gaz-fax-1 as +44 7700 900077
    And I fill in #this-IP1_person-hasIPReferenceNumber-1 as 9999999997
    And I fill in the form
      | fieldName                      | fieldValue | fieldType |
      | #this-IP1_person-noticeDated-1 | 4          | date      |
    And I fill in #this-IP1_person-additionalInformationIP-1 as someAdditionalInfo
    And I click 2441_pdf_voucher_checkbox
    And I click 2441_continue_button
    And I wait for the page /notice/[0-9]{5} to load
    And I click add_to_basket
    And I click go_checkout
    And I verify company_profile_annual_total is £76.74
    And I fill in #discountCode as GHI789
    And I click apply_discount_code_button
    And I wait for 10 seconds
    Then the text The product code you entered is invalid or not applicable to the content of your basket should be visible
    And I verify company_profile_annual_total is £76.74
    Then I click basket_item_remove_btn
    And I wait for 2 seconds
    And I click basket_item_remove_confirm
    And I wait for 10 seconds
    Then the text There are no items in your basket should be visible
    Then I click shop_link
    And I click shop_order3_button
    And I fill in the form
      | fieldName          | fieldValue               | fieldType |
      | edition_dropdown   | London                   | text      |
      | month_dropdown     | 5                        | text      |
      | year_dropdown      | 2014                     | text      |
      | issue_supp_number  | Issue 60867 - 16/05/2014 | text      |
      | num_pro_ww1        | 1                        | text      |
      | full_name_purchase | George Freeman           | text      |
    And I click next_purchase_button
    And I click add_basket_button
    And I click basket_item_checkout_button
    And I verify company_profile_annual_total is £84.00
    And I fill in #discountCode as GHI789
    And I click apply_discount_code_button
    And I wait for 10 seconds
    Then the text The product code you entered is invalid or not applicable to the content of your basket should be visible
    And I verify company_profile_annual_total is £84.00
    Then I click basket_item_remove_btn
    And I wait for 2 seconds
    And I click basket_item_remove_confirm
    And I wait for 5 seconds
    Then the text There are no items in your basket should be visible


    Examples:
      | test1 |
      | test2 |