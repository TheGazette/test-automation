@ignored
Feature: 2447 Webform London Negative scenario

  Scenario: Fill the webform with negative inputs and validate the errors
    Given I am logged in as RegressionTest36@mailhog.com, with a password of Williams#1
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/london/2447/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is Rule 15.8 of the Insolvency (England and Wales) Rules 2016
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | -1                               | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11127702                         | text      |
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
      | #this-notifiableThing_corp-insolvency-dateOfDecision-1               | -2         | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts         | 2          | date      |
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
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The 'Earliest publication date' should be after or on the current date. should be visible
    Then the text The last day for proving must not be less than 5 days from the date of publication. should be visible
    And I fill in the form
      | fieldName                                                    | fieldValue | fieldType |
      | #noticeid-_gaz-earliestPublicationDate                       | 0          | date      |
      | #this-notifiableThing_corp-insolvency-dateOfDecision-1       | 2          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts | 6          | date      |
    Then I click 2441_continue_button
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The data you have supplied for Company Name has not been verified.You will need to correct this information in order to submit your notice. should be visible
