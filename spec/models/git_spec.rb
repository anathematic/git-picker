require 'spec_helper'

describe Git do
  before(:each) do
    @valid_attributes = {
      :name => "Git for random project",
      :attachment => File.open("#{RAILS_ROOT}/spec/fixtures/git-example.tar.gz")
    }
    @git = Git.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @git.save
    @git.should be_valid
  end
  
  it "should be able to unzip the git repo" do
    @git.save
    @git.unzip
    File.exists?("#{RAILS_ROOT}/tmp/#{@git.id}").should be_true
  end
  
  it "should be able to read branches and import all the commits based on branches" do
    @git.save
    @git.branches.size.should eql(3)
    @git.commits.size.should eql(9)
    @git.branches.first.commits.size.should eql(3)
  end
  
  it "should be able to handle big git repos" do
    @git.attachment = File.open("#{RAILS_ROOT}/spec/fixtures/thiswayin-git.tar.gz")
    @git.save
    @git.should be_valid
  end
  
  it "should grab the name of the git repo if :name is not defined" do
    @git.name = nil
    @git.save
    @git.name.should eql("Git Repo")
  end
  
  it "should remove the git repo out of temp and /gits/ once it's loaded into the db'" do
    @git.save    
    FAIL
  end
  
  it "should prevent false tar files from being uploaded" do
    @git.attachment = File.open("#{RAILS_ROOT}/spec/fixtures/branches.yml")
    @git.save
    @git.should have(1).error_on(:attachment)
  end
end
