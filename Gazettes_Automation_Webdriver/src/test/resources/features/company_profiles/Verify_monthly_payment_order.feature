Feature: (GCP-REG-T033) Verify monthly paymemt details

  Scenario: Verify company account order details
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as test_monthly_payment@mailhog.com, with a password of Hello123$
    And I click signin_button
    And I select my_account from my_gazette_menu
    And I click my_account_orders_xpath
    And I click first_order_link
    Then I verify product_id_xpath is gaz176
    And I verify order_value_xpath is £23.99
    And I verify my_order_company_name_xpath is SAME CONTRACT LIMITED