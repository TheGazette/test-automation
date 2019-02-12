Feature: (GCP-REG-T037) Verify digital badge download

  Scenario: Verify digital badge downlaod
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as HCCLEGAL@mailhog.com, with a password of _password_
    And I click signin_button
    And I select my_company_xpath from my_gazette_menu
    And I click company_profile_my_company_link
    Then I click #digital-badge
    Then digital_badge_image_1 is present
    And digital_badge_image_2 is present
    And digital_badge_image_3 is present
    Then I click digital_badge_link_1
    And I wait for 30 seconds
    Then a file called badge_1_print.tif should be downloaded to my downloads directory
    Then I click digital_badge_link_2
    And I wait for 30 seconds
    Then a file called badge_2_print.tif should be downloaded to my downloads directory
    Then I click digital_badge_link_3
    And I wait for 30 seconds
    Then a file called badge_3_print.tif should be downloaded to my downloads directory