Feature: (GA-055) Withdraw notice as Organisational user – Central Gov’t
  In order to Withdraw Gazette notices, I want to be able to select that option
 
   Scenario: Login and check if I can withdraw a notice 
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I select notice_placed_link from my_gazette_menu
    And I click view_pending_notices
    And NP_ActionLink is present
    And I click NP_ActionLink
    And I click withdrawNoticeLink
    Then withdrawNoticeText should say Are you sure you want to withdraw this notice?
    And I click WN_DeleteButton
     