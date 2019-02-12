Feature: Select place notice from the menu
  In order to place Gazette notices, I want to be able to select that option
 
  Scenario Outline: Login and check if I can place a notice
    Given I am logged in as <username>, with a password of <password>
    When I highlight my_gazette_menu
    Then place_notice_link should <place_notice_presence>

    Examples:
    | username 						| password 			|	type											| place_notice_presence		|
    | research_css@mailhog.com 	| _password_			|	research user									| not be present			|
	| individual_css@mailhog.com	| _password_			|	individual user									| be present				|
	| insorg_css@mailhog.com		| _password_			|	Organisational user – Insolvency administrator	| be present				|
	| adorg_css@mailhog.com		| _password_			|	Organisational user – Advertising agency		| be present				|
	| cgorg_css@mailhog.com		| _password_			|	Organisational user – Central Gov’t				| be present				|
	| lgorg_css@mailhog.com		| _password_			|	Organisational user – Local Gov’t				| be present				|
	| insporg_css@mailhog.com	| _password_			|	Organisational user – Insolvency practitioner	| be present				|
	| laworg_css@mailhog.com		| _password_			|	Organisational user – Law Firm					| be present				|
	| liqorg_css@mailhog.com		| _password_			|	Organisational user – Liquidator				| be present				|
	| pborg_css@mailhog.com		| _password_			|	Organisational user – Professional Body			| be present				|
	| solorg_css@mailhog.com		| _password_			|	Organisational user – Solicitor					| be present				|
	| tsona_css@mailhog.com		| _password_			|	Admin user – Notice Approver					| not be present			|
	| gazad@mailhog.com			| _password_			|	Admin user – All other roles					| be present				|
	
	