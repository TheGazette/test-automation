Feature: (GA-004) Search within the Insolvency Service
  In order to view notices for a specific edition, I want to be able to filter my search
 
  Scenario: Search by text
    Given I am on the site homepage
    When I select insolvancy_notices_link from notices_menu
    And I fill in text_search_input as Lawrence
    And I click update_results_button
	And I click view_full_notices
    Then the text Lawrence should be visible
    
 Scenario: Search by location
    Given I am on the site homepage
    When I select insolvancy_notices_link from notices_menu    
    And I click location_search_field
    And I fill in location_search_input as NR1 1UA
    And I click update_results_button
    And I wait for 3 seconds
    Then notices_map should be present
    
 Scenario: Search by publication date
    Given I am on the site homepage
    When I select insolvancy_notices_link from notices_menu
    And I click publication_date_field
    And I fill in published_date_from as 23/06/2014
    And I fill in published_date_to as 23/06/2014
    And I click update_results_button
    Then feed_first_notice_publication_date should say 23 June 2014
    
 Scenario Outline: Search by edition
    Given I am on the site homepage
    When I select insolvancy_notices_link from notices_menu
    And I click gazette_edition_button
    And I wait for 2 seconds
    And I click gazette_london_checkbox
    And I click update_results_button
	And I click view_full_notices
    Then notice_edition should say The London Gazette

    Examples:
    | edition 						| notice_edition			|
    | gazette_belfast_checkbox 		| The Belfast Gazette		|
    | gazette_edinburgh_checkbox	| The Edinburgh Gazette		|
	| gazette_london_checkbox		| The London Gazette		|	
	