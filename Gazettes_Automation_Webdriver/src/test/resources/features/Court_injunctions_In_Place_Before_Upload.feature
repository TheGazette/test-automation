Feature: (GA-060, GA-061, GA-062) Test court injunctiion blocks for all 3 editions, TSO admin user
  In order to preventing user from submitting a notice using XML route, for that court injunctions is in place
 
  Scenario Outline: Setup court injection
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    And I click username_toplink
    And I click court_injunctions
    And I click add_new_injunction
        And  I fill in the form
      | fieldName                                             | fieldValue           | fieldType |
      | court_company_name                                    | <Company_Name>       | text      |
      | court_company_number				                  | <Company_Number>     | text      |
      | injunction_from               						  | 0                    | date      |
      | injunction_to               						  | 1                    | date      |
    And I click petitions_windUp_companies
    And I upload the file \\court-injunctions\\1.pdf to upload_CI
	And I click add_new_injuctions
    And add_to_injuction_text should say <Injunction_text>
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
    When I upload the file <file> to xml_upload
    And I click upload_xml_file_button
   	And I wait up to 10 minutes for validation_errors to appear
   	Then validation_errors should say There are a total of 1 validation errors in this bundle, please view the validation reports for details of the required corrections
   	When I click view_validation_report
    Then validation_error_text should say There is a court injunction blocking the publication of this notice. If you have any questions about this please contact The Gazette customer services team by email: customer.services@thegazette.co.uk, telephone: +44 (0)333 200 2434 or speak to us using web chat.
   	
	
    Examples:
    | Company_Name						| Company_Number |Injunction_text       | file 													|
    | FIRST CONSTRUCTION LIMITED 		| SC239596		 |Add to injunction list| \\place_a_notice\\Ed_Court_Blocker_Inj_In_Place.xml	|
    | ASP SAFETY SERVICES (NI) LTD 		| NI616241		 |Add to injunction list| \\place_a_notice\\Bel_Court_Blocker_Inj_In_Place.xml	|
    | Xefro Trade Ltd 					| 09413716		 |Add to injunction list| \\place_a_notice\\Lon_Court_Blocker_Inj_In_Place.xml	|
    	