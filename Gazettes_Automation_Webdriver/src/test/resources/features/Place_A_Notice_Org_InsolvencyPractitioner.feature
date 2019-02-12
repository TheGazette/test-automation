Feature: Select place notice as Organisational user – Insolvency practitioner 
	In order to place Gazette notices, I want to be able to select that option
 
Scenario: Login and check if I can place a notice and pay with Card 
	Given I am logged in as insporg_css@mailhog.com, with a password of _password_ 
	And I select place_notice_link from my_gazette_menu 
	And I wait for 5 seconds
	And I update the xml file \\place_a_notice\\CourtsSep03_test.xml to have the correct publication date
	And I update DATE_OF_HEARING in the xml file \\place_a_notice\\CourtsSep03_test.xml to be 20 days from current date
	And I upload the file \\place_a_notice\\CourtsSep03_test.xml to xml_upload 
	And I click upload_xml_file_button 
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