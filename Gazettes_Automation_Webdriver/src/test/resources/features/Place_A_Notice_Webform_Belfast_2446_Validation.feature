Feature: 2446 Webform Belfast Negative Scenario

  Scenario:Fill in the webform with wrong inputs and validate the errors
    Given I am logged in as RegressionTest27@mailhog.com, with a password of Williams#1
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/place-notice/belfast/2446/online-form
    And I verify #this-legislation-1_legislation-legislationTitle is The Insolvency (Northern Ireland) Order 1989 (Art. 84)
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
    And I wait for 2 seconds
    And I fill in #this-company-principal-trading-address-1_vcard-postal-code-1 as NR3 1PD
    And I click 2441_principal_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2442_principal_address_lookup_first_result
    And I click 2442_principal_address_select_button
    And I wait for 2 seconds
    And I fill in the form
      | fieldName                                                            | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts         | 4          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebtsWITHtime | 10:00      | text      |
    And I fill in the form
      | fieldName                        | fieldValue               | fieldType |
      | #this-IP1_foaf-name-1            | officeHolder             | text      |
      | #this-IP1_person-hasIPnum-1      | officeHolderNumber       | text      |
      | #this-IP-company-1_gazorg-name-1 | officeHolderOrganization | text      |
    And I click 2441_office_holder_address_checkbox
    And I wait for 2 seconds
    And I fill in the form
      | fieldName                                                 | fieldValue          | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfAppointment-1 | 2                   | date      |
      | #this-IP2_foaf-name-1                                     | secondOfficer       | text      |
      | #this-IP2_person-hasIPnum-1                               | secondOfficerNumber | text      |
      | #this-IP-company-2_gazorg-name-1                          | secondOfficerOrg    | text      |
      | #this-IP2-address-1_vcard-postal-code-1                   | BD7 2SE             | text      |
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
    Then I click 2441_continue_button
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The 'Earliest publication date' should be after or on the current date. should be visible
    Then the text The last day for proving must not be less than 21 days from the date of publication. should be visible
    Then the text The 'Date of Appointment' should be before the publication date. should be visible
    And I fill in the form
      | fieldName                                                    | fieldValue | fieldType |
      | #noticeid-_gaz-earliestPublicationDate                       | 0          | date      |
      | #this-notifiableThing_corp-insolvency-onOrBeforeProvingDebts | 26         | date      |
      | #this-notifiableThing_corp-insolvency-dateOfAppointment-1    | -2         | date      |
    And I click 2441_continue_button
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The data you have supplied for Company Name has not been verified.You will need to correct this information in order to submit your notice. should be visible
