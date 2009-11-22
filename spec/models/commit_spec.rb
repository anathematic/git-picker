require 'spec_helper'

describe Commit do
  before(:each) do
    @valid_attributes = {
      :message => "Added the inital app",
      :authored_by => "Thomas",
      :commited_at => Time.now
    }
    @commit = Commit.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Commit.create!(@valid_attributes)
  end
  
  it "should create a commit message if no message is passed" do
    @commit.message = ""
    @commit.save
    @commit.message.should eql("No message found for this commit")
  end
  
end
