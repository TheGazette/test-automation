Feature: (GA-018) Notice data representation
   
  @ignored
  Scenario Outline: Verify that content is  displayed in the htm and xml format
    Given I am on the site homepage
    And I navigate to <URL>
    Then <xpath> should say <Text>

    Examples:
    | URL		                | xpath         | Text           |
    | /notice/161187/data.htm   |notice_details |Notice details  |
    | /notice/161187/data.xml   |notice_category|Notice category:|  
    
  @ignored
  Scenario Outline: Verify that content is  displayed in the rdf format
    Given I am on the site homepage
    And I navigate to <URL>
    

    Examples:
    | URL		               | 
    | /notice/161187/data.rdf  |

 @ignored
 Scenario Outline: Verify that content is  downloaded in the jsonld and ttl format
    Given I am on the site homepage
    And I navigate to <URL>
     Then a file called data.<File_extension> should be downloaded to my downloads directory
    
  Examples:
    | URL		                | File_extension |
    | /notice/161187/data.jsonld| jsonld	     |
    | /notice/161187/data.ttl   |  ttl			 |