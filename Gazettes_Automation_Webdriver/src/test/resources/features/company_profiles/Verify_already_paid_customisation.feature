Feature: (GCP-REG-T034) Verify user not charged again for customisation

  Scenario: Verify user not charged again for customisation
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as HCCLEGAL@mailhog.com, with a password of _password_
    And I click signin_button
    And I select my_company_xpath from my_gazette_menu
    And I click company_profile_my_company_link
    Then I click edit_company_profile_link
    Then I click customise_company_submit
    Then I am taken to /my-gazette/my-companies page