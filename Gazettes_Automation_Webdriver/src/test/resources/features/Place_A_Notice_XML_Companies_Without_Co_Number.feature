Feature: Upload XML, account payment, check companies without company number, Private Sector Users
  In order to place Gazette notices, I want to be able to upload and publish XML, so that website users may see the published notice

  Scenario Outline: Login and check if I can place a notice
    Given I am logged in as <username>, with a password of <password>
    And I select place_notice_link from my_gazette_menu
    And I wait for 5 seconds
    And I update the xml file <file> to have the correct publication date
    And I update DATE_OF_HEARING in the xml file <file> to be 20 days from current date
    When I upload the file <file> to xml_upload
    And I click upload_xml_file_button
    And I wait up to 10 minutes for validation_errors to appear
    Then validation_errors should say There are no validation errors in this bundle
    And I click continue_button
    And I click add_all_to_basket
    And I click go_to_checkout
    And I click pay_by_account_button
    And I wait for 10 seconds
    And I click proceed_button
    And I click confirm_order_button
    And I wait for 20 seconds
    Then confirmation_title should say Confirmation

    Examples:
      | username                   | password  | file                                                                                                                                                                        |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Clubs Society.xml                                                                                                       |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Unregistered Companies 2450.xml                                                                                         |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\All Partnership except 2462 or 2450 - tested.xml                                                          |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\Partnership 2450 2452 (both company tagged - overseas type).xml                                           |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\Partnership 2450 2452 (both company tagged - partnership type).xml                                        |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\Partnership 2451 (company tag) 2453 (Partnership tag).xml                                                 |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\Partnership 2451 2453 (both Partnership tagged).xml                                                       |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\Partnership Edinburgh 2450 (company tagged, overseas type) 2451 (partnership tagged) - Copy.xml           |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Companies with no number testing\\Partnerships\\Partnership Edinburgh 2450 (company tagged, partnership type) 2451 (partnership tagged) - Copy - Copy.xml |
