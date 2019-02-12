Feature:2442-Edinburgh Positive Scenario
        Verify that the users can palce a 2442 webform notice on gazettes Edinburgh edition

  Scenario Outline: Logging in and filling in the webform
    Given I am logged in as <username>, with a password of <password>
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/edinburgh/2442/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is Insolvency Act 1986 (as amended)
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | 0                                | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-previousCompanyName-1 | dataAnalytics                    | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11090783                         | text      |
      | #this-company-1_gazorg-tradingAs-1           | DataAnalytics&Consultancy Ltd    | text      |
      | #this-company-1_gazorg-previouslyTradingAs-1 | dataAnalytics Ltd                | text      |
    And I fill in #this-company-registered-office-1_vcard-postal-code-1 as ME2 2LA
    And I click 2442_registered_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2442_registered_address_look_up_first_result
    And I click 2442_registered_address_select_button
    And I wait for 2 seconds
    And I fill in #this-company-principal-trading-address-1_vcard-postal-code-1 as NR3 1PD
    And I click 2441_principal_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2442_principal_address_lookup_first_result
    And I click 2442_principal_address_select_button
    And I wait for 2 seconds
    And I click 2441_meeting_procedure_drop_down
    And I click 2441_meeting_procedure_physical
    And I fill in the form
      | fieldName                                            | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-hasPurpose-1-1 | purpose 1  | text      |
      | #this-notifiableThing_corp-insolvency-hasPurpose-2-1 | purpose 2  | text      |
      | #this-notifiableThing_corp-insolvency-hasPurpose-3-1 | purpose 3  | text      |
      | #this-notifiableThing_corp-insolvency-hasPurpose-4-1 | purpose 4  | text      |
      | #this-notifiableThing_corp-insolvency-hasPurpose-5-1 | purpose 5  | text      |
      | #this-notifiableThing_corp-insolvency-hasPurpose-6-1 | purpose 6  | text      |
    And I click 2442_physical_meeting_enter_address_manually_link
    And I wait for 2 seconds
    And I fill in the form
      | fieldName                                       | fieldValue    | fieldType |
      | #this-meetingAddress-1_vcard-street-address-1   | firstAddress  | text      |
      | #this-meetingAddress-1_vcard-extended-address-1 | secondAddress | text      |
      | #this-meetingAddress-1_vcard-locality-1         | someTown      | text      |
      | #this-meetingAddress-1_vcard-postal-code-1      | BT12 5GH      | text      |

    And I fill in #this-address-for-lodging-proofs-1_vcard-postal-code-1 as BD7 2SE
    And I click 2442_lodging_proof_address_lookup_link
    And I wait for 2 seconds
    And I click 2442_lodging_proof_address_first_result
    And I click 2442_lodging_proof_address_select_button
    And I wait for 2 seconds
    And I fill in the form
      | fieldName                                                            | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-meetingTime                    | 5          | date      |
      | #this-notifiableThing_corp-insolvency-meetingTimeWITHtime            | 10:00      | text      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts         | 2          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebtsWITHtime | 10:00      | text      |

    And I fill in #this-signatory-1_foaf-name-1 as David Hoffmann
    And I fill in #this-IP1_foaf-name-1 as officeHolderName
    And I fill in #this-IP1_person-hasIPnum-1 as officeHolderNumber
    And I fill in #this-IP-company-1_gazorg-name-1 as officeHolderOrg
    And I click 2441_office_holder_address_checkbox
    And I fill in #this-IP2_foaf-name-1 as secondOfficeHolder
    And I fill in #this-IP2_person-hasIPnum-1 as secondOfficeHolderNumber
    And I fill in #this-IP-company-2_gazorg-name-1 as secondOfficeHolderOrg
    And I fill in #this-IP2-address-1_vcard-postal-code-1 as NG9 1LA
    And I click 2441_second_office_holder_address_lookup
    And I wait for 2 seconds
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
    And I wait for 15 seconds
    And I wait for the page /notice/[0-9]{5} to load
    Then the text DATA & ANALYTICS CONSULTANCY LTD should be visible
    Then the text 11090783 should be visible
    Then the text dataAnalytics should be visible
    Then the text DataAnalytics&Consultancy Ltd should be visible
    Then the text dataAnalytics Ltd should be visible
    Then the text 1 LABURNUM ROAD, ROCHESTER ME2 2LA should be visible
    Then the text ST. CRISPINS HOUSE, DUKE STREET, NORWICH NR3 1PD should be visible
    Then the text purpose 1 should be visible
    Then the text purpose 2 should be visible
    Then the text purpose 3 should be visible
    Then the text purpose 4 should be visible
    Then the text purpose 5 should be visible
    Then the text purpose 6 should be visible
    Then the text firstAddress, secondAddress, someTown BT12 5GH should be visible
    Then the text 192 PASTURE LANE, BRADFORD BD7 2SE should be visible
    Then the text PROGRESS HOUSE, 5 MANDELA WAY, LONDON SE1 5SS should be visible
    Then the text W BLOCK, BEESTON BUSINESS PARK, NOTTINGHAM NG9 1LA should be visible
    Then the text +44 7700 900077 should be visible
    Then the text someUser@balanc3r.com should be visible
    Then the text 999999999 should be visible
    Then the text someAdditionalInfo should be visible
    Then the text David Hoffmann should be visible
    Then the text Liquidator should be visible
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
    Then confirmation_title should say <verification text>

    ##Two of the below cases are expected to fail payment because the payment amount ends with 2p,5p or 7p

    Examples:
      | username                                | password   | verification text   |
      | RegressionTest36@mailhog.com         | Williams#1 | Card Payment Failed |
      | RegressionTestAdvtAgency@mailhog.com | Williams#1 | Confirmation        |
      | RegressionTest37@mailhog.com         | Williams#1 | Card Payment Failed |
      | RegressionTest26@mailhog.com         | Williams#1 | Confirmation        |
      | RegressionTest38@mailhog.com         | Williams#1 | Confirmation        |
      | RegressionTest27@mailhog.com         | Williams#1 | Confirmation        |


