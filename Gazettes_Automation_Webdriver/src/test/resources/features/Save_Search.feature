Feature: (GA-008) Save a search
  In order re-run searches, I want to be able to save them
 
  Scenario: Save a search (GA-008)
   Given I am logged in as research_css@mailhog.com, with a password of _password_
   And I click all_notices
   And I fill in text_search_input as 'randomstr1'
   And I click update_results_button
   And I page down from text_search_input
   And I click save_these_search_criteria
   And I fill in search_name as 'randomstr2'
   And I click save_these_results
   And I wait for 10 seconds
   And I click close
   When I select saved_searches from my_gazette_menu
   Then the text 'randomstr2' should be visible
   When I select run_this_search_again from actions
   Then I verify #free-text contains text 'randomstr1'
   When I select saved_searches from my_gazette_menu
   And I select delete_this_search from actions
   And I wait for 10 seconds
   And I click delete
   And I wait for 5 seconds
   Then the text 'randomstr2' should not be visible
   

   