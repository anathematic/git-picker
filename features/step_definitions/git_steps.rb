Given /^I have an existing git repo$/ do
  Given 'I am on the homepage'
  When 'I attach the file at "spec/fixtures/git-example.tar.gz" to "Attachment"'
  And 'I press "Upload"'
  Then 'I should see "Successfully Uploaded File"'
end