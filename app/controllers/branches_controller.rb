class BranchesController < ApplicationController

  before_filter :git
  
  def index
    @branches = @git.branches
  end
  
  private
  
  def branch
    @branch = Branch.find(params[:id])
  end
  
end
