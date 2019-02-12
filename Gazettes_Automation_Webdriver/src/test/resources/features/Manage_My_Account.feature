Feature: Manage my own account
  In order to change my user details, I need to be able to manage my account
 
   Scenario: Login and check if I can edit my profile 
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    And I select my_acccount_link from my_gazette_menu
	And I wait up to 1 minutes for account_setting_title to appear	
    Then account_setting_title should say Change name, email address or password
    And I click edit_profile_link
    And I click gazette_newsletter
    And I click profile_save_button
    