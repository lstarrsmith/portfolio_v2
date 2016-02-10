class WelcomeController < ApplicationController
	def index
		@projects = Project.all.sort
		@images = []
		@projects.map do |p|
			if p.images.find_by(project_main_image: true) != nil
				@images << p.images.find_by(project_main_image: true)
			end
		end
	end

end
