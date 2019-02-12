Feature: Check notices that have a company number should have a company timeline above them
   
  Scenario: View website and filter by company name to check company timeline is visible
    Given I am on the site homepage
    And I select insolvancy_notices_link from notices_menu
    And I click notice_code_link
    And I fill in text_search_input as KIRKPATRICK MANAGEMENT LIMITED
    And I click gazette_edition_button
    And I click update_results_button
    And I click insolvancy_company_name
    Then insolvancy_timeline_text should say Notice timeline for KIRKPATRICK MANAGEMENT LIMITED
   
   Scenario: View website and filter by company name and check company timeline is visible on company number
    Given I am on the site homepage
    And I select insolvancy_notices_link from notices_menu
    And I click notice_code_link
    And I fill in text_search_input as KIRKPATRICK MANAGEMENT LIMITED
    And I click gazette_edition_button
    And I click update_results_button
    And I click insolvancy_company_name
    And I click insolvancy_company_number
    Then Notice_timeline should say Timeline
  
  
   Scenario Outline: Verify that content is  showing in the json and xml format
    Given I am on the site homepage
    And I navigate to <URL>
    
  Examples:
  |URL                        |  
  |/company/08827017/data.json|
  |/company/08827017/data.xml |