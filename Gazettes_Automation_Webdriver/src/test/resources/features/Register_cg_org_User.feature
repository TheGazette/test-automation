Feature: (GA-022) Register government org user
  Verify that an organizational users is split into 2 main sub categories, ‘public sector’ and ‘any other notice placer’.
  These subsections drive the types of notice that the user is permitted to place

  Scenario: Register government Org user
    Given I go to register as organisation user
    And I fill in the form
      | fieldName                | fieldValue      | fieldType |
      | #organisation-name       | TAG DENT MD LTD | text      |
      | #organisation-regno      | 10940907        | text      |
      | #register-firstName      | firstname       | text      |
      | #company-TelephoneNo     | 07964806666     | text      |
      | #business-nature         | business        | text      |
      | register_company_address | se15ss          | text      |
    And I click register_company_address_lookup
    And I click register_company_address_select
    And I click register_company_address_select_button
    And I fill in the form
      | fieldName                  | fieldValue  | fieldType |
      | registration_title_xpath   | Mr          | select    |
      | #register-familyName       | Familyname  | text      |
      | #register-firstName        | firstname   | text      |
      | #register-email            | cg_org      | email     |
      | #register-telephone        | 07964806666 | text      |
      | #register-password         | Passw0rd@1  | text      |
      | #register-password-confirm | Passw0rd@1  | text      |
    And I click register_org_agent
    And I fill in #job-title as title
    And I fill in registration_address_postcode as SE15SS
    And I click registration_address_lookup
    And I click registration_address_select
    And I click registration_address_select_button
    And I fill in #businessType as Government (central)
    And I fill in #officeOrDepartmentId as Central Dept
    And I fill in captcha field #captcha
    And I click org_register_accept_terms_checkbox
    And I click registration_submit
    Then I verify registration_confirmation_header is Registration successful: check your email
    Then I go to temp mail website and change temp mail
#    And I wait up to 2 minutes for temp_mail_subject to appear
    And I find temp mail having subject Gazettes registration confirmation
    And I confirm registration
    And I wait for 5 seconds
    And I switch to next window
    And I wait for 5 seconds
    And I fill in #user-email as gazad@mailhog.com
    And I fill in #user-password as _password_
    And I click signin_button
    And I navigate to /my-gazette/account-admin?status=awaiting-verification
    And I fill in text_search_input as email
    And I click update_results_button
    And I click await_verification_company_link
    And I click verify_govt_agency
    And I click verify_email
    And I click approve_account
    And I click save_changes_button
    And I navigate to /sign-out
    And I navigate to /sign-in
    And I fill in #user-email as email
    And I fill in #user-password as Passw0rd@1
    And I click signin_button
    And I navigate to /my-gazette/place-notice/london/2450/online-form
    Then winding_up_page_header should say Petitions to Wind Up (Companies)
    And I navigate to /my-gazette/place-notice/london/2903/online-form
    Then winding_up_page_header should say Place a Deceased Estates Notice