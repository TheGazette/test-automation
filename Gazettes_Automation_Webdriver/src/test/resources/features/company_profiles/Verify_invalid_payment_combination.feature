Feature: (GCP-REG-T027) Test payment combination

  Scenario: Test payment failure
    Given I am logged in as premier_agencies@mailhog.com, with a password of Password1!
    And I empty the basket if not empty before I add more items
    And I navigate to /my-gazette/companyprofile/customisation/11186565
    And I click company_profile_select_monthly
    And I click company_profile_add_to_basket
    And I navigate to /shop?purchase=true
    And I fill in #product_parchment as 1
    And I fill in #fullName as Test name
    And I click commemorative_next_button
    And I click commemorative_add_to_basket
    Then I verify page_header_h1 is Item not added to Basket