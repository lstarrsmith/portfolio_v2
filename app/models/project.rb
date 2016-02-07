class Project < ActiveRecord::Base
	has_many :categories
	has_many :images, through: :categories
end
