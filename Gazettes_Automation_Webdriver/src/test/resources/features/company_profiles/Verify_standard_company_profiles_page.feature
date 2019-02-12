Feature: (GCP-REG-T005) Verify the Standard companies registration Page details

  Scenario: Empty company profiles page should be displayed
    Given I am on the site homepage
    And I click cp_register_button
    Then I verify registration_page_header_1 is For research
    And I verify registration_page_header_2 is Company profile
    And I verify registration_page_header_3 is Individual notice placer
    And I verify registration_page_header_4 is Organisational notice placer
    And I click registration_page_register_cp_button
    Then I verify registration_page_header is Registration
