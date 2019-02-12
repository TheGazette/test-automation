Feature: (GA-048) Select place notice as Organisational user – Central Gov’t
  In order to place Gazette notices, I want to be able to select Jason template submission
 
   Scenario: Login and check if I can place a notice 
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the json file \\place_a_notice\\2903 - test.json to have the correct publication date
    And I upload the file \\place_a_notice\\2903 - test.json to template_chooseDoc_button
    And I click upload_template_button
   	And I wait up to 10 minutes for review_template_title to appear
    Then review_template_title should say Review your Deceased Estates notice
    And I click online_add_basket_button
    And I click go_to_checkout
	And I click pay_by_account_button
	And I wait for 10 seconds
	And I click proceed_button
	And I click confirm_order_button
	And I wait for 20 seconds 
	Then confirmation_title should say Confirmation  