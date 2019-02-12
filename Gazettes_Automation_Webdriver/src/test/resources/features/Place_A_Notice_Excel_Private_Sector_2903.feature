Feature: (GA-046) Select Excel Template upload as Organisational user – Private 
	In order to place Gazette notices, I want to be able to select that option
 
Scenario Outline: Login and check if I can place a notice and pay with Card 
	Given I am logged in as <username>, with a password of <password> 
	When I select place_notice_link from my_gazette_menu 
	And I wait for 5 seconds
	And I update the excel file <file> to have the correct publication date 
	And I upload the file <file> to template_chooseDoc_button
	And I click upload_template_button 
   	And I wait up to 10 minutes for validation_errors to appear
   	Then validation_errors should say There are no validation errors in this bundle
    And I click continue_button
    And I click add_all_to_basket
    And I click go_to_checkout
	And I click pay_by_account_button
	And I wait for 10 seconds
	And I click proceed_button
	And I click confirm_order_button
	And I wait for 20 seconds 
	Then confirmation_title should say Confirmation 
	
	Examples:
    | username 						| password 			|	file													| 
	| adorg_css@mailhog.com		| _password_			|	\\place_a_notice\\Belfast_2903-gazette-template-v2.xls	|
	
	