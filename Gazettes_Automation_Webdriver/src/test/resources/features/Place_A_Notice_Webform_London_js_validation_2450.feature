Feature: 2450 Webforms, Place corporate insolvency notice in London edition-validation

  Scenario Outline: Login and check if I can place a insolvency notice in london edition of gazette
    Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
    And I empty the basket if not empty before I add more items
    And I select place_notice_link from my_gazette_menu
    And I click place_notice_webform_link
    And  I select noticeType_edition as London
    And  I select subNotice as Corporate Insolvency
    And  I select subNotice1 as Winding-up By The Court
    And  I select subNotice2 as Petitions to Wind Up (Companies) - 2450
    And I wait for online_continue_button to be enabled
    And I click online_continue_button
    And I page_down from element id #noticeid-_gaz-earliestPublicationDate
    And I page_down from element id #this-petitioner-address-1_vcard-postal-code-1
    And I page_down from element id #this-IP1_gaz-telephone-1
    And I click continue_notice
    And I page_up from element id #noticeid-_gaz-earliestPublicationDate
    #there are actually 22 mandatory fields
    Then I verify error_sumary is Your form contains 30 errors, see details below.
### Not necessary not sure why the runners are not being generated
    Examples:
      | test  |
      | test1 |