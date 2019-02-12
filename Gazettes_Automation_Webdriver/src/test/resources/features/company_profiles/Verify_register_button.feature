Feature: (GCP-REG-T002)(GCP-REG-T004) Verify the vanilla profile page as notice placer user and pre-populated fields

  Scenario: Registered user should see the claim company page
    Given I am logged in as adorg_css@mailhog.com, with a password of _password_
    And I go to a random company profile page
    And I randomly click a company_link
    Then I verify register_company_profile_header is Is this your company?
    And I click register_company_profile_button
    Then I verify registration_page_header is Registration
    And #organisation-regno should be populated
    And #organisation-name should be populated