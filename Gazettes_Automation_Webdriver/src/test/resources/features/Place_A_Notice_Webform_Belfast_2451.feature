#Currently there are some validation bugs in belfast edition
@ignored
Feature: Place partnerships insolvency notice in belfast edition
  Scenario Outline: Login and check if I can place a insolvency notice in belfast edition of gazette
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I click place_notice_webform_link
    And  I select noticeType_edition as Belfast
    And  I select subNotice as Corporate Insolvency
    And  I select subNotice1 as Winding-up By The Court
    And  I select subNotice2 as Petitions to Wind Up (Partnerships) - 2451
    And I wait for online_continue_button to be enabled
    And I click online_continue_button
    And  I fill in the form
      | fieldName                                                     | fieldValue           | fieldType |
      | publication_date                                              | 0                    | date      |
      | #this-court-case-1_court-caseNumber-1                         | case 1               | text      |
      | #this-court-case-1_court-caseYear-1                           | 1288                 | text      |
      | #this-company-1_gazorg-name-1                                 | AWESOME AUTOWORX LTD | text      |
      | #this-company-1_gazorg-tradingAs-1                            | a company            | text      |
      | #this-company-principal-trading-address-1_vcard-postal-code-1 | se15ss               | text      |
    And I click partnership_address_lookup
    And I click partnership_address_select
    And I click partnership_address_select_button
    And I page_down from element id #this-company-principal-trading-address-1_vcard-postal-code-1
    And  I fill in the form
      | fieldName                                                                | fieldValue      | fieldType |
      | #this-company-1_gazorg-natureOfBusiness-1                                | software        | text      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentation         | -10             | date      |
      | #this-notifiableThing_corp-insolvency-dateOfPetitionPresentationWITHtime | 12:12           | text      |
      | #this-petitioner-1_foaf-name-1                                           | petitioner name | text      |
      | #this-petitioner-address-1_vcard-postal-code-1                           | se15ss          | text      |
    And I click petitioner_address_lookup
    And I click petitioner_address_select
    And I click petitioner_address_select_button
    And I page_down from element id #this-petitioner-1_foaf-name-1
    And  I fill in the form
      | fieldName                                                             | fieldValue    | fieldType |
      | #this-notifiableThing_corp-insolvency-dateOfHearing                   | 60            | date      |
      | #this-notifiableThing_corp-insolvency-dateOfHearingWITHtime           | 12:12         | text      |
      | #this-notifiableThing_corp-insolvency-dateToRequestAppearance         | 30            | date      |
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
    And I wait for the page /notice/[0-9]{5} to load
    And I click add_to_basket
    And I click go_checkout
    And I click payment_not_required
    And I click confirm_order
    Then confirmation_title should say Confirmation
### Not necessary not sure why the runners are not being generated
    Examples:
      | test  |
      | test1 |