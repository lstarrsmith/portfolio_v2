class Category < ActiveRecord::Base
	belongs_to :project
	has_many :images, :dependent => :destroy
	accepts_nested_attributes_for :images
end
