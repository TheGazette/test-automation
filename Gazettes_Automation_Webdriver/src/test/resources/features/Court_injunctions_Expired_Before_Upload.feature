Feature: (GA-066, GA-067, GA-068) Test court injunctiion blocks for all 3 editions, TSO admin user
  In order to permit user from submitting a notice using XML route, an expired injunction should not block submission
 
  Scenario Outline: Setup expired court injection, no validation errors
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    And I click username_toplink
    And I click court_injunctions
    And I click add_new_injunction
        And  I fill in the form
      | fieldName                                             | fieldValue           | fieldType |
      | court_company_name                                    | <Company_Name>       | text      |
      | court_company_number				                  | <Company_Number>     | text      |
      | injunction_from               						  | -2                    | date      |
      | injunction_to               						  | -1                    | date      |
    And I click petitions_windUp_companies
    And I upload the file \\court-injunctions\\1.pdf to upload_CI
	And I click add_new_injuctions
    And add_to_injuction_text should say <Injunction_text>
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
    When I upload the file <file> to xml_upload
    And I click upload_xml_file_button
	And I wait up to 10 minutes for main_title to appear
   	And I click publish_this_notice
    Then main_title should say Your bundle has been sent for publication
   	
	
    Examples:
    | Company_Name						| Company_Number |Injunction_text       | file 													|
    | THE WONDER INN C.I.C.		 		| 09160107		 |Add to injunction list| \\place_a_notice\\Lon_Court_Blocker_Expired.xml		|
    | PURE CITY LIMITED			 		| SC369715		 |Add to injunction list| \\place_a_notice\\Ed_Court_Blocker_Expired.xml		|
    | CARNMORE STONE LIMITED	 		| NI030996		 |Add to injunction list| \\place_a_notice\\Bel_Court_Blocker_Expired.xml		|
    	