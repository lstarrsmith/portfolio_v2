class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :project_list
  def project_list
  	@project_list = Project.all.order(:rank)
  	if params['id'] != nil
  		@project = Project.find_by(id: params['id'])
  	elsif params['action'] == "index"
  		@p = "All Work"
    elsif params['action'] == "about"
      @p = "About"
  	end
  end
end
