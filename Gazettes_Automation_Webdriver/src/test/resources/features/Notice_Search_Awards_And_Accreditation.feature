Feature: (GA-002) Search within the Awards And Accreditation
  In order to view notices for a specific edition, I want to be able to filter my search
 
  Scenario: Search by text
    Given I am on the site homepage
    When I select award_accreditation_link from notices_menu
    And I fill in text_search_input as Robin Edgar Norman
    And I click update_results_button
	And I click view_full_notices
    Then the text Robin Edgar Norman should be visible
    
 Scenario: Search by publication date
   Given I am on the site homepage
    When I select award_accreditation_link from notices_menu
    And I click publication_date_field
    And I fill in published_date_from as 07/02/2002
    And I fill in published_date_to as 07/02/2002
    And I click update_results_button
    Then feed_first_notice_publication_date should say 7 February 2002

 Scenario: Search by edition
    Given I am on the site homepage
    When I select award_accreditation_link from notices_menu
    And I click gazette_edition_button
    And I click gazette_london_checkbox
    And I click update_results_button
	And I click view_full_notices
    Then notice_edition should say The London Gazette