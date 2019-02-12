@ignored
Feature: 2450 Webforms, Place corporate insolvency notice in belfast edition

  Scenario Outline: Login and check if I can place a insolvency notice in belfast edition of gazette
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I click place_notice_webform_link
    And  I select noticeType_edition as Belfast
    And  I select subNotice as Corporate Insolvency
    And  I select subNotice1 as Winding-up By The Court
    And  I select subNotice2 as Petitions to Wind Up (Companies) - 2450
    And I wait for 5 seconds
    And I click online_continue_button
    And I verify #this-legislation-1_legislation-legislationTitle is Insolvency (Northern Ireland) Order 1989
    And  I fill in the form
      | fieldName                                             | fieldValue                | fieldType |
      | publication_date                                      | 0                         | date      |
      | #this-court-case-1_court-caseNumber-1                 | case 1                    | text      |
      | #this-court-case-1_court-caseYear-1                   | 2018                      | text      |
      | #this-company-1_gazorg-name-1                         | AWESOME AUTOWORX LTD      | text      |
      | #this-company-1_gazorg-previousCompanyName-1          | Awesome Autoworks Pvt Ltd | text      |
      | #this-company-1_gazorg-companyNumber-1                | NI645465                  | text      |
      | #this-company-1_gazorg-tradingAs-1                    | AwesomeAutos Ltd          | text      |
      | #this-principal-trading-address-1_vcard-postal-code-1 | ME2 2LA                   | text      |
    And I click trading_address_lookup
    And I wait for 2 seconds
    And I click trading_address_select
    And I click trading_address_select_button
    And I wait for 2 seconds
    And I fill in #this-previous-trading-address-1_vcard-postal-code-1 as NR3 1PD
    And I wait for 10 seconds
    And I click 2441_previous_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2441_previous_trading_lookup_address_select_button
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                                                | fieldValue      | fieldType |
      | #this-company-1_gazorg-natureOfBusiness-1                                | software        | text      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentation         | -10             | date      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentationWITHtime | 12:12           | text      |
      | #this-petitioner-1_foaf-name-1                                           | petitioner name | text      |
      | #this-petitioner-address-1_vcard-postal-code-1                           | BT12 5GH        | text      |
    And I click petitioner_address_lookup
    And I wait for 2 seconds
    And I click petitioner_address_select
    And I click petitioner_address_select_button
    And I wait for 2 seconds
    And I select 2450_presented_by as Contributory
    And  I fill in the form
      | fieldName                                                             | fieldValue    | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfHearing                   | 60            | date      |
      | #this-notifiableThing_corp-insolvency-dateOfHearingWITHtime           | 12:10         | text      |
      | #this-notifiableThing_corp-insolvency-dateToRequestAppearance         | 30            | date      |
      | #this-notifiableThing_corp-insolvency-dateToRequestAppearanceWITHtime | 12:00         | text      |
      | #this-IP1_foaf-name-1                                                 | Director name | text      |
    And I click 2441_office_holder_address_checkbox
    And I wait for 3 seconds
    And  I fill in the form
      | fieldName                        | fieldValue           | fieldType |
      | #this-IP2_foaf-name-1            | secondRepresentative | text      |
      | #this-IP-company-2_gazorg-name-1 | secondRepOrg         | text      |
    And I click 2446_second_office_holder_address_enter_manually
    And I wait for 3 seconds
    And I fill in the form
      | fieldName                                  | fieldValue        | fieldType |
      | #this-IP2-address-1_vcard-street-address-1 | someStreet        | text      |
      | #this-IP2-address-1_vcard-locality-1       | someTown          | text      |
      | #this-IP2-address-1_vcard-postal-code-1    | NG9 1LA           | text      |
      | #this-IP1_gaz-telephone-1                  | 44 7700 900077    | text      |
      | #this-IP1_gaz-fax-1                        | 44 7700 900077    | text      |
      | #this-IP1_gaz-email-1                      | email@email.com   | text      |
      | #this-IP1_person-hasIPReferenceNumber-1    | 9999999999        | text      |
      | #this-IP1_person-noticeDated-1             | 30                | date      |
      | #this-IP1_person-additionalInformationIP-1 | someAddtionalInfo | text      |
    And I wait for 10 seconds
    And I click continue_notice
    And I wait for the page /notice/[0-9]{5} to load
    Then the text AWESOME AUTOWORX LTD should be visible
    Then the text Awesome Autoworks Pvt Ltd should be visible
    Then the text NI645465 should be visible
    Then the text  5 Laburnum Road, Rochester ME2 2LA should be visible
    Then the text petitioner name should be visible
    Then the text Unit 1a, Weavers Court, Belfast BT12 5GH should be visible
    Then the text Somestreet, Sometown NG9 1LA should be visible
    And I click add_to_basket
    And I click go_checkout
    And I click payment_not_required
    And I click confirm_order
    Then confirmation_title should say Confirmation
    Examples:
      | test  |
      | test1 |