Feature: (GA-009) My notices
  I should be able to save a draft notice and finish later

  Scenario: Save a notice
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I click place_notice_webform_link
    And  I select noticeType_edition as London
    And  I select subNotice as Corporate Insolvency
    And  I select subNotice1 as Winding-up By The Court
    And  I select subNotice2 as Petitions to Wind Up (Companies) - 2450
    And I wait for online_continue_button to be enabled
    And I click online_continue_button
    And I verify #this-legislation-1_legislation-legislationTitle is Insolvency Act 1986
    And  I fill in the form
      | fieldName                              | fieldValue      | fieldType |
      | publication_date                       | 0               | date      |
      | #this-court-case-1_court-caseNumber-1  | case 1          | text      |
      | #this-court-case-1_court-caseYear-1    | 1288            | text      |
      | #this-company-1_gazorg-name-1          | GS PARTNERS LTD | text      |
      | #this-company-1_gazorg-companyNumber-1 | 07417559        | text      |
    And I page_down from element id #this-company-1_gazorg-companyNumber-1
    And I page_down from element id #this-petitioner-address-1_vcard-postal-code-1
    And I page_down from element id #this-IP1_gaz-email-1
    And I click save_and_finish_later
    And I select notice_placed_link from my_gazette_menu
    Then GS PARTNERS LTD should be present in notice_draft_name
    And notice_draft_modified date should be 0 format dd MMMM yyyy