Feature: Git Import
  In order to make my git commits useful
  As a user
  I want be able to upload my file, adjust the settings and go from there
  
  Scenario: I can upload my file and download it as a csv
    Given I am on the homepage
    When I attach the file at "spec/fixtures/git-example.tar.gz" to "Attachment"
    And I press "Upload"
    Then I should see "Successfully Uploaded File"

  Scenario: I should be able to sort out my csv details based on the git uploaded
    Given I have an existing git repo
    When I follow "Branches"
    Then I follow "master"
    When I follow "Commits"
    Then I should see "3 Commits"
    When I follow "master" 
    And I follow "Git Repo"
    And I follow "Commits"
    Then I should see "9 Commits"
    And I follow "Export to CSV"
    Then I should see "date, author, message"
    And I should see "2009-11-20 07:37:50 UTC, Thomas, Removed foo text file"
    