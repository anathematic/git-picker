class GitsController < ApplicationController

  before_filter :git, :only => "show"
  
  def index
    redirect_to new_git_path
  end
  
  def new
    @git = Git.new
  end
  
  def create
    @git = Git.new(params[:git])
    
    if @git.save
      redirect_to git_path(@git)
      flash[:notice] = "Successfully Uploaded File"
    else
      render(:action => "new")
    end
  end
  
  def show
    respond_to do |format|
      format.html { }
      format.csv { }
    end
  end

  private
  
  def git
    @git = Git.find(params[:id].to_i)
  end
  
end
