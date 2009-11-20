Feature: Log Import
  In order to make my git commits useful
  As a user
  I want be able to upload my file, adjust the settings and go from there
  
  Scenario: I can upload my file and download it as a csv
    Given I am on the homepage
    When I attach the file at "spec/fixtures/git-example.tar.gz" to "Attachment"
    And I press "Upload"
    Then I should see "Successfully Uploaded File"
    When I follow "Download CSV"
    Then I should see "Thomas"
    And I should see "Added foo text file"
