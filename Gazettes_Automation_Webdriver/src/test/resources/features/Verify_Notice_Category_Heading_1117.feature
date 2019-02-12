Feature: Search for a 1117 notice and verify that the heading is Scottish Government.

  Scenario:Go to notices and search for a 1117 notice.
    Given I am on the site homepage
    And I navigate to /all-notices
    And I click search_notices_by_text
    And I page down from search_notices_by_text
    And I click search_by_notice_code_link
    And I wait for 2 seconds
    And I fill in search_by_notice_code_input_field as 1117
    And I click update_results_button
    And I click search_notices_first_result
    And I verify company_law_notice_title is The Scottish Government
    And I verify company_law_notice_side_header is The Scottish Government