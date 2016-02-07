class Admin::CategoriesController < ApplicationController
	layout 'admin.html.erb'
	before_action :require_login

	def new
		@project = Project.find_by(id: params['project_id'])
		@projects = Project.all.order(:rank)
	end

	def create
		Category.create(name: params['name'], project_id: params['project_id'])
		redirect_to "/admin/projects/#{params['project_id']}/edit"
	end
	
	def edit
		@admin = Admin.find_by(id: params["admin_id"])
		@category = Category.find_by(id: params['id'])
		@projects = Project.all 
		# @image = Image.where(section: params['id'])
	end

	def update
		@category = Category.find(params['id'])
		@category.update(name: params['name'], project_text: params['project_text'])
		@admin = Admin.find_by(id: session['admin_id'])
      	redirect_to "/admin/projects/#{params['project_id']}/edit"
    end

    def destroy
		@category = Category.find(params['id'])
		@category.destroy
		redirect_to "/admin/projects/#{params['project_id']}/edit"
	end

	private

	def require_login
		unless session['admin_id']
			@login_error = true
			render 'admin/index'
		end
	end	
end
