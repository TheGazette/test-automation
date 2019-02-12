Feature: (GA-037, GA-038, GA-039) Place 2903 webform as an Individual user
  In order to place Gazette notices, I want to be able to select that option

  Scenario Outline: Login and check if I can place a notice and pay with Card
    Given I am logged in as testindividual@mailhog.com, with a password of Password1!
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And  I select noticeType_edition as <Edition>
    And  I select subNotice as Personal Legal
    And  I select subNotice1 as Deceased Estates - 2903
    And I wait for online_continue_button to be enabled
    And I click online_continue_button
    And I verify <legislation_title> is <Legislation Title>
    And I verify <legislation_section> is <Legislation Section>
    And I click post_document_link
    And I click post_document_checkbox
    And I click post_document_button
    And I wait for 5 seconds
    And  I fill in the form
      | fieldName        | fieldValue | fieldType |
      | publication_date | -10        | date      |
      | deceased_surname | System     | text      |
      | deceased_name    | Test       | text      |
      | date_death       | 100        | date      |
    And I page down from <page_down>
    And I wait for 5 seconds
    And I click deceased_address_manual
    And  I fill in the form
      | fieldName                                | fieldValue | fieldType |
      | deceased_address1                        | St crispin | text      |
      | deceased_town                            | Norwich    | text      |
      | deceased_postcode                        | NR3 1PD    | text      |
      | #this-estateExecutor-1_foaf-familyName-1 | System     | text      |
      | #this-estateExecutor-1_foaf-firstName-1  | UAT        | text      |
    And I wait for 5 seconds
    And I scroll to ex_address_manual
    And I click ex_address_manual
    And  I fill in the form
      | fieldName   | fieldValue | fieldType |
      | ex_address1 | St crispin | text      |
      | ex_town     | Norwich    | text      |
      | ex_postcode | NR3 1PD    | text      |
      | claim_date  | 25         | date      |
    And I page down from claim_date
    And I wait for 5 seconds
    And I click online_continue2_button
    And I wait for the page /draft/[0-9]+ to load
    Then The 'Earliest publication date' should be after or on the current date. should be present in error_list
    Then The 'Date of Death' should be before the publication date. should be present in error_list
    Then The 'Claim deadline' has to be a minimum of 2 months and a day from the earliest publication date. should be present in error_list

    Examples:
      | Edition   | Legislation Title                             | legislation_title                                | Legislation Section           | legislation_section                                | page_down  |
      | London    | Trustee Act 1925                              | #this-legislation-1_legislation-legislationTitle | Section 27 (Deceased Estates) | #this-legislation-1_legislation-legislationSection | date_death |
      | Belfast   | Trustee Act (Northern           Ireland) 1958 | #this-legislation-1_legislation-legislationTitle | Section 28 (Deceased Estates) | #this-legislation-1_legislation-legislationSection | date_death |
      | Edinburgh |                                               |                                                  |                               |                                                    |            |