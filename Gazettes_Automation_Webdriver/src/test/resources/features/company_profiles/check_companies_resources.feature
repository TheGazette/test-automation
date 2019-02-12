Feature: Verify that a user is able to view companies resources page.

  Scenario: Navigate to resources page from notices tab
    Given I am on the site homepage
    And I navigate to /all-notices
    And I select notices_tab_resources_link from notices_tab
    And I click search_by_category_link
    And I wait for 1 seconds
    And I click search_by_category_drop_down
    And I wait for 2 seconds
    And I click search_resources_by_category_companies
    And I wait for 1 seconds
    And I click search_resources_by_publicationDate
    And I fill in the form
      | fieldName            | fieldValue | fieldType |
      | #date-published-from | -30        | date      |
      | #date-published-to   | 0          | date      |
    And I wait for 2 seconds
    And I click update_search_results_button
    Then resources_page_first_search_result should be present


  Scenario: Navigate to resources page from company profiles tab
    Given I am on the site homepage
    And I wait for 2 seconds
    And I select companies_profiles_resources_link from company_profiles_tab
    And I wait for 2 seconds
    Then resources_page_first_search_result should be present


  Scenario: Navigate to resources page from company profiles tab
    Given I am on the site homepage
    And I click company_profiles_tab
    And I click see_all_companies_resources_link
    Then resources_page_first_search_result should be present
