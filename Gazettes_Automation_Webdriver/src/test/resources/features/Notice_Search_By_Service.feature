Feature: View notices for each service
  In order to view notices for a service, I want to be able to access this type of notice separately
 
  Scenario Outline: View notices for each service
    Given I am on the site homepage
    When I select <service_link> from notices_menu
	And I click view_full_notices
    Then all_notice_codes_of_this_service_type_link should say <all_notice_codes_of_this_service_type_link>

    Examples:
    | service_link						| all_notice_codes_of_this_service_type_link		|
    | award_accreditation_link			| All Awards and Accreditation notices				|
    | insolvancy_notices_link			| All insolvency notices							|
    | wills_and_probate_link			| All wills and probate notices						|
    