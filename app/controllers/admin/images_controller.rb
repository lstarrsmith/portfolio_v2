class Admin::ImagesController < ApplicationController
  layout 'admin.html.erb'
  before_action :require_login

  def index
    @image = Image.new
    @images = Image.where(category_id: params['category_id']).sort
    @project = Project.find_by(id: params['project_id'])
    @category = Category.find_by(id: params['category_id'])
    render(:index)
  end

  def new
    @image = Image.new
    @project = Project.find_by(id: params['project_id'])
    @category = Category.find_by(id: params['category_id'])
    render(:new)
  end

	def create
      @image = Image.new(image_params)
      @image.update(category_id: params['category_id'])
      @image.save
      redirect_to "/admin/projects/#{params['project_id']}/categories/#{params['category_id']}/images"
     
  end

  def update
      # update image
      @image = Image.find_by(id: params['id'])
      @image.update(image_params)
      @image.update(category_id: params['category_id'])
      @image.save
      
      # restore variables to enable form helper
      @image = Image.new
      @images = Image.where(category_id: params['category_id']).sort
      @project = Project.find_by(id: params['project_id'])
      @category = Category.find_by(id: params['category_id'])
      redirect_to "/admin/projects/#{params['project_id']}/categories/#{params['category_id']}/images"
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    # restore variables to enable form helper
    @images = Image.where(category_id: params['category_id']).sort
    @project = Project.find_by(id: params['project_id'])
    @category = Category.find_by(id: params['category_id'])
    render(:index)
  end

  def image_params
  	params.require(:image).permit(:photo, :caption, :project_main_image)
  end

  private

  def require_login
      unless session['admin_id']
        @login_error = true
        render 'admin/index'
      end
  end 

end