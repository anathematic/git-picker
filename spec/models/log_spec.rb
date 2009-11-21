require 'spec_helper'

describe Log do
  before(:each) do
    @valid_attributes = {
      :name => "Logs for 2009",
      :attachment => File.open("#{RAILS_ROOT}/spec/fixtures/git-example.tar.gz")
    }
    @log = Log.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @log.save
    @log.should be_valid
  end
  
  it "should be able to unzip the git repo" do
    @log.save
    @log.unzip
    File.exists?("#{RAILS_ROOT}/tmp/#{@log.id}").should be_true
  end
  
  it "should be able to read branches and import all the commits based on branches" do
    @log.save
    @log.read_branches
    @log.branches.size.should eql(3)
  end
  
  it "should be able to open a .git and create the logs" do
    @log.save
    @log.commits.size.should eql(3)
  end
  
end
