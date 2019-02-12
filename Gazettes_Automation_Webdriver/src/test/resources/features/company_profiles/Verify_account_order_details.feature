Feature: (GCP-REG-T032) Verify account order details

  Scenario: Verify company account order details
    Given I am on the site homepage
    When I click signin_link
    And I enter credentials as HCCLEGAL@mailhog.com, with a password of _password_
    And I click signin_button
    And I wait for 5 seconds
    And I select my_account from my_gazette_menu
    And I click my_account_orders_xpath
    And I click first_order_link
    Then I verify product_id_xpath is gaz177
    And I verify order_value_xpath is £210.00
    And I verify my_order_company_name_xpath is HCC LEGAL LIMITED