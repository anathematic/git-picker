class CommitsController < ApplicationController
  
  before_filter :git
  before_filter :branch
  before_filter :commit, :only => "show"
  
  def index
    if params[:branch_id]
      @commits = @branch.commits.paginate(:page => params[:page])
    else
      @commits = @git.commits.paginate(:page => params[:page])
    end
  end
  
  private
  
  def commit
    if params[:branch_id]
      @commit = @branch.commits.find(params[:id])
    else
      @commit = @git.commits.find(params[:id])
    end
  end
  
end
