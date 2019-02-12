Feature: (GA-034) Select shop from the menu, card payment
  In order to purchase Personalised commemorative editions,  I want to be able to select that option
  
  Scenario Outline: Purchase a Deluxe presentation pack - Certificate of Record from shop
   Given I am logged in as cgorg_css@mailhog.com, with a password of _password_
   When I click shop_link 
   And I click shop_order3_button
   And I fill in the form 
      | fieldName| fieldValue | fieldType |
      | edition_dropdown | <Edition> | text |
   	  | month_dropdown | <Month> | text |
      | year_dropdown | <Year> | text |
      | issue_supp_number | <IssueNumber> | text |
      | num_pro_ww1 | 1 | text |
      | num_pro_certificate | 1 | text |
      | num_pro_parchment | 2 | text |
      | full_name_purchase | <FullName> | text |
   And I click next_purchase_button
   And I click add_basket_button
   And I click go_checkout
   And I click pay_by_card_button
   And I wait for 1 minutes
   And I fill in the form 
      |fieldName | fieldValue | fieldType |
      |card_number | 4444444444444448 | text |
    And I wait for 20 seconds
    And I fill in the form 
      |fieldName | fieldValue | fieldType |
      |card_security_code | 000| text |
      |card_expiry_month  | 12| text |
      |card_expiry_year | 2018| text |
   And I click continue_payment
   And I click confirm_order_button
   Then confirmation_title should say Confirmation 
   
    Examples:
    |Edition                | Month |Year   |IssueNumber               |FullName       |
    |The London Gazette     | 3     |2014   |Supp 60813 - 21/03/2014   |System Testing  |
    
    
  