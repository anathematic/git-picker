# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  private
  
  def git
    @git = Git.find(params[:git_id].to_i) if params[:git_id]
  end
  
  def branch
    @branch = Branch.find(params[:branch_id].to_i) if params[:branch_id]
  end
  
end
