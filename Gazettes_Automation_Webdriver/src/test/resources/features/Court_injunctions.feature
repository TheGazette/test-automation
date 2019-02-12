Feature: Setup court injunctions
  In order to preventing user from submitting a notice using XML route, for that court injunctions is in place
 
  Scenario Outline: Setup court injection
    Given I am logged in as gazad@mailhog.com, with a password of _password_
    When I click username_toplink
    And I click court_injunctions
    And I click add_new_injunction
    And I fill in court_company_name as <Company_Name>
    And I fill in court_company_number as <Company_Number>
    And I fill in injunction_from as <Date_From>
    And I fill in injunction_to as <Date_To>
    And I click petitions_windUp_companies
    And I upload the file \\court-injunctions\\1.pdf to upload_CI
	And I click add_new_injuctions
    Then add_to_injuction_text should say <Injunction_text>

    Examples:
    | Company_Name					| Company_Number| Date_From		| Date_To			|Injunction_text                  |
    | A A S ENTERPRISES LTD 		| 8419247		| 30/05/2016 	| 01/12/2016		|Add to injunction list|
    
    
	