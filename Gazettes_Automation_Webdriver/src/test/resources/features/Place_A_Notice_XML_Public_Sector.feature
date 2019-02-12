Feature: (GA-052,053,054) Upload XML, account payment, Public Sector Users, payment not required
  In order to place Gazette notices, I want to be able to upload and publish XML, so that website users may see the published notice

  Scenario Outline: Login and check if I can place a notice
    Given I am logged in as <username>, with a password of <password>
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
    And I update DATE_OF_HEARING in the xml file <file> to be 20 days from current date
    And I upload the file <file> to xml_upload
    And I click upload_xml_file_button
    And I wait up to 10 minutes for validation_errors to appear
    Then validation_errors should say There are no validation errors in this bundle
    And I click continue_button
    And I click add_all_to_basket
    And I click go_to_checkout
    And I click payment_not_required_button
    And I click confirm_order_button
    And I wait for 20 seconds
    Then confirmation_title should say Confirmation

    Examples:
      | username                 | password  | file                                   |
      | lgorg_css@mailhog.com | _password_ | \\place_a_notice\\CourtsSep03_test.xml |
      | cgorg_css@mailhog.com | _password_ | \\place_a_notice\\CourtsSep03_test.xml |
	