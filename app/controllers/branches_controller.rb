class BranchesController < ApplicationController

  before_filter :git
  before_filter :branch, :only => "show"
  
  def index
    @branches = @git.branches
  end
  
  private
  
  def branch
    @branch = Branch.find(params[:id])
  end
  
end
