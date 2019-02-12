Feature: Notice Placement Validation, Companies House 
	In Order to verify the functionality of Submiting a notice with invalid company name/number
   
   Scenario Outline: Login and check company name is invalid
    Given I am logged in as <username>, with a password of <password>
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
     And I update DATE_OF_HEARING in the xml file <file> to be 20 days from current date
     And I upload the file <file> to xml_upload
    And I wait for 2 seconds
    And I submit the xml_upload
    And I wait for the page /my-gazette/bundle/[0-9]+ to load
    And I click view_validation_report
    Then validation_error_text should say <validation_result_text>
    
      Examples:
    | username 						| password 			|	file													| validation_result_text |
	| cgorg_css@mailhog.com		| _password_			|	\\place_a_notice\\InvalidCompanyName.xml				| The data you have supplied for Company Name has not been verified.You will need to correct this information in order to submit your notice.|
	| cgorg_css@mailhog.com		| _password_			|	\\place_a_notice\\InvalidCompanyNumber.xml				| The data you have supplied for Company Number has not been verified.You will need to correct this information in order to submit your notice.|
	| cgorg_css@mailhog.com		| _password_			|	\\place_a_notice\\BlankCompanyName.xml					| The 'Company name' for this organisation is missing.|
	| cgorg_css@mailhog.com		| _password_			|	\\place_a_notice\\BlankCompanyNumber.xml				| The 'Company number' for this organisation is missing.|
