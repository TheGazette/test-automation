Feature: (GA-010,011) In order to check social sharing functionlity, I want to be able to select that option
  
  Scenario: Social Sharing-copy to clipboard functionlity
   Given I am on the site homepage
   When I click all_notices
   And I click social_sharing_tool
   And I click social_link_button
   Then link_lable_text should say Link to this Gazette notice
	
 Scenario: Social Sharing-send email functionlity
   Given I am on the site homepage
   When I click all_notices
   And I click social_sharing_tool
   And I click email_link
   Then send_noticedByEmail_text should say Send a link to this Gazette notice by email
   
  Scenario: Social Sharing- All links should be available
   Given I am on the site homepage
   When I click all_notices
   And I click social_sharing_tool
   Then facebook_link should be present
   And linkedin_link should be present
   And twitter_link should be present
   And googlePlus_link should be present