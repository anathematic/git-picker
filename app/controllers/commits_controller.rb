class CommitsController < ApplicationController
  
  before_filter :git
  before_filter :branch
  before_filter :commit, :only => "show"
  before_filter :commits, :only => "index"
  
  def index
    respond_to do |format|
      format.html { }
      format.csv {
        if params[:branch_id]
          @commits = @branch.commits.all
        else
          @commits = @git.commits.all
        end
      }
    end
  end
  
  private
  
  def commit
    if params[:branch_id]
      @commit = @branch.commits.find(params[:id].to_i)
    else
      @commit = @git.commits.find(params[:id].to_i)
    end
  end
  
  def commits
    if params[:branch_id]
      @commits = @branch.commits.paginate(:page => params[:page])
      @commits_count = @branch.commits.count
    else
      @commits = @git.commits.paginate(:page => params[:page])
      @commits_count = @git.commits.count
     end
   end
  
end
