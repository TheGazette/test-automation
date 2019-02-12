@ignored
Feature:2447 Webform London Positive Scenario
        Check whether users are able to place a 2447 webform notice in gazettes London edition

  Scenario Outline: Logging in and filling in the webform
    Given I am logged in as <username>, with a password of <password>
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/london/2447/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is Rule 15.8 of the Insolvency (England and Wales) Rules 2016
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | 0                                | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11090783                         | text      |
      | #this-company-1_gazorg-previousCompanyName-1 | dataAnalytics                    | text      |
      | #this-company-1_gazorg-tradingAs-1           | DataAnalytics&Consultancy Ltd    | text      |
      | #this-company-1_gazorg-previouslyTradingAs-1 | dataAnalytics Ltd                | text      |
    And I fill in #this-company-registered-office-1_vcard-postal-code-1 as ME2 2LA
    And I click 2441_registered_address_post_code_lookup_link
    And I wait for 2 seconds
    And I click 2442_registered_address_look_up_first_result
    And I click 2442_registered_address_select_button
    And I wait for 5 seconds
    And I fill in #this-company-principal-trading-address-1_vcard-postal-code-1 as NR3 1PD
    And I click 2441_principal_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2442_principal_address_lookup_first_result
    And I click 2442_principal_address_select_button
    And I wait for 2 seconds
    And I click 2441_meeting_details_attendees
    And I click 2441_meeting_details_attendees_creditors
    And I fill in the form
      | fieldName                                              | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-hasProposal-1-1  | proposal1  | text      |
      | #this-notifiableThing_corp-insolvency-hasProposal-2-1  | proposal2  | text      |
      | #this-notifiableThing_corp-insolvency-hasProposal-3-1  | proposal3  | text      |
      | #this-notifiableThing_corp-insolvency-hasProposal-4-1  | proposal4  | text      |
      | #this-notifiableThing_corp-insolvency-hasProposal-5-1  | proposal5  | text      |
      | #this-notifiableThing_corp-insolvency-hasProposal-6-1  | proposal6  | text      |
      | #this-address-for-lodging-proofs-1_vcard-postal-code-1 | BD7 2SE    | text      |
    And I click 2442_lodging_proof_address_lookup_link
    And I wait for 2 seconds
    And I click 2447_lodging_proof_address_first_result
    And I click 2442_lodging_proof_address_select_button
    And I wait for 2 seconds
    And I fill in #this-notifiableThing_corp-insolvency-emailForLodgingProofs-1 as lodgeproof@balanc3r.com
    And I fill in the form
      | fieldName                                                            | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfDecision-1               | 2          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts         | 6          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebtsWITHtime | 10:00      | text      |
    And I click 2447_liquidation_committee_drop_down
    And I click 2447_liquidation_committee_no_option
    And I fill in #this-signatory-1_foaf-name-1 as firstSignatory
    And I fill in #this-signatory-2_foaf-name-1 as secondSignatory
    And I click 2441_signatory_job_title_drop_down
    And I click 2441_signatory_job_partner
    And I fill in #this-IP1_foaf-name-1 as convenerName
    And I fill in #this-IP1_person-hasIPnum-1 as convenerNumber
    And I fill in #this-IP-company-1_gazorg-name-1 as convenerOrg
    And I click 2441_office_holder_address_checkbox
    And I fill in #this-IP2_foaf-name-1 as secondConvener
    And I fill in #this-IP2_person-hasIPnum-1 as secondConvenerNum
    And I fill in #this-IP-company-2_gazorg-name-1 as secondConvenerOrg
    And I click 2447_second_convener_address_enter_manually
    And I wait for 2 seconds
    And I fill in #this-IP2-address-1_vcard-street-address-1 as someStreet
    And I fill in #this-IP2-address-1_vcard-locality-1 as someTown
    And I fill in #this-IP2-address-1_vcard-postal-code-1 as BT12 5GH
    And I fill in #this-IP1_gaz-telephone-1 as +44 7700 900077
    And I fill in #this-IP1_gaz-email-1 as someUser@balanc3r.com
    And I fill in #this-IP1_gaz-fax-1 as +44 7700 900077
    And I fill in #this-IP1_person-hasIPReferenceNumber-1 as 999999999
    And I fill in the form
      | fieldName                      | fieldValue | fieldType |
      | #this-IP1_person-noticeDated-1 | 1          | date      |
    And I fill in #this-IP1_person-additionalInformationIP-1 as someAdditionalInfo
    And I click 2442_pdf_voucher_checkbox
    Then I click 2441_continue_button
    And I wait for the page /notice/[0-9]{5} to load
    Then the text DATA & ANALYTICS CONSULTANCY LTD should be visible
    Then the text 11090783 should be visible
    Then the text dataAnalytics should be visible
    Then the text DataAnalytics&Consultancy Ltd should be visible
    Then the text dataAnalytics Ltd should be visible
    Then the text Registered Office: 1 LABURNUM ROAD, ROCHESTER ME2 2LA should be visible
    Then the text Principal Trading Address: ST. CRISPINS HOUSE, DUKE STREET, NORWICH NR3 1PD should be visible
    Then the text Creditors of DATA & ANALYTICS CONSULTANCY LTD should be visible
    Then the text proposal1 should be visible
    Then the text proposal2 should be visible
    Then the text proposal3 should be visible
    Then the text proposal4 should be visible
    Then the text proposal5 should be visible
    Then the text proposal6 should be visible
    Then the text 192 PASTURE LANE, BRADFORD BD7 2SE should be visible
    Then the text lodgeproof@balanc3r.com should be visible
    Then the text someAdditionalInfo should be visible
    Then the text convenerName should be visible
    Then the text convenerNumber should be visible
    Then the text PROGRESS HOUSE, 5 MANDELA WAY, LONDON SE1 5SS should be visible
    Then the text secondConvener should be visible
    Then the text someStreet, someTown BT12 5GH should be visible
    Then the text +44 7700 900077 should be visible
    Then the text someUser@balanc3r.com should be visible
    Then the text 999999999 should be visible
    Then the text firstSignatory should be visible
    Then the text secondSignatory should be visible
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
