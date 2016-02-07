class AddProjectMainImageToImages < ActiveRecord::Migration
  def change
    add_column :images, :project_main_image, :boolean
  end
end
