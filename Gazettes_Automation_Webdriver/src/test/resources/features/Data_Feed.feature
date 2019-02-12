Feature: (GA-030) In order to check data feed functionlity, I want to be able to select that option
  
  Scenario: Data Feed functionlity
   Given I am on the site homepage
   When I click all_notices
   And I click notice_code_link
   And I fill in notice_code_input as 2903
   And I click gazette_edition_button
   And I click update_results_button
   And I click rss_feed_link
   Then rss_feed_search_text should say RSS feed for this search
	
	