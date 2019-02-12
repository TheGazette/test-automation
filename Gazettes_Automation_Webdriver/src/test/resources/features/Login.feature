Feature: Login via popup
  In order to use The Gazette, I want to be able to login
 
  Scenario Outline: Login and check My Gazette is available
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as <username>, with a password of <password>
	And I click signin_button
	And I wait up to 1 minutes for my_gazette_menu to appear	
    Then my_gazette_menu should be present

    Examples:
    | username 						| password 			|	type							|
    | research_css@mailhog.com 	| _password_			|	research user					|
	| laworg_css@mailhog.com		| _password_			|	organisational user, law firm	|
	