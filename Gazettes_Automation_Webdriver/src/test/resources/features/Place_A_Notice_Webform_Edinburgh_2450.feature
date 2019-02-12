@ignored
Feature: 2450 Webforms, Place corporate insolvency notice in edinburgh edition

  Scenario Outline: Login and check if I can place a insolvency notice in belfast edition of gazette
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I click place_notice_webform_link
    And  I select noticeType_edition as Edinburgh
    And  I select subNotice as Corporate Insolvency
    And  I select subNotice1 as Winding-up By The Court
    And  I select subNotice2 as Petitions to Wind Up (Companies) - 2450
    And I wait for 2 seconds
    And I click online_continue_button
    And I select #this-court-1_court-courtName-1-button as Sheriff Court
    And I verify #this-legislation-1_legislation-legislationTitle is Insolvency Act 1986
    And  I fill in the form
      | fieldName                                             | fieldValue          | fieldType |
      | publication_date                                      | 0                   | date      |
      | #this-court-case-1_court-caseNumber-1                 | case 1              | text      |
      | #this-court-case-1_court-caseYear-1                   | 1288                | text      |
      | #this-company-1_gazorg-name-1                         | GS PARTNERS LTD     | text      |
      | #this-company-1_gazorg-previousCompanyName-1          | GS Partners Pvt Ltd | text      |
      | #this-company-1_gazorg-companyNumber-1                | 07417559            | text      |
      | #this-company-1_gazorg-tradingAs-1                    | GS Partners Ltd     | text      |
      | #this-company-1_gazorg-previouslyTradingAs-1          | G S P Ltd           | text      |
      | #this-principal-trading-address-1_vcard-postal-code-1 | ME2 2LA             | text      |
    And I click trading_address_lookup
    And I wait for 2 seconds
    And I click trading_address_select
    And I click trading_address_select_button
    And I wait for 2 seconds
    And I fill in #this-previous-trading-address-1_vcard-postal-code-1 as NR3 1PD
    And I click 2441_previous_trading_post_code_look_up_link
    And I wait for 2 seconds
    And I click 2441_previous_trading_lookup_address_select_button
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                                                | fieldValue      | fieldType |
      | #this-company-1_gazorg-natureOfBusiness-1                                | software        | text      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentation         | -10             | date      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentationWITHtime | 12:00           | text      |
      | #this-petitioner-1_foaf-name-1                                           | petitioner name | text      |
      | #this-petitioner-address-1_vcard-postal-code-1                           | BT12 5GH        | text      |
    And I click petitioner_address_lookup
    And I wait for 2 seconds
    And I click petitioner_address_select
    And I click petitioner_address_select_button
    And I wait for 2 seconds
    And I select 2450_presented_by as Director
    And I fill in #this-hearingAddress_vcard-postal-code-1 as BD7 2SE
    And I click 2450_hearing_address_lookup_link
    And I wait for 2 seconds
    And I click 2450_hearing_address_select_button
    And I wait for 2 seconds
    And  I fill in the form
      | fieldName                                                  | fieldValue    | fieldType |
      | #this-notifiableThing_corp-insolvency-sheriffName-1        | Sheriffs Name | text      |
      | #this-notifiableThing_corp-insolvency-dateOfInterlocutor-1 | -15           | date      |
    And I select #this-notifiableThing_corp-insolvency-personToLodgeAnswersTo-1-button as Deputy Sheriff Clerk
    And  I fill in the form
      | fieldName                                    | fieldValue | fieldType |
      | #this-IP1-provisional_foaf-name-1            | Agent Name | text      |
      | #this-IP-provisional-company-1_gazorg-name-1 | Agent Org  | text      |
    And I fill in #this-IP1-provisional-address-1_vcard-postal-code-1 as NG9 1LA
    And I click 2450_agent_address_lookup_link
    And I click 2450_agent_address_select_button
    And I fill in the form
      | fieldName                                           | fieldValue       | fieldType |
      | #this-IP2-provisional_foaf-name-1                   | Second Agent     | text      |
      | #this-IP-provisional-company-2_gazorg-name-1        | Second Agent Org | text      |
      | #this-IP2-provisional-address-1_vcard-postal-code-1 | SE1 5SS          | text      |
    And I click 2450_second_agent_address_lookup_limk
    And I wait for 3 seconds
    And I click 2450_second_agent_address_select_button
    And  I fill in the form
      | fieldName                                  | fieldValue         | fieldType |
      | #this-IP1_gaz-telephone-1                  | 02034564477        | text      |
      | #this-IP1_gaz-email-1                      | email@email.com    | text      |
      | #this-IP1_person-hasIPReferenceNumber-1    | 02034564477        | text      |
      | #this-IP1_person-hasIPReferenceNumber-1    | 9999999            | text      |
      | #this-IP1_person-additionalInformationIP-1 | someAdditionalInfo | text      |
      | #this-IP1_person-noticeDated-1             | 30                 | date      |
    #And I click continue_notice
    And I wait for the page /notice/[0-9]{5} to load
    And I click add_to_basket
    And I click go_checkout
    And I click payment_not_required
    And I click confirm_order
    Then confirmation_title should say Confirmation
    Examples:
      | test  |
      | test1 |