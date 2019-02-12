Feature: (GCP-REG-T001) Verify the vanilla profile page as notice placer user

  Scenario: Registered user should see the claim company page
    Given I am logged in as adorg_css@mailhog.com, with a password of _password_
    And I go to a random company profile page
    And I randomly click a company_link
    Then I verify register_company_profile_header is Is this your company?
    And register_company_profile_button should be present