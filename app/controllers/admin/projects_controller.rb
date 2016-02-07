class Admin::ProjectsController < ApplicationController
	layout 'admin.html.erb'
	before_action :require_login

	def show
		@project = Project.find_by(id: params["id"])
		@admin = Admin.find_by(id: params["admin_id"])
	end

	def new
		@admin = Admin.find_by(id: params["admin_id"])
	end

	def create
		Project.create(name: params['name'], short_description: params['short_description'], has_subsection: false)
		redirect_to "/admin/#{session['admin_id']}"
	end

	def edit
		@project = Project.find_by(id: params["id"])
		@admin = Admin.find_by(id: params["admin_id"])
		@categories = Category.where({project_id: params['id']}).sort
		@project_main_image = @project.images.find_by(project_main_image: true)
	end

	def update
		@project = Project.find(params['id'])
		@project.update(name: params['name'], short_description: params['short_description'])
		@categories = Category.where(project_id: params['id']).sort
		@categories.map do |c|
			if params[c.name]
				c.project_text = params[c.name]
				c.save
			end
		end
		@admin = Admin.find_by(id: params["admin_id"])
      	redirect_to "/admin/#{session['admin_id']}"
    end

	private

	def require_login
		unless session['admin_id']
			@login_error = true
			render 'admin/index'
		end
	end	
end
