Git.blueprint do
  name 
  attachment File.open("#{RAILS_ROOT}/spec/fixtures/git-example.tar.gz")
end