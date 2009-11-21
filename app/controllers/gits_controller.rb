class GitsController < ApplicationController

  def index
    redirect_to new_Git_path
  end
  
  def new
    @git = Git.new
  end
  
  def create
    @git = Git.new(params[:Git])
    
    if @git.save
      redirect_to Git_path(@git)
      flash[:notice] = "Successfully Uploaded File"
    else
      render(:action => "new")
    end
  end
  
  def show
    @git = Git.find(params[:id])
    
    respond_to do |format|
      format.html { }
      format.csv { }
    end
  end
  
end
