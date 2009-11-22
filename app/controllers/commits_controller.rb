class CommitsController < ApplicationController
  
  before_filter :git
  before_filter :branch
  before_filter :commit, :only => "show"
  
  def index
    @commits = Commit.all
  end
  
  private
  
  def commit
    @commit = @branch.commits.find(params[:id])
  end
  
end
