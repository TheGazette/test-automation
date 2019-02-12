Feature: (GA-026) Verify that account approval can be accessed under the My Gazettes menu by customer services users

  Scenario: Verify that account approval can be accessed under the My Gazettes menu by customer services users
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    Then I select user_personal_menu_accounts from user_personal_menu
