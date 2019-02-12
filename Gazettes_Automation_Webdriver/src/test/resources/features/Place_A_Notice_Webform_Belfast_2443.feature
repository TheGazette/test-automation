
Feature:2443 Webform - Belfast Positive Scenario
  Check whether users are able to place a 2443 webform notice in gazettes belfast edition

  Scenario Outline: Logging in and filling in the webform
    Given I am logged in as <username>, with a password of <password>
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/belfast/2443/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is The Insolvency (Northern Ireland) Order 1989 (Art. 95)
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | 0                                | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-previousCompanyName-1 | dataAnalytics                    | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11090783                         | text      |
      | #this-company-1_gazorg-tradingAs-1           | DataAnalytics&Consultancy Ltd    | text      |
      | #this-company-1_gazorg-previouslyTradingAs-1 | dataAnalytics Ltd                | text      |
    And I click 2443_company_type_drop_down
    And I click 2443_company_type_unregistered
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
      | #this-notifiableThing_corp-insolvency-dateOfAppointment-1 | -2         | date      |
    And I click 2443_appointed_by_whom_drop_down
    And I click appointed_by_court
    And I click 2443_court_case_number_format_drop_down
    And I click 2443_case_number_format_CR
    And I fill in the form
      | fieldName                             | fieldValue       | fieldType |
      | #this-court-case-1_court-caseNumber-1 | 999999999        | text      |
      | #this-court-case-1_court-caseYear-1   | 2018             | text      |
      | #this-IP1_foaf-name-1                 | officeHolderName | text      |
      | #this-IP1_person-hasIPnum-1           | 123456           | text      |
      | #this-IP-company-1_gazorg-name-1      | officeHolderOrg  | text      |
    And I click 2441_office_holder_address_checkbox
    And I wait for 2 seconds
    And I fill in #this-IP2_foaf-name-1 as secondOfficeHolder
    And I fill in #this-IP2_person-hasIPnum-1 as 234567
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
    And I wait for the page /notice/[0-9]{5} to load
    Then the text Court number should be visible
    Then the text DATA & ANALYTICS CONSULTANCY LTD should be visible
    Then the text 11090783 should be visible
    Then the text Nature of the business: 62012 should be visible
    Then the text dataAnalytics should be visible
    Then the text DataAnalytics&Consultancy Ltd should be visible
    Then the text dataAnalytics Ltd should be visible
    Then the text SOME ROAD, SOMESTREET BT12 5GH should be visible
    Then the text 1 LABURNUM ROAD, ROCHESTER ME2 2LA should be visible
    Then the text ST. CRISPINS HOUSE, DUKE STREET, NORWICH NR3 1PD should be visible
    Then the text officeHolderName should be visible
    Then the text secondOfficeHolder should be visible
    Then the text PROGRESS HOUSE, 5 MANDELA WAY, LONDON SE1 5SS should be visible
    Then the text W BLOCK, BEESTON BUSINESS PARK, NOTTINGHAM NG9 1LA should be visible
    Then the text +44 7700 900077 should be visible
    Then the text someUser@balanc3r.com should be visible
    Then the text 999999999 should be visible
    Then the text By whom appointed: By Order of the Court should be visible
    Then the text someAdditionalInfo should be visible
    And I click add_to_basket
    And I click go_checkout
    And I click company_profile_pay_by_card
    And I wait for 1 minutes
    And I fill in the form
      | fieldName   | fieldValue       | fieldType |
      | card_number | 4444444444444448 | text      |
    And I wait for 20 seconds
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | card_security_code | 000        | text      |
      | card_expiry_month  | 12         | text      |
      | card_expiry_year   | 2018       | text      |
    And I click continue_payment
    And I wait for 1 minutes
    And I click company_profile_confirm_order
    Then confirmation_title should say Confirmation

    Examples:
      | username                                | password   |
      | RegressionTest36@mailhog.com         | Williams#1 |
      | RegressionTestAdvtAgency@mailhog.com | Williams#1 |
      | RegressionTest37@mailhog.com         | Williams#1 |
      | RegressionTest26@mailhog.com         | Williams#1 |
      | RegressionTest38@mailhog.com         | Williams#1 |
      | RegressionTest27@mailhog.com         | Williams#1 |