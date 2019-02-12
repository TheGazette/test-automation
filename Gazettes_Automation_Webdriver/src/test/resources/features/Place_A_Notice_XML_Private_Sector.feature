Feature: (GA-052,053,054) Upload XML, account payment, Private Sector Users
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
      | username                   | password  | file                                                    |
      | adorg_css@mailhog.com   | _password_ | \\place_a_notice\\Advertising Agency BELFAST.xml        |
      | adorg_css@mailhog.com   | _password_ | \\place_a_notice\\Advertising Agency EDINBURGH.xml      |
      | adorg_css@mailhog.com   | _password_ | \\place_a_notice\\Advertising Agency LONDON.xml         |
      | insorg_css@mailhog.com  | _password_ | \\place_a_notice\\Insolvency Administrator BELFAST.xml  |
      | insorg_css@mailhog.com  | _password_ | \\place_a_notice\\Insolvency Administrator ED.xml       |
      | insorg_css@mailhog.com  | _password_ | \\place_a_notice\\Insolvency Administrator LONDON.xml   |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Insolvency Practitioner BELFAST.xml   |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Insolvency Practitioner EDINBURGH.xml |
      | insporg_css@mailhog.com | _password_ | \\place_a_notice\\Insolvency Practitioner LONDON.xml    |
      | laworg_css@mailhog.com  | _password_ | \\place_a_notice\\Law Firm-ABS-Other LP BELFAST.xml     |
      | laworg_css@mailhog.com  | _password_ | \\place_a_notice\\Law Firm-ABS-Other LP EDINBURGH.xml   |
      | laworg_css@mailhog.com  | _password_ | \\place_a_notice\\Law Firm-ABS-Other LP LONDON.xml      |
      | liqorg_css@mailhog.com  | _password_ | \\place_a_notice\\Liquidator BELFAST.xml                |
      | liqorg_css@mailhog.com  | _password_ | \\place_a_notice\\Liquidator EDINBURGH.xml              |
      | liqorg_css@mailhog.com  | _password_ | \\place_a_notice\\Liquidator LONDON.xml                 |
      | solorg_css@mailhog.com  | _password_ | \\place_a_notice\\Solicitor BELFAST.xml                 |
      | solorg_css@mailhog.com  | _password_ | \\place_a_notice\\Solicitor EDINBURGH.xml               |
      | solorg_css@mailhog.com  | _password_ | \\place_a_notice\\Solicitor LONDON.xml                  |
	
	