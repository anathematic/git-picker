require 'spec_helper'

describe Branch do
  before(:each) do
    @git = Git.make
    @valid_attributes = {
      :name => "Master",
      :git_id => @git.id
    }
  end

  it "should create a new instance given valid attributes" do
    Branch.create!(@valid_attributes)
  end
end
