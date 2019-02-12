Feature: (GA-006, GA-007) View a notice
  In order to understand data for a notice, I want to see the data represented graphically
 
  Scenario: View notice, notice code metadata is present
    Given I am on the site homepage
    And I click all_notices
    When I click view_full_notices
    Then notice_code_metadata should be present
    
  Scenario: View notice, check publication date is present
    Given I am on the site homepage
    And I click all_notices
    And I click view_full_notices
    When I click linked_data_view
    Then the text has notice code should be visible
    And the text is about should be visible
    
  Scenario: View notice, check notice provenance is present
    Given I am on the site homepage
    And I click all_notices
    And I click view_full_notices
    When I click provenance_trail
    Then the text Receive Bundle Activity should be visible
