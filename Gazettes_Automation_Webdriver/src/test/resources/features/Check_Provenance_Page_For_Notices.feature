Feature: Browsing provenance page for various notice formats such as html|xml|ttl|rdf|JasonId

  Scenario:Checking links on the right hand side pane.
    Given I navigate to /all-notices
    And I click search_notices_first_result
    Then I keep a note of notice_details_id
    And I click provenance_trail
    Then I verify provenance_page_title is Provenance Trail
    And I click view_html_version_of_notice_link
    Then I verify notice_details_id is 'my note'
    And I click provenance_trail
    And I click download_notice_xml_format_link
    And I wait for 5 seconds
    Then a file called data.xml should be downloaded to my downloads directory
    And I click download_notice_json_format_link
    And I wait for 5 seconds
    Then a file called data.json should be downloaded to my downloads directory

  Scenario:Validating notice links containing notice formats
    Given I navigate to /all-notices
    And I click search_notices_first_result
    Then I keep a note of notice_details_id
    And I navigate to /notice/'my note'/data_htm/provenance
    Then I verify provenance_page_title is Provenance Trail
    And I navigate to /notice/'my note'/data_xml/provenance
    Then I verify provenance_page_title is Provenance Trail
    And I navigate to /notice/'my note'/data_ttl/provenance
    Then I verify provenance_page_title is Provenance Trail
    And I navigate to /notice/'my note'/data_rdf/provenance
    Then I verify provenance_page_title is Provenance Trail
    And I navigate to /notice/'my note'/data_jsonld/provenance
    Then I verify provenance_page_title is Provenance Trail

  Scenario:Checking that the notice can be downloaded in different formats from url
    Given I navigate to /all-notices
    And I click search_notices_first_result
    Then I keep a note of notice_details_id
    And I navigate to /notice/'my note'/data_htm/provenance/data.rdf
    And I wait for 4 seconds
    Then a file called data.rdf should be downloaded to my downloads directory
    And I navigate to /notice/'my note'/data_htm/provenance/data.xml
    And I wait for 4 seconds
    Then a file called data.xml should be downloaded to my downloads directory
    And I navigate to /notice/'my note'/data_htm/provenance/data.ttl
    And I wait for 4 seconds
    Then a file called data.ttl should be downloaded to my downloads directory
    And I navigate to /notice/'my note'/data_htm/provenance/data.jsonld
    And I wait for 4 seconds
    Then a file called data.json should be downloaded to my downloads directory
    
    
