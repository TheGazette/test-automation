Feature: Place a 2903 Notice as Organisational User

  Scenario Outline: Login and check if I can place a notice and pay with Card
    Given I am logged in as CA_StaingOrguser@mailhog.com, with a password of Williams#1
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I click place_notice_webform_link
    And  I select noticeType_edition as <Edition>
    And  I select subNotice as Personal Legal
    And  I select subNotice1 as Deceased Estates - 2903
    And I wait for 5 seconds
    And I click online_continue_button
    And I wait for 5 seconds
    And I verify <legislation_title> is <Legislation Title>
    And I verify <legislation_section> is <Legislation Section>
    And I wait for 5 seconds
    And  I fill in the form
      | fieldName        | fieldValue | fieldType |
      | publication_date | 0          | date      |
      | deceased_surname | System     | text      |
      | deceased_name    | Test       | text      |
      | date_death       | -100       | date      |
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
      | claim_date  | 200        | date      |
    And I page down from claim_date
    And I wait for 5 seconds
    And I click online_continue2_button
    And I wait for the page /notice/[0-9]+ to load
    And I click online_add_basket_button
    And I click online_checkout
    And I click pay_by_card_button
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
    And I click confirm_order_button
    Then confirmation_title should say Confirmation
    Then I keep a note of notice_id_confirmation_page
    Then I navigate to /my-gazette/pending
    And I fill in #free-text as 'my note'
    And I click update_results_button
    And pending_first_noticeid should say 'my note'
    And pending_first_status should say   Paid and awaiting billing confirmation


    Examples:
      | Edition   | Legislation Title                             | legislation_title                                | Legislation Section           | legislation_section                                | page_down  |
      | London    | Trustee Act 1925                              | #this-legislation-1_legislation-legislationTitle | Section 27 (Deceased Estates) | #this-legislation-1_legislation-legislationSection | date_death |
      | Belfast   | Trustee Act (Northern           Ireland) 1958 | #this-legislation-1_legislation-legislationTitle | Section 28 (Deceased Estates) | #this-legislation-1_legislation-legislationSection | date_death |
      | Edinburgh |                                               |                                                  |                               |                                                    |            |