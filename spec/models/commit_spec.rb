require 'spec_helper'

describe Commit do
  before(:each) do
    @valid_attributes = {
      :message => "Added the inital app",
      :authored_by => "Thomas",
      :commited_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Commit.create!(@valid_attributes)
  end
end
