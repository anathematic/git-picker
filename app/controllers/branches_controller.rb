class BranchesController < ApplicationController

  before_filter :git
  before_filter :branch, :only => "show"
  
  def index
    @branches = @git.branches.paginate(:page => params[:page])
    @branches_count = @git.branches.count
  end
  
  private
  
  def branch
    @branch = Branch.find(params[:id].to_i)
  end
  
end
