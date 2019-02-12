Feature: (GA-050) 2450 Webforms, Place corporate insolvency notice in London edition

  Scenario Outline: Login and check if I can place a insolvency notice in london edition of gazette
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I click place_notice_webform_link
    And  I select noticeType_edition as London
    And  I select subNotice as Corporate Insolvency
    And  I select subNotice1 as Winding-up By The Court
    And  I select subNotice2 as Petitions to Wind Up (Companies) - 2450
    And I wait for online_continue_button to be enabled
    And I click online_continue_button
    And I verify #this-legislation-1_legislation-legislationTitle is Insolvency Act 1986
    And  I fill in the form
      | fieldName                                             | fieldValue      | fieldType |
      | publication_date                                      | -1              | date      |
      | #this-court-case-1_court-caseNumber-1                 | case 1          | text      |
      | #this-court-case-1_court-caseYear-1                   | 1288            | text      |
      | #this-company-1_gazorg-name-1                         | GS PARTNERS LTD | text      |
      | #this-company-1_gazorg-companyNumber-1                | 07417559        | text      |
      | #this-company-1_gazorg-tradingAs-1                    | a company       | text      |
      | #this-principal-trading-address-1_vcard-postal-code-1 | SE1 5SS          | text      |
    And I click trading_address_lookup
    And I click trading_address_select
    And I click trading_address_select_button
    And I page_down from element id #this-principal-trading-address-1_vcard-postal-code-1
    And  I fill in the form
      | fieldName                                                                | fieldValue      | fieldType |
      | #this-company-1_gazorg-natureOfBusiness-1                                | software        | text      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentation         | 10              | date      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentationWITHtime | 12:12           | text      |
      | #this-petitioner-1_foaf-name-1                                           | petitioner name | text      |
      | #this-petitioner-address-1_vcard-postal-code-1                           | SE1 5SS          | text      |
    And I click petitioner_address_lookup
    And I click petitioner_address_select
    And I click petitioner_address_select_button
    And I page_down from element id #this-petitioner-1_foaf-name-1
    And  I fill in the form
      | fieldName                                                    | fieldValue | fieldType |
      | #this-notifiableThing_corp-insolvency-nameOfPlaceOfHearing-1 | court 1    | text      |
      | #this-hearingAddress_vcard-postal-code-1                     | SE1 5SS     | text      |
    And I click hearing_address_lookup
    And I click hearing_address_select
    And I click hearing_address_select_button
    And  I fill in the form
      | fieldName                                                             | fieldValue    | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfHearing                   | 9             | date      |
      | #this-notifiableThing_corp-insolvency-dateOfHearingWITHtime           | 12:12         | text      |
      | #this-notifiableThing_corp-insolvency-dateToRequestAppearance         | 11            | date      |
      | #this-notifiableThing_corp-insolvency-dateToRequestAppearanceWITHtime | 12:12         | text      |
      | #this-IP1_foaf-name-1                                                 | Director name | text      |
    And I page_down from element id #this-IP1_foaf-name-1
    And I fill in #this-IP1-address-1_vcard-postal-code-1 as SE15SS
    And I click rep_address_lookup
    And I click rep_address_select
    And I click rep_address_select_button
    And  I fill in the form
      | fieldName                      | fieldValue      | fieldType |
      | #this-IP1_gaz-telephone-1      | 02034564477     | text      |
      | #this-IP1_gaz-email-1          | email@email.com | text      |
      | #this-IP1_person-noticeDated-1 | 30              | date      |
    And I click continue_notice
    And I wait for the page /draft/[0-9]{5} to load
    Then the text The 'Notice of intention to attend hearing deadline' should be before hearing date. should be visible
    Then the text The 'Earliest publication date' should be after or on the current date. should be visible
    Then the text The 'Presentation date' should be on or before the publication date. should be visible
### Not necessary not sure why the runners are not being generated
    Examples:
      | test  |
      | test1 |