Feature: Claim a company and apply discount code on multiple products

  Scenario:Add annual subscription to basket and apply discount code.Then add shop items and checkout together.
    Given I go to a random company profile page
    And I randomly click a company_link
    And I click register_company_profile_button
    And I keep a note of #organisation-regno
    And I fill in the form
      | fieldName                | fieldValue  | fieldType |
      | #company-TelephoneNumber | 07964806666 | text      |
      | #address-finder-postcode | se15ss      | text      |
    And I click register_company_address_lookup
    And I click register_company_address_select
    And I click register_company_address_select_button
    And I fill in the form
      | fieldName                         | fieldValue  | fieldType |
      | #register-directorFamilyName      | DFamname    | text      |
      | #register-directorFirstName       | DFname      | text      |
      | #register-directorTelephoneNumber | 07964806666 | text      |
      | #register-directorEmail           | CP          | email     |
    And I fill in captcha field #captcha
    And I click individual_accept_terms
    And I click individual_submit
    Then I verify registration_successful_header is Sign up successful: check your email
    Then I go to temp mail website and change temp mail
    And I find temp mail having subject The Gazette company profile registration
    And I confirm registration
    And I switch to next window
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | #register-password | P@ssword01 | text      |
      | #password-confirm  | P@ssword01 | text      |
    And I click register_cp_accept_terms
    And I click register_activate_cp
    And I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I wait for 5 seconds
    And I select company_claims_xpath from my_gazette_menu
    And I verify default_company_claim_sort is Ascending
    And I fill in #free-text as 'my note'
    And I click update_search_results_button
    And I click first_search_result
    And I click verify_company_profile_registered_address
    And I click verify_company_profile_company_number
    And I click verify_company_profile_company_active
    And I click verify_company_profile_company_director
    And I click verify_company_profile_company_director_email
    And I click verify_company_profile_company_id_doc
    And I click verify_company_profile_company_address_doc
    Then I click #approveClaim
    Then I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as P@ssword01
    And I click signin_button
    Then I navigate to /company/'my note'
    And I click edit_company_profile_link
    And I click company_profile_add_to_basket
    And I verify company_profile_annual_total is £210.00
    And I fill in #discountCode as GHI789
    And I click apply_discount_code_button
    And I wait for 10 seconds
    Then I verify company_profile_annual_total is £168.00
    Then I click shop_link
    And I click shop_order3_button
    And I fill in the form
      | fieldName           | fieldValue               | fieldType |
      | edition_dropdown    | London                   | text      |
      | month_dropdown      | 5                        | text      |
      | year_dropdown       | 2014                     | text      |
      | issue_supp_number   | Issue 60867 - 16/05/2014 | text      |
      | num_pro_ww1         | 1                        | text      |
      | num_pro_certificate | 1                        | text      |
      | num_pro_parchment   | 2                        | text      |
      | full_name_purchase  | George Freeman           | text      |
    And I click next_purchase_button
    And I click add_basket_button
    And I click basket_item_checkout_button
    And I click company_profile_pay_by_card
    And I wait for 1 minutes
    And I fill in the form
      | fieldName   | fieldValue       | fieldType |
      | card_number | 4444444444444448 | text      |
    And I wait for 20 seconds
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | card_security_code | 000        | text      |
      | card_expiry_month  | 12         | text      |
      | card_expiry_year   | 2018       | text      |
    And I click continue_payment
    And I wait for 1 minutes
    And I verify company_profile_order_confirm_company_id is 'my note'
    And I click company_profile_confirm_order
    Then I am taken to confirmation page

  Scenario: Add shop items to basket.Then add annual subscription and apply discount.
    Given I go to a random company profile page
    And I randomly click a company_link
    And I click register_company_profile_button
    And I keep a note of #organisation-regno
    And I fill in the form
      | fieldName                | fieldValue  | fieldType |
      | #company-TelephoneNumber | 07964806666 | text      |
      | #address-finder-postcode | se15ss      | text      |
    And I click register_company_address_lookup
    And I click register_company_address_select
    And I click register_company_address_select_button
    And I fill in the form
      | fieldName                         | fieldValue  | fieldType |
      | #register-directorFamilyName      | DFamname    | text      |
      | #register-directorFirstName       | DFname      | text      |
      | #register-directorTelephoneNumber | 07964806666 | text      |
      | #register-directorEmail           | CP          | email     |
    And I fill in captcha field #captcha
    And I click individual_accept_terms
    And I click individual_submit
    Then I verify registration_successful_header is Sign up successful: check your email
    Then I go to temp mail website and change temp mail
    And I find temp mail having subject The Gazette company profile registration
    And I confirm registration
    And I switch to next window
    And I fill in the form
      | fieldName          | fieldValue | fieldType |
      | #register-password | P@ssword01 | text      |
      | #password-confirm  | P@ssword01 | text      |
    And I click register_cp_accept_terms
    And I click register_activate_cp
    And I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I wait for 5 seconds
    And I select company_claims_xpath from my_gazette_menu
    And I verify default_company_claim_sort is Ascending
    And I fill in #free-text as 'my note'
    And I click update_search_results_button
    And I click first_search_result
    And I click verify_company_profile_registered_address
    And I click verify_company_profile_company_number
    And I click verify_company_profile_company_active
    And I click verify_company_profile_company_director
    And I click verify_company_profile_company_director_email
    And I click verify_company_profile_company_id_doc
    And I click verify_company_profile_company_address_doc
    Then I click #approveClaim
    Then I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as P@ssword01
    And I click signin_button
    Then I click shop_link
    And I click shop_order3_button
    And I fill in the form
      | fieldName           | fieldValue               | fieldType |
      | edition_dropdown    | London                   | text      |
      | month_dropdown      | 5                        | text      |
      | year_dropdown       | 2014                     | text      |
      | issue_supp_number   | Issue 60867 - 16/05/2014 | text      |
      | num_pro_ww1         | 1                        | text      |
      | num_pro_certificate | 1                        | text      |
      | num_pro_parchment   | 2                        | text      |
      | full_name_purchase  | George Freeman           | text      |
    And I click next_purchase_button
    And I click add_basket_button
    Then I navigate to /company/'my note'
    And I click edit_company_profile_link
    And I click company_profile_add_to_basket
    And I verify company_profile_annual_total is £518.00
    And I verify company_profile_annual_subscription_rate is 210.00
    And I fill in #discountCode as GHI789
    And I click apply_discount_code_button
    And I wait for 10 seconds
    Then I verify company_profile_annual_subscription_rate is 168.00
    And I verify company_profile_annual_total is £476.00

