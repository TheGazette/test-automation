Feature: Login
  In order to use The Gazette, I want to be able to login
 
  Scenario Outline: Login and check My Gazette is available
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as <username>, with a password of <password>
	And I click signin_button    
	Then username_toplink should be present

    Examples:
    | username 						| password 			|	type							|
    | research_css@mailhog.com 		| _password_			|	research user					|
    | individual_css@mailhog.com	| _password_wrong	|	individual user					|
	| laworg_css@mailhog.com		| _password_			|	organisational user, law firm	|
	