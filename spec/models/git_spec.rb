require 'spec_helper'

describe Git do
  before(:each) do
    @valid_attributes = {
      :name => "Git for random project",
      :attachment => File.open("#{RAILS_ROOT}/spec/fixtures/git-example.tar.gz")
    }
    @git = Log.new(@valid_attributes)
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
    @git.read_branches
    @git.branches.size.should eql(3)
  end
  
  it "should be able to open a .git and create the logs" do
    @git.save
    @git.commits.size.should eql(3)
  end

end