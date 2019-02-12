Feature: 2443 Webform Belfast Negative Scenario
  Scenario: Fill the webform with wrong inputs and validate errors
    Given I am logged in as RegressionTest37@mailhog.com, with a password of Williams#1
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/belfast/2443/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is The Insolvency (Northern Ireland) Order 1989 (Art. 95)
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | -1                               | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-previousCompanyName-1 | dataAnalytics                    | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11127702                         | text      |
      | #this-company-1_gazorg-tradingAs-1           | DataAnalytics&Consultancy Ltd    | text      |
      | #this-company-1_gazorg-previouslyTradingAs-1 | dataAnalytics Ltd                | text      |
    And I fill in #this-company-principal-trading-address-1_vcard-postal-code-1 as ME2 2LA
    And I click 2441_principal_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2443_principal_address_lookup_first_result
    And I click 2441_select_lookup_address_button
    And I wait for 2 seconds
    And I fill in #this-previous-trading-address-1_vcard-postal-code-1 as NR3 1PD
    And I click 2441_previous_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2443_previous_trading_address_lookup_first_result
    And I click 2441_previous_trading_lookup_address_select_button
    And I wait for 1 seconds
    And I click 2441_registered_address_enter_manually
    And I wait for 1 seconds
    And I fill in #this-company-registered-office-1_vcard-street-address-1 as SOME ROAD
    And I fill in #this-company-registered-office-1_vcard-locality-1 as SOMESTREET
    And I fill in #this-company-registered-office-1_vcard-postal-code-1 as BT12 5GH
    And I fill in #this-company-previous-registered-office-1_vcard-postal-code-1 as BD7 2SE
    And I click 2443_previous_registered_address_lookup_link
    And I wait for 2 seconds
    And I click 2443_previous_registered_address_lookup_first_result
    And I click 2443_previous_registered_address_select_button
    And I wait for 2 seconds
    And I fill in #this-company-1_gazorg-natureOfBusiness-1 as 62012
    And I fill in the form
      | fieldName                                                 | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfAppointment-1 | 2          | date      |
    And I click 2443_appointed_by_whom_drop_down
    And I click appointed_by_court
    And I click 2443_court_case_number_format_drop_down
    And I click 2443_case_number_format_CR
    And I fill in the form
      | fieldName                             | fieldValue         | fieldType |
      | #this-court-case-1_court-caseNumber-1 | 999999999          | text      |
      | #this-court-case-1_court-caseYear-1   | 2018               | text      |
      | #this-IP1_foaf-name-1                 | officeHolderName   | text      |
      | #this-IP1_person-hasIPnum-1           | officeHolderNumber | text      |
      | #this-IP-company-1_gazorg-name-1      | officeHolderOrg    | text      |
    And I click 2441_office_holder_address_checkbox
    And I wait for 2 seconds
    And I fill in #this-IP2_foaf-name-1 as secondOfficeHolder
    And I fill in #this-IP2_person-hasIPnum-1 as secondOfficeHolderNumber
    And I fill in #this-IP-company-2_gazorg-name-1 as secondOfficeHolderOrg
    And I fill in #this-IP2-address-1_vcard-postal-code-1 as NG9 1LA
    And I click 2441_second_office_holder_address_lookup
    And I wait for 2 seconds
    And I click 2443_second_officer_address_lookup_first_result
    And I click 2441_second_office_holder_address_select
    And I wait for 2 seconds
    And I fill in #this-IP1_gaz-telephone-1 as +44 7700 900077
    And I fill in #this-IP1_gaz-email-1 as someUser@balanc3r.com
    And I fill in #this-IP1_gaz-fax-1 as +44 7700 900077
    And I fill in #this-IP1_person-hasIPReferenceNumber-1 as 999999999
    And I fill in the form
      | fieldName                      | fieldValue | fieldType |
      | #this-IP1_person-noticeDated-1 | 4          | date      |
    And I fill in #this-IP1_person-additionalInformationIP-1 as someAdditionalInfo
    And I click 2442_pdf_voucher_checkbox
    And I click 2441_continue_button
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The 'Date of Appointment' should be before the publication date. should be visible
    Then the text The 'Earliest publication date' should be after or on the current date. should be visible
    And I fill in the form
      | fieldName                                                 | fieldValue | fieldType |
      | #noticeid-_gaz-earliestPublicationDate                    | 0          | date      |
      | #this-notifiableThing_corp-insolvency-dateOfAppointment-1 | -2         | date      |
    And I click 2441_continue_button
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The data you have supplied for Company Name has not been verified.You will need to correct this information in order to submit your notice. should be visible
