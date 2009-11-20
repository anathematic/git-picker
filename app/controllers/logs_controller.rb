class LogsController < ApplicationController

  def index
    redirect_to new_log_path
  end
  
  def new
    @log = Log.new
  end
  
  def create
    @log = Log.new(params[:log])
    
    if @log.save
      redirect_to log_path(@log)
      flash[:notice] = "Successfully Uploaded File"
    else
      render(:action => "new")
    end
  end
  
  def show
    @log = Log.find(params[:id])
    
    respond_to do |format|
      format.html { }
      format.csv { }
    end
  end
  
end
