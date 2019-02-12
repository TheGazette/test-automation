Feature: 2442 webform London Negative Scenario

  Scenario: Fill the form with negative inputs and validate the errors
    Given I am logged in as RegressionTest36@mailhog.com, with a password of Williams#1
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/london/2442/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is Rule 15.8 of the Insolvency (England and Wales) Rules 2016
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                    | fieldValue                       | fieldType |
      | #noticeid-_gaz-earliestPublicationDate       | -1                               | date      |
      | #this-company-1_gazorg-name-1                | DATA & ANALYTICS CONSULTANCY LTD | text      |
      | #this-company-1_gazorg-previousCompanyName-1 | dataAnalytics                    | text      |
      | #this-company-1_gazorg-companyNumber-1       | 11127702                         | text      |
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
    And I click 2441_meeting_details_attendees
    And I click 2441_meeting_details_attendees_creditors
    And I click 2442_meeting_requested_by_creditors_drop_down
    And I click 2442_meeting_requested_by_creditors_no_option
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
      | #this-notifiableThing_corp-insolvency-meetingTime                    | -2         | date      |
      | #this-notifiableThing_corp-insolvency-meetingTimeWITHtime            | 10:00      | text      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts         | -4         | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebtsWITHtime | 10:00      | text      |

    And I click 2442_treatment_of_small_debts_drop_down
    And I click 2442_treatment_of_small_debts_drop_down_option_no
    And I fill in #this-signatory-1_foaf-name-1 as David Hoffmann
    And I click 2441_signatory_job_title_drop_down
    And I click 2442_signatory_job_title_liquidator
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
    And I wait for 5 seconds
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
    Then the text The 'Meeting time' should be after the publication date. should be visible
    Then the text The 'Claim submission date' should be after the publication date. should be visible
    Then the text The 'Earliest publication date' should be after or on the current date. should be visible
    And I fill in the form
      | fieldName                                                    | fieldValue | fieldType |
      | #noticeid-_gaz-earliestPublicationDate                       | 0          | date      |
      | #this-notifiableThing_corp-insolvency-meetingTime            | 6          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts | 4          | date      |
    And I click 2441_continue_button
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The data you have supplied for Company Name has not been verified.You will need to correct this information in order to submit your notice. should be visible
